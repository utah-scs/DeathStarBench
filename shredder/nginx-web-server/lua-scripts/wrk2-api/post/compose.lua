local _M = {}

local function _StrIsEmpty(s)
  return s == nil or s == ''
end

local function _UploadUserId(req_id, post, carrier)
  local redis = require "resty.redis"
  local red = redis:new()
  local ngx = ngx

  red:set_timeouts(1000, 1000, 1000)
  local ok, err = red:connect("10.0.1.1", 11211)
  if not ok then
    ngx.say("failed to connect: ", err)
    return
  end

  ok, err = red:js(req_id, "user_service.js", "upload_creator_with_userid",
                   tonumber(post.user_id), post.username)

  if not ok then
    ngx.status = ngx.HTTP_INTERNAL_SERVER_ERROR
    ngx.say("Upload user_id failed: " .. err.message)
    ngx.log(ngx.ERR, "Upload user_id failed: " .. err.message)
    ngx.exit(ngx.HTTP_INTERNAL_SERVER_ERROR)
  end
  ok, err = red:close()
end

local function _UploadText(req_id, post, carrier)
  local redis = require "resty.redis"
  local red = redis:new()
  local ngx = ngx

  red:set_timeouts(1000, 1000, 1000)
  local ok, err = red:connect("10.0.1.1", 11211)
  if not ok then
    ngx.say("failed to connect: ", err)
    return
  end

  ok, err = red:js(req_id, "text_service.js", "upload_text", post.text)

  if not ok then
    ngx.status = ngx.HTTP_INTERNAL_SERVER_ERROR
    ngx.say("Upload text failed: " .. err.message)
    ngx.log(ngx.ERR, "Upload text failed: " .. err.message)
    ngx.exit(ngx.HTTP_INTERNAL_SERVER_ERROR)
  end
  ok, err = red:close()
end

local function _UploadUniqueId(req_id, post, carrier)
  local ngx = ngx

  local redis = require "resty.redis"
  local red = redis:new()

  red:set_timeouts(1000, 1000, 1000)
  local status, err = red:connect("10.0.1.1", 11211)
  if not status then
    ngx.say("failed to connect: ", err)
    return
  end

  status, err = red:js(req_id, "unique_id_service.js", "upload_unique_id",
                       tonumber(post.post_type))
  if not status then
    ngx.status = ngx.HTTP_INTERNAL_SERVER_ERROR
    ngx.say("Upload unique_id failed: " .. err.message)
    ngx.log(ngx.ERR, "Upload unique_id failed: " .. err.message)
    ngx.exit(ngx.HTTP_INTERNAL_SERVER_ERROR)
  end
  ok, err = red:close()
end

local function _UploadMedia(req_id, post, carrier)
  local cjson = require "cjson"
  local ngx = ngx

  local redis = require "resty.redis"
  local red = redis:new()

  red:set_timeouts(1000, 1000, 1000)
  local status, err = red:connect("10.0.1.1", 11211)
  if not status then
    ngx.say("failed to connect: ", err)
    return
  end

  status, err = red:js(req_id, "media_service.js", "upload_media", 
                       post.media_types, post.media_ids)

  if not status then
    ngx.status = ngx.HTTP_INTERNAL_SERVER_ERROR
    ngx.say("Upload media failed: " .. err.message)
    ngx.log(ngx.ERR, "Upload media failed: " .. err.message)
    ngx.exit(ngx.HTTP_INTERNAL_SERVER_ERROR)
  end
  ok, err = red:close()
end

function _M.ComposePost()
  local ngx = ngx
  local cjson = require "cjson"
  local jwt = require "resty.jwt"

  local req_id = tonumber(string.sub(ngx.var.request_id, 0, 15), 16)

  ngx.req.read_body()
  local post = ngx.req.get_post_args()

  if (_StrIsEmpty(post.user_id) or _StrIsEmpty(post.username) or
      _StrIsEmpty(post.post_type) or _StrIsEmpty(post.text)) then
    ngx.status = ngx.HTTP_BAD_REQUEST
    ngx.say("Incomplete arguments")
    ngx.log(ngx.ERR, "Incomplete arguments")
    ngx.exit(ngx.HTTP_BAD_REQUEST)
  end

  local threads = {
    ngx.thread.spawn(_UploadMedia, req_id, post, carrier),
    ngx.thread.spawn(_UploadUserId, req_id, post, carrier),
    ngx.thread.spawn(_UploadText, req_id, post, carrier),
    ngx.thread.spawn(_UploadUniqueId, req_id, post, carrier)
  }

  local status = ngx.HTTP_OK
  for i = 1, #threads do
    local ok, res = ngx.thread.wait(threads[i])
    if not ok then
      status = ngx.HTTP_INTERNAL_SERVER_ERROR
      ngx.exit(status)
    end
  end
  ngx.say("Successfully upload post")
--  span:finish()
  ngx.exit(status)
end




return _M

local _M = {}

local function _StrIsEmpty(s)
  return s == nil or s == ''
end

local function _UploadUserId(req_id, post, carrier)
  local GenericObjectPool = require "GenericObjectPool"
  local UserServiceClient = require "social_network_UserService"
  local ngx = ngx

  local user_client = GenericObjectPool:connection(
      UserServiceClient, "user-service", 9090)
  local status, err = pcall(user_client.UploadCreatorWithUserId, user_client,
      req_id, tonumber(post.user_id), post.username, carrier)
  if not status then
    ngx.status = ngx.HTTP_INTERNAL_SERVER_ERROR
    ngx.say("Upload user_id failed: " .. err.message)
    ngx.log(ngx.ERR, "Upload user_id failed: " .. err.message)
    ngx.exit(ngx.HTTP_INTERNAL_SERVER_ERROR)
  end
  GenericObjectPool:returnConnection(user_client)
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

  ok, err = red:js("text_service.js", "upload_text",  post.text)
  ngx.log(ngx.ERR, "post text: " .. post.text)
  if not ok then
    ngx.say("js test failed: ", err)
    return
  end

  if not ok then
    ngx.status = ngx.HTTP_INTERNAL_SERVER_ERROR
    ngx.say("Upload text failed: " .. err.message)
    ngx.log(ngx.ERR, "Upload text failed: " .. err.message)
    ngx.exit(ngx.HTTP_INTERNAL_SERVER_ERROR)
  end
  ok, err = red:close()
end

local function _UploadUniqueId(req_id, post, carrier)
  local GenericObjectPool = require "GenericObjectPool"
  local UniqueIdServiceClient = require "social_network_UniqueIdService"
  local ngx = ngx

  local unique_id_client = GenericObjectPool:connection(
      UniqueIdServiceClient, "unique-id-service", 9090)
  local status, err = pcall(unique_id_client.UploadUniqueId, unique_id_client,
      req_id, tonumber(post.post_type), carrier)
  if not status then
    ngx.status = ngx.HTTP_INTERNAL_SERVER_ERROR
    ngx.say("Upload unique_id failed: " .. err.message)
    ngx.log(ngx.ERR, "Upload unique_id failed: " .. err.message)
    ngx.exit(ngx.HTTP_INTERNAL_SERVER_ERROR)
  end
  GenericObjectPool:returnConnection(unique_id_client)
end

local function _UploadMedia(req_id, post, carrier)
  local GenericObjectPool = require "GenericObjectPool"
  local MediaServiceClient = require "social_network_MediaService"
  local cjson = require "cjson"
  local ngx = ngx

  local media_client = GenericObjectPool:connection(
      MediaServiceClient, "media-service", 9090)
  local status, err
  if (not _StrIsEmpty(post.media_ids) and not _StrIsEmpty(post.media_types)) then
    status, err = pcall(media_client.UploadMedia, media_client,
        req_id, cjson.decode(post.media_types), cjson.decode(post.media_ids), carrier)
  else
    status, err = pcall(media_client.UploadMedia, media_client,
        req_id, {}, {}, carrier)
  end
  if not status then
    ngx.status = ngx.HTTP_INTERNAL_SERVER_ERROR
    ngx.say("Upload media failed: " .. err.message)
    ngx.log(ngx.ERR, "Upload media failed: " .. err.message)
    ngx.exit(ngx.HTTP_INTERNAL_SERVER_ERROR)
  end
  GenericObjectPool:returnConnection(media_client)
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
--    ngx.thread.spawn(_UploadMedia, req_id, post, carrier),
--    ngx.thread.spawn(_UploadUserId, req_id, post, carrier),
    ngx.thread.spawn(_UploadText, req_id, post, carrier),
--    ngx.thread.spawn(_UploadUniqueId, req_id, post, carrier)
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

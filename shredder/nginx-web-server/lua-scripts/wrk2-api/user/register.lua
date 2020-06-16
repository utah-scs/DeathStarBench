local _M = {}

local function _StrIsEmpty(s)
  return s == nil or s == ''
end

function _M.RegisterUser()
  local ngx = ngx

  local req_id = tonumber(string.sub(ngx.var.request_id, 0, 15), 16)
  local redis = require "resty.redis"
  local red = redis:new()
  local ngx = ngx

  red:set_timeouts(1000, 1000, 1000)
  local ok, err = red:connect("10.0.1.1", 11211)
  if not ok then
    ngx.say("failed to connect: ", err)
    return
  end

  ngx.req.read_body()
  local post = ngx.req.get_post_args()

  if (_StrIsEmpty(post.first_name) or _StrIsEmpty(post.last_name) or
      _StrIsEmpty(post.username) or _StrIsEmpty(post.password) or
      _StrIsEmpty(post.user_id)) then
    ngx.status = ngx.HTTP_BAD_REQUEST
    ngx.say("Incomplete arguments")
    ngx.log(ngx.ERR, "Incomplete arguments")
    ngx.exit(ngx.HTTP_BAD_REQUEST)
  end

  ok, err = red:js("user_service.js", "user_register", post.user_id, post.username)
  if not ok then
    ngx.say("User register failed: ", err)
    return
    ngx.exit(ngx.HTTP_INTERNAL_SERVER_ERROR)
  end

--  local status, err = pcall(client.RegisterUserWithId, client, req_id, post.first_name,
--      post.last_name, post.username, post.password, tonumber(post.user_id), carrier)
--  GenericObjectPool:returnConnection(client)

end

return _M

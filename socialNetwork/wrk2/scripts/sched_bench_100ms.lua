require "socket"
math.randomseed(socket.gettime()*1000)
math.random(); math.random(); math.random()

local function test()
  local method = "POST"
  local path = "/sched_bench/run_100ms"
  local headers = {}
  local body = ""
--  headers["MS"] = "4"
  return wrk.format(method, path, headers, body)
end

request = function()
    return test()
end

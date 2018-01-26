local http = require 'resty.http'
local json = json or require 'json'
local _M = { __VERSION = '0.1-0' }
local mt = { __index = _M }

local sandbox_url = 'https://api.sandbox.paypal.com/v1/'
local api_url = 'https://api.paypal.com/v1/';

function create_url(path, params)
  local url = api_url .. path
  if params not nil then
    url = url .. '?' .. ngx.encode_args(params)
  end 
  return url
end

function request(method, path, params)
  local httpc = http.new()
  local args  = {
    method = method,
    body = json.encode(params),
    headers = {
      ['Content-Type']  = 'application/json',
      ['Authorization'] =  'Bearer ' .. _M.get_access_token()
    } 
  }
  local url = create_url(path, params)
  return httpc:request(url, args)
end


function _M.new(config)
  if not config then error("Missing paypal config params") end
  if not config.client_id then error("Missing required paypal client_id") end
  if not config.secret then error("Missing require paypal secret") end

  _M.env = config.env or 'sandbox'
  _M.client_id = config.client_id
  _M.secret = config.secret
  return setmetatable(_M, mt)
end

function _M.get_access_token()
  local httpc = http.new()
  local args = {
    method = 'POST',
    body = "grant_type=client_credentials",
    headers = { 
      ['Accept'] = 'application/json' 
      ['Authorization'] = 'Basic ' .. ngx.base64(_M.client_id .. ':' .. _M.secret)
    }
  } 
  local res = httpc:request(url, args) 
end

function _M.get(self, api, args)
  return request('GET', api, args) 
end

function _M.post(self, args)
  return request('POST', api, args) 
end

return _M

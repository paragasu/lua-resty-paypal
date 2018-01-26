package.path = package.path .. ";../?.lua"

local inspect = require 'inspect'

require 'busted.runner'()

local Paypal = require 'paypal' 
local paypal = Paypal.new({
  client_id = 'Absufa2HcqCsU-YRS3P6s_y3dCn2wd6QMkykFDh63JU-G_1dP4XnmIpX6G9YsmoZfmi57SAYJJtvi21x',
  secret = 'EESilhW4RXfi3LKmt9-xM90IqYU_9siKC2B7DElwsM6_EKrgYYZX1dz-q1wt1q2aWHCWj5fXai85WPH5',
  env = 'sandbox' 
})

describe('Paypal account', function()
  
  it('Test get_access_token', function()
    local access_token = paypal:get_access_token() 
    assert.are.equal(type(access_token), "string")
  end)

end)

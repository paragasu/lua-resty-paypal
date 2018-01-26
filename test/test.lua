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

  it('Test create payment', function()
    local res, err = paypal:post('payments/payment', {
      intent = "sale",
      payer = {
        payment_method = "paypal",
      },
      transactions = {
        {
          description = "something to pay",
          amount = { total = "30.10", currency = "USD" }  
        }
      },
      redirect_urls = {
        return_url = "https://www.example.com/return",
        cancel_url = "https://www.example.com/cancel"
      } 
    }) 
    ngx.log(ngx.ERR, inspect(err))
    assert.are.equal(res.status, 200)
  end)

end)

# lua-resty-paypal
Lua rest backend [paypal express checkout v4 API](https://developer.paypal.com/docs/integration/direct/express-checkout/integration-jsv4)


# Usage
```lua
  local Paypal = require 'resty.paypal'
  local paypal = Paypal.new({
    client_id: 'xx', -- paypal client id
    secret: 'xx', -- paypal secret
    env: 'live'
  })

  -- https://developer.paypal.com/docs/api/payments/#payment_create
  local res, err = paypal:api('v1/payments/payment', {
    intent = "sale",
    payer = {
      payment_method = "paypal",
      transactions = {
        description = "something to pay",
        amount: { total = "30.10", currency = "USD" }  
      }
    }
  })

  -- https://developer.paypal.com/docs/api/payments/#payment_execute
  local res, err = paypal:execute('v1/payments/execute', {
    payer_id: "xxx"
  })
```

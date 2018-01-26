# lua-resty-paypal
Lua backend [Paypal Express Checkout v4 REST API](https://developer.paypal.com/docs/integration/direct/express-checkout/integration-jsv4)


# Usage
```lua
  local Paypal = require 'resty.paypal'
  local paypal = Paypal.new({
    client_id: 'xx', -- paypal client id
    secret: 'xx', -- paypal secret
    env: 'live'
  })

  -- https://developer.paypal.com/docs/api/payments/#payment_create
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

  -- https://developer.paypal.com/docs/api/payments/#payment_execute
  local res, err = paypal:post('payments/execute', {
    payment_id: "xxx",
    payer_id: "xxx"
  })
```

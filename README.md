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

  local res, err = paypal:create({
  })

  local res, err = paypal:execute({
  })
```

*** Variables ***
${title_login}               Swag Labs
&{error_msg}                 invalid_username=Epic sadface: Username is required
...                          invalid_password=Epic sadface: Password is required
...                          invalid_username_and_password=Epic sadface: Username is required
...                          locked_user=Epic sadface: Sorry, this user has been locked out.
...                          invalid_firstname_and_lastname=
&{page}                      products=Products
...                          cart=Your Cart
...                          checkout=Checkout: Your Information
...                          overview=Checkout: Overview
...                          complete=Checkout: Complete!
&{client}                    firstname=Solar
...                          lastname=The Cat
...                          zip_code=2024
&{overview}                  payment=Payment Information:
...                          shipping=Shipping Information:
...                          price_total=Price Total
...                          price=Item total:
...                          tax=Tax:
&{complete}                  thank=Thank you for your order!
...                          detail=Your order has been dispatched, and will arrive just as fast as the pony can get there!
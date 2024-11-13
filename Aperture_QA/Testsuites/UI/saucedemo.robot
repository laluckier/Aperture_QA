*** Settings ***
Resource                ../../Resources/Keywords/saucedemo.resource
Test Setup            Open Sauce Demo Page           ${url_saucedemo}
Test Teardown         Close All Web Browser

*** Test Cases ***
TC_001 Verify redirect to Saucedemo successfully
    [Documentation]    Owner: Pattamawan
    ...    *** PreRequisite ***
    ...    URL: https://www.saucedemo.com/
    ...    *** Test Steps ***
    ...    1. Open web Saucedemo
    ...    2. Verify Detail Login page [1]
    ...    ==>
    ...    *** Expect Result ***
    ...    [1] Verify Detail Login page
    ...    - Title page "Swag Labs"
    ...    - Username Textbox
    ...    - Password Textbox
    ...    - Login Button
    ...    - Login Credentials
    ...       - Username
    ...       - Password
    ...    ==>
    [Tags]    001    pass
    Verify Elements On Login Page
    Browser Take Screenshot    TC_001

TC_002 Verify login to Saucedemo successfully
    [Documentation]    Owner: Pattamawan
    ...    *** PreRequisite ***
    ...    URL: https://www.saucedemo.com/
    ...    Username: standard_user
    ...    Password: secret_sauce
    ...    *** Test Steps ***
    ...    1. Open web Saucedemo
    ...    2. Fill in the username field
    ...    3. Fill in the password field
    ...    4. Click "Login"
    ...    5. Verify login success [1]
    ...    ==>
    ...    *** Expect Result ***
    ...    [1] Verify login success
    ...    - Title Page "Products"
    ...    - Hamburger Menu
    ...    - Cart icon
    ...    - Sort icon
    ...    - Product List
    ...    ==>
    [Tags]    002    pass
    Login To Sauce Demo Success
    Verify Elements On Products Page
    Browser Take Screenshot    TC_002


TC_003 Verify error message if username fields blank
    [Documentation]    Owner: Pattamawan
    ...    *** PreRequisite ***
    ...    URL: https://www.saucedemo.com/
    ...    Username: 
    ...    Password: secret_sauce
    ...    *** Test Steps ***
    ...    1. Open web Saucedemo
    ...    2.  Fill in the password field
    ...    3. Click "Login"
    ...    4. Verify error message [1]
    ...    ==>
    ...    *** Expect Result ***
    ...    [1] Verify error message
    ...    - Message "Epic sadface: Username is required"
    ...    - Error icon on Username
    ...    - Error icon on Password
    ...    ==>
    [Tags]    003    pass
    Login To Sauce Demo With Invalid User    password=${password}
    Verify Error Message After Login With Invalid Username
    Browser Take Screenshot    TC_003

TC_004 Verify error message if password fields blank
    [Documentation]    Owner: Pattamawan
    ...    *** PreRequisite ***
    ...    URL: https://www.saucedemo.com/
    ...    Username: standard_user
    ...    Password:
    ...    *** Test Steps ***
    ...    1. Open web Saucedemo
    ...    2. Fill in the username field
    ...    3. Click "Login"
    ...    4. Verify error message [1]
    ...    ==>
    ...    *** Expect Result ***
    ...    [1] Verify error message
    ...    - Message "Epic sadface: Password is required"
    ...    - Error icon on Username
    ...    - Error icon on Password
    ...    ==>
    [Tags]    004    pass
    Login To Sauce Demo With Invalid User    username=${username.invalid}
    Verify Error Message After Login With Invalid Password
    Browser Take Screenshot    TC_004

TC_005 Verify error message if both fields blank
    [Documentation]    Owner: Pattamawan
    ...    *** PreRequisite ***
    ...    URL: https://www.saucedemo.com/
    ...    Username: 
    ...    Password: 
    ...    *** Test Steps ***
    ...    1. Open web Saucedemo
    ...    2. Click "Login"
    ...    3. Verify error message [1]
    ...    ==>
    ...    *** Expect Result ***
    ...    [1] Verify error message
    ...    - Message "Epic sadface: Username is required"
    ...    - Error icon on Username
    ...    - Error icon on Password
    ...    ==>
    [Tags]    005    pass
    Login To Sauce Demo With Invalid User
    Verify Error Message After Login With Invalid Username And Password
    Browser Take Screenshot    TC_005

TC_006 Verify unable login with locked user
    [Documentation]    Owner: Pattamawan
    ...    *** PreRequisite ***
    ...    URL: https://www.saucedemo.com/
    ...    Username: locked_out_user
    ...    Password: secret_sauce
    ...    *** Test Steps ***
    ...    1. Open web Saucedemo
    ...    2. Fill in the username field
    ...    3. Fill in the password field
    ...    4. Click "Login"
    ...    5. Verify error message [1]
    ...    ==>
    ...    *** Expect Result ***
    ...    [1] Verify error message
    ...    - Message "Epic sadface: Sorry, this user has been locked out."
    ...    - Error icon on Username
    ...    - Error icon on Password
    ...    ==>
    [Tags]    006    pass
    Login To Sauce Demo With Invalid User    username=${username.invalid}    password=${password}
    Verify Error Message After Login With Locked User
    Browser Take Screenshot    TC_006

TC_007 Verify that the cart badge displays the correct number of items
    [Documentation]    Owner: Pattamawan
    ...    *** PreRequisite ***
    ...    URL: https://www.saucedemo.com/
    ...    Username: standard_user
    ...    Password: secret_sauce
    ...    *** Prerequisite Step ***
    ...    1. Open web Saucedemo
    ...    2. Fill in the username field
    ...    3. Fill in the password field
    ...    4. Click "Login"
    ...    *** Test Steps ***
    ...    1. Adding products
    ...    2. Verify added cart badge correctly [1]
    ...    3. Remove products
    ...    4. Verify revomed cart badge correctly [2]
    ...    ==>
    ...    *** Expect Result ***
    ...    [1] Verify added cart badge correctly
    ...    - Cart badge displays the correct number of items
    ...    [2] Verify revomed cart badge correctly
    ...    - Cart badge displays the correct number of items
    ...    ==>
    [Tags]    007    pass
    Login To Sauce Demo Success
    Adding 3 Products To Cart
    Verify Add Products To Cart Success
    Browser Take Screenshot    TC_007_1
    Remove 1 Products Form Cart
    Verify Remove Products From Cart Success
    Browser Take Screenshot    TC_007_2
    

TC_008 Verify Adding Items Correctly
    [Documentation]    Owner: Pattamawan
    ...    *** PreRequisite ***
    ...    URL: https://www.saucedemo.com/
    ...    Username: standard_user
    ...    Password: secret_sauce
    ...    *** Prerequisite Step ***
    ...    1. Open web Saucedemo
    ...    2. Fill in the username field
    ...    3. Fill in the password field
    ...    4. Click "Login"
    ...    5. Adding products
    ...    *** Test Steps ***
    ...    1. Click "Cart icon"
    ...    2. Verify add items correctly [1]
    ...    ==>
    ...    *** Expect Result ***
    ...    [1] Verify add items correctly
    ...    - Title Page "Your Cart"
    ...    - Item name and price
    ...    - Remove Button
    ...    - Continue Shopping Button
    ...    - Checkout Button
    ...    ==>
    [Tags]    008    pass
    Login To Sauce Demo Success
    Adding 4 Products To Cart
    Go To Cart Page
    Verify Elements On Cart Page
    Verify Added To Cart Correctly
    Browser Take Screenshot    TC_008

TC_009 Verify Redirect To Checkout Infomation Page Success
    [Documentation]    Owner: Pattamawan
    ...    *** PreRequisite ***
    ...    URL: https://www.saucedemo.com/
    ...    Username: standard_user
    ...    Password: secret_sauce
    ...    *** Prerequisite Step ***
    ...    1. Open web Saucedemo
    ...    2. Fill in the username field
    ...    3. Fill in the password field
    ...    4. Click "Login"
    ...    5. Adding products
    ...    6. Click "Cart icon"
    ...    *** Test Steps ***
    ...    1. Click "Checkout"
    ...    2. Verify redirect to the checkout information page [1]
    ...    ==>
    ...    *** Expect Result ***
    ...    [1] Verify back to the checkout information page
    ...    - Title Page "Checkout: Your Information"
    ...    - First Name Textbox
    ...    - Last Name Textbox
    ...    - Zip/Postal Code Textbox
    ...    - Cancel Button
    ...    - Continued Button
    ...    ==>
    [Tags]    009    pass
    Login To Sauce Demo Success
    Adding 4 Products To Cart
    Go To Cart Page
    Go To Checkout Cart Items
    Verify Elements On Checkout Page
    Browser Take Screenshot    TC_009



TC_010 Verify Redirect To Overview Page Success
    [Documentation]    Owner: Pattamawan
    ...    *** PreRequisite ***
    ...    URL: https://www.saucedemo.com/
    ...    Username: standard_user
    ...    Password: secret_sauce
    ...    *** Prerequisite Step ***
    ...    1. Open web Saucedemo
    ...    2. Fill in the username field
    ...    3. Fill in the password field
    ...    4. Click "Login"
    ...    5. Adding products
    ...    6. Click "Cart icon"
    ...    7. Click "Checkout"
    ...    *** Test Steps ***
    ...    1. Input client information
    ...    2. Click "Continue"
    ...    3. Verify redirect to the overview page [1]
    ...    ==>
    ...    *** Expect Result ***
    ...    [1] Verify redirect to the overview page
    ...    - Title Page "Checkout: Overview"
    ...    - Item name and price
    ...    - Payment Information
    ...    - Shipping Information
    ...    - Price Total
    ...    - Cancel Button
    ...    - Finish Button
    ...    ==>
    [Tags]    010    pass
    Login To Sauce Demo Success
    Adding 4 Products To Cart
    Go To Cart Page
    Go To Checkout Cart Items
    Input Client Information Success
    Verify Redirect To Overview Page Correctly
    Browser Take Screenshot    TC_010

TC_011 Verify Completed Order
    [Documentation]    Owner: Pattamawan
    ...    *** PreRequisite ***
    ...    URL: https://www.saucedemo.com/
    ...    Username: standard_user
    ...    Password: secret_sauce
    ...    *** Prerequisite Step ***
    ...    1. Open web Saucedemo
    ...    2. Fill in the username field
    ...    3. Fill in the password field
    ...    4. Click "Login"
    ...    5. Adding products
    ...    6. Click "Cart icon"
    ...    7. Click "Checkout"
    ...    8. Input client information
    ...    9. Click "Continue"
    ...    *** Test Steps ***
    ...    1. Click "Finish"
    ...    2. Verify redirect to the checkout complete page [1]
    ...    ==>
    ...    *** Expect Result ***
    ...    [1] Verify redirect to the checkout complete page
    ...    - Title Page "Checkout: Complete!"
    ...    - Label "Thank you for your order!"
    ...    - Back Home Button
    ...    ==>v
    [Tags]    011    pass
    Login To Sauce Demo Success
    Adding 4 Products To Cart
    Go To Cart Page
    Check Items On Cart
    Go To Checkout Cart Items
    Input Client Information Success
    Finish The Order
    Verify The Order Has Been Completed
    Browser Take Screenshot    TC_011

TC_012 Verify Redirect To Home Page And Order Has Been Cleared
    [Documentation]    Owner: Pattamawan
    ...    *** PreRequisite ***
    ...    URL: https://www.saucedemo.com/
    ...    Username: standard_user
    ...    Password: secret_sauce
    ...    *** Prerequisite Step ***
    ...    1. Open web Saucedemo
    ...    2. Fill in the username field
    ...    3. Fill in the password field
    ...    4. Click "Login"
    ...    5. Adding products
    ...    6. Click "Cart icon"
    ...    7. Click "Checkout"
    ...    8. Input client information
    ...    9. Click "Continue"
    ...    10. Click "Finish"
    ...    *** Test Steps ***
    ...    1. Click "Back Home"
    ...    2. Verify navigate to product page [1]
    ...    ==>
    ...    *** Expect Result ***
    ...    [1] Verify navigate to product page
    ...    - Title Page "Products"
    ...    - Hamburger Menu
    ...    - Cart icon
    ...    - Sort icon
    ...    - Product List
    ...    ==>
    [Tags]    012    pass
    Login To Sauce Demo Success
    Adding 4 Products To Cart
    Go To Cart Page
    Check Items On Cart
    Go To Checkout Cart Items
    Input Client Information Success
    Finish The Order
    Click Back To Home Page
    Verify Redirect To Home Page
    Browser Take Screenshot    TC_012


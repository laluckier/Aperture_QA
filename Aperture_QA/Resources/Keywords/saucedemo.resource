*** Settings ***
Library            Browser
Library            String
Library            Collections
Resource          ../Testdata/saucedemo_testdata.resource
Resource          ../Repositories/saucedemo.resource
Variables          ../../Config/default_config.yaml

*** Keywords ***
Open Sauce Demo Page
    [Documentation]    Owner : Pattamawan
    [Arguments]    ${url}
    New Browser    browser=${browser}    headless=${False}
    New Page       ${url}

Close All Web Browser
    [Documentation]    Owner : Pattamawan
    Close Browser    ALL

Verify Elements On Login Page
    [Documentation]    Owner : Pattamawan
    Verify Text On Element            ${lbl_title_login}    ${title_login}
    Check Element Visible             ${txt_username}
    Check Element Visible             ${txt_password}
    Check Element Visible             ${btn_login}
    Check Element Visible             ${pnl_login_credentials}
    Check Element Visible             ${pnl_password}

Verify Text On Element
    [Documentation]    Owner : Pattamawan
    [Arguments]    ${selector}    ${expect_text}
    Check Element Visible    ${selector}
    ${actual_text}    Get Text    ${selector}
    Should Be Equal As Strings    ${actual_text}    ${expect_text}
    ...    values=${False}
    ...    msg=The text of element '${selector}' should have been '${expect_text}' but in fact it was '${actual_text}'.

Check Element Visible
    [Documentation]    Owner : Pattamawan
    [Arguments]    ${selector}
    Wait For Elements State    selector=${selector}    state=visible    timeout=${BrowserTimeout}

Browser Take Screenshot
    [Documentation]    Owner : Pattamawan
    [Arguments]    ${screenshot_name}=pass
    Take Screenshot    ${OUTPUT_DIR}${/}screenshot${/}${screenshot_name}.png    timeout=${screenshot_timeout}

Login To Sauce Demo Success
    [Documentation]    Owner: Pattamawan
    Input Username And Password    ${username.valid}    ${password}
    Click    ${btn_login}
    Check Element Visible          ${lbl_title}

Input Username And Password
    [Documentation]    Owner: Pattamawan
    [Arguments]    ${username}=${EMPTY}    ${password}=${EMPTY}
    Type Text    ${txt_username}    ${username}
    Type Text    ${txt_password}    ${password}

Login To Sauce Demo With Invalid User
    [Documentation]    Owner: Pattamawan
    [Arguments]    ${username}=${EMPTY}    ${password}=${EMPTY}
    Input Username And Password    ${username}    ${password}
    Click    ${btn_login}

Verify Error Message After Login With ${invalid}
    [Documentation]    Owner: Pattamawan
    Check Element Visible    ${btn_close_error}
    Check Element Visible    ${icn_error_username}
    Check Element Visible    ${icn_error_password}
    ${text}        Convert To Lower Case    ${invalid}
    ${invalid_login}        Replace String    ${text}    ${SPACE}    _
    Verify Text On Element    ${lbl_error_msg}    ${error_msg.${invalid_login}}

Verify Elements On Products Page
    [Documentation]    Owner: Pattamawan
    Verify Text On Element            ${lbl_title}        ${page.products}
    Check Element Visible             ${lbl_active_sort}
    Check Element Visible             ${mnu_hamburger}
    Check Element Visible             ${icn_cart}
    Count Items Product

Count Items Product
    [Documentation]    Owner: Pattamawan
    ${items}    Get Elements    ${lst_items}
    ${count}    Get Length     ${items}
    FOR    ${index}    IN RANGE    1    ${count}+1
        Check Element Visible             ${lst_items}\[${index}]
        Check Element Visible             ${lst_items}\[${index}]${lst_items_image}
        Check Element Visible             ${lst_items}\[${index}]${lst_items_name}
        Check Element Visible             ${lst_items}\[${index}]${lst_items_desc}
        Check Element Visible             ${lst_items}\[${index}]${lst_items_price}
        Check Element Visible             ${lst_items}\[${index}]${btn_add_to_cart}
    END

Adding ${add_items} Products To Cart
    [Documentation]    Owner: Pattamawan
    ...    ${add_items}    support only number 1-6
    @{selected_lists}        Create List
    FOR    ${index}    IN RANGE    1    ${add_items}+1
        Click             ${lst_items}\[${index}]${btn_add_to_cart}
        ${slected}        Read Selected Items    ${index}
        Append To List    ${selected_lists}      ${slected}
    END
    Set Test Variable    ${ADD_ITEMS}         ${add_items}
    Set Test Variable    ${SELECTED_LISTS}    ${selected_lists}

Read Selected Items
    [Documentation]    Owner: Pattamawan
    [Arguments]    ${index}
    @{item_info}     Create List
    ${item_name}     Get Text    ${lst_items}\[${index}]${lst_items_name}
    ${item_desc}     Get Text    ${lst_items}\[${index}]${lst_items_desc}
    ${item_price}    Get Text    ${lst_items}\[${index}]${lst_items_price}
    Append To List    ${item_info}    ${item_name}
    Append To List    ${item_info}    ${item_desc}
    Append To List    ${item_info}    ${item_price}
    RETURN    ${item_info}

Verify Add Products To Cart Success
    [Documentation]    Owner: Pattamawan
    ${total_cart}    Get Text     ${icn_cart}
    Should Be Equal As Strings    ${ADD_ITEMS}    ${total_cart}

Remove ${remove_items} Products Form Cart
    [Documentation]    Owner: Pattamawan
    ...    ${items}    support only number 1-6
    Count Selected Items Before Remove    ${remove_items}
    FOR    ${index}    IN RANGE    1      ${remove_items}+1
        Click        ${lst_items}\[${index}]${btn_remove_item}
    END
    ${cart_items}    Evaluate    ${COUNT}-${remove_items}
    Set Test Variable            ${CART_ITEMS}    ${cart_items}

Count Selected Items Before Remove
    [Documentation]    Owner: Pattamawan
    [Arguments]    ${remove_items}
    ${items}    Get Elements    ${btn_add_to_cart}
    ${count}    Get Length      ${items}
    ${current_items}        Evaluate    ${count} >= ${remove_items}
    Should Be True    ${current_items}
    ...    msg=The products in the cart is '${count}', there aren’t enough to remove.
    Set Test Variable    ${COUNT}        ${count}

Verify Remove Products From Cart Success
    [Documentation]    Owner: Pattamawan
    ${total_cart}    Get Text     ${icn_cart}
    Should Be Equal As Strings    ${CART_ITEMS}    ${total_cart}

Go To Cart Page
    [Documentation]    Owner: Pattamawan
    Click    ${icn_cart}
    Verify Text On Element            ${lbl_title}        ${page.cart}

Verify Elements On Cart Page
    [Documentation]    Owner: Pattamawan
    Check Element Visible             ${mnu_hamburger}
    Check Element Visible             ${icn_cart}
    Check Element Visible             ${lbl_qty}
    Check Element Visible             ${lbl_desc}
    Check Element Visible             ${btn_continue_shopping}
    Check Element Visible             ${btn_checkout}
    Check Items On Cart

Check Items On Cart
    [Documentation]    Owner: Pattamawan
    ${items}    Get Elements    ${lst_cart_items}
    ${count}    Get Length     ${items}
    @{cart_selected}    Create List
    FOR    ${index}    IN RANGE    1    ${count}+1
        ${slected}        Read Items On Cart Page    ${index}
        Append To List    ${cart_selected}      ${slected} 
    END
    Set Test Variable    ${CART_SELECTED}    ${cart_selected}

Read Items On Cart Page
    [Documentation]    Owner: Pattamawan
    [Arguments]    ${index}
    @{cart_info}     Create List
    ${item_name}     Get Text    ${lst_cart_items}\[${index}]${lst_cart_name}
    ${item_desc}     Get Text    ${lst_cart_items}\[${index}]${lst_cart_desc}
    ${item_price}    Get Text    ${lst_cart_items}\[${index}]${lst_cart_price}
    Append To List    ${cart_info}    ${item_name}
    Append To List    ${cart_info}    ${item_desc}
    Append To List    ${cart_info}    ${item_price}
    RETURN    ${cart_info}

Verify Added To Cart Correctly
    [Documentation]    Owner: Pattamawan
    Lists Should Be Equal    ${SELECTED_LISTS}    ${CART_SELECTED}

Go To Checkout Cart Items
    [Documentation]    Owner: Pattamawan
    Click    ${btn_checkout}
    Verify Text On Element            ${lbl_title}        ${page.checkout}
    
Verify Elements On Checkout Page
    [Documentation]    Owner: Pattamawan
    Check Element Visible            ${txt_firstname}
    Check Element Visible            ${txt_lastname}
    Check Element Visible            ${txt_zip_code}
    Check Element Visible            ${btn_cancel}
    Check Element Visible            ${btn_continue}

Input Client Information Success
    [Documentation]    Owner: Pattamawan
    Click And Input Text    ${txt_firstname}    ${client.firstname}
    Click And Input Text    ${txt_lastname}     ${client.lastname}
    Click And Input Text    ${txt_zip_code}     ${client.zip_code}
    Click        ${btn_continue}

Click And Input Text
    [Documentation]    Owner: Pattamawan
    [Arguments]        ${selector}    ${text}
    Click            ${selector}
    Type Text        ${selector}    ${text}

Verify Redirect To Overview Page Correctly
    [Documentation]    Owner: Pattamawan
    Check Items On Cart
    Verify Text On Element    ${lbl_payment}            ${overview.payment}
    Verify Text On Element    ${lbl_shipping}           ${overview.shipping}
    Verify Text On Element    ${lbl_price_total}        ${overview.price_total}
    Verify Text Match Regexp On Element        ${lbl_detail_payment}         \[a-zA-Z]|\s#|\d
    Verify Text Match Regexp On Element        ${lbl_detail_shipping}        \[a-zA-Z]|\W
    Verify Text Match Regexp On Element        ${lbl_detail_item_total}      Item total: \\$|\d+.\d+
    Verify Text Match Regexp On Element        ${lbl_detail_tax}             Tax: \\$|\d+.\d+
    Verify Text Match Regexp On Element        ${lbl_detail_price_total}     Total: \\$|\d+.\d+
    Verify Total Price Correctly
    

Verify Text Match Regexp On Element
    [Documentation]    Owner : Pattamawan
    [Arguments]    ${selector}    ${pattern}
    Check Element Visible    ${selector}
    ${pattern}    Convert To String    ${pattern}
    ${actual_text}    Get Text    ${selector}
    Should Match Regexp    ${actual_text}    ${pattern}
    ...    values=${False}
    ...    msg=The text of selector '${selector}' should not match with '${pattern}' but text was '${actual_text}'

Verify Total Price Correctly
    [Documentation]    Owner : Pattamawan
    ${total_price}     Calculate Total Price    ${CART_SELECTED}
    ${item_price}    Get Price    ${lbl_detail_item_total}
    ${tax}           Get Price    ${lbl_detail_tax}
    ${total}         Get Price    ${lbl_detail_price_total}
    ${actual_price}    Evaluate    ${item_price}+${tax}
    Should Be Equal As Numbers    ${item_price}    ${total_price}
    Should Be Equal As Numbers    ${actual_price}    ${total}

Get Price
    [Documentation]    Owner : Pattamawan
    [Arguments]    ${selector}
    ${text_price}        Get Text    ${selector}
    ${number}            Fetch From Right    ${text_price}    $
    ${actual_price}     Convert To Number    ${number}
    RETURN    ${actual_price}


Calculate Total Price
    [Documentation]    Owner : Pattamawan
    [Arguments]    ${list_items}
    ${total_price}       Set Variable    ${0}
    ${total_items}       Get Length    ${list_items}
    FOR    ${index}    IN RANGE    0    ${total_items}
        ${code}         Get From List        ${list_items}[${index}]    index=2
        ${price}        Remove String        ${code}    $
        ${int_price}    Convert To Number    ${price}
        ${total_price}        Evaluate    ${int_price}+${total_price}
    END
    RETURN    ${total_price}

Finish The Order
    [Documentation]    Owner : Pattamawan
    Click    ${btn_finish}
    Verify Text On Element            ${lbl_title}        ${page.complete}

Verify The Order Has Been Completed
    [Documentation]    Owner : Pattamawan
    Check Element Visible     ${img_express}
    Verify Text On Element    ${lbl_complete_header}    ${complete.thank}
    Verify Text On Element    ${lbl_complete_desc}      ${complete.detail}
    Check Element Visible     ${btn_back_home}

Click Back To Home Page
    [Documentation]    Owner : Pattamawan
    Click    ${btn_back_home}
    Verify Text On Element            ${lbl_title}        ${page.products}


Verify Redirect To Home Page
    [Documentation]    Owner: Pattamawan
    Verify Elements On Products Page
    ${all_items}         Count Element     ${lst_items}
    ${all_add_button}    Count Element     ${btn_add_to_cart}
    Should Be Equal As Numbers    ${all_items}    ${all_add_button}
    ${cart}        Get Text    ${icn_cart}
    Should Be Empty    ${cart}

Count Element
    [Documentation]    Owner: Pattamawan
    [Arguments]    ${selector}
    ${items}    Get Elements    ${selector}
    ${count}    Get Length     ${items}
    RETURN    ${count}
    


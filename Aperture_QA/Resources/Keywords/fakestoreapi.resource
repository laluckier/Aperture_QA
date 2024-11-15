*** Settings ***
Library            Collections
Library            RequestsLibrary
Library            String
Library            JSONLibrary
Resource           ../Testdata/fakestoreapi.robot
Variables          ../../Config/default_config.yaml         

*** Keywords ***
Get Session
    [Documentation]    Owner: Pattamawan
    Create Session    fake_store    ${API.url_fakestoreapi}
    Set Test Variable    \${fake_store}    fake_store

Get All Products
    [Documentation]    Owner: Pattamawan
    ${response}    GET On Session    ${fake_store}    url=${API.product_path}    expected_status=200
    Log List    ${response.json()}
    Set Test Variable    \${response_code}    ${response.status_code}

Create New Product
    [Documentation]    Owner: Pattamawan
    [Arguments]       ${product}
    ${response}    POST On Session    ${fake_store}    url=${API.product_path}    json=${product}        expected_status=200
    ${title}    Get Dictionary Items        ${response.json()}
    Log List    ${title}
    Set Test Variable    \${response_code}    ${response.status_code}

Update Product Data
    [Documentation]    Owner: Pattamawan
    [Arguments]       ${product_id}    ${product_data}
    ${response}    PUT On Session    ${fake_store}    url=${API.product_path}/${product_id}    json=${product_data}        expected_status=200
    Log    ${response.json()}
    Set Test Variable    \${response_code}    ${response.status_code}

Get Product By Category
    [Documentation]    Owner: Pattamawan
    [Arguments]    ${category}
    ${category_response}        GET On Session    ${fake_store}    url=${API.product_path}/category/${category}        expected_status=200
    Log List    ${category_response.json()}
    Set Test Variable    \${response_code}    ${category_response.status_code}

Sorted Product In ${type} Order
    [Documentation]    Owner: Pattamawan
    ...        ${type}    Support only 'Asc' or 'Desc'
    ${text}        Convert To Lower Case    ${type}
    ${sorted_response}=    GET On Session    ${fake_store}    url=${API.product_path}?sort=${text}        expected_status=200
    Log List    ${sorted_response.json()}
    Set Test Variable    \${response_code}    ${sorted_response.status_code}

Delete Product By Id
    [Documentation]    Owner: Pattamawan
    [Arguments]       ${product_id}
    ${delete_response}    DELETE On Session    ${fake_store}    url=${API.product_path}/${product_id}        expected_status=200
    Set Test Variable    \${response_code}    ${delete_response.status_code}

Verify Status Code Should Be ${status}
    [Documentation]    Owner: Pattamawan
    ...    ${status}    support only status code
    Should Be Equal As Numbers   ${status}    ${response_code}
    ...    msg=Expect status code '${status}', but got '${response_code}'.
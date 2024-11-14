*** Settings ***
Library            Collections
Library            RequestsLibrary
Library    ../../../.venv/Lib/site-packages/robot/libraries/String.py
Resource          ../Testdata/fakestoreapi.robot
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

Create New Product
    [Documentation]    Owner: Pattamawan
    [Arguments]       ${product}
    ${response}    POST On Session    ${fake_store}    url=${API.product_path}    json=${product}        expected_status=200
    ${title}    Get Dictionary Items        ${response.json()}
    Log List    ${title}

Update Product Data
    [Documentation]    Owner: Pattamawan
    [Arguments]       ${product_id}    ${product_data}
    ${response}    PUT On Session    ${fake_store}    url=${API.product_path}/${product_id}    json=${product_data}        expected_status=200
    Log    ${response.json()}

Get Product By Category
    [Documentation]    Owner: Pattamawan
    [Arguments]    ${category}
    ${category_response}        GET On Session    ${fake_store}    url=${API.product_path}/category/${category}        expected_status=200
    Log List    ${category_response.json()}

Sorted Product In ${type} Order
    [Documentation]    Owner: Pattamawan
    ${text}        Convert To Lower Case    ${type}
    ${sorted_response}=    GET On Session    ${fake_store}    url=${API.product_path}?sort=${text}        expected_status=200
    Log List    ${sorted_response.json()}

Delete Product By Id
    [Documentation]    Owner: Pattamawan
    [Arguments]       ${product_id}
    ${delete_response}    DELETE On Session    ${fake_store}    url=${API.product_path}/${product_id}        expected_status=200
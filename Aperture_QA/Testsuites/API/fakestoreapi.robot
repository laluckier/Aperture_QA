*** Settings ***
Resource        ../../Resources/Keywords/fakestoreapi.resource
Test Setup      Get Session

*** Test Cases ***
TC_001 Get All Products From Fake Store API
    [Documentation]    Owner: Pattamawan
    ...    *** PreRequisite ***
    ...    Url: https://fakestoreapi.com/
    ...    Path: products 
    ...    *** Prerequisite Step ***
    ...    1. Create API fakestoreapi Session
    ...    *** Test Steps ***
    ...    1. Get products from fakestoreapi
    ...    2. Verify get products success [1]
    ...    ==>
    ...    *** Expect Result ***
    ...    [1.] Verify get products success
    ...    - Response status code 200
    [Tags]    001    test
    Get All Products
    Verify Status Code Should Be 200

TC_002 Create New Products To Fake Store API
    [Documentation]    Owner: Pattamawan
    ...    *** PreRequisite ***
    ...    Url: https://fakestoreapi.com/
    ...    Path: products 
    ...    *** Prerequisite Step ***
    ...    1. Create API fakestoreapi Session
    ...    *** Test Steps ***
    ...    1. Create Nen products to fakestoreapi
    ...    2. Verify create new products success [1]
    ...    ==>
    ...    *** Expect Result ***
    ...    [1.] Verify create new products success
    ...    - Response status code 200
    [Tags]    002
    Create New Product            product=${data_luffy}
    Verify Status Code Should Be 200

TC_003 Update Products Data To Fake Store API
    [Documentation]    Owner: Pattamawan
    ...    *** PreRequisite ***
    ...    Url: https://fakestoreapi.com/
    ...    Path: products 
    ...    ProductId: 15
    ...    *** Prerequisite Step ***
    ...    1. Create API fakestoreapi Session
    ...    *** Test Steps ***
    ...    1. Update products data to fakestoreapi
    ...    2. Verify update products data success [1]
    ...    ==>
    ...    *** Expect Result ***
    ...    [1.] Verify update products data success
    ...    - Response status code 200
    [Tags]    003
    Update Product Data           product_id=${product_id}    product_data=${data_law}
    Verify Status Code Should Be 200

TC_004 Select Products By Category On Fake Store API
    [Documentation]    Owner: Pattamawan
    ...    *** PreRequisite ***
    ...    Url: https://fakestoreapi.com/ 
    ...    Path: products/categories 
    ...    *** Prerequisite Step ***
    ...    1. Create API fakestoreapi Session
    ...    *** Test Steps ***
    ...    1. Select products from category on fakestoreapi
    ...    2. Verify select products success [1]
    ...    ==>
    ...    *** Expect Result ***
    ...    [1.] Verify select products success
    ...    - Response status code 200
    [Tags]    004
    Get Product By Category       category=${category}
    Verify Status Code Should Be 200

TC_005 Get Product By Sorted In Asc
    [Documentation]    Owner: Pattamawan
    ...    *** PreRequisite ***
    ...    Url: https://fakestoreapi.com/
    ...    Path: products?sort=asc
    ...    *** Prerequisite Step ***
    ...    1. Create API fakestoreapi Session
    ...    *** Test Steps ***
    ...    1. Sorted product in 'Asc' on fakestoreapi
    ...    2. Verify sorted products success [1]
    ...    ==>
    ...    *** Expect Result ***
    ...    [1.] Verify sorted products success
    ...    - Response status code 200
    [Tags]    005
    Sorted Product In Asc Order
    Verify Status Code Should Be 200

TC_006 Delete Product From Fake Store API
    [Documentation]    Owner: Pattamawan
    ...    *** PreRequisite ***
    ...    Url: https://fakestoreapi.com/
    ...    Path: products 
    ...    ProductId: 15
    ...    *** Prerequisite Step ***
    ...    1. Create API fakestoreapi Session
    ...    *** Test Steps ***
    ...    1. Delete products from fakestoreapi
    ...    2. Verify delete products success [1]
    ...    ==>
    ...    *** Expect Result ***
    ...    [1.] Verify delete products success
    ...    - Response status code 200
    [Tags]    006
    Delete Product By Id          product_id=${product_id}
    Verify Status Code Should Be 200
*** Settings ***
Resource        ../../Resources/Keywords/fakestoreapi.resource
Test Setup      Get Session

*** Test Cases ***
TC_001 Get All Products From Fake Store API
    [Documentation]    Owner: Pattamawan
    [Tags]    001
    Get All Products
    Create New Product            product=${data_luffy}
    Update Product Data           product_id=${product_id}    product_data=${data_law}
    Get Product By Category       category=${category}
    Sorted Product In Asc Order
    Delete Product By Id          product_id=${product_id}
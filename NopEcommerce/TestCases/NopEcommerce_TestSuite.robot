*** Settings ***
Documentation    Testing the mobile purchase flow
Library    SeleniumLibrary    
Suite Setup    Open Browser  browser=chrome
Test Setup    Go to  https://frontend.nopcommerce.com/
Suite Teardown    Close Browser


***Variables***
${search_item}        id=small-searchterms
${Opt_Electronics}    xpath =  (//a[text()='Electronics '])[1]  #//ul[@class='top-menu notmobile']//a[text()='Electronics ']
${Opt_CellPhones}     xpath=//ul[@class='top-menu notmobile']//a[text()='Cell phones ']
${page_title}         xpath=//div[@class='page-title']//h1[text()='Cell phones']
${shopping_cart}      xpath=//a[text()='shopping cart']
${item_quantity}      id=itemquantity11218
${update_cart_button}  name=updatecart
${unit_price}        xpath=//span[@class='product-unit-price']
${total_price}       xpath=//span[@class='product-subtotal']



*** Test Cases ***
Check mobile purchase flow
    [Documentation]    Check the mobile purchase flow
    Select Mobile Options from Electronics
    Add the mobile to cart    Nokia Lumia 1020
    Verify the shopping cart    2
       
    
    
    
    
*** Keywords ***
Select Mobile Options from Electronics
     Maximize Browser Window
     Sleep    5s  
     Input Text    ${search_item}    Mobile    
     Sleep    20s    
     Wait Until Element Is Visible    ${Opt_Electronics}    20s
     Mouse Over    ${Opt_Electronics}
     Click Element    ${Opt_CellPhones}
     Wait Until Element Is Visible    ${page_title}    

Add the mobile to cart
    [Arguments]  ${mobile_model}    
    Click Element    //div[@class='description' and contains(text(), '"${mobile_model}"')]/..//input[contains(@value, 'Add to cart')]   
    Wait Until Element Is Visible    ${shopping_cart}    
    
Verify the shopping cart
    [Arguments]    ${quantity}
    Clear Element Text    ${item_quantity}
    Input Text    ${item_quantity}    ${quantity}
    Click Element    ${update_cart_button}
    Sleep  5s
    ${mobile_unit_price}=  Get Text    ${unit_price}
    ${actual_mobile_tot_price}=    Get Text    ${total_price}
    ${expected_total}=    Evaluate    ${mobile_unit_price} * ${quantity}
    Pass Execution If    '${expected_total}' == '${actual_mobile_tot_price}'    Total is matching    

           
    
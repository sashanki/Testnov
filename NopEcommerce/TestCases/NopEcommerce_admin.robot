*** Settings ***
Library    String
Documentation    Verifying the admin portal
Library    SeleniumLibrary    
Suite Setup    Open Browser  browser=chrome
Test Setup    Go to  https://admin-demo.nopcommerce.com/
Suite Teardown    Close Browser


***Variables***
${txt_email}        id=Email
${txt_pwd}          id=Password
${btn_login}        xpath=//input[contains(@value,'Log in')]

${lnk_Customer}     xpath=(//ul[@class='sidebar-menu tree']//span[text()='Customers'])[1]
${cust_list}        xpath=(//a[@href='/Admin/Customer/List'])[1]

${btn_newCust}      xpath=//a[@href='/Admin/Customer/Create']
${txt_newCustEmail}    id=Email
${txt_newCustPwd}    id=Password
${txtFName}    id=FirstName
${txtLName}    id=LastName
${rdbtn_male}    id=Gender_Male
${txt_DOB}    id=DateOfBirth
${txt_Company}    id=Company
${btn_save}    name=save

${newCustAlert}    xpath=//div[@class='alert alert-success alert-dismissable']


*** Test Cases ***
Create new customer flow
    [Documentation]    Check the mobile purchase flow
    Login to the site    admin@yourstore.com    admin
    Choose Customer
    Add new Customer      
    
    
    
*** Keywords ***
Login to the site
    [Arguments]    ${Username}    ${password}
    Maximize Browser Window
    Wait Until Element Is Visible    ${txt_email}    
    Input Text    ${txt_email}    ${Username}    
    Input Password    ${txt_pwd}    ${password}    
    Click Button    ${btn_login}    
    Wait Until Element Is Visible    ${lnk_Customer}   20s    
    
Choose Customer
    Click Element    ${lnk_Customer}    
    Wait Until Element Is Visible    ${cust_list}  20s
    Click Element    ${cust_list}    
    Wait Until Element Is Visible    ${btn_newCust}    
 
Add new customer
    Click Element    ${btn_newCust}    
    Wait Until Element Is Visible    ${txt_newCustEmail}   
    ${ret} =  Generate Random String	    2    [NUMBERS]
    Input Text    ${txt_newCustEmail}    testuser+${ret}+@gmail.com   
    Input Password    ${txt_newCustPwd}    test
    Input Text    ${txtFName}    testuser1     
    Input Text    ${txtLName}    SampleUser    
    #Select Radio Button    ${rdbtn_male}    M
    Click Element    ${rdbtn_male}    
    Input Text    ${txt_DOB}    11/18/2020
    Input Text    ${txt_Company}    TestCompany    
    Click Button    ${btn_save}    
    Wait Until Element Is Visible    ${newCustAlert}    20s
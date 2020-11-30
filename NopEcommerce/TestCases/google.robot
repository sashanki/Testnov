*** Settings ***
Documentation    Testing the mobile purchase flow
Library    SeleniumLibrary    
Suite Setup    Open Browser  browser=chrome
Test Setup    Go to  https://www.google.com
Suite Teardown    Close Browser


***Variables***
${seachbox}    xpath = //input[@name='q']
${searchbutton}    xpath=(//input[@value='Google Search'])[2]


*** Test Cases ***
Check mobile purchase flow
    [Documentation]    Check the mobile purchase flow
    Click Button    ${seachbox}
    Input Text    ${seachbox}    hello        
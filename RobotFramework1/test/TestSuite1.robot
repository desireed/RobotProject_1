*** Settings ***
Library    SeleniumLibrary

Suite Setup    Log    I am inside Test Suite Setup
Suite Teardown    Log    I am inside Test Suite Teardown
Test Setup    Log    I am inside Test Case Setup     
Test Teardown    Log    I am inside Test Case Setup     

Default Tags    sanity

*** Test Cases ***
MyFirstTest
    [Tags]    smoke
    Log    Hello World...    

*** Test Cases ***
MySecondTest
    Log    Hello World..
    Set Tags    regression1.    
    #Remove Tags    regression1.    

*** Test Cases ***
MyThirdTest
    Log    Hello World...    

*** Test Cases ***
MyFourthTest
    Log    Hello World...    

FirstSeleniumTest
    Open Browser    https://www.google.com    ff
    Set Browser Implicit Wait    5
    Input Text    name=q    Automation step by step
    Press Keys    name=q    ENTER
    #Click Button    name=btnk       
    Sleep    2
    close browser
    log    Test Completed
    
SampleLoginTest
    [Documentation]    This is a sample Login test
    Open Browser    ${URL}    ff
    Set Browser Implicit Wait    5
    Input Text        id=txtUsername    @{CREDENTIALS}[0]
    Input Password    id=txtPassword    &{LOGINDATA}[password]
    click Button    id=btnLogin
    Click Element    id=welcome
    Click Element    link=Logout
    Sleep    2
    Close Browser    
    Log                Test Completed
    Log    This test was executed by %{username}             

SampleLoginTest2
    [Documentation]    This is a sample Login test
    Open Browser    ${URL}    ff
    Set Browser Implicit Wait    5
    LoginKW
    Click Element    id=welcome
    Click Element    link=Logout
    Sleep    2
    Close Browser    
    Log                Test Completed
    Log    This test was executed by %{username}             

*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com/
@{CREDENTIALS}    Admin    admin123
&{LOGINDATA}    username=Admin    password=admin123

*** Keywords ***
LoginKW
    Input Text        id=txtUsername    @{CREDENTIALS}[0]
    Input Password    id=txtPassword    &{LOGINDATA}[password]
    click Button    id=btnLogin

    
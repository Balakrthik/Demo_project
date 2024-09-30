*** Settings ***
Documentation     Automating Demo Website
Library           SeleniumLibrary
Resource          ..//Automation_demo/Resource.robot
Resource          ..//Automation_demo/keywords.robot

*** Test Cases ***
TC_01_Open Browser and Maximize Window
    [Tags]     ${BROWSER}_${LOCALIZATION}
    Initialize open browser
    ${title}     Get Title  
    Run Keyword If     '${title}' == 'Amazon.com. Spend less. Smile more.'     Log To Console    'Browser opened in English languagae'  
    ...    ELSE     Log To Console      'Browser opened in Spanish languagae'
    Log     Title is : '${title}'
TC_02_To verify that empty fields get an error value
    [Tags]     ${BROWSER}_${LOCALIZATION}
    Create an account with no credentials 
TC_03_To Verify the invalid credentials get an error value  
    [Tags]     ${BROWSER}_${LOCALIZATION}
    Login with Invalid username
TC_04_To verify with invalid value
    [Tags]     ${BROWSER}_${LOCALIZATION}
    Login with valid username and invalid password
TC_05_To verify with valid credentials
    [Tags]     ${BROWSER}_${LOCALIZATION}
    Login with valid credentials
TC_06_Change the country region and select product
    [Tags]     ${BROWSER}_${LOCALIZATION}
  IF  '${LOCALIZATION}' == 'en'
    Change country Region 
    Search product and Select product
  ELSE
    Search product and Select product
  END
Tc_07 To verify invalid card details get an error value
    [Tags]     ${BROWSER}_${LOCALIZATION}
    Add card  
TC_08 To verify the boundary value
    [Tags]     ${BROWSER}_${LOCALIZATION}
    Select amazon pay and check boundary value analysis
TC_08 To verify Signout
    [Tags]     ${BROWSER}_${LOCALIZATION}
    SignOut and Close Browser
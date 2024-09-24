*** Settings ***
Library    SeleniumLibrary 
Library    JSONLibrary
Resource    ../Localization/variables_en.robot

*** Test Cases ***
TC_01
    [Tags]     ${BROWSER}_${LOCALIZATION}
    Initialize open browser
    # Attempt to click the popup button
    ${result}    ${error}    Run Keyword And Ignore Error    Click Popup Button
    Run Keyword If    '${error}' == 'None'    Log    Successfully clicked the popup button
    ...    ELSE    Log    Popup button was not found or clickable
    Validate the language
    Click Flights button

*** Keywords ***
Initialize open browser    
  IF     '${BROWSER}' == 'CHROME'
    Open Browser     ${URL}     ${BROWSER}      options=add_experimental_option('prefs', {"intl.accept_languages":"${LOCALIZATION}"});
    Maximize Browser Window
  ELSE IF  '${BROWSER}' == 'EDGE'
    Open Browser     ${URL}     ${BROWSER}      options=add_experimental_option('prefs', {"intl.accept_languages":"${LOCALIZATION}"});
    Maximize Browser Window
  ELSE IF  '${BROWSER}' == 'FIREFOX' or '${BROWSER}' == 'Firefox' or '${BROWSER}' == 'firefox'
    Open Browser     ${URL}     ${BROWSER}      ff_profile_dir=set_preference("intl.accept_languages","${LOCALIZATION}")
    Maximize Browser Window
    Delete All Cookies
  END
Click Popup Button
    # Check if the popup button is visible
    Wait Until Element Is Visible    ${POPUP_BUTTON}    timeout=5
    Click Element    ${POPUP_BUTTON}
    Log    Popup button clicked

Validate the language
  IF     '${LOCALIZATION}' == '${EMPTY}'
    ${value}     Get Text    ${register.text}    
    Should Be Equal    ${value}    Register
    Log To Console    Language : English
  ELSE
   ${value1}     Get Text    ${register.text1}   
    Should Be Equal    ${value1}     Hazte una cuenta
    Log To Console    Language : Spanish
  END

Click Flights button
  IF     '${LOCALIZATION}' == '${EMPTY}'
   Click Element    ${flights.button}
   Click Element    ${whereto.button}
   Input Text       ${enterdest.text}     MAA
   Sleep    3s
   Click Element    ${select.dest} 
   Click Button    ${search.button} 
  ELSE
   Click Element    ${flights.button}
   Click Element    ${whereto.button}
   Input Text       ${enterdest.text1}     MAA
   Sleep    3s
   Click Element    ${select.dest1} 
   Click Button    ${search.button} 
  END

       
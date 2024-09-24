*** Settings ***
Library    SeleniumLibrary 
Library    JSONLibrary

*** Variables ***
${URL}        https://www.booking.com
${BROWSER}    ${EMPTY}
${LANGUAGE}   ${EMPTY} 

*** Test Cases ***
Initialize open browser
    [Tags]     ${BROWSER}     
  IF     '${BROWSER}' == 'CHROME'
    Open Browser     ${URL}     ${BROWSER}      options=add_experimental_option('prefs', {'intl.accept_languages':'es'});
    Maximize Browser Window
  ELSE IF  '${BROWSER}' == 'EDGE' 
    Open Browser     ${URL}     ${BROWSER}      options=add_experimental_option('prefs', {'intl.accept_languages':'es'});
    Maximize Browser Window
  ELSE IF  '${BROWSER}' == 'FIREFOX' or '${BROWSER}' == 'Firefox' or '${BROWSER}' == 'firefox' 
    Open Browser     ${URL}     ${BROWSER}      ff_profile_dir=set_preference("intl.accept_languages", "en")
    Maximize Browser Window
  END
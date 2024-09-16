*** Settings ***
Resource    ../Keywords/keywords.robot

*** Test Cases ***
TC_01
     [Tags]    ${BROWSER}_Login
    Login to Adactin   ${URL}     ${BROWSER}  

TC_02
    [Tags]     ${BROWSER}_Searching Hotel
    Search Hotels
TC_03
    [Tags]     ${BROWSER}_Selecting Hotel
    Select Hotel
TC_04
    [Tags]     ${BROWSER}_Booking Hotel
    Book Hotel
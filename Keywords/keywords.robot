*** Settings ***
Library    SeleniumLibrary 
Library    Process
     
*** Variables ***

${URL}        https://adactinhotelapp.com/
${BROWSER}    ${EMPTY}  


#**************Locators****************#
#Login Page
${userid.Username}     id=username
${userid.password}     id=password
${user.login}          id=login

#Search Hotel
${hotel.location}     id=location
${hotel.name}         id=hotels
${hotel.roomno}       id=room_nos
${hotel.roomtype}     id=room_type
${hotel.adult}        id=adult_room
${hotel.child}        id=child_room
${hotel.submit}       id=Submit

#Select Hotel
${select.radiobtn}    id=radiobutton_0
${click.continue}     id=continue

#Book Hotel
${book.firstname}    id=first_name
${book.lastname}     id=last_name 
${book.address}      id=address
${book.ccnum}        id=cc_num
${book.cctype}       id=cc_type
${book.expmonth}     id=cc_exp_month
${book.expyear}      id=cc_exp_year
${book.cvv}          id=cc_cvv
${book.submit}       id=book_now

*** Keywords ***
Login to Adactin
    [Arguments]     ${URL}     ${BROWSER}      
    Open Browser       ${URL}     ${BROWSER}               
    Maximize Browser Window
    Title Should Be    Adactin.com - Hotel Reservation System
    Input Text    ${userid.Username}      Tonystark1234
    Input Text    ${userid.password}   A02801
    Click Button  ${user.login}  

# Login to Adactin InValidLogin
#     Open Browser      https://adactinhotelapp.com/    chrome       
#     Maximize Browser Window
#     Title Should Be    Adactin.com - Hotel Reservation System
#     Input Text    id=username   Tonystark12345
#     Input Text    id=password   A028012
#     Click Button  id=login 

Search Hotels 
    Page Should Contain    Search Hotel  
    Select From List By Value   ${hotel.location}   London    
    Select From List By Value   ${hotel.name}       Hotel Sunshine
    Select From List By Value   ${hotel.roomtype}   Double
    Select From List By Value   ${hotel.roomno}     3
    Select From List By Value   ${hotel.adult}      2
    Select From List By Value   ${hotel.child}      1
    Click Button                ${hotel.submit}
    
Select Hotel
    Page Should Contain    Select Hotel 
    Click Button     ${select.radiobtn}           
    Click Button     ${click.continue}

Book Hotel
    Page Should Contain    Book A Hotel 
    Input Text                    ${book.firstname}   Tony
    Input Text                    ${book.lastname}    Stark1234
    Input Text                    ${book.address}     xyz
    Input Text                    ${book.ccnum}       5432198761234567
    Select From List By Value     ${book.cctype}      VISA    
    Select From List By Value     ${book.expmonth}    6
    Select From List By Value     ${book.expyear}     2028
    Input Text                    ${book.cvv}         123     
    Click Button                  ${book.submit}
    Set Browser Implicit Wait    7
    ${value}    Get Element Attribute    id=order_no    value
    Log    ${value} 
    Log To Console    OrderNo.${value}
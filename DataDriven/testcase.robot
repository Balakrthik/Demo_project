*** Settings ***
Documentation      Datadriver Testing with Excel
Library            SeleniumLibrary
Library            DataDriver     ../TestData/value.xlsx     sheet_name=Login
Library            Process
Test Template      Booking A Hotel with Valid Credentials

*** Variables ***
${URL}        https://adactinhotelapp.com/
${BROWSER}   chrome
${valid.username}     id=username
${valid.password}     id=password
${login}              id=login

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


*** Test Cases ***
To Verify the hotel Booking   ${name}      ${pass}    ${location}    ${hotelname}	${hotelroomtype}	${hotelroomno}
    ...           ${hoteladult}    ${hotelchild}    ${bookfirstname}	${booklastname} 	${bookaddress}	
    ...	          ${bookccnum}	${bookcctype}	${bookexpmonth}    ${bookexpyear}    ${bookcvv} 
    [Documentation]     This is executing using Excel File
    [Tags]    ${BROWSER}_Booking_hotel
    
*** Keywords ***
Booking A Hotel with Valid Credentials
    [Arguments]   ${name}      ${pass}    ${location}    ${hotelname}	${hotelroomtype}	${hotelroomno}
    ...           ${hoteladult}    ${hotelchild}    ${bookfirstname}	${booklastname} 	${bookaddress}	
    ...	          ${bookccnum}	${bookcctype}	${bookexpmonth}    ${bookexpyear}    ${bookcvv} 
#Login to Adactin                
    Open Browser   ${URL}     ${BROWSER} 
    Maximize Browser Window
    Title Should Be    Adactin.com - Hotel Reservation System
    Input Text    ${valid.username}    ${name}         
    Input Text    ${valid.password}    ${pass}  
    Click Button  ${login}  
#searching Hotel       
    Page Should Contain    Search Hotel  
    Select From List By Label   ${hotel.location}      ${location}       
    Select From List By Value   ${hotel.name}          ${hotelname}       
    Select From List By Value   ${hotel.roomtype}      ${hotelroomtype}
    Select From List By Value   ${hotel.roomno}        ${hotelroomno}
    Select From List By Value   ${hotel.adult}         ${hoteladult}
    Select From List By Value   ${hotel.child}         ${hotelchild}
    Click Button                ${hotel.submit}
#Selecting Hotel
    Page Should Contain    Select Hotel 
    Click Button     ${select.radiobtn}           
    Click Button     ${click.continue}
#Booking Hotel  
    Page Should Contain    Book A Hotel 
    Input Text                    ${book.firstname}     ${bookfirstname}   
    Input Text                    ${book.lastname}      ${booklastname}
    Input Text                    ${book.address}       ${bookaddress}
    Input Text                    ${book.ccnum}         ${bookccnum}     
    Select From List By Value     ${book.cctype}        ${bookcctype}
    Select From List By Value     ${book.expmonth}      ${bookexpmonth} 
    Select From List By Value     ${book.expyear}       ${bookexpyear}
    Input Text                    ${book.cvv}           ${bookcvv} 
    Click Button                  ${book.submit}
    Set Browser Implicit Wait    7
    ${value}    Get Element Attribute    id=order_no    value
    Log    ${value} 
    Log To Console    OrderNo.${value}

 



*** Settings ***
Library    SeleniumLibrary 
Library    JSONLibrary

*** Variables ***
${URL}            https://www.booking.com
${BROWSER}        ${EMPTY}
${LOCALIZATION}   ${EMPTY}

${POPUP_BUTTON}        (//button[@type='button'])[57]
${flights.button}      id=flights
${whereto.button}      //button[@data-ui-name='input_location_to_segment_0']

${enterdest.text}     //input[@placeholder='Airport or city']  
${enterdest.text1}    //input[@placeholder='Aeropuerto o ciudad'] 

${select.dest}         //span[text()='Chennai International Airport']
${select.dest1}        //span[text()='Aeropuerto internacional de Chennai']

${search.button}       //button[@data-ui-name='button_search_submit']

${register.text}       //span[text()='Register']
${register.text1}      //span[text()='Hazte una cuenta']
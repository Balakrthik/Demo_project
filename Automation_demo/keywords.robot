*** Settings ***
Documentation     Automating Demo Website
Library           SeleniumLibrary
Library    Screenshot
Resource          ..//Automation_demo/Resource.robot


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
    Click Element    ${SignIn.button}

Change country Region 
    Mouse Over    ${currency.text} 
    Sleep    2s
    Click Element    ${change.country}
    Wait Until Page Contains Element    ${country.header}
    Click Element    ${click.country} 
    Click Element    ${select.coutnryen}  
    Click Element    //input[@class='a-button-input']
    Sleep  2s
    Switch Window     NEW
    Take Screenshot

Login with Invalid username
    Wait Until Page Contains Element    ${SignIn.text}
    Input Text    ${email.textbox}     ABC 
    Click Button    ${continue.button}
    ${error}     Get Text    ${invalidno.error}  
    Log      Error : ${error} 
    Double Click Element    ${email.textbox}
    Sleep    2s 
    Press Keys    None    BACKSPACE 
    Input Text    ${email.textbox}     9025990259  
    Click Button    ${continue.button}  
  IF     '${LOCALIZATION}' == 'en'  
    Sleep    2s
    ${error_en}     Get Text   ${error.headeren} 
    Log      Error : ${error_en}
  ELSE
     Sleep    2s
    ${error_es}     Get Text   ${error.headeres} 
    Log      Error : ${error_es}
  END
    
Create an account with no credentials 
    Click Element    ${createacc.btn} 
    ${title}     Get Title
  IF     '${LOCALIZATION}' == 'en'
    Title Should Be    Amazon Registration 
  ELSE   
    Title Should Be    Registro de Amazon
  END  
    Click Button    ${acccontinue.button} 
    ${error}    Get Text    ${accerror.text} 
    Log      Error : ${error}
    ${error1}    Get Text    ${accerror.text1}
    Log      Error : ${error1}
    ${error2}    Get Text    ${accerror.text2}
    Log      Error : ${error2} 
    Go Back
    Reload Page

Login with valid username and invalid password
    Wait Until Page Contains Element    ${SignIn.text}
    Double Click Element    ${email.textbox}
    Sleep    2s 
    Press Keys    None    BACKSPACE 
    Input Text    ${email.textbox}     8220575935  
    Click Button    ${continue.button} 
    Input Text    ${pass.text}     password  
    Click Button    ${signin.submit}
    Sleep    2s
    ${error}     Get Text   ${pass.error} 
    Log      Error : ${error}

Login with valid credentials
    Input Text    ${pass.text}     Karthik#1819 
    Click Button   ${signin.submit}

Login with valid username and valid password
    Input Text    ${email.textbox}     8220575935  
    Click Button    ${continue.button} 
    Input Text    ${pass.text}     Karthik#1819 
    Click Button   ${signin.submit}


Search product and Select product
    Input Text       ${search.box}     samsung s24 ultra
    Press Keys       ${search.box}     ENTER
    ${title}     Get Title
  IF     '${LOCALIZATION}' == 'en'
    Title Should Be    Amazon.in : samsung s24 ultra 
    Wait Until Page Contains Element    ${product.link} 
    Click Element    ${product.link}  
  ELSE
    Wait Until Page Contains Element    ${product.link1} 
    Click Element    ${product.link1}  
  END

Add card  
    Sleep   3s
  IF     '${LOCALIZATION}' == 'en'
    Switch Window     Samsung Galaxy S24 Ultra 5G AI Smartphone (Titanium Gray, 12GB, 512GB Storage) : Amazon.in: Electronics
    Take Screenshot
    Click Button    ${Buy.button}  
    Login with valid username and valid password
    Switch Window     Amazon.in : samsung s24 ultra
    Take Screenshot
  END
Select amazon pay and check boundary value analysis
  IF     '${LOCALIZATION}' == 'en' 
    Click Element    ${all.btn}  
    Sleep  3s
    Click Link    ${amazonpay.btn}
    Sleep  3s
    Click Element    ${electricity.btn}
    Sleep  3s
    Select From List By Label    ${select.state}      Tamil Nadu       
    Sleep  3s
    Input Text    ${consumer.no}      123
    Press Keys     NONE     TAB
    Sleep    2s
    ${error}     Get Text    ${billno.error}  
    Log     Error:${error}
  ELSE  
    Click Element    ${all.btn} 
    Sleep  3s
    Click Element    ${seemore.btn}
    Sleep  3s
    Click Element    ${giftcard.btn}  
    Sleep  3s
    Click Link    ${amazonreload.btn}
    Sleep    3s
    Input Text    ${giftcard.amt}     2
    Sleep    3s
    ${error}     Get Text    ${amount.error}   
    Log     Error:${error}
    Press Keys     NONE     BACKSPACE
    Input Text    ${giftcard.amt}     3000
    Sleep    3s
    ${error1}     Get Text    ${amount.error}   
    Log     Error:${error1}
  END  
SignOut and Close Browser
  IF     '${LOCALIZATION}' == 'en' 
    Click Element    ${all.btn} 
    Sleep    3s
    Click Link    ${signout.btn} 
    Take Screenshot
  ELSE
    Click Element    ${all.btn}  
    Sleep    2s
    Click Link    ${signout.btn1} 
    Take Screenshot
  END
    Close All Browsers







  
    


    
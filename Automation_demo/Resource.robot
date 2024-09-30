*** Settings ***
Documentation     Automating Demo Website
Library           SeleniumLibrary


*** Variables ***
${URL}            https://www.amazon.com
${BROWSER}        ${EMPTY}
${LOCALIZATION}   ${EMPTY}
${SignIn.button}     id=nav-link-accountList-nav-line-1
${SignIn.text}       //h1[@class='a-spacing-small']

#valid and Invalid credentials
${email.textbox}     id=ap_email
${continue.button}    id=continue
${invalidno.error}         (//div[@class='a-alert-content'])[4]
${error.headeren}           //h4[text()='Incorrect phone number']
${error.headeres}          //h4[text()='Número de teléfono incorrecto']
${pass.text}            id=ap_password
${signin.submit}        id=signInSubmit
${pass.error}         //span[@class="a-list-item"]


#Create account page
${createacc.btn}          id=createAccountSubmit
${createacc.text}         //h1[@class='a-spacing-small']
${acccontinue.button}     id=continue
${accerror.text}          (//div[@class='a-alert-content'])[2]
${accerror.text1}          (//div[@class='a-alert-content'])[4]
${accerror.text2}          (//div[@class='a-alert-content'])[7]
${signin.btn}               //a[@class='a-link-emphasis']

#search product
${search.box}            id=twotabsearchtextbox 
${Brand.filter}          (//span[@class='sf-rib-v1-dropdown-pill-content-container'])[2]
${Brand.checkbox}         (//span[@class='a-size-base a-color-base'])[1]
${product.link}           (//h2[@class='a-size-mini a-spacing-none a-color-base s-line-clamp-2'])[1]     
${product.link1}          (//h2[@class='a-size-mini a-spacing-none a-color-base s-line-clamp-2'])[3]       
${Buy.button}            id=buy-now-button

#Change currency
${currency.text}        (//span[@class='nav-line-2'])[1]
${change.country}        (//div[@class='icp-mkt-change-lnk'])[1]
${click.country}        (//span[@class='a-button-text a-declarative'])[1]
${select.coutnryen}       id=icp-dropdown-item-8
${select.countryes}       id=icp-dropdown-item-12
${website.btn}          //input[@class='a-button-input']
${country.header}       //h3[@class='a-spacing-extra-large']

#Card Details
${add_card.btn}         //input[@type='radio' and @value='SelectableAddCreditCard']
${newcard.link}         //a[@class='a-link-emphasis pmts-add-cc-default-trigger-link']
${page.text}            //p[@class='a-spacing-small']
${entercard.btn}        //input[@type='submit' and @name='ppw-widgetEvent:AddCreditCardEvent']
${get.headertext}       //h4[@class='a-alert-heading']
${get.headertext1}      (//h4[@class='a-alert-heading']/following::div[@class='a-alert-content'])[1]
${usethisaddress.btn}    (//input[@class='a-button-input'])[3]
${skip.btn}              id=kyc_xborder_skip_section_label
${cont.btn}              (//input[@class="a-button-input"])[3]

#Amazon pay
${all.btn}         //i[@class='hm-icon nav-sprite']
${amazonpay.btn}    (//a[text()='Amazon Pay'])[2]
${electricity.btn}     (//div[@class="a-section a-spacing-none a-text-center icon-text-section"])[7]
${select.state}        id=ELECTRICITY
${consumer.no}         id=Consumer Number
${billno.error}        //span[text()='Please enter a valid Consumer Number between 9 to 12 characters (eg. 01000008564)']   
${signout.btn}         (//a[text()='Sign Out'])[1]
${signout.btn1}         (//a[text()='Salir'])[1]   

${seemore.btn}        (//div[text()='Ver todo'])[2]
${giftcard.btn}      (//div[text()='Tarjetas de Regalo'])[1]
${amazoncash.btn}       //a[@href='/-/es/gp/browse.html?node=14583169011&ref_=nav_em_hmc_gc_amazoncash_0_2_35_6']
${amazonreload.btn}     //a[text()='visite Amazon Reload']

${giftcard.amt}         id=gc-ui-form-custom-amount
${amount.error}         id=gc-ui-error-message-container-amount


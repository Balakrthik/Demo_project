*** Settings ***
Documentation   Database Testing using Robot framework 
Library         DatabaseLibrary

*** Variables ***
${DBName}     iot_platform
${DBHost}     165.22.222.47
${DBPort}     3306
${DBUser}     root
${DBPass}     iot@1234
${SSHHost}    165.22.222.47
${SSHPort}    22
${ServerUser}     balakarthik
${ServerPass}     b@laK@rthik
${SSHKey}         C:\Users\ADMIN\Downloads\balakarthik_165.22.222.47_login.ppk




*** Test Cases ***
Verify DB connection
    Connect To Database    pymysql     ${DBName}    ${DBHost}      ${DBPort}      ${DBUser}     ${DBPass}     ${SSHHost}     ${SSHPort}     ${SSHKey}   
    # ${Query}=     Query    select * FROM iot_fota.tbl_configuration tc ;
    Disconnect From Database
    # Log To Console  ${Query}
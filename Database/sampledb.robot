*** Settings ***
Documentation   Database Testing using Robot framework 
Library         DatabaseLibrary

*** Variables ***
${DBName}     information_schema
${DBUser}     root
${DBPass}     Karthik#1819
${DBHost}     127.0.0.1
${DBPort}     3306

*** Test Cases ***
Verify DB connection
    Connect To Database    pymysql     ${DBName}    ${DBUser}     ${DBPass}    ${DBHost}     ${DBPort} 
    ${Query}=     Query    select * from information_schema.tables;
    Disconnect From Database
    Log To Console  ${Query}
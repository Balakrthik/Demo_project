*** Settings ***
Library    DatabaseLibrary

*** Variables ***
${DB_PATH}    C:/Users/ADMIN/AppData/Roaming/DBeaverData/workspace6/.metadata/sample-database-sqlite-1/Chinook.db
${DB_URL}     sqlite:///${DB_PATH}

*** Test Cases ***
Connect To SQLite Database
    Connect To Database Using Custom Params    ${DB_URL}
    ${result} =    Query    SELECT * FROM artists LIMIT 10  # Change 'artists' to the relevant table name
    Log    ${result}
    Disconnect From Database

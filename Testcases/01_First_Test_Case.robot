*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${Browser}  Chrome
${URL}  https://minimal-todos.netlify.app/

*** Test Cases ***
SampleAddTodoTest  #Test case name
    Open Browser  ${URL}  ${Browser} 
    Input Text     id=todo  Buy diapers
    Click Button            Add Todo
    Close Browser

    
    

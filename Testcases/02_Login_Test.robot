*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${Browser}  chrome
${URL} https://quote-notes.web.app/

*** Test Cases ***
LoginTest
    Open Browser  ${URL}  ${Browser} 
    Click Link  Login
    Close Browser
*** Settings ***
Library  Selenium2Library     #importing selenium library


*** Variables ***
${Browser}  Chrome          #setting up browser to chrome
${URL}  http://www.google.com

*** Test Cases ***
Open and Close Browser      #Test case name
    Open Browser  ${URL}  ${Browser}
    Close Browser
    Input Text
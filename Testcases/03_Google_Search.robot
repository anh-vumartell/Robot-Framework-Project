*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
Google search   # Name of test case
    Open Browser     http://www.google.com  chrome
    Input Text  name=q  robot framework
    Click Button    name=btnK

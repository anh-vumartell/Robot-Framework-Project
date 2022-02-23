*** Settings ***
Library     Selenium2Library

*** Variables ***
${url}  https://admin.microsoft.com/AdminPortal/Home?#/users
${browser}  chrome
${input_account}    name:loginfmt
${account}          DongPham@QASpringboard.onmicrosoft.com
${input_password}   name:passwd
${password}         e,gH0|t_5N6ST7VKEf;W
${signIn}           xpath://*[@id="idSIButton9"]
${addAUser}         xpath://*[@id="viewport"]/div[4]/div/div/div/div/div/div[1]/div[1]/button

*** Test Cases  ***
Verify success login
    Open Browser    ${url}      ${browser}
    Input Text      ${input_account}    ${account}
    Click Button    Next
    Sleep   2s
    Input Password      ${input_password}   ${password}
    Sleep   2s
    Click Element       ${signIn}
    Sleep   2s
    Click Button    Yes
    Sleep   2s
    Close Browser
   

Verify success add new users
    Open Browser    ${url}      ${browser}
    Input Text      ${input_account}    ${account}
    Click Button    Next
    Sleep   2s
    Input Password      ${input_password}   ${password}
    Sleep   2s
    Click Element       ${signIn}
    Sleep   2s
    Click Button    Yes
    Sleep   4s
    Click Button    ${addAUser}
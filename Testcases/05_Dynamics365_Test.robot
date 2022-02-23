*** Settings ***
Library     Selenium2Library

*** Variables ***
${url}  https://admin.microsoft.com/AdminPortal/Home?#/users
${browser}  chrome
${input_account}    name:loginfmt
${account}          DongPham@QASpringboard.onmicrosoft.com
${invalid_account}  DongPham@QASpringboard.microsoft.com
${input_password}   name:passwd
${password}         e,gH0|t_5N6ST7VKEf;W
${invalid_password}  e,gH0|t_5N6ST7VKEf;W${SPACE}
${signIn}           xpath://*[@id="idSIButton9"]
${password_error_msg} id:passwordError
${reset_link}       xpath://*[@id="idA_IL_ForgotPassword0"]
${addAUser}         xpath://*[@id="viewport"]/div[4]/div/div/div/div/div/div[1]/div[1]/button

*** Test Cases  ***
Verify success login with valid credentials
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
   
Verify unsuccess login with invalid account name
    Open Browser    ${url}      ${browser}
    Input Text      ${input_account}    ${invalid_account}
    Click Button    Next
    Sleep   2s
    Input Password      ${input_password}   ${password}
    Sleep   2s
    Click Element       ${signIn}
    Sleep   2s
    Click Button    Yes
    Sleep   2s
    Close Browser
Verify unsuccess login with invalid password - first attempt
    Open Browser    ${url}      ${browser}
    Input Text      ${input_account}    ${account}
    Click Button    Next
    Sleep   2s
    Input Password      ${input_password}   ${invalid_password}
    Sleep   2s
    Click Element       ${signIn}
    Sleep   2s
    Element Should Contain  ${password_error_msg}   ${reset_link}
#Verify success add new user 
#  Input Text      ${input_account}    ${account}
#    Click Button    Next
#    Sleep   2s
#    Input Password      ${input_password}   ${password}
#    Sleep   2s
#    Click Element       ${signIn}
#   Sleep   2s
#    Click Button    Yes
#    Sleep   4s
#   Click Button    ${addAUser}
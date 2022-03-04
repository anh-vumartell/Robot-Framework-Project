*** Settings ***
Library     Selenium2Library


*** Variables ***
${URL}   https://www.aktia.fi/fi/yritysasiakkaat/viitenumerolaskuri 
${BROWSER}   chrome

${input_refNumberBase}     name:referenceNumberBase
${input_refNumberAmount}   id:ig-select-referenceNumberAmount
${input_refNumberType}     xpath://*[@id="ig-radiogroup-referenceNumberType"]/label[2]/div/span
${button_calc}      xpath:////*[@id="MainContentSection_T17BA5993010_Col00"]/referencenumber-calculator/app-container/div/div/calculator/form-control-group/div[2]/div/button
${error_container}   xpath://*[@id="referenceNumberBase"]/div/div[4]/div

*** Keywords ***
Access application
    [Arguments]     ${url}  ${browser}
    Open Browser    ${url}  ${browser}
Error text should be
    [Arguments]     ${error_container}  ${error_text}
    Element Text Should Be  ${error_container}  ${error_text}


*** Test Cases ***
# List out a list of scenarios
Verify invalid reference number base - no input
    [Tags]  input
    Access application  ${URL}  ${BROWSER}
    Sleep   5s
    Input Text   ${input_refNumberBase}     \  
    Sleep   2s
    Click Button    Laske 
    Element Text Should Be   ${error_container}    Pakollinen tieto.
    Close Browser

Verify invalid reference number base - too short starting with 0 
    Access application  ${URL}  ${BROWSER}
    Sleep   5s
    Input Text   ${input_refNumberBase}     02
    Select From List By value   ${input_refNumberAmount}   2: TEN
    Click Element  ${input_refNumberType}      
    Sleep   2s
    Element Text Should Be   ${error_container}    Viitenumeron perusosa on liian lyhyt.
    Close Browser

Verify invalid reference number base - too short only two digits
    Access application  ${URL}  ${BROWSER}
    Sleep   5s
    Input Text   ${input_refNumberBase}     12
    Select From List By value   ${input_refNumberAmount}   2: TEN
    Click Element  ${input_refNumberType}      
    Sleep   2s
    Element Text Should Be   ${error_container}    Viitenumeron perusosa on liian lyhyt.
    Close Browser

Verify invalid reference number base - too short only zeros
    Access application  ${URL}  ${BROWSER}
    Sleep   5s
    Input Text   ${input_refNumberBase}     00
    Select From List By value   ${input_refNumberAmount}   2: TEN
    Click Element  ${input_refNumberType}      
    Sleep   2s
    Element Text Should Be   ${error_container}    Viitenumeron perusosa on liian lyhyt.
    Close Browser

Verify invalid reference number base - too long 20-digits
    Access application  ${URL}  ${BROWSER}
    Sleep   5s
    Input Text   ${input_refNumberBase}     12345678912345678912
    Select From List By value   ${input_refNumberAmount}   2: TEN
    Click Element  ${input_refNumberType}      
    Sleep   2s
    Element Text Should Be   ${error_container}    Viitenumeron perusosa on liian lyhyt.
    Close Browser

Verify invalid reference number base - too long 21-digits
    Access application  ${URL}  ${BROWSER}
    Sleep   5s
    Input Text   ${input_refNumberBase}     123456789123456789123
    Select From List By value   ${input_refNumberAmount}   2: TEN
    Click Element  ${input_refNumberType}      
    Sleep   2s
    Element Text Should Be   ${error_container}    Viitenumeron perusosa on liian lyhyt.
    Close Browser 

Verify invalid reference number base - includes space in the beginning
    Access application  ${URL}  ${BROWSER}
    Sleep   5s
    Input Text   ${input_refNumberBase}     ${SPACE}2364
    Select From List By value   ${input_refNumberAmount}   2: TEN
    Click Element  ${input_refNumberType}      
    Sleep   2s
    Element Text Should Be   ${error_container}    Syötetty arvo ei ole validi numero.
    Close Browser 

Verify invalid reference number base - includes space in the middle
    Access application  ${URL}  ${BROWSER}
    Sleep   5s
    Input Text   ${input_refNumberBase}     236${SPACE}4
    Select From List By value   ${input_refNumberAmount}   2: TEN
    Click Element  ${input_refNumberType}      
    Sleep   2s
    Element Text Should Be   ${error_container}    Syötetty arvo ei ole validi numero.
    Close Browser 

Verify invalid reference number base - includes space in the end
    Access application  ${URL}  ${BROWSER}
    Sleep   5s
    Input Text   ${input_refNumberBase}     2364${SPACE}
    Select From List By value   ${input_refNumberAmount}   2: TEN
    Click Element  ${input_refNumberType}      
    Sleep   2s
    Element Text Should Be   ${error_container}    Syötetty arvo ei ole validi numero.
    Close Browser 

Verify invalid reference number base - include alphabetical characters
    Access application  ${URL}  ${BROWSER}
    Sleep   5s
    Input Text   ${input_refNumberBase}     abc
    Select From List By value   ${input_refNumberAmount}   2: TEN
    Click Element  ${input_refNumberType}      
    Sleep   2s
    Element Text Should Be   ${error_container}    Syötetty arvo ei ole validi numero.
    Close Browser 

Verify invalid reference number base - include special characters
    Access application  ${URL}  ${BROWSER}
    Sleep   5s
    Input Text   ${input_refNumberBase}     -123
    Select From List By value   ${input_refNumberAmount}   2: TEN
    Click Element  ${input_refNumberType}      
    Sleep   2s
    Element Text Should Be   ${error_container}   Syötetty arvo ei ole validi numero.
    Close Browser 



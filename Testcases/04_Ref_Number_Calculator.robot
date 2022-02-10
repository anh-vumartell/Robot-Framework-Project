*** Settings ***
Library     SeleniumLibrary

*** Variables  ***
${url}   https://www.aktia.fi/fi/yritysasiakkaat/viitenumerolaskuri 
${browser}   chrome
${input_refNumberBase}     name:referenceNumberBase
${input_refNumberAmount}   id:ig-select-referenceNumberAmount
${input_refNumberType}     xpath://*[@id="ig-radiogroup-referenceNumberType"]/label[2]/div/span
${error_container}   xpath://*[@id="referenceNumberBase"]/div/div[4]/div


*** Test Cases ***
# List out a list of scenarios
Verify invalid reference number base - no input
    Open Browser    ${url}  ${browser}
    Sleep   5s
    Input Text   ${input_refNumberBase}     \  
    Select From List By value   ${input_refNumberAmount}   2: TEN
    Click Element  ${input_refNumberType}      
    Sleep   2s
    Element Text Should Be   ${error_container}    Pakollinen tieto.
    Close Browser
Verify invalid reference number base - too short starting with 0 
    Open Browser    ${url}  ${browser}
    Sleep   5s
    Input Text   ${input_refNumberBase}     02
    Select From List By value   ${input_refNumberAmount}   2: TEN
    Click Element  ${input_refNumberType}      
    Sleep   2s
    Element Text Should Be   ${error_container}    Viitenumeron perusosa on liian lyhyt.
    Close Browser
Verify invalid reference number base - too short only two digits
    Open Browser    ${url}  ${browser}
    Sleep   5s
    Input Text   ${input_refNumberBase}     12
    Select From List By value   ${input_refNumberAmount}   2: TEN
    Click Element  ${input_refNumberType}      
    Sleep   2s
    Element Text Should Be   ${error_container}    Viitenumeron perusosa on liian lyhyt.
    Close Browser

Verify invalid reference number base - too short only zeros
    Open Browser    ${url}  ${browser}
    Sleep   5s
    Input Text   ${input_refNumberBase}     00
    Select From List By value   ${input_refNumberAmount}   2: TEN
    Click Element  ${input_refNumberType}      
    Sleep   2s
    Element Text Should Be   ${error_container}    Viitenumeron perusosa on liian lyhyt.
    Close Browser

Verify invalid reference number base - too long 20-digits
    Open Browser    ${url}  ${browser}
    Sleep   5s
    Input Text   ${input_refNumberBase}     12345678912345678912
    Select From List By value   ${input_refNumberAmount}   2: TEN
    Click Element  ${input_refNumberType}      
    Sleep   2s
    Element Text Should Be   ${error_container}    Viitenumeron perusosa on liian lyhyt.
    Close Browser

Verify invalid reference number base - too long 21-digits
    Open Browser    ${url}  ${browser}
    Sleep   5s
    Input Text   ${input_refNumberBase}     123456789123456789123
    Select From List By value   ${input_refNumberAmount}   2: TEN
    Click Element  ${input_refNumberType}      
    Sleep   2s
    Element Text Should Be   ${error_container}    Viitenumeron perusosa on liian lyhyt.
    Close Browser 

Verify invalid reference number base - includes space
    Open Browser    ${url}  ${browser}
    Sleep   5s
    Input Text   ${input_refNumberBase}     236 4
    Select From List By value   ${input_refNumberAmount}   2: TEN
    Click Element  ${input_refNumberType}      
    Sleep   2s
    Element Text Should Be   ${error_container}    Syötetty arvo ei ole validi numero.
    Close Browser 

Verify invalid reference number base - include alphabetical characters
    Open Browser    ${url}  ${browser}
    Sleep   5s
    Input Text   ${input_refNumberBase}     abc
    Select From List By value   ${input_refNumberAmount}   2: TEN
    Click Element  ${input_refNumberType}      
    Sleep   2s
    Element Text Should Be   ${error_container}    Syötetty arvo ei ole validi numero.
    Close Browser 

Verify invalid reference number base - include special characters
    Open Browser    ${url}  ${browser}
    Sleep   5s
    Input Text   ${input_refNumberBase}     -123
    Select From List By value   ${input_refNumberAmount}   2: TEN
    Click Element  ${input_refNumberType}      
    Sleep   2s
    Element Text Should Be   ${error_container}   Syötetty arvo ei ole validi numero.
    Close Browser 



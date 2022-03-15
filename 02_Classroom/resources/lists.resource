***Settings***
Library     OperatingSystem
Library     String
Library     BuiltIn
***Keywords***
Print Multiple Names        
    [Arguments]     ${NAMES}
    Log To Console    ${\n}    no_newline=True
    FOR     ${NAME}     IN      @{NAMES}
        Log To Console     ${NAME}
    END  

Read Name From File 
    [Arguments]     ${names_file}
    ${file_content}=    Get File    ${names_file}
    @{names}=       Split To Lines  ${file_content}
    [Return]    ${names}

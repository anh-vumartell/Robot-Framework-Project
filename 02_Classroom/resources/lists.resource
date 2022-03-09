***Keywords***
Print Multiple Names        
    [Arguments]     ${NAMES}
    FOR     ${NAME}     IN      @{NAMES}
        Log     ${NAME}
    END     
***Settings***
Resource        ${CURDIR}${/}resources${/}lists.resource

***Test Cases***
Print A List of Names 
    [Tags]  names
    Print Multiple Names    ${NAMES}  

***Variables***
@{NAMES}    Jane Doe    John Doe


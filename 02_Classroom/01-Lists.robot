***Settings***
Resource        ${CURDIR}${/}resources${/}lists.resource
Library         OperatingSystem
***Test Cases***
Print A List of Names 
    [Tags]  names
    Print Multiple Names    ${NAMES} 
Print Names From A File
    [Tags]  student
    [Documentation]     This test logs names from file students.txt
    @{students}=    Read Name From File   ${STUDENTS_FILE}
    FOR     ${student}  IN  @{students}
        Log To Console  ${student} 
    END

***Variables***
@{NAMES}    Jane Doe    John Doe    Ngoc Anh    Conny
${STUDENTS_FILE}    ${CURDIR}${/}test-data${/}students.txt

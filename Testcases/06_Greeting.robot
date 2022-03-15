*** Test Cases ***
Original Greetings
    [Tags]    ubuntu
    [Documentation]    This test case checks that the Print Your Name keyword works as expected.
    Print Your Name
    Print Your Name    ${YOUR_NAME}

Greetings Again
    [Tags]    centos
    [Documentation]    This test case proves that we can import variables from resource files.
    Print Your Name    ${NAME_FROM_RESOURCE}

Greetings From Init
    [Tags]    centos    ubuntu
    [Documentation]    This test case proves that we can create global variables using initialization files.
    Print Your Name    ${NAME_FROM_INIT}

*** Settings ***
Resource    ${CURDIR}${/}resources${/}greeting.resource

*** Variables ***
${YOUR_NAME}    Your Name
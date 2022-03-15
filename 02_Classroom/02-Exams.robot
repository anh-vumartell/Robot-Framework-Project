***Settings***
Library     OperatingSystem
Library         JSONlibrary
Library         HelperLibrary
***Test Cases***
Get Exam Results
    [Documentation]     In this test case we use json.loads() to take the content
    ...                 of a json file and assign them to a dict variable by using 
    ...                 EVALUATE keyword
    ...                 Use FOR...IN loop to loop through each value in the dict 
    ...                 and log them to the console
    &{exam_results}=         Parse JSON File        ${EXAM_RESULTS_JSON}
    #${exam_results}=    Get File    ${EXAM_RESULTS_JSON}
    #&{results}=     Evaluate    json.loads('''${exam_results}''')   json
    FOR     ${student}      ${result}   IN      &{exam_results}
        Log To Console      ${student}: ${result} 
    END

Generate Exam Results 
    [Setup]         Remove File     ${ANOTHER_RESULTS_FILE}
    #Remove result file before each execution
    ${file_content}     Set Variable
    # Set new variable
    FOR     ${student}      IN      @{STUDENTS}
        ${grade}=      Generate Random Number      ${0}    ${100}
        ${file_content}=    Catenate    ${file_content}     ${student}: ${grade}%${\n}
    END 
    Create File     ${ANOTHER_RESULTS_FILE}     ${file_content}
    Log             ${file_content}

***Variables***
${EXAM_RESULTS_JSON}        ${CURDIR}${/}test-data${/}exam-results.json
${ANOTHER_RESULTS_FILE}      ${CURDIR}${/}test-data${/}another_results_file.txt
@{STUDENTS}                  Ngoc Anh   Conny    Emma    Stella
#How to execute this test case with our custom class-based keyword
# robot --pythonpath libraries --suite 02-Exams
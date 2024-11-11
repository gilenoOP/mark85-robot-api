*** Settings ***
Documentation        Elementos e ações da página de cadastro de tarefas
Library        Browser

*** Keywords ***
Submit task form
    [Arguments]    ${task}
    ${tag_element}    Set Variable    css=input[placeholder="Informe até 3 tags"]
    ${num_tasks}      Get Length      ${task}
    FOR    ${index}    IN RANGE    ${num_tasks}
        ${actual_task}    Set Variable                      ${task[${index}]}
        Fill Text         css=input[placeholder$=tarefa]    ${actual_task}[name]
        FOR    ${tag}    IN    @{actual_task}[tags]
            Fill Text     ${tag_element}    ${tag}
            Sleep         0.2
            Press Keys    ${tag_element}    Enter
        END
    
        Click             css=button[type=submit]
        
        Run Keyword If    ${index} < ${num_tasks} -1    Click    css=a button[type="button"]
    END
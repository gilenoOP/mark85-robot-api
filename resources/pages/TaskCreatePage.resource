*** Settings ***
Documentation        Elementos e ações da página de cadastro de tarefas
Library        Browser

*** Keywords ***
Register tasks
    [Arguments]        ${tasks}
    ${is_dict}    Evaluate    isinstance(${tasks}, dict)
    ${is_list}    Evaluate    isinstance(${tasks}, list)
    Run Keyword If    ${is_dict}
    ...    Submit task form     ${tasks}
    
    Run Keyword If    ${is_list}
    ...    Submit tasks form    ${tasks}

Submit task form
    [Arguments]        ${task}
    ${num_tags}    Get Length    ${task}[tags]
    ${tags}    Set Variable    ${task}[tags]
    Fill Text    css=input[name='name']    ${task}[name]
    Run Keyword If    ${num_tags} > 0 and any(${tags})
    ...    Register tags    ${task}
    Press Keys    css=button[type=submit]    Enter

Submit tasks form
    [Arguments]    ${tasks}
    ${num_tasks}      Get Length      ${tasks}
    FOR    ${index}    IN RANGE    ${num_tasks}
        ${actual_task}    Set Variable      ${tasks[${index}]}
        ${tags}    Set Variable    ${actual_task}[tags]
        Fill Text         css=input[name='name']    ${actual_task}[name]
        ${num_tags}       Get Length        ${actual_task}[tags]
        
        Run Keyword If    ${num_tags} > 0 and any(${tags})
        ...    Register tags    ${actual_task}
        
        Click    css=button[type=submit]

        Exit For Loop If    ${index} == ${num_tasks} -1
        
        Click    css=button[type="button"]:has-text("Nova tarefa")
    END

Register tags
    [Arguments]    ${task}
    ${num_tags}       Get Length        ${task}[tags]
    ${tag_element}    Set Variable    css=input[placeholder="Informe até 3 tags"]
        FOR    ${index}    IN RANGE    ${num_tags}
            Fill Text     ${tag_element}    ${task}[tags][${index}]
            Press Keys    ${tag_element}    Enter
        END
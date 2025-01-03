*** Settings ***
Documentation        Ações e elementos da página de listagem de tarefas

Library        Browser

*** Keywords ***
Task should be registered
    [Arguments]        ${task}
    Wait For Elements State    css=.task-todo >> text=${task}[name]    visible    5
    ${tags}    Set Variable    ${task}[tags]
    Run Keyword If    len(${tags}) >= 1 and any(${tags})    Wait For Multiple Tags    @{tags}

Wait For Multiple Tags
    [Arguments]    @{tags}
    FOR    ${tag}    IN    @{tags}
        Wait For Elements State    xpath=//div[@class='tags']/span[text()="${tag}"]    visible    5
    END

Tasks should be registered
    [Arguments]        ${task}
    ${num_tasks}      Get Length    ${task}
    FOR    ${index}    IN RANGE    ${num_tasks}
        ${actual_task}             Set Variable                                   ${task[${index}]}
        ${tags}    Set Variable    ${actual_task}[tags]
        Wait For Elements State    css=.task-todo >> text=${actual_task}[name]    visible                5
        Run Keyword If    len(${tags}) >= 1 and any(${tags})    Wait For Multiple Tags    @{tags}
    END

Task should be completed
    [Arguments]        ${task_name}
    ${element}     Set Variable    css=.task-done >> text=${task_name}
    Wait For Elements State    ${element}    visible    5
    Get Style    ${element}    text-decoration-line    equal    line-through

Mark task as completed
    [Arguments]        ${task_name}
    ${element}    Set Variable    xpath=//strong[text()="${task_name}"]/..//button[@class="item-toggle"]
    Wait For Elements State    ${element}    visible    5
    Click    ${element}
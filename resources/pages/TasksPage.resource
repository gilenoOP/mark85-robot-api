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
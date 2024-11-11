*** Settings ***
Documentation        Ações e elementos da página de listagem de tarefas

Library        Browser

*** Keywords ***
Task should be registered
    [Arguments]        ${task}
    ${num_tasks}      Get Length    ${task}
    FOR    ${index}    IN RANGE    ${num_tasks}
        ${actual_task}             Set Variable                                   ${task[${index}]}
        Wait For Elements State    css=.task-todo >> text=${actual_task}[name]    visible                5
        FOR    ${tag}    IN    @{actual_task}[tags]
            Wait For Elements State    xpath=//div[@class='tags']/span[text()="${tag}"]    visible                5
        END
    END
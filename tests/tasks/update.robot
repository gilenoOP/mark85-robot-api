*** Settings ***
Documentation        Cenários de testes de atualização de tarefas

Resource        ../../resources/base.resource

Test Setup       Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Marcar tarefa como concluída
    [Tags]    task_done
    ${data}    Get fixture    tasks    OneDoneTask
    Cleans user from database        ${data}[user][email]
    Inserts user from database       ${data}[user]
    
    POST user session            ${data}[user]
    POST a new task              ${data}[task]
    Submit login form            ${data}[user]
    User should be logged        ${data}[user][name]
    Mark task as completed       ${data}[task][name]
    Task should be completed     ${data}[task][name]
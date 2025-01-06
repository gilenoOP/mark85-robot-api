*** Settings ***
Documentation        Cenários de testes de exclusão de tarefas

Resource        ../../resources/base.resource

Test Setup           Start Session
Test Teardown        Take Screenshot

*** Test Cases ***
Realizar a exclusão de uma tarefa
    [Tags]    del_task
    ${data}    Get fixture    tasks    DeleteTask
    Cleans user from database        ${data}[user][email]
    Inserts user from database       ${data}[user]
    
    POST user session            ${data}[user]
    POST a new task              ${data}[task]
    Submit login form            ${data}[user]
    User should be logged        ${data}[user][name]
    Request removal              ${data}[task][name]
    Task should not exist        ${data}[task][name]
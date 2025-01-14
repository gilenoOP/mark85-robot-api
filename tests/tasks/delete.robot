*** Settings ***
Documentation        Cenários de testes de exclusão de tarefas

Resource        ../../resources/base.resource

Test Setup           Start Session
Test Teardown        Take Screenshot

*** Test Cases ***
Realizar a exclusão de uma tarefa
    [Tags]    del_task
    ${data}    Get fixture    tasks    DeleteTask
    Reset user from database         ${data}[user]
    
    Create a new task from api       ${data}
    Do login                         ${data}[user]
    Request removal                  ${data}[task][name]
    Task should not exist            ${data}[task][name]
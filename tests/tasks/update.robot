*** Settings ***
Documentation        Cenários de testes de atualização de tarefas

Resource        ../../resources/base.resource

Test Setup           Start Session
Test Teardown        Take Screenshot

*** Test Cases ***
Marcar tarefa como concluída
    [Tags]    task_done
    ${data}    Get fixture    tasks    OneDoneTask
    Reset user from database         ${data}[user]
    
    Create a new task from api       ${data}
    Do login                         ${data}[user]
    Mark task as completed           ${data}[task][name]
    Task should be completed         ${data}[task][name]
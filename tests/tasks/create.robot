*** Settings ***
Documentation        Cenário de cadastro de tarefas

Library        JSONLibrary
Resource       ../../resources/base.resource

Test Setup           Start Session
Test Teardown        Take Screenshot

*** Test Cases ***
Cadastrar nova tarefa sem tags
    [Tags]    cad_task
    ${data}    Get fixture    tasks    CreateTaskWithoutTags
    Cleans user from database        ${data}[user][email]
    Inserts user from database       ${data}[user]
    Submit login form                ${data}[user]
    User should be logged            ${data}[user][name]
    Go to the new tasks form
    Register tasks                   ${data}[task]
    Task should be registered        ${data}[task]

Cadastrar nova tarefa com tags
    [Tags]    cad_task_tags
    ${data}    Get fixture    tasks    CreateTaskWithTags
    Cleans user from database        ${data}[user][email]
    Inserts user from database       ${data}[user]
    Submit login form                ${data}[user]
    User should be logged            ${data}[user][name]
    Go to the new tasks form
    Register tasks                   ${data}[task]
    Task should be registered        ${data}[task]

Cadastrar novas tarefas sem tags
    [Tags]    cad_tasks
    ${data}    Get fixture    tasks    CreateTasksWithoutTags
    Cleans user from database        ${data}[user][email]
    Inserts user from database       ${data}[user]
    Submit login form                ${data}[user]
    User should be logged            ${data}[user][name]
    Go to the new tasks form
    Register tasks                    ${data}[task]
    Tasks should be registered        ${data}[task]

Cadastrar novas tarefas com tags
    [Tags]    cad_tasks_tags
    ${data}    Get fixture    tasks    CreateTasksWithTags
    Cleans user from database        ${data}[user][email]
    Inserts user from database       ${data}[user]
    Submit login form                ${data}[user]
    User should be logged            ${data}[user][name]
    Go to the new tasks form
    Register tasks                    ${data}[task]
    Tasks should be registered        ${data}[task]

Cadastrar tarefa duplicada
    [Tags]    dup
    ${data}    Get fixture    tasks    Duplicate
    Cleans user from database        ${data}[user][email]
    Inserts user from database       ${data}[user]
    Submit login form                ${data}[user]
    User should be logged            ${data}[user][name]
    Go to the new tasks form
    Submit task form                 ${data}[task]
    Go to the new tasks form
    Submit task form                 ${data}[task]
    Notice should be                 Oops! Tarefa duplicada.

Marcar uma tarefa como realizada
    [Tags]    one_done
    ${data}    Get fixture    tasks    OneTaskDone
    Cleans user from database        ${data}[user][email]
    Inserts user from database       ${data}[user]
    Submit login form                ${data}[user]
    User should be logged            ${data}[user][name]
    Go to the new tasks form
    Submit task form                 ${data}[task]
    Go to the new tasks form
    Submit task form                 ${data}[task]
    Notice should be                 Oops! Tarefa duplicada.

Marcar todas as terefas como finalizada
    [Tags]    all_done
    ${data}    Get fixture    tasks    AllDoneTasks
    Cleans user from database        ${data}[user][email]
    Inserts user from database       ${data}[user]
    Submit login form                ${data}[user]
    User should be logged            ${data}[user][name]
    Go to the new tasks form
    Submit task form                 ${data}[task]
    Go to the new tasks form
    Submit task form                 ${data}[task]
    Notice should be                 Oops! Tarefa duplicada.

Excluir tarefa
    [Tags]    del_task
    ${data}    Get fixture    tasks    DeleteTask
    Cleans user from database        ${data}[user][email]
    Inserts user from database       ${data}[user]
    Submit login form                ${data}[user]
    User should be logged            ${data}[user][name]
    Go to the new tasks form
    Submit task form                 ${data}[task]
    Go to the new tasks form
    Submit task form                 ${data}[task]
    Notice should be                 Oops! Tarefa duplicada.

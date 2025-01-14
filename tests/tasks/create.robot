*** Settings ***
Documentation        Cenário de cadastro de tarefas

Resource       ../../resources/base.resource

Test Setup           Start Session
Test Teardown        Take Screenshot

*** Test Cases ***
Cadastrar nova tarefa sem tags
    [Tags]    cad_task
    ${data}    Get fixture    tasks    CreateTaskWithoutTags
    Reset user from database         ${data}[user]
    Do login                         ${data}[user]
    Go to the new tasks form
    Register tasks                   ${data}[task]
    Task should be registered        ${data}[task]

Cadastrar nova tarefa com tags
    [Tags]    cad_task_tags
    ${data}    Get fixture    tasks    CreateTaskWithTags
    Reset user from database         ${data}[user]
    Do login                         ${data}[user]
    Go to the new tasks form
    Register tasks                   ${data}[task]
    Task should be registered        ${data}[task]

Cadastrar novas tarefas sem tags
    [Tags]    cad_tasks
    ${data}    Get fixture    tasks    CreateTasksWithoutTags
    Reset user from database          ${data}[user]
    Do login                         ${data}[user]
    Go to the new tasks form
    Register tasks                    ${data}[task]
    Tasks should be registered        ${data}[task]

Cadastrar novas tarefas com tags
    [Tags]    cad_tasks_tags
    ${data}    Get fixture    tasks    CreateTasksWithTags
    Reset user from database          ${data}[user]
    Do login                         ${data}[user]
    Go to the new tasks form
    Register tasks                    ${data}[task]
    Tasks should be registered        ${data}[task]

Cadastrar tarefa com mais do que 3 tags
    [Tags]    tags_lim
    ${data}    Get fixture    tasks    TagsLimit
    Reset user from database         ${data}[user]
    Do login                         ${data}[user]
    Go to the new tasks form
    Register tasks                   ${data}[task]
    Notice should be                 Oops! Limite de tags atingido.

Cadastrar tarefa duplicada
    [Tags]    dup
    ${data}    Get fixture    tasks    Duplicate
    Reset user from database         ${data}[user]
    Create a new task from api       ${data}
    Do login                         ${data}[user]
    Go to the new tasks form
    Register tasks                   ${data}[task]
    Notice should be                 Oops! Tarefa duplicada.
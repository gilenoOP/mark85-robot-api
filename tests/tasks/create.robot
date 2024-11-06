*** Settings ***
Documentation        Cenário de cadastro de tarefas

Library        JSONLibrary
Resource       ../../resources/base.resource

Test Setup           Start Session
Test Teardown        Take Screenshot

*** Test Cases ***
Cadastrar uma nova tarefa
    ${data}    Get fixture    tasks    Create
    Cleans user from database        ${data}[user][email]
    Inserts user from database       ${data}[user]
    Submit login form                ${data}[user]
    User should be logged            ${data}[user][name]
    Go to the new tasks form
    Submit task form                 ${data}[task]
*** Settings ***
Documentation        Cenários de testes do cadastro de usuários
Resource       ../resources/base.resource

Test Setup        Start Session
Test Teardown     Take Screenshot

*** Test Cases ***
Cadastrar novo usuário sem preencher campos obrigatórios
    [Tags]    required
    ${user}        Create Dictionary
    ...            name=${EMPTY}
    ...            email=${EMPTY}
    ...            password=${EMPTY}

    Go to signup page
    Submit signup form           ${user}
    Sleep    1

Cadastrar novo usuário
    [Tags]    success
    ${user}        Create Dictionary
    ...            name=Gileno Oliveira
    ...            email=gileno.teste@gmail.com
    ...            password=pwd123

    Remove user from database    ${user}[email]
    Go to signup page
    Submit signup form           ${user}
    Notice should be             Boas vindas ao Mark85, o seu gerenciador de tarefas.
    Sleep    1

Cadastrar novo usuário com email duplicado
    [Tags]    duplicate
    ${user}        Create Dictionary
    ...            name=Mike Tyson
    ...            email=mtyson@yahoo.com
    ...            password=pwd123

    Remove user from database    ${user}[email]
    Insert user from database    ${user}
    Go to signup page
    Submit signup form           ${user}
    Notice should be             Oops! Já existe uma conta com o e-mail informado.
    Sleep    1
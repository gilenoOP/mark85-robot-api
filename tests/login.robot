*** Settings ***
Documentation        Cenários de testes do cadastro de usuários

Resource       ../resources/base.resource

Test Setup        Start Session
Test Teardown     Take Screenshot

*** Test Cases ***
Validar tela de login
    [Tags]    val_login_screen
    Validate login screen

Realizar login sem preencher campos obrigatórios
    ${user}    Create Dictionary
    ...        name=${EMPTY}
    ...        email=${EMPTY}
    ...        password=${EMPTY}

    Remove user from database    ${user}[email]
    Insert user from database    ${user}
    Submit login form            ${user}
Realizar login com email inválido
    [Tags]    email_inv
    ${user}        Create Dictionary
    ...            name=Samantha Cox
    ...            email=s.cox@google
    ...            password=pwd123
Realizar login com senha incorreta
    [Tags]    pass_inv
    ${user}        Create Dictionary
    ...            name=Julia Pio
    ...            email=pio.julia@outlook.com
    ...            password=pwd
Realizar login com sucesso
    [Tags]    success
    ${user}        Create Dictionary
    ...            name=Brandon Lee
    ...            email=b.lee@google.com
    ...            password=pwd123

    Remove user from database    ${user}[email]
    Insert user from database    ${user}
    Submit login form            ${user}
    User should be logged        ${user}[name]
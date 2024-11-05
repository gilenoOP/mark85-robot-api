*** Settings ***
Documentation        Cenários de testes do cadastro de usuários

Resource       ../resources/base.resource
Library        Collections

Test Setup        Start Session
Test Teardown     Take Screenshot

*** Test Cases ***
Validar tela de login
    [Tags]    val_login_screen
    Validate login screen

Realizar login sem preencher campos obrigatórios
    ${user}    Create Dictionary
    ...        email=${EMPTY}
    ...        password=${EMPTY}

    Submit login form            ${user}
    Alert should be    Informe seu e-mail
    Alert should be    Informe sua senha

Realizar login com email inválido
    [Tags]    email_inv
    ${user}        Create Dictionary
    ...            email=s.cox@google
    ...            password=pwd123

    Submit login form    ${user}
    Alert should be    Digite um e-mail válido

Realizar login com senha incorreta
    [Tags]    pass_inv
    ${user}        Create Dictionary
    ...            name=Julia Pio
    ...            email=pio.julia@outlook.com
    ...            password=pwd123
    
    Remove user from database    ${user}[email]
    Insert user from database    ${user}
    Set To Dictionary    ${user}    password=abc456
    Submit login form    ${user}
    Notice should be    Ocorreu um erro ao fazer login, verifique suas credenciais.
    
Realizar login com sucesso
    [Tags]    success
    ${user}        Create Dictionary
    ...            name=Dakota Jones
    ...            email=dakota.jones@yahoo.com
    ...            password=pwd123

    Remove user from database    ${user}[email]
    Insert user from database    ${user}
    Submit login form            ${user}
    User should be logged        ${user}[name]
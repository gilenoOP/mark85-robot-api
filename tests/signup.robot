*** Settings ***
Documentation        Cenários de testes do cadastro de usuários
Resource       ../resources/base.resource

Test Setup        Start Session
Test Teardown     Take Screenshot

*** Test Cases ***
Validar tela de cadastro
    [Tags]    val_signup_screen
    Validate signup screen

Validar botão de voltar para login
    [Tags]    back_login
    Go to signup page
    Click on the back to login button

Cadastrar novo usuário sem preencher campos obrigatórios
    [Tags]    required
    ${user}        Create Dictionary
    ...            name=${EMPTY}
    ...            email=${EMPTY}
    ...            password=${EMPTY}

    Go to signup page
    Submit signup form        ${user}
    Alert should be           Informe seu nome completo
    Alert should be           Informe seu e-email
    Alert should be           Informe uma senha com pelo menos 6 digitos

Cadastrar novo usuário com email inválido
    [Tags]    email_inv
    ${user}        Create Dictionary
    ...            name=Anne Simpson
    ...            email=anne.simp@outlook
    ...            password=pwd123

    Go to signup page
    Submit signup form        ${user}
    Alert should be           Digite um e-mail válido

Cadastrar novo usuário com email duplicado
    [Tags]    duplicate
    ${user}        Create Dictionary
    ...            name=Mike Tyson
    ...            email=mtyson@yahoo.com
    ...            password=pwd123

    Removes user from database    ${user}[email]
    Inserts user from database    ${user}
    Go to signup page
    Submit signup form           ${user}
    Notice should be             Oops! Já existe uma conta com o e-mail informado.

Cadastrar novo usuário com senha abaixo de 6 caracteres
    [Tags]    pass_inv
    Go to signup page
    @{password_list}    Create List    p    pw    pwd    pwd1    pwd12
    FOR    ${password}    IN    @{password_list}
        ${user}        Create Dictionary
        ...            name=Anne Simpson
        ...            email=anne.simp@outlook.com
        ...            password=${password}

        Submit signup form        ${user}
        Alert should be           Informe uma senha com pelo menos 6 digitos        
    END

Cadastrar novo usuário
    [Tags]    success
    ${user}        Create Dictionary
    ...            name=Gileno Oliveira
    ...            email=gileno.teste@gmail.com
    ...            password=pwd123

    Removes user from database    ${user}[email]
    Go to signup page
    Submit signup form           ${user}
    Notice should be             Boas vindas ao Mark85, o seu gerenciador de tarefas.
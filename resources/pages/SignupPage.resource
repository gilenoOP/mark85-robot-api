*** Settings ***
Documentation        Elementos e ações da página de cadastro

Library        Browser
Resource       ../env.resource

*** Keywords ***
Validate signup screen
    Click    css=a[href="/signup"]
    Wait For Elements State    css=img[src="/static/media/logo.fc82b1a9.svg"]         visible    5
    Wait For Elements State    css=h1 >> text="Faça seu cadastro"                     visible    5
    Wait For Elements State    css=#name[placeholder=Nome]                            visible    5
    Wait For Elements State    css=#email[placeholder=E-mail]                         visible    5
    Wait For Elements State    css=#password[placeholder=Senha]                       visible    5
    Wait For Elements State    css=#buttonSignup                                      visible    5
    Get Text                   css=#buttonSignup                                      equal      Cadastrar
    Wait For Elements State    xpath=//a[@href="/"]                                   visible    5
    Get Text                   xpath=//a[@href="/"]                                   equal      Voltar para login

Go to signup page
    Click    css=a[href="/signup"]
    Wait For Elements State        css=h1        visible        5
    Get Text                       css=h1        equal          Faça seu cadastro

Click on the back to login button
    Click                      css=a[href="/"]
    Wait For Elements State    css=form h1        visible    5
    Get Text                   css=form h1        equal      Faça seu login

Submit signup form
    [Arguments]    ${user}
    Fill Text    css=#name        ${user}[name]
    Fill Text    css=#email       ${user}[email]
    Fill Text    css=#password    ${user}[password]
    Click        text=Cadastrar
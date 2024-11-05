*** Settings ***
Documentation        Elementos e ações da página de login

Library        Browser
Resource       ../env.resource

*** Keywords ***
Validate login screen
    Wait For Elements State    css=img[src="/static/media/logo.fc82b1a9.svg"]         visible    5
    Wait For Elements State    css=h1 >> text="Faça seu login"                        visible    5
    Wait For Elements State    css=#email[placeholder=E-mail]                         visible    5
    Wait For Elements State    css=#password[placeholder=Senha]                       visible    5
    Wait For Elements State    css=#buttonLogin                                       visible    5
    Get Text                   css=#buttonLogin                                       equal      Entrar
    Wait For Elements State    xpath=//a[@href="/signup"]                             visible    5
    Get Text                   xpath=//a[@href="/signup"]                             equal      Criar conta

Submit login form
    [Arguments]        ${user}
    Fill Text    css=#email       ${user}[email]
    Fill Text    css=#password    ${user}[password]
    Click        text=Entrar
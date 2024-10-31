*** Settings ***
Documentation        Elementos e ações da página de cadastro

Library        Browser
Resource       ../env.robot

*** Keywords ***
Go to signup page
    Go To        http://localhost:3000/signup
    Wait For Elements State        css=h1        visible        5
    Get Text                       css=h1        equal          Faça seu cadastro

Submit signup form
    [Arguments]    ${user}
    Fill Text    css=#name        ${user}[name]
    Fill Text    css=#email       ${user}[email]
    Fill Text    css=#password    ${user}[password]
    Click        text=Cadastrar

Notice should be
    [Arguments]    ${expected_text}
    ${element}     Set Variable    css=.notice p
    Wait For Elements State    ${element}       visible
    Get Text                   ${element}       equal    ${expected_text}
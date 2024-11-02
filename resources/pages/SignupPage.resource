*** Settings ***
Documentation        Elementos e ações da página de cadastro

Library        Browser
Resource       ../env.resource

*** Keywords ***
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

Alert should be
    [Arguments]        ${expected_alert}
    Wait For Elements State    css=.alert-error >> text=${expected_alert}   visible    5

Notice should be
    [Arguments]    ${expected_text}
    ${element}     Set Variable    css=.notice p
    Wait For Elements State    ${element}       visible    5
    Get Text                   ${element}       equal      ${expected_text}
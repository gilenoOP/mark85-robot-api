*** Settings ***
Documentation        Ações e elementos do componente do header da aplicação

Library        Browser
Library        String

*** Keywords ***
User should be logged
    [Arguments]        ${name}
    ${splited_name}        Split String    ${name}
    ${element}    Set Variable    css=header small

    Wait For Elements State    ${element}    visible    5
    Get Text                   ${element}    equal      Olá, ${splited_name}[0]

Go to the new tasks form
    Click    css=a button[type="button"]
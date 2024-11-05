*** Settings ***
Documentation        Ações e elementos do componente de mensagem de alerta

Library        Browser

*** Keywords ***
Alert should be
    [Arguments]        ${expected_alert}
    Wait For Elements State    css=.alert-error >> text=${expected_alert}   visible    5
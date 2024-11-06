*** Settings ***
Documentation        Elementos e ações da página de cadastro de tarefas
Library        Browser

*** Keywords ***
Submit task form
    [Arguments]    ${task}
    Fill Text    css=input[placeholder$=tarefa]    ${task}[name]
    Click    css=button[type=submit] >> text="Cadastrar"
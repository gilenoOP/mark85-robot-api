*** Settings ***
Documentation        Cenário de cadastro de tarefas

Library        JSONLibrary
Resource       ../../resources/base.resource

*** Test Cases ***
Cadastrar uma nova tarefas
    ${data}    Load Json From File    ${EXECDIR}/resource/fixtures/tasks.json    encoding=utf-8
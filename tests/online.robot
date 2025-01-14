*** Settings ***
Documentation        Validar que a aplicação está online
Resource       ../resources/base.resource

*** Test Cases ***
Webapp deve estar online
    Start Session
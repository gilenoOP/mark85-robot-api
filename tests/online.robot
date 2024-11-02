*** Settings ***
Documentation        Validar que a aplicação está online
Library        Browser
Resource       ../resources/base.resource

*** Test Cases ***
Webapp deve estar online
    Start Session
*** Settings ***
Documentation        Validar que a aplicação está online
Library        Browser
Resource       ../resources/base.robot

*** Test Cases ***
Webapp deve estar online
    Start Session
    Get Title       equal        Mark85 by QAx
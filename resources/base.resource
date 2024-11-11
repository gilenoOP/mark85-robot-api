*** Settings ***
Library        libs/database.py
Library        Browser
Library        JSONLibrary
Resource       env.resource

Resource       ../resources/components/Alert.resource
Resource       ../resources/components/Notice.resource
Resource       ../resources/components/Header.resource

Resource       pages/SignupPage.resource
Resource       pages/LoginPage.resource
Resource       pages/TaskCreatePage.resource
Resource       pages/TasksPage.resource

*** Keywords ***
Start Session
    New Browser     browser=Chromium    headless=False
    New Page        ${BASE_URL}

Get fixture
    [Arguments]    ${file_name}    ${cenario}
    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/${file_name}.json    encoding=utf-8

    RETURN    ${data}[${cenario}]
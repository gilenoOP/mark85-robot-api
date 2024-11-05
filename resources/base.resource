*** Settings ***
Library        libs/database.py
Library        Browser
Resource       env.resource
Resource       ../resources/components/Alert.resource
Resource       ../resources/components/Notice.resource
Resource       ../resources/components/Header.resource
Resource       pages/SignupPage.resource
Resource       pages/LoginPage.resource

*** Keywords ***
Start Session
    New Browser     browser=Chromium    headless=False
    New Page        ${BASE_URL}
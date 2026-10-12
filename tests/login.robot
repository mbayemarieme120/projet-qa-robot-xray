*** Settings ***
Library           SeleniumLibrary
Test Setup        Open Browser    ${URL}    chrome
Test Teardown     Close All Browsers

*** Variables ***
${URL}    https://www.saucedemo.com

*** Test Cases ***
Connexion Valide
    Input Text        id=user-name    standard_user
    Input Password    id=password     secret_sauce
    Click Button      id=login-button
    Wait Until Page Contains Element    id=inventory_container    timeout=10s

Connexion Mot De Passe Invalide
    Input Text        id=user-name    standard_user
    Input Password    id=password     mauvais_mdp
    Click Button      id=login-button
    Page Should Contain    Username and password do not match
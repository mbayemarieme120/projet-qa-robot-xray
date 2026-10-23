*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}           https://www.saucedemo.com
${BROWSER}       chrome
${USER_OK}       standard_user
${USER_LOCKED}   locked_out_user
${PASSWORD}      secret_sauce

*** Keywords ***
Ouvrir SauceDemo
    Open Browser    ${URL}    ${BROWSER}
    ...    options=add_argument("--incognito");add_experimental_option("prefs", {"credentials_enable_service": False, "profile.password_manager_enabled": False, "profile.password_manager_leak_detection": False})
    Wait Until Element Is Visible    id=login-button    timeout=10s

Se Connecter En Tant Que
    [Arguments]    ${utilisateur}    ${mot_de_passe}
    Input Text        id=user-name    ${utilisateur}
    Input Password    id=password     ${mot_de_passe}
    Click Button      id=login-button

Se Connecter Avec Un Compte Valide
    Se Connecter En Tant Que    ${USER_OK}    ${PASSWORD}
    Wait Until Page Contains Element    id=inventory_container    timeout=10s

    
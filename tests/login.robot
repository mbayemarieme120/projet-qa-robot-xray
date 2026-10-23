*** Settings ***
Resource          ../resources/keywords.resource
Test Setup        Ouvrir SauceDemo
Test Teardown     Close All Browsers

*** Test Cases ***
Connexion Valide
    Se Connecter Avec Un Compte Valide

Connexion Mot De Passe Invalide
    Se Connecter En Tant Que    ${USER_OK}    mauvais_mdp
    Page Should Contain    Username and password do not match

Connexion Compte Bloque
    Se Connecter En Tant Que    ${USER_LOCKED}    ${PASSWORD}
    Page Should Contain    locked out

Deconnexion
    Se Connecter Avec Un Compte Valide
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    id=logout_sidebar_link    timeout=10s
    Click Link    id=logout_sidebar_link
    Wait Until Element Is Visible    id=login-button    timeout=10s
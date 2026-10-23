*** Settings ***
Resource          ../resources/keywords.resource
Test Setup        Run Keywords    Ouvrir SauceDemo    AND    Se Connecter Avec Un Compte Valide
Test Teardown     Close All Browsers

*** Test Cases ***
Commande Complete
    Click Button    id=add-to-cart-sauce-labs-backpack
    Click Link      class=shopping_cart_link
    Wait Until Element Is Visible    id=checkout    timeout=10s
    Click Button    id=checkout
    Wait Until Element Is Visible    id=first-name    timeout=10s
    Input Text      id=first-name     Marieme
    Input Text      id=last-name      Test
    Input Text      id=postal-code    69100
    Click Button    id=continue
    Wait Until Element Is Visible    id=finish    timeout=10s
    Click Button    id=finish
    Wait Until Page Contains    Thank you for your order    timeout=10s

Checkout Avec Champ Obligatoire Vide
    Click Button    id=add-to-cart-sauce-labs-backpack
    Click Link      class=shopping_cart_link
    Wait Until Element Is Visible    id=checkout    timeout=10s
    Click Button    id=checkout
    Wait Until Element Is Visible    id=continue    timeout=10s
    Click Button    id=continue
    Wait Until Page Contains    First Name is required    timeout=10s
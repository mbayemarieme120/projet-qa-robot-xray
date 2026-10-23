*** Settings ***
Resource          ../resources/keywords.resource
Test Setup        Run Keywords    Ouvrir SauceDemo    AND    Se Connecter Avec Un Compte Valide
Test Teardown     Close All Browsers

*** Test Cases ***
Ajouter Un Produit Au Panier
    Click Button    id=add-to-cart-sauce-labs-backpack
    Element Text Should Be    class=shopping_cart_badge    1

Retirer Un Produit Du Panier
    Click Button    id=add-to-cart-sauce-labs-backpack
    Wait Until Element Is Visible    id=remove-sauce-labs-backpack    timeout=10s
    Click Button    id=remove-sauce-labs-backpack
    Wait Until Page Does Not Contain Element    class=shopping_cart_badge    timeout=10s
    
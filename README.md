# Projet QA: tests automatisés avec Robot Framework et Xray

## Arborescence du projet
```
resources/    → mots-clés réutilisables
tests/        → fichiers de tests (login, panier, checkout)
results/      → rapports générés (non versionnés)
```

## Outils utilisés
- Robot Framework, SeleniumLibrary
- Jira / Xray
- Python

## Cas de test
| ID | Cas de test | Fichier | Résultat attendu | Statut |
|---|---|---|---|---|

| 1 | Connexion valide | `login.robot` | La page des produits s'affiche | ✅ Passé |

| 2 | Connexion avec mot de passe invalide | `login.robot` | Message d'erreur affiché | ✅ Passé |

| 3 | Connexion avec un compte bloqué | `login.robot` | Message « locked out » affiché | ✅ Passé |

| 4 | Déconnexion | `login.robot` | Retour à la page de connexion | ✅ Passé |

| 5 | Ajouter un produit au panier | `panier.robot` | Le compteur du panier affiche 1 | ✅ Passé |

| 6 | Retirer un produit du panier | `panier.robot` | Le compteur disparaît | ✅ Passé |

## Installation et lancement


## Difficulté rencontrée: 
1. un test instable:

Lors de mes premières exécutions, le test **Connexion valide** donnait des résultats différents d'une exécution à l'autre, sans aucune modification du code. Il passait parfois et échouait parfois.

**Cause:** Robot Framework vérifiait la présence de la liste des produits avant que la page ne soit entièrement chargée.

**Correction:** j'ai remplacé la vérification immédiate par une attente explicite:
```robotframework
Wait Until Page Contains Element    id=inventory_container    timeout=10s
```

Le test attend désormais jusqu'à 10 secondes que la page apparaisse avant de continuer.

Le test **Connexion avec mot de passe invalide** était plus stable: 
le message d'erreur s'affiche sur la même page, sans changement de page, donc il n'y a pas de temps de chargement à attendre.

2. le test « Retirer un produit du panier » :

J'ai rencontré le même type de problème sur ce test. Après un clic sur « Add to cart », le bouton est remplacé par « Remove ». Dans ma première version, Robot Framework cliquait sur « Remove » environ 0,3 seconde après l'ajout, avant que ce changement ne soit effectif. Le bouton était introuvable et le test échouait avec le message `Button with locator 'id=remove-sauce-labs-backpack' not found`.

**Correction :** j'ai ajouté deux attentes explicites, qui laissent jusqu'à 10 secondes à la page pour se mettre à jour :

```robotframework
Wait Until Element Is Visible    id=remove-sauce-labs-backpack    timeout=10s
Wait Until Page Does Not Contain Element    class=shopping_cart_badge    timeout=10s
```

La première attend l'apparition du bouton « Remove » avant de cliquer, la seconde attend la disparition de la pastille du panier avant de vérifier le résultat. Le test passe désormais.

**Ce que j'en retiens :** un test automatisé s'exécute plus vite qu'un utilisateur. Il faut donc attendre explicitement chaque changement de la page dont l'étape suivante dépend.

## Captures d'écran




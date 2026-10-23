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

## Captures d'écran




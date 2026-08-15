# Phase 1 — Sécurité du dépôt

Le workflow `.github/workflows/repository-security.yml` est la première pipeline
exécutable du laboratoire. Il ne dépend d'aucune application.

## Déclencheurs

- `push` : après l'envoi de nouveaux commits ;
- `pull_request` : avant l'intégration d'un changement ;
- `workflow_dispatch` : lancement manuel depuis GitHub.

## Job `foundation`

Ce job récupère le dépôt sur un runner Linux, puis exécute le script PowerShell
qui vérifie les fichiers structurants. Le runner est temporaire : GitHub le crée
pour le job et le détruit ensuite.

## Job `secret-scan`

Ce job récupère tout l'historique Git grâce à `fetch-depth: 0`. Gitleaks ne se
limite donc pas au dernier fichier visible : il cherche aussi les secrets qui
auraient été ajoutés puis supprimés dans des commits antérieurs.

Le `GITHUB_TOKEN` est créé temporairement par GitHub Actions. Il n'est pas écrit
dans le dépôt. Les permissions globales sont limitées à la lecture du contenu.

## Comportement de sécurité

Si Gitleaks trouve un secret, le job échoue. Supprimer uniquement la chaîne du
dernier fichier ne suffit pas : il faut d'abord révoquer ou faire tourner le
secret, puis traiter sa présence dans l'historique.

## Limites actuelles

- aucune analyse de code applicatif, car aucun workload n'est présent ;
- aucun scan d'image, car aucune image n'est construite ;
- aucune règle de protection de branche, à activer plus tard sur GitHub ;
- les actions utilisent actuellement des tags majeurs lisibles. Leur verrouillage
  sur des SHA immuables fera partie du durcissement de la supply chain.


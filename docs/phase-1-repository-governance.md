# Phase 1 — Gouvernance du dépôt

Cette phase transforme une pipeline informative en contrôle intégré au processus
de changement.

## Flux de changement

```text
Branche de travail
        |
        v
Pull Request
        |
        +-- validation de la structure
        +-- détection de secrets
        |
        v
Fusion dans main uniquement si les contrôles réussissent
```

## CODEOWNERS

`.github/CODEOWNERS` attribue une responsabilité explicite aux fichiers du dépôt.
Les workflows, la sécurité, Kubernetes et Terraform sont répétés volontairement
car leur modification peut altérer les contrôles ou les environnements.

Dans ce laboratoire individuel, la propriétaire est `@faduuu`. Dans une équipe,
ces entrées pointeraient vers des équipes comme `@organisation/platform` et
`@organisation/security` afin d'appliquer la séparation des responsabilités.

## Modèle de Pull Request

Le modèle impose une description du besoin, des validations, de l'impact
sécurité/GRC et des preuves. Il réduit les changements non documentés et crée une
trace exploitable lors d'un audit.

## Dependabot

Dependabot vérifie chaque semaine les GitHub Actions utilisées et propose les
mises à jour sous forme de Pull Requests. Une mise à jour n'est pas fusionnée
automatiquement : elle passe par les mêmes contrôles que les autres changements.

## Politique de sécurité

`SECURITY.md` définit le périmètre, les règles de signalement et le processus de
traitement. Elle rappelle notamment qu'un secret découvert doit être révoqué ou
rotaté avant de nettoyer son exposition dans Git.

## Contrôle GitHub attendu

Le ruleset `Protect main` doit cibler la branche par défaut et imposer :

- une Pull Request avant fusion ;
- la réussite des jobs `Validate repository foundation` et
  `Detect committed secrets` ;
- l'interdiction de supprimer la branche ou d'effectuer un force-push.

Comme le laboratoire n'a qu'une contributrice, aucune approbation humaine n'est
exigée pour le moment. Cette décision doit être revue si d'autres contributeurs
rejoignent le projet.


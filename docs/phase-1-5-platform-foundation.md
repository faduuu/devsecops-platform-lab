# Phase 1.5 — Fondation déclarative de la plateforme

## Objectif

Préparer Kubernetes et Terraform sans choisir d'application et sans créer de
ressource cloud. Cette phase vérifie que l'organisation, la syntaxe et les
premières règles de sécurité sont testables dans la pipeline.

## Chaîne mise en place

```text
Modification Git
    |
    v
Pull Request
    |
    +-- yamllint : qualité des fichiers YAML
    +-- Terraform : format, initialisation locale et validation
    +-- Checkov : audit GitHub Actions, Terraform et Kubernetes
    |
    v
Rapports conservés 30 jours dans GitHub Actions
```

## Fondation Kubernetes

La base crée uniquement un namespace logique, des limites de ressources, une
politique réseau fermée par défaut et l'application du standard Pod Security
`restricted`. Kustomize agrège les manifests, mais aucun manifeste n'est appliqué
automatiquement sur un cluster dans cette phase.

## Fondation Terraform

La configuration définit une version de Terraform, deux variables validées, des
métadonnées communes et une sortie. Elle ne déclare ni provider, ni backend, ni
ressource. `terraform init -backend=false` prépare seulement le répertoire local
du runner ; `terraform validate` contrôle la cohérence interne du code.

## Décision de sécurité

Checkov reste temporairement en mode informatif avec `--soft-fail`. Son rapport
est une preuve et permet de construire une baseline. Il deviendra bloquant après
analyse et traitement documenté des résultats, afin que l'échec signifie une
violation réellement acceptée comme critère de blocage.

## Ce qui n'est pas encore fait

- aucun cluster Kubernetes n'est créé ;
- aucune commande `kubectl apply` n'est exécutée ;
- aucune ressource cloud n'est créée par Terraform ;
- aucun `terraform plan` ou `terraform apply` n'est exécuté ;
- aucune application n'est construite ou déployée.

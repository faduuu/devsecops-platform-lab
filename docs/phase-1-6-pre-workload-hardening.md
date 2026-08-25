# Phase 1.6 — Durcissement avant workload

## Objectif

Terminer les contrôles qui ne dépendent pas d'une application : vérifier les
schémas Kubernetes, rendre les dépendances GitHub Actions immuables, séparer les
preuves Checkov et préparer un cluster local reproductible.

## Validation Kubernetes

Le job `Validate Kubernetes manifests` télécharge Kubeconform `0.8.0`, vérifie
le SHA-256 publié pour son archive puis valide les manifests contre les schémas
Kubernetes `1.36.0`. Le fichier Kustomize est exclu de ce contrôle, car il ne
s'agit pas d'une ressource de l'API Kubernetes.

Les trois contrôles YAML ont des responsabilités différentes :

```text
yamllint     -> syntaxe et conventions YAML
Kubeconform  -> conformité aux schémas de l'API Kubernetes
Checkov      -> règles de sécurité et mauvaises configurations
```

## Dépendances GitHub Actions immuables

Chaque clé `uses:` référence maintenant un SHA de commit complet. Le commentaire
de version (`# v6`, par exemple) conserve la lisibilité. Dependabot continue de
proposer les mises à jour, qui doivent passer par une Pull Request et les mêmes
contrôles obligatoires.

## Baseline Checkov explicite

GitHub Actions, Terraform et Kubernetes sont exécutés dans trois commandes
Checkov distinctes. Chaque framework produit son propre rapport JUnit, ce qui
évite qu'un framework absent ou mal paramétré soit confondu avec un audit réussi.

La baseline locale a produit 132 contrôles GitHub Actions réussis et aucun
échec pour les trois frameworks. Le mode `--soft-fail` a donc été retiré : une
violation Checkov provoque maintenant l'échec de la Pull Request.

## Cluster local préparé

Le fichier `platform/kubernetes/kind/cluster.yaml` décrit un cluster local nommé
`devsecops-lab`. Le script suivant vérifie les prérequis, crée le cluster s'il
n'existe pas, puis applique la base Kustomize :

```powershell
powershell -NoProfile -ExecutionPolicy Bypass `
  -File ./scripts/Initialize-LocalKubernetes.ps1
```

Le script nécessite Docker, `kind` et `kubectl`. Il échoue explicitement sans
modifier le poste lorsqu'un de ces outils est absent.

## Limites

- aucun cluster n'est créé par la CI ;
- aucune application n'est construite ou déployée ;
- aucune ressource cloud n'est créée ;
- le test local réel attend l'installation de Docker, `kind` et `kubectl`.

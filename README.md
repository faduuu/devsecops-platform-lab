# DevSecOps Platform Lab

Ce dépôt sert à construire progressivement une plateforme DevSecOps réutilisable.
L'application métier n'est pas encore choisie : elle sera ajoutée plus tard dans
`app/` sans modifier l'organisation générale de la plateforme.

## Objectif

Construire, comprendre et documenter la chaîne suivante :

```text
Code source -> CI -> contrôles de sécurité -> image -> registre
            -> Kubernetes -> tests dynamiques -> observabilité
```

## État actuel

| Bloc | État | Pourquoi |
|---|---|---|
| Structure du dépôt | Prête | Base indépendante du workload |
| CI/CD | Phase 1 prête | Structure et détection de secrets avec GitHub Actions |
| Build et tests | En attente | Nécessitent le choix d'une application |
| Image et Trivy | En attente | Nécessitent une image à construire |
| Kubernetes | À concevoir | Des modèles génériques peuvent être préparés |
| Terraform/AWS | Plus tard | Après validation locale pour éviter coûts et complexité |
| Observabilité | À concevoir | Sera connectée au workload déployé |

## Organisation

```text
app/                    futur workload
ci/                     documentation et composants CI/CD
security/               politiques et configurations de sécurité
platform/kubernetes/    manifests Kubernetes
infra/terraform/        infrastructure as code
observability/          métriques, tableaux de bord et alertes
docs/                   architecture, décisions, GRC et apprentissage
scripts/                validations locales
```

Les logiciels nécessaires et leur ordre d'installation sont détaillés dans
[`docs/prerequisites.md`](docs/prerequisites.md).

La première pipeline et son fonctionnement sont expliqués dans
[`docs/phase-1-repository-security.md`](docs/phase-1-repository-security.md).

La gouvernance des changements, les responsabilités et la maintenance des
GitHub Actions sont détaillées dans
[`docs/phase-1-repository-governance.md`](docs/phase-1-repository-governance.md).

## Premier contrôle

Depuis PowerShell :

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File ./scripts/Test-RepositoryStructure.ps1
```

Le script vérifie uniquement la fondation. Il n'affirme pas que les phases de
build, de déploiement ou de sécurité applicative sont déjà opérationnelles.

## Principe de progression

Chaque phase doit produire quatre éléments : une configuration exécutable, une
preuve de fonctionnement, une explication pédagogique et un lien avec un risque
ou un contrôle GRC.

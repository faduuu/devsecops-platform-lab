# Phase 1 — Qualité et sécurité des configurations

Cette extension de la première pipeline ajoute deux contrôles indépendants de
l'application : la validation des fichiers YAML et l'analyse de sécurité des
workflows GitHub Actions.

## Pourquoi contrôler le YAML ?

YAML est utilisé par GitHub Actions, Kubernetes et de nombreux outils DevOps.
Une mauvaise indentation, une clé dupliquée ou une valeur ambiguë peut modifier
le comportement attendu ou empêcher un déploiement.

Le fichier `.yamllint.yml` constitue la règle commune du dépôt. Le job
`Validate YAML configuration` installe `yamllint`, examine récursivement le
dépôt et échoue lorsqu'il rencontre une erreur. Il s'agit donc d'un contrôle
bloquant.

## Pourquoi utiliser Checkov ?

Checkov applique des règles de sécurité à des configurations déclaratives. Dans
cette étape, il analyse séparément les workflows GitHub Actions, Terraform et
Kubernetes afin que chaque framework produise une preuve identifiable.

Le job `Audit configuration security` est désormais bloquant. Le mode
`--soft-fail` a été retiré après établissement d'une baseline séparée pour les
trois frameworks. Une violation non traitée provoque donc l'échec du job et
empêche la fusion dans `main`.

## Dépendances reproductibles

Les versions de `yamllint` et Checkov sont fixées dans
`ci/security-tools-constraints.txt`. Deux exécutions de la même révision
installent ainsi les mêmes versions, sauf indisponibilité externe du paquet.

## Preuves et rétention

Chaque job conserve son résultat comme artefact GitHub Actions pendant 30 jours :

- `yamllint-report` contient la sortie du contrôle YAML ;
- `checkov-configuration-report` regroupe trois rapports JUnit XML, un par
  framework ;
- `kubeconform-report` contient la validation JSON des schémas Kubernetes.

La console facilite le diagnostic immédiat. L'artefact fournit une preuve
téléchargeable et rattachée à une exécution, un commit et une Pull Request.

## Correspondance GRC

| Risque | Contrôle | Preuve |
|---|---|---|
| Configuration invalide ou ambiguë | Lint YAML bloquant | Statut du job et rapport yamllint |
| Workflow CI mal configuré | Analyse Checkov | Journal et rapport JUnit XML |
| Résultat de contrôle non traçable | Artefacts conservés 30 jours | Artefact lié au run et au commit |
| Dérive de version d'un outil | Versions Python fixées | Fichier de dépendances versionné |

Ces preuves soutiennent la traçabilité du contrôle. Elles ne constituent pas, à
elles seules, une certification de conformité.

## Limites assumées

- aucun code applicatif n'est analysé ;
- aucun code applicatif, conteneur ou service en fonctionnement n'est analysé.

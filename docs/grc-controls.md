# Correspondance GRC initiale

| Risque | Contrôle technique prévu | Preuve attendue |
|---|---|---|
| Secret exposé dans Git | Détection de secrets et protection des variables | Rapport CI et historique de correction |
| Dépendance vulnérable | SCA, SBOM et seuil de blocage | Rapport, ticket et délai de remédiation |
| Image compromise | Scan, registre privé et signature | Résultat Trivy et vérification de signature |
| Déploiement non autorisé | Revue, environnements protégés et RBAC | Journal d'approbation et audit Kubernetes |
| Conteneur trop privilégié | Security context et politiques | Manifest validé et résultat de policy check |
| Service indisponible | Probes, métriques et alertes | Historique d'alertes et tableau de bord |
| Changement non traçable | Git, CI et artefacts immuables | Commit lié au build et digest de l'image |
| Configuration invalide ou ambiguë | Lint YAML bloquant | Statut CI et rapport conservé 30 jours |
| Configuration CI non conforme | Analyse Checkov progressive | Rapport JUnit lié au commit et au run |
| Dépassement des ressources Kubernetes | ResourceQuota et LimitRange | Manifests versionnés et audit Checkov |
| Communications réseau non autorisées | Politique réseau fermée par défaut | Manifest versionné et revue de la PR |
| IaC invalide ou non formatée | Terraform fmt et validate bloquants | Statut CI et rapport JSON conservé 30 jours |
| Ressource cloud créée sans contrôle | Absence d'apply automatique à ce stade | Workflow auditable et revue de la PR |
| Action CI remplacée ou altérée | Références GitHub Actions verrouillées par SHA | Workflow versionné et revue Dependabot |
| Champ Kubernetes inconnu ou obsolète | Validation stricte Kubeconform | Statut CI et rapport JSON conservé 30 jours |

Cette table est une base de travail, pas une certification de conformité.

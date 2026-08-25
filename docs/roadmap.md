# Feuille de route

## Phase 0 — Fondation

- structure du dépôt ;
- conventions Git et secrets ;
- architecture et critères de réussite ;
- validation automatique de la fondation.

## Phase 1 — Sécurité du dépôt

- [x] première GitHub Action ;
- [x] Gitleaks ;
- [x] gouvernance par Pull Request et protection de `main` ;
- [x] lint des fichiers de configuration ;
- [x] conservation initiale des rapports ;
- [ ] passage progressif de Checkov du mode informatif au mode bloquant ;
- [ ] verrouillage des actions tierces par SHA immuable.

## Phase 1.5 — Fondation déclarative sans workload

- [x] namespace Kubernetes isolé et Pod Security `restricted` ;
- [x] quotas, limites et politique réseau fermée par défaut ;
- [x] contrat Terraform minimal sans provider ni ressource cloud ;
- [x] validation Terraform dans la CI ;
- [x] audit Checkov étendu à Kubernetes et Terraform ;
- [ ] validation des manifests avec un schéma Kubernetes ;
- [ ] passage de la baseline Checkov au mode bloquant.

## Phase 2 — Contrat du workload

- choix d'une application minimale ou existante ;
- build et tests reproductibles ;
- endpoint de santé et configuration externe.

## Phase 3 — Supply chain

- SAST et SCA ;
- construction d'image reproductible ;
- SBOM, Trivy, signature et publication contrôlée.

## Phase 4 — Kubernetes local

- manifests ou Helm ;
- probes, ressources, moindre privilège et politiques ;
- déploiement et tests automatiques.

## Phase 5 — DAST et observabilité

- OWASP ZAP ;
- Prometheus/Grafana ;
- alertes et preuves d'exploitation.

## Phase 6 — Cloud

- Terraform ;
- AWS ECR/EKS et IAM ;
- contrôle des coûts, journalisation et durcissement.

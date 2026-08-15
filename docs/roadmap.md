# Feuille de route

## Phase 0 — Fondation

- structure du dépôt ;
- conventions Git et secrets ;
- architecture et critères de réussite ;
- validation automatique de la fondation.

## Phase 1 — Sécurité du dépôt

- première GitHub Action ;
- Gitleaks ;
- lint des fichiers de configuration ;
- conservation des rapports et règles de blocage.

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


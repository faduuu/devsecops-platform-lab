# CI/CD

La CI sera introduite en deux niveaux.

1. Contrôles indépendants du workload : structure, secrets, documentation et
   Infrastructure as Code.
2. Contrôles dépendants du workload : tests, SAST/SCA, build, image, Trivy,
   publication et déploiement.

Cette séparation empêchera la pipeline d'être liée à une seule technologie.


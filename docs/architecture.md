# Architecture logique

```text
Développeur
    |
    v
Dépôt Git
    |
    v
Pipeline CI --------------------------------------+
    |                                             |
    +-- qualité/tests                             +-- preuves et rapports
    +-- secrets/SAST/SCA                              de sécurité
    +-- build artefact                            |
    +-- build et scan image                       |
    |                                             |
    v                                             |
Registre d'images                                 |
    |                                             |
    v                                             |
Kubernetes <--- configuration/secrets/policies ---+
    |
    +-- DAST
    +-- métriques, logs et alertes
```

## Frontières

- `app/` fournit le workload et son contrat d'exécution.
- `ci/` orchestre les contrôles et la promotion.
- `security/` définit les règles de sécurité et leurs seuils.
- `platform/` décrit l'exécution sur Kubernetes.
- `infra/` crée les ressources externes.
- `observability/` apporte les preuves d'exploitation.

Le remplacement de l'application doit modifier son adaptateur de build et ses
paramètres de déploiement, pas toute l'architecture.


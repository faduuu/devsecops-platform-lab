# Outils préliminaires

L'installation se fait par phase. Installer toute la stack dès le début ajoute
des problèmes sans aider à comprendre la première pipeline.

## Phase 1 — nécessaires maintenant

| Outil | Rôle | État détecté |
|---|---|---|
| Git | Historique, commits et envoi vers GitHub | Installé |
| Compte GitHub | Hébergement du dépôt et exécution de GitHub Actions | Confirmé |
| Éditeur IntelliJ IDEA | Lire et modifier YAML, Markdown et scripts | Installé |
| Navigateur | Consulter GitHub et les rapports CI | Disponible sur Windows |
| PowerShell | Exécuter les validations locales | Disponible |

Gitleaks n'a pas besoin d'être installé localement au départ : la première
version sera exécutée par GitHub Actions sur un runner hébergé.

## Phase 2 — lors de l'ajout d'une application

- runtime correspondant à l'application ;
- gestionnaire de dépendances correspondant ;
- Docker Desktop avec le backend WSL 2.

Pour PetClinic, ce serait Java. Le Maven Wrapper du dépôt permettrait de ne pas
installer Maven séparément.

## Phase 3 — Kubernetes local

- `kubectl` pour communiquer avec le cluster ;
- un cluster local, par exemple celui fourni/configuré avec Docker Desktop ou
  un outil dédié ;
- Helm seulement lorsque nous aurons besoin de packages réutilisables.

État actuel : Docker, `kubectl`, `kind` et `minikube` ne sont pas disponibles
dans le terminal. La configuration et le script du cluster sont prêts, mais le
cluster local n'a pas encore été créé.

## Phase 4 — cloud

- Terraform ;
- AWS CLI ;
- compte AWS avec budget et alertes de coût configurés avant EKS.

## Scanners locaux optionnels

Trivy et Gitleaks pourront être installés plus tard pour obtenir le même retour
avant un push. Les exécuter d'abord dans la CI réduit les prérequis du laboratoire.

## Configuration Git à terminer

Remplacer les valeurs d'exemple par l'identité à afficher dans les commits :

```powershell
git config --global user.name "Votre Nom"
git config --global user.email "votre-email@example.com"
```

Vérification :

```powershell
git --version
git config --global user.name
git config --global user.email
```

Ne jamais placer un mot de passe ou un token GitHub dans un fichier du dépôt.

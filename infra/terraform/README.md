# Terraform

Ce répertoire contient le contrat Terraform minimal de la plateforme. Il permet
dès maintenant de tester le format et la syntaxe de l'IaC sans créer de compte
cloud, de backend distant ou de ressource facturable.

## Contenu actuel

- `versions.tf` fixe la version compatible de Terraform ;
- `variables.tf` définit et valide les paramètres d'entrée ;
- `locals.tf` construit des métadonnées communes ;
- `outputs.tf` expose ces métadonnées pour vérifier le contrat.

La pipeline exécute `terraform fmt`, `terraform init -backend=false` puis
`terraform validate`. Elle n'exécute volontairement ni `plan` ni `apply`.

Les futurs composants cloud seront ajoutés dans cet ordre : réseau, registre
d'images, cluster, identités et permissions, observabilité, puis contrôles de
sécurité cloud. Les états, plans et secrets locaux restent exclus de Git.

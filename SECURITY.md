# Politique de sécurité

## Périmètre

Ce dépôt est un laboratoire d'apprentissage DevSecOps. Il ne traite aucune
donnée de production et ne doit contenir aucun secret réel.

## Signaler un problème

Pour une erreur de configuration sans donnée sensible, ouvrir une issue GitHub
en décrivant le composant, l'impact potentiel et les étapes de reproduction.

Ne jamais publier dans une issue un mot de passe, un token, une clé privée, des
données personnelles ou les détails exploitables d'une vulnérabilité active.

## Traitement

Chaque signalement est qualifié selon quatre étapes :

1. confirmer le problème et identifier le composant affecté ;
2. évaluer la vraisemblance et l'impact ;
3. corriger ou documenter une exception approuvée ;
4. conserver la preuve de correction dans une Pull Request et la CI.

En cas de secret exposé, la première action est sa révocation ou sa rotation.
La suppression du texte dans le dernier commit ne suffit pas, car le secret peut
rester accessible dans l'historique Git.


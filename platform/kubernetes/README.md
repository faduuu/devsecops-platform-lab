# Kubernetes

Le dossier `base/` prépare un espace Kubernetes sécurisé qui ne dépend d'aucune
application :

- `namespace.yaml` isole le laboratoire et impose le niveau Pod Security
  `restricted` ;
- `resource-quota.yaml` limite la consommation totale du namespace ;
- `limit-range.yaml` applique des valeurs CPU/mémoire par défaut aux conteneurs ;
- `network-policy.yaml` bloque par défaut tous les flux entrants et sortants ;
- `kustomization.yaml` regroupe ces fichiers pour une future application avec
  `kubectl apply -k platform/kubernetes/base`.

Aucun `Deployment` ni `Service` n'est encore défini, car le workload reste à
choisir. La politique réseau bloque aussi le DNS par défaut : une règle de sortie
DNS et les flux strictement nécessaires seront ajoutés avec l'application.

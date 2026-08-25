$ErrorActionPreference = 'Stop'

$requiredCommands = @('docker', 'kind', 'kubectl')
$missingCommands = foreach ($command in $requiredCommands) {
    if (-not (Get-Command $command -ErrorAction SilentlyContinue)) {
        $command
    }
}

if ($missingCommands) {
    throw "Outils manquants : $($missingCommands -join ', '). Installez-les avant de créer le cluster local."
}

docker info *> $null
if ($LASTEXITCODE -ne 0) {
    throw 'Docker est installé mais son moteur ne répond pas. Démarrez Docker Desktop.'
}

$repositoryRoot = Split-Path -Parent $PSScriptRoot
$clusterConfig = Join-Path $repositoryRoot 'platform/kubernetes/kind/cluster.yaml'
$existingClusters = @(kind get clusters)

if ($existingClusters -notcontains 'devsecops-lab') {
    kind create cluster --config $clusterConfig
}
else {
    Write-Host 'Le cluster kind devsecops-lab existe déjà.'
}

kubectl apply -k (Join-Path $repositoryRoot 'platform/kubernetes/base')

Write-Host 'Fondation Kubernetes appliquée :'
kubectl get namespace devsecops-lab
kubectl get resourcequota,limitrange,networkpolicy -n devsecops-lab

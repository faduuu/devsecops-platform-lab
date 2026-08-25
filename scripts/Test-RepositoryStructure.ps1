$ErrorActionPreference = 'Stop'

$repositoryRoot = Split-Path -Parent $PSScriptRoot
$requiredPaths = @(
    'README.md',
    '.gitignore',
    '.github/workflows/repository-security.yml',
    '.github/CODEOWNERS',
    '.github/PULL_REQUEST_TEMPLATE.md',
    '.github/dependabot.yml',
    '.yamllint.yml',
    'app/README.md',
    'ci/README.md',
    'ci/security-tools-constraints.txt',
    'security/README.md',
    'platform/kubernetes/README.md',
    'platform/kubernetes/base/namespace.yaml',
    'platform/kubernetes/base/resource-quota.yaml',
    'platform/kubernetes/base/limit-range.yaml',
    'platform/kubernetes/base/network-policy.yaml',
    'platform/kubernetes/base/kustomization.yaml',
    'platform/kubernetes/kind/cluster.yaml',
    'infra/terraform/README.md',
    'infra/terraform/versions.tf',
    'infra/terraform/variables.tf',
    'infra/terraform/locals.tf',
    'infra/terraform/outputs.tf',
    'observability/README.md',
    'docs/architecture.md',
    'docs/roadmap.md',
    'docs/grc-controls.md',
    'docs/prerequisites.md',
    'docs/phase-1-repository-security.md',
    'docs/phase-1-repository-governance.md',
    'docs/phase-1-configuration-security.md',
    'docs/phase-1-5-platform-foundation.md',
    'docs/phase-1-6-pre-workload-hardening.md',
    'scripts/Initialize-LocalKubernetes.ps1',
    'SECURITY.md'
)

$missingPaths = foreach ($relativePath in $requiredPaths) {
    $absolutePath = Join-Path $repositoryRoot $relativePath
    if (-not (Test-Path -LiteralPath $absolutePath)) {
        $relativePath
    }
}

if ($missingPaths) {
    Write-Error ("Structure incomplète. Éléments absents : " + ($missingPaths -join ', '))
}

Write-Host "Structure du dépôt valide : $($requiredPaths.Count) éléments contrôlés."

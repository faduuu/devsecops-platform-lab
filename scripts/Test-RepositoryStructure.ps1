$ErrorActionPreference = 'Stop'

$repositoryRoot = Split-Path -Parent $PSScriptRoot
$requiredPaths = @(
    'README.md',
    '.gitignore',
    '.github/workflows/repository-security.yml',
    '.github/CODEOWNERS',
    '.github/PULL_REQUEST_TEMPLATE.md',
    '.github/dependabot.yml',
    'app/README.md',
    'ci/README.md',
    'security/README.md',
    'platform/kubernetes/README.md',
    'infra/terraform/README.md',
    'observability/README.md',
    'docs/architecture.md',
    'docs/roadmap.md',
    'docs/grc-controls.md',
    'docs/prerequisites.md',
    'docs/phase-1-repository-security.md',
    'docs/phase-1-repository-governance.md',
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

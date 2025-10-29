<#
activate_env.ps1
Helper para ativar o virtual environment `venv` criado na raiz do repositório.

Uso:
  . .\scripts\activate_env.ps1   # dot-source para ativar no terminal atual do PowerShell
  .\scripts\activate_env.ps1     # (opcional) abre uma nova janela do PowerShell com o venv ativado
#>

$RepoRoot = Split-Path -Parent $PSScriptRoot
$activate = Join-Path $RepoRoot 'venv\Scripts\Activate.ps1'

if (-not (Test-Path $activate)) {
    Write-Host "Nenhum virtual environment encontrado. Rode .\scripts\create_env.ps1 primeiro." -ForegroundColor Yellow
    exit 1
}

if ($MyInvocation.InvocationName -eq '.') {
    # Dot-sourced: ativar no terminal atual
    & $activate
    Write-Host "venv ativado nesta sessão." -ForegroundColor Green
    return
}

Write-Host "Para ativar no terminal atual, dot-source este script (note o ponto e o espaço):" -ForegroundColor Cyan
Write-Host "  . $PSScriptRoot\activate_env.ps1" -ForegroundColor Cyan
Write-Host "Abrindo nova janela do PowerShell com o ambiente ativado..." -ForegroundColor Gray

# Abrir nova janela do PowerShell com o venv ativado
$cmd = "& '$activate'"
Start-Process powershell -ArgumentList "-NoExit","-ExecutionPolicy","Bypass","-Command",$cmd

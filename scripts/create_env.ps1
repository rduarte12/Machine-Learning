<#
create_env.ps1
Cria um virtual environment chamado `venv` na raiz do repositório e instala os pacotes do requirements.txt.

Uso:
  .\scripts\create_env.ps1          # cria venv e instala requisitos
  .\scripts\create_env.ps1 -Recreate  # recria (remove) venv existente e cria novamente
#>

param(
    [switch]$Recreate
)

$RepoRoot = Split-Path -Parent $PSScriptRoot
$VenvPath = Join-Path $RepoRoot 'venv'

if ((Test-Path $VenvPath) -and $Recreate) {
    Write-Host "Removendo venv existente..." -ForegroundColor Yellow
    Remove-Item $VenvPath -Recurse -Force
}

if (-not (Test-Path $VenvPath)) {
    Write-Host "Criando virtual environment em: $VenvPath" -ForegroundColor Green
    python -m venv $VenvPath
}

$pythonExe = Join-Path $VenvPath 'Scripts\python.exe'
if (-not (Test-Path $pythonExe)) {
    Write-Host "Não foi possível localizar o Python dentro do venv. Verifique se 'python' está no PATH e tente novamente." -ForegroundColor Red
    exit 1
}

Write-Host "Atualizando pip..." -ForegroundColor Gray
& $pythonExe -m pip install --upgrade pip

$req = Join-Path $RepoRoot 'requirements.txt'
if (Test-Path $req) {
    Write-Host "Instalando pacotes do requirements.txt..." -ForegroundColor Gray
    & $pythonExe -m pip install -r $req
} else {
    Write-Host "Arquivo requirements.txt não encontrado em $req" -ForegroundColor Yellow
}

Write-Host ""; Write-Host "Pronto." -ForegroundColor Green
Write-Host "Para ativar o ambiente nesta sessão do PowerShell rode (dot-source):" -ForegroundColor Cyan
Write-Host "  . $RepoRoot\venv\Scripts\Activate.ps1" -ForegroundColor Cyan
Write-Host "Ou use o helper: . $PSScriptRoot\activate_env.ps1" -ForegroundColor Cyan

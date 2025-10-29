# Machine-Learning (ambiente)

Este repositório contém material para documentar aprendizado em Machine Learning.
Os scripts nesta pasta ajudam a criar e ativar um ambiente Python isolado (virtualenv) e instalar as dependências especificadas em `requirements.txt`.

## Scripts disponíveis

- `scripts/create_env.ps1` (PowerShell)
  - Cria o virtualenv em `venv/` e instala os pacotes do `requirements.txt`.
  - Uso: Abra um terminal PowerShell e rode:

    ```powershell
    .\scripts\create_env.ps1
    ```

  - Para recriar o ambiente (remover e criar novamente):

    ```powershell
    .\scripts\create_env.ps1 -Recreate
    ```

- `scripts/activate_env.ps1` (PowerShell helper)
  - Para ativar o ambiente na sessão atual do PowerShell (recomendado):

    ```powershell
    . .\scripts\activate_env.ps1
    ```

    Observe o ponto seguido de espaço (dot-source) — isso ativa o venv na sessão atual.

  - Se você executar sem dot-source (`.\scripts\activate_env.ps1`), o script tentará abrir uma nova janela do PowerShell com o venv ativado.

- `scripts/activate_env.bat` (CMD)
  - Para ambientes `cmd.exe` apenas: `scripts\activate_env.bat`.

## Integração com VS Code

As configurações de workspace em `.vscode/settings.json` apontam o interpretador para `${workspaceFolder}/venv/Scripts/python.exe` e ativam automaticamente o ambiente nos terminais integrados quando possível.

## Observações

- O arquivo `requirements.txt` já existe na raiz (edite se precisar de versões diferentes).
- Se o PowerShell bloquear a execução de scripts, é possível executar com política de execução temporária na sessão:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\scripts\create_env.ps1
```

ou dot-source a ativação após criar o venv:

```powershell
. .\scripts\activate_env.ps1
```

## Próximos passos sugeridos

- Instalar a extensão Python e Pylance no VS Code para melhor experiência.
- Se preferir conda, adapte os scripts ou use um `environment.yml`.
# Machine-Learning
Reposity for documentation my learn about Machine Learning

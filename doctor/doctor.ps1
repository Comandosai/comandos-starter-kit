# COMANDOS Starter Kit — DOCTOR (Windows / PowerShell)
# Эквивалент doctor.sh. Проверяет окружение, ищет базу знаний, готовит ~/.comandos/config.json.
# Запуск: powershell -ExecutionPolicy Bypass -File doctor/doctor.ps1
# Ничего деструктивного. Безопасен для повторного запуска.

$ErrorActionPreference = "SilentlyContinue"
$home_ = $env:USERPROFILE
$confDir = Join-Path $home_ ".comandos"
$conf = Join-Path $confDir "config.json"

function Have($name) { return [bool](Get-Command $name -ErrorAction SilentlyContinue) }

Write-Output "=== COMANDOS DOCTOR REPORT ==="
Write-Output "os: Windows"

Write-Output "--- cli ---"
foreach ($t in @("node","npm","npx","git")) {
  if (Have $t) { Write-Output "$t`: OK ($(& $t --version 2>&1 | Select-Object -First 1))" }
  else { Write-Output "$t`: MISSING -> установить с https://nodejs.org (node/npm/npx) или https://git-scm.com (git)" }
}

Write-Output "--- ide ---"
if (Test-Path (Join-Path $home_ ".claude")) { Write-Output "claude-code: detected" } else { Write-Output "claude-code: -" }
if (Test-Path (Join-Path $home_ ".codex"))  { Write-Output "codex: detected" }       else { Write-Output "codex: -" }
if ((Test-Path (Join-Path $home_ ".antigravity")) -or (Test-Path (Join-Path $home_ ".gemini"))) { Write-Output "antigravity: detected" } else { Write-Output "antigravity: -" }

Write-Output "--- knowledge_base candidates ---"
$roots = @($home_, (Join-Path $home_ "Documents"), (Join-Path $home_ "Comandos.ai"), (Join-Path $home_ "Dropbox"))
$found = @{}
foreach ($r in $roots) {
  if (-not (Test-Path $r)) { continue }
  Get-ChildItem -Path $r -Recurse -Depth 4 -Directory -Filter ".obsidian" -ErrorAction SilentlyContinue |
    ForEach-Object { $found[$_.Parent.FullName] = $true }
}
if ($found.Count -gt 0) { $found.Keys | Select-Object -First 10 | ForEach-Object { Write-Output "candidate: $_" } }
else { Write-Output "candidate: NONE" }

Write-Output "--- config ---"
New-Item -ItemType Directory -Force -Path $confDir | Out-Null
if (Test-Path $conf) {
  Write-Output "config: EXISTS"; Write-Output "config_path: $conf"
  try {
    $pdir = (Get-Content $conf -Raw | ConvertFrom-Json).projects_dir
    if ($pdir -match "OneDrive|Dropbox|Mobile Documents|CloudDocs") {
      Write-Output "projects_dir_cloud: YES ($pdir) -> git/npm могут не работать, предложи локальную папку"
    } elseif (-not $pdir) { Write-Output "projects_dir_cloud: unknown" }
    else { Write-Output "projects_dir_cloud: NO" }
  } catch { Write-Output "projects_dir_cloud: unknown" }
}
else { Write-Output "config: ABSENT (агент должен создать после интервью)"; Write-Output "config_path: $conf" }

Write-Output "=== END REPORT ==="

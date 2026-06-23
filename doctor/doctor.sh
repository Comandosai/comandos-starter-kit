#!/usr/bin/env bash
# COMANDOS Starter Kit — DOCTOR
# Проверяет окружение, ищет базу знаний, готовит ~/.comandos/config.json.
# Запускается AI-агентом. Печатает СТРУКТУРИРОВАННЫЙ отчёт, который агент парсит.
# Ничего деструктивного не делает. Безопасен для повторного запуска.

set -uo pipefail

CONF_DIR="$HOME/.comandos"
CONF="$CONF_DIR/config.json"

say() { printf '%s\n' "$1"; }
have() { command -v "$1" >/dev/null 2>&1; }

say "=== COMANDOS DOCTOR REPORT ==="
say "os: $(uname -s)"

# --- 1. Базовые инструменты ---
say "--- cli ---"
for tool in node npm npx git; do
  if have "$tool"; then
    say "$tool: OK ($($tool --version 2>&1 | head -1))"
  else
    say "$tool: MISSING -> установить: см. lib/mcp-install.md (macOS: nodejs.org .pkg или brew; Windows: nodejs.org)"
  fi
done

# --- 2. Определение IDE/среды ---
say "--- ide ---"
if [ -d "$HOME/.claude" ]; then say "claude-code: detected"; else say "claude-code: -"; fi
if [ -d "$HOME/.codex" ]; then say "codex: detected"; else say "codex: -"; fi
if [ -d "$HOME/.antigravity" ] || [ -d "$HOME/.config/antigravity" ] || [ -d "$HOME/.gemini" ]; then
  say "antigravity: detected"
else
  say "antigravity: -"
fi

# --- 3. Поиск базы знаний (vault) ---
say "--- knowledge_base candidates ---"
# ищем папки .obsidian не глубже 4 уровней в типичных местах (с дедупликацией)
SEARCH_ROOTS=("$HOME" "$HOME/Documents" "$HOME/Comandos.ai" "$HOME/Dropbox")
tmp_cand="$(mktemp)"
for root in "${SEARCH_ROOTS[@]}"; do
  [ -d "$root" ] || continue
  find "$root" -maxdepth 4 \( -name node_modules -o -name Library -o -name .git \) -prune -o \
       -type d -name ".obsidian" -print 2>/dev/null | while IFS= read -r vault; do
    dirname "$vault"
  done >> "$tmp_cand"
done
if [ -s "$tmp_cand" ]; then
  sort -u "$tmp_cand" | head -10 | while IFS= read -r c; do say "candidate: $c"; done
else
  say "candidate: NONE"
fi
rm -f "$tmp_cand"

# --- 4. Глобальный конфиг ---
say "--- config ---"
mkdir -p "$CONF_DIR"
if [ -f "$CONF" ]; then
  say "config: EXISTS"
  say "config_path: $CONF"
  # Облако-проверка: код в iCloud/Dropbox/OneDrive ломает git/npm
  pdir=$(grep -o '"projects_dir"[^,]*' "$CONF" 2>/dev/null | sed 's/.*": *"//; s/"$//')
  case "$pdir" in
    *"Mobile Documents"*|*"com~apple~CloudDocs"*|*Dropbox*|*OneDrive*)
      say "projects_dir_cloud: YES ($pdir) -> git/npm могут не работать, предложи локальную папку" ;;
    "") say "projects_dir_cloud: unknown" ;;
    *) say "projects_dir_cloud: NO" ;;
  esac
else
  say "config: ABSENT (агент должен создать после интервью)"
  say "config_path: $CONF"
fi

say "=== END REPORT ==="
say ""
say "Дальше: агент сверяет 'cli/mcp/env' нужного рецепта с этим отчётом,"
say "доустанавливает недостающее (см. lib/mcp-install.md), создаёт config при ABSENT."

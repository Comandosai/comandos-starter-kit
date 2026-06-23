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
    say "$tool: MISSING"
  fi
done

# --- 2. Определение IDE/среды ---
say "--- ide ---"
[ -d "$HOME/.claude" ] && say "claude-code: detected" || say "claude-code: -"
[ -d "$HOME/.codex" ]  && say "codex: detected"       || say "codex: -"
[ -d "$HOME/.antigravity" ] || [ -d "$HOME/.config/antigravity" ] && say "antigravity: detected" || say "antigravity: -"

# --- 3. Поиск базы знаний (vault) ---
say "--- knowledge_base candidates ---"
# ищем папки .obsidian не глубже 4 уровней в типичных местах
SEARCH_ROOTS=("$HOME" "$HOME/Documents" "$HOME/Comandos.ai" "$HOME/Dropbox")
found_any=0
for root in "${SEARCH_ROOTS[@]}"; do
  [ -d "$root" ] || continue
  while IFS= read -r vault; do
    [ -z "$vault" ] && continue
    say "candidate: $(dirname "$vault")"
    found_any=1
  done < <(find "$root" -maxdepth 4 -type d -name ".obsidian" 2>/dev/null | head -10)
done
[ "$found_any" -eq 0 ] && say "candidate: NONE"

# --- 4. Глобальный конфиг ---
say "--- config ---"
mkdir -p "$CONF_DIR"
if [ -f "$CONF" ]; then
  say "config: EXISTS"
  say "config_path: $CONF"
else
  say "config: ABSENT (агент должен создать после интервью)"
  say "config_path: $CONF"
fi

say "=== END REPORT ==="
say ""
say "Дальше: агент сверяет 'cli/mcp/env' нужного рецепта с этим отчётом,"
say "доустанавливает недостающее (см. lib/mcp-install.md), создаёт config при ABSENT."

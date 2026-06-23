# Установка MCP, CLI и ключей по рецепту (для агента)

После выбора рецепта сверь `needs` с отчётом doctor. Чего нет — доустанови.
Резидент — не программист: делай сам, объясняй простыми словами.
Доктор НЕ проверяет MCP/ENV — это целиком на тебе по этому файлу.

## CLI

### Node / npm / npx
- **macOS, есть Homebrew:** `brew install node`
- **macOS, Homebrew НЕТ (чистый Mac):**
  1. Предупреди: понадобится пароль Mac и согласие на окно установки инструментов.
  2. Сначала `xcode-select --install` (всплывёт окно — нажать «Установить», подождать).
  3. Установи Homebrew (команда с https://brew.sh), затем `brew install node`.
  - **Альтернатива без Homebrew (проще для непрограммиста):** скачать официальный
    установщик LTS с https://nodejs.org → запустить .pkg → готово.
- **Windows:** скачать установщик LTS с https://nodejs.org (или `winget install OpenJS.NodeJS.LTS`).

### git
- macOS: всплывёт окно Command Line Tools при первом `git` — нажать «Установить».
  Либо `brew install git`. Windows: https://git-scm.com или `winget install Git.Git`.

### degit
Ставить не нужно — вызывается через `npx degit <repo> <target>`.

---

## MCP-серверы — по каждой IDE свой способ и формат

MCP из `needs.mcp` рецепта надо прописать в конфиг ИМЕННО той среды, где сидит
резидент (`config.ide`). После добавления MCP часто нужен **перезапуск среды**,
иначе сервер не подхватится в текущей сессии — предупреди резидента.

### Claude Code
Командой (пишет в нужный конфиг сам):
```bash
claude mcp add supabase -- npx -y @supabase/mcp-server-supabase@latest
# с ключом окружения:
claude mcp add supabase --env SUPABASE_ACCESS_TOKEN=<PAT> -- npx -y @supabase/mcp-server-supabase@latest
```
Либо вручную в `.mcp.json` в корне проекта:
```json
{ "mcpServers": {
    "supabase": {
      "command": "npx",
      "args": ["-y","@supabase/mcp-server-supabase@latest"],
      "env": { "SUPABASE_ACCESS_TOKEN": "<PAT>" }
    }
} }
```
Проверка: `claude mcp list`. После добавления — перезапусти сессию.

### OpenAI Codex
В `~/.codex/config.toml`. ВАЖНО: ENV у Codex — отдельной подсекцией `[mcp_servers.<name>.env]`:
```toml
[mcp_servers.supabase]
command = "npx"
args = ["-y", "@supabase/mcp-server-supabase@latest"]

[mcp_servers.supabase.env]
SUPABASE_ACCESS_TOKEN = "<PAT>"
```
Codex читает config.toml при СТАРТЕ сессии → после правки **закрыть и открыть Codex**,
затем проверить, что сервер виден.

### Google Antigravity
Конфиг: `~/.gemini/config/mcp_config.json` (в UI: «…» → Manage MCP Servers → View raw config).
Формат как у Claude Code:
```json
{ "mcpServers": {
    "supabase": {
      "command": "npx",
      "args": ["-y","@supabase/mcp-server-supabase@latest"],
      "env": { "SUPABASE_ACCESS_TOKEN": "<PAT>" }
    }
} }
```
После сохранения — перезапусти Antigravity / обнови список MCP.

---

## ENV-ключи — где брать (объясняй резиденту по-человечески)

| Ключ | Где взять |
|---|---|
| `ANTHROPIC_API_KEY` | console.anthropic.com → API Keys → Create |
| `TELEGRAM_BOT_TOKEN` | в Telegram написать **@BotFather** → `/newbot` → имя → скопировать токен |
| `SUPABASE_ACCESS_TOKEN` | supabase.com → Account → Access Tokens (нужен MCP supabase) |
| `NEXT_PUBLIC_SUPABASE_URL` / `..._ANON_KEY` | supabase.com → проект → Project Settings → API |
| `STRIPE_SECRET_KEY` | dashboard.stripe.com → Developers → API keys |

Чего нет — спроси, сохрани в `.env` создаваемого проекта (НИКОГДА не коммить,
он уже в `.gitignore`). Различай: ключи ДЛЯ ПРИЛОЖЕНИЯ идут в `.env` проекта;
токены ДЛЯ MCP-СЕРВЕРА (напр. `SUPABASE_ACCESS_TOKEN`) идут в конфиг MCP среды.

---

## Реестр известных MCP

| Имя в рецепте | Запуск | Ключ |
|---|---|---|
| supabase | `npx -y @supabase/mcp-server-supabase@latest` | `SUPABASE_ACCESS_TOKEN` |
| context7 | `npx -y @upstash/context7-mcp@latest` | — |
| kie-ai | MCP COMANDOS для генерации медиа (veo3/kling/seedance). Это **предоставляемый клубом** сервер: попроси у куратора COMANDOS точную команду `claude mcp add kie-ai ...` и ключ (`KIE_API_KEY`/токен). Если у резидента он уже подключён (`claude mcp list`) — используй как есть. | `KIE_API_KEY` |

Если нужного MCP нет в реестре и его нельзя поставить — честно скажи резиденту
и предложи альтернативу (другой инструмент или ручной путь).

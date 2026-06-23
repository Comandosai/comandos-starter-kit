# Установка MCP и CLI по рецепту (для агента)

После выбора рецепта сверь `needs` с отчётом doctor. Чего нет — доустанови.
Резидент — не программист: делай сам, объясняй простыми словами.

## CLI

| Нужно | Команда установки (macOS) | Windows |
|---|---|---|
| node / npm / npx | `brew install node` (или nvm) | скачать с nodejs.org |
| git | `brew install git` | git-scm.com |
| degit | идёт через `npx degit ...` (ставить не нужно) | то же |

Если `brew` нет на macOS — подскажи установить Homebrew одной строкой с brew.sh.

## MCP-серверы — по каждой IDE свой способ

MCP, объявленные в `needs.mcp` рецепта (напр. `supabase`, `kie-ai`, `telegram`),
надо прописать в конфиг ИМЕННО той среды, где сидит резидент (`config.ide`).

### Claude Code
Проще всего командой (пишет в нужный конфиг сам):
```bash
claude mcp add <name> -- <команда запуска сервера>
# пример:
claude mcp add supabase -- npx -y @supabase/mcp-server-supabase@latest
```
Либо вручную добавить в `.mcp.json` в корне проекта:
```json
{ "mcpServers": {
    "supabase": { "command": "npx", "args": ["-y","@supabase/mcp-server-supabase@latest"] }
} }
```

### OpenAI Codex
Добавить сервер в Codex MCP-конфиг (`~/.codex/config.toml`, секция `[mcp_servers.<name>]`):
```toml
[mcp_servers.supabase]
command = "npx"
args = ["-y", "@supabase/mcp-server-supabase@latest"]
```

### Google Antigravity
Прописать MCP в настройках Antigravity (конфиг MCP-серверов в его settings).
Формат — `command` + `args`, как у остальных. Если резидент не знает где —
проведи по шагам через UI.

## ENV-ключи
Чего нет в окружении (`needs.env`) — спроси у резидента человеческим языком,
сохрани в `.env` создаваемого проекта (НИКОГДА не коммить, добавь в `.gitignore`).
Где взять ключ — подскажи ссылкой (напр. ANTHROPIC_API_KEY → console.anthropic.com).

## Реестр известных MCP (расширяется)
| Имя в рецепте | Пакет / запуск |
|---|---|
| supabase | `npx -y @supabase/mcp-server-supabase@latest` |
| kie-ai | MCP генерации медиа (veo3/kling/seedance) — по конфигу COMANDOS |
| telegram | по выбранному telegram-MCP (или обойтись grammY без MCP) |
| context7 | `npx -y @upstash/context7-mcp@latest` |

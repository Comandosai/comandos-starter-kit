# {{PROJECT_NAME}} — цифровой сотрудник

Минимальный агент на **Claude Agent SDK** (TypeScript).

## Запуск
```bash
npm install
cp .env.example .env      # впиши ANTHROPIC_API_KEY
npm start "твоя задача"
```

## Где что
- `src/index.ts` — логика сотрудника (роль в `SYSTEM_PROMPT`)
- `.env` — ключи (не коммитится)
- `PROJECT-BRIEF.md` — что строим (человеческим языком)
- `AGENTS.md` — правила для AI

## Дальше
Опиши задачу в `PROJECT-BRIEF.md` и попроси AI доработать `src/index.ts`:
подключить инструменты (`allowedTools`), MCP (`mcpServers`), расписание и т.д.

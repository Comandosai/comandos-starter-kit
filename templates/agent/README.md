# {{PROJECT_NAME}} — цифровой сотрудник

Профессиональный костяк агента на **Claude Agent SDK** (TypeScript). Готов к наполнению.

## Запуск
Если проект собрал агент-стартер — ключ уже в `.env`, просто:
```bash
npm start "твоя задача"
```

Если запускаешь с нуля вручную:
```bash
npm install
cp .env.example .env      # macOS/Linux. Windows: Copy-Item .env.example .env
npm start "твоя задача"   # впиши ANTHROPIC_API_KEY в .env
```

## Команды
- `npm start` — запустить агента
- `npm run dev` — запуск с авто-перезапуском
- `npm run typecheck` — проверка типов
- `npm run lint` — ESLint
- `npm run format` — Prettier (автоформат)
- `npm test` — тесты (Node test runner)

## Структура (куда что класть)
```
src/
  index.ts      — точка входа (роль агента в SYSTEM_PROMPT)
  lib/          — переиспользуемые утилиты (env, helpers)
tests/          — тесты (пример: env.test.ts)
.env            — ключи (НЕ коммитится)
AGENTS.md       — правила для AI
PROJECT-BRIEF.md — что строим (человеческим языком)
```

## Дальше
Опиши задачу в `PROJECT-BRIEF.md`, **открой новый чат в этой папке** и наполняй:
подключи инструменты (`allowedTools`), MCP (`mcpServers`), добавь логику и тесты.

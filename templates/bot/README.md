# {{PROJECT_NAME}} — Telegram-бот

Профессиональный костяк бота на **grammY** (TypeScript). Готов к наполнению.

## Запуск
Если проект собрал агент-стартер — токен уже в `.env`, просто:
```bash
npm start
```

Если запускаешь с нуля вручную:
```bash
npm install
cp .env.example .env      # macOS/Linux. Windows: Copy-Item .env.example .env
npm start                 # впиши TELEGRAM_BOT_TOKEN (от @BotFather) в .env
```

## Команды
- `npm start` — запустить бота
- `npm run dev` — запуск с авто-перезапуском
- `npm run typecheck` — проверка типов
- `npm run lint` — ESLint
- `npm run format` — Prettier (автоформат)
- `npm test` — тесты (Node test runner)

## Структура (куда что класть)
```
src/
  index.ts      — точка входа (команды и ответы бота)
  lib/          — переиспользуемые утилиты (env, helpers)
tests/          — тесты (пример: env.test.ts)
.env            — токен (НЕ коммитится)
AGENTS.md       — правила для AI
PROJECT-BRIEF.md — что строим (человеческим языком)
```

## Дальше
Опиши задачу в `PROJECT-BRIEF.md`, **открой новый чат в этой папке** и наполняй:
добавь кнопки, сценарии, базу данных, оплату и тесты.

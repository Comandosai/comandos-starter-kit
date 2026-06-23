# {{PROJECT_NAME}} — Telegram-бот

Минимальный бот на **grammY** (TypeScript).

## Запуск
```bash
npm install
cp .env.example .env      # впиши TELEGRAM_BOT_TOKEN (от @BotFather)
npm start
```

## Где что
- `src/index.ts` — логика бота (команды, ответы)
- `.env` — токен (не коммитится)
- `PROJECT-BRIEF.md` — что строим (человеческим языком)
- `AGENTS.md` — правила для AI

## Дальше
Опиши задачу в `PROJECT-BRIEF.md` и попроси AI доработать `src/index.ts`:
добавить кнопки, сценарии, базу данных, оплату и т.д.

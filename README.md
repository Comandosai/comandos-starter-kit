# COMANDOS Starter Kit

Универсальный AI-native стартер для резидентов COMANDOS AI. **Один промпт** —
и разворачивается рабочий проект любого типа, привязанный к твоей базе знаний,
с уже настроенным окружением (включая нужные MCP). Работает в **Claude Code,
OpenAI Codex, Google Antigravity**.

## Быстрый старт

Открой свою AI-среду и вставь:

```
Установи и запусти COMANDOS Starter Kit.
1) git clone https://github.com/Comandosai/comandos-starter-kit ~/.comandos-kit
   (если есть — cd ~/.comandos-kit && git pull)
2) Прочитай ~/.comandos-kit/bootstrap.md и выполни по шагам.
Общайся по-русски, просто. Я не программист — делай всё за меня.
```

Подробно — [`ИНСТРУКЦИЯ.md`](ИНСТРУКЦИЯ.md).

## Что внутри

| Файл | Назначение |
|---|---|
| `bootstrap.md` | Пошаговый сценарий для агента (рулбук) |
| `SKILL.md` | Оркестратор (карта потока) |
| `doctor/doctor.sh` | Проверка окружения, поиск базы знаний |
| `lib/mcp-install.md` | Установка MCP/CLI в каждой IDE |
| `recipes/*.json` | Карточки типов проектов (+ `_schema.md`) |
| `templates/*` | Код-шаблоны |
| `conventions/*` | Что класть в созданный проект |

## Принцип

**Convention, not catalog.** Рецепты — это дефолты для частых случаев ради скорости,
а не ограничение. Хочешь нестандартное — агент соберёт по правилам COMANDOS.

Поток: `DOCTOR → CONFIG+VAULT → ИНТЕРВЬЮ → РЕЦЕПТ → ФИНАЛИЗАЦИЯ`.

## Типы (дефолты)
Сайт (Astro) · Telegram-бот (grammY) · Цифровой сотрудник (Claude Agent SDK) ·
Micro-SaaS (Next.js+Supabase) · TG Mini App · Презентация/видео (навыки/MCP) · Research.

---
COMANDOS AI · мульти-платформенный пакет (Claude Code / Codex / Antigravity)

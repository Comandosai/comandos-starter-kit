# DEVLOG

## 2026-06-23 — v0.1.0 скелет
- Создан скелет kit по конвенции COMANDOS (как site-starter / package-for-distribution).
- Архитектура: Convention-not-catalog, поток DOCTOR→CONFIG+VAULT→ИНТЕРВЬЮ→РЕЦЕПТ→ФИНАЛ.
- Рецепты как карточки (template / repo / action:skill|mcp).
- doctor: окружение + поиск базы знаний + config.
- Шаблон agent сверен с Claude Agent SDK через context7 (@anthropic-ai/claude-agent-sdk, query()).
- Дорожная карта в vault: 01-Projects/28-comandos-universal-starter/README.md

# STATUS

**Версия:** 0.2.0 (после прогона роем агентов + фиксы)
**Дата:** 2026-06-23

## Готово
- bootstrap.md — полный сценарий: ветки A/B/C, существующий проект (путь+git-safety+карта),
  scaffold_cmd, action:skill|mcp с фолбэками, Windows-путь, без плейсхолдеров для резидента
- SKILL.md — оркестратор
- doctor: doctor.sh (фикс antigravity, хинты MISSING, prune) + doctor.ps1 (Windows)
- lib/mcp-install.md — MCP для 3 IDE с токенами и перезапуском, @BotFather, чистый Mac, реестр
- recipes/ — agent, bot, site, saas (create-next-app), miniapp, presentation (+fallback),
  video (полное имя MCP + async-пайплайн), research + _schema.md (палитра, scaffold_cmd, Открытый путь)
- templates/agent — Claude Agent SDK (.env через --env-file-if-exists, tsconfig, engines)
- templates/bot — grammY (рабочий, .env, tsconfig, engines)
- templates/research — структура знания
- conventions/ — AGENTS.md.tmpl, PROJECT-BRIEF.md.tmpl, vault-link.md
- адаптеры: CLAUDE.md, AGENTS.md, .agent/, .agents/

## Исправлено по итогам роя (17 critical, 20 major)
- несуществующие шаблоны bot/saas → bot построен, saas через create-next-app
- .env не грузился в шаблонах → --env-file-if-exists + engines>=22.7
- doctor: баг детекта antigravity, нет хинтов, ложное обещание про MCP → исправлено
- MCP-токены (supabase/kie-ai), Antigravity-путь, @BotFather → добавлено
- ветка «существующий проект» и финализация артефактов (A) → дописаны
- Windows: doctor.ps1 + путь $HOME в промпте

## Дальше
- Публикация на GitHub Comandosai (делается)
- Ссылка на модуль «Второй мозг» (пока: «спросить у куратора»)
- При спросе: templates/saas как полноценный репо вместо create-next-app

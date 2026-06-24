# STATUS

**Версия:** 0.4.0 (профессиональный костяк шаблонов)
**Дата:** 2026-06-23
Опубликован: https://github.com/Comandosai/comandos-starter-kit

## v0.4.0 — профессиональный костяк (как стартовал бы senior-разработчик)
Кит не проектирует фичи/агентов (их ещё не знаем), а готовит проверенную проф-базу:
- шаблоны agent/bot: ESLint + Prettier + `.editorconfig`, `@types/node`, полный набор
  скриптов (`typecheck`/`lint`/`format`/`test`), каркас тестов (Node test runner) с примером,
  растущая структура (`src/lib/`), утилита `env.ts` (fail-fast валидация ключей)
- bootstrap ШАГ 7: ПРОВЕРКА гоняет typecheck/lint/test по npm-скриптам
- bootstrap ШАГ 9: явно «костяк готов → открой новый чат в папке и наполняй»
- проверено живым прогоном: npm install + lint + typecheck + test(3 pass) + smoke

## v0.3.x — полнота генерируемого проекта + verification gate

## v0.3.0 — по итогам живого прогона (проект вышел неполным)
Проблема: kit генерировал скелет без `.env`, без правил для всех IDE, без `.gitignore`,
не собирал/не запускал проект, не создавал заметку в базе знаний, оставлял мусор плагинов.
Исправлено в самом ките:
- conventions расширены: `CLAUDE.md.tmpl`, `antigravity-rules.md.tmpl`, `gitignore.tmpl`,
  `env-setup.md`, `README.md` (полный набор файлов в КАЖДЫЙ проект)
- bootstrap: СБОРКА (полный набор + рабочий `.env`) → ПРОВЕРКА (git+npm+типы+smoke, gate
  «не говори готово без зелёного») → ПРИВЯЗКА к базе знаний (обязательно) + Definition of Done
- предупреждение про облачные папки (iCloud/Dropbox: git/npm не работают)
- `.gitignore` проекта исключает `.bkit/` `.planning/` `.claude/`

## v0.2.1 — verified вторым роем (7/7 сценариев работают)

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

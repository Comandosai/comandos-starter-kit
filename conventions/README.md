# conventions — что кладётся в КАЖДЫЙ создаваемый проект

Агент на ШАГЕ 6 (СБОРКА) обязан положить в новый проект полный набор:

| Файл проекта | Из шаблона | Зачем |
|---|---|---|
| `AGENTS.md` | `AGENTS.md.tmpl` | главные правила для AI (Codex + все) |
| `CLAUDE.md` | `CLAUDE.md.tmpl` | вход для Claude Code (импортирует AGENTS.md) |
| `.agent/rules/project.md` | `antigravity-rules.md.tmpl` | правила для Antigravity |
| `PROJECT-BRIEF.md` | `PROJECT-BRIEF.md.tmpl` | бизнес-контекст (по интервью) |
| `.gitignore` | `gitignore.tmpl` | секреты/мусор не в git (вкл. .bkit/.planning) |
| `.env` / `.env.local` | template-ветки: из `.env.example`. scaffold-ветки (Next.js): создаётся напрямую из `needs.env` (имя из `recipe.env_file`, обычно `.env.local`) | реальные ключи (НЕ коммитится) |
| `.env.example` | только template-ветки | список нужных ключей (у scaffold его нет) |

**Подставь все `{{ПЛЕЙСХОЛДЕРЫ}}`** значениями из интервью и config.
Все три IDE-файла (`AGENTS.md`, `CLAUDE.md`, `.agent/rules/`) обязательны —
проект должен одинаково работать в Claude Code, Codex и Antigravity.

Привязка к базе знаний — `vault-link.md`. Создание `.env` — `env-setup.md`.

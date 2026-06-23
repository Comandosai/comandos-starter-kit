# Smoke-запуск (для агента) — как безопасно проверить долгоживущий проект

Боты и серверы (bot, saas, miniapp) НЕ завершаются сами (long polling / dev-server).
Запускать их «в лоб» нельзя — `npm start` зависнет навсегда. И НЕ полагайся на команду
`timeout`: на голом macOS её НЕТ. Используй портативный приём: **фон → опрос лога → kill**.

## macOS / Linux
```bash
cd "<target>"
npm start > /tmp/smoke.log 2>&1 &   # или npm run dev — для Next.js
PID=$!
# ждём до ~20с появления строки готовности
for i in $(seq 1 20); do
  if grep -qiE "Бот запущен|ready|listening|localhost:3000" /tmp/smoke.log; then OK=1; break; fi
  sleep 1
done
kill "$PID" 2>/dev/null
[ "${OK:-0}" = 1 ] && echo "SMOKE OK" || { echo "SMOKE FAIL"; cat /tmp/smoke.log; }
```

## Windows (PowerShell)
```powershell
cd "<target>"
$p = Start-Process npm "start" -PassThru -RedirectStandardOutput smoke.log -NoNewWindow
$ok = $false
for ($i=0; $i -lt 20; $i++) {
  if (Select-String -Path smoke.log -Pattern "Бот запущен|ready|listening|localhost:3000" -Quiet) { $ok=$true; break }
  Start-Sleep 1
}
Stop-Process -Id $p.Id -Force
if ($ok) { "SMOKE OK" } else { "SMOKE FAIL"; Get-Content smoke.log }
```

## Что считать успехом
- Появилась строка готовности (`Бот запущен` / `ready` / `listening` / `localhost:PORT`) → **OK**, гасим процесс.
- Чистый выход с понятным сообщением об отсутствующем ключе (как у бота с пустым `.env`) → **OK** (код жив).
- Падение с синтаксической/импортной ошибкой → **FAIL**, чини.

> Боту smoke лучше прогонять с ПУСТЫМ токеном (чистый выход с сообщением), а не боевым —
> иначе будет 401-стектрейс от Telegram.

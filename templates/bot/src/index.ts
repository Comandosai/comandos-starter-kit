/**
 * {{PROJECT_NAME}} — Telegram-бот на grammY.
 * Токен берётся из .env (TELEGRAM_BOT_TOKEN), получают у @BotFather.
 * Запуск: npm install && npm start
 */
import { Bot } from "grammy";

const token = process.env.TELEGRAM_BOT_TOKEN;
if (!token) {
  console.error("Нет TELEGRAM_BOT_TOKEN. Получи токен у @BotFather и впиши в .env");
  process.exit(1);
}

const bot = new Bot(token);

// /start
bot.command("start", (ctx) =>
  ctx.reply("Привет! Я {{PROJECT_NAME}}. {{BOT_PURPOSE}}")
);

// /help
bot.command("help", (ctx) =>
  ctx.reply("Напиши мне сообщение — я отвечу. Команды: /start, /help")
);

// эхо на любой текст (замени на свою логику)
bot.on("message:text", (ctx) => ctx.reply(`Ты написал: ${ctx.message.text}`));

bot.catch((err) => console.error("Ошибка бота:", err));

console.log("Бот запущен. Останови — Ctrl+C");
bot.start();

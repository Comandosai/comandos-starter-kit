/**
 * Цифровой сотрудник — минимальный скелет на Claude Agent SDK.
 * Заполни SYSTEM_PROMPT и задачу под свою роль (см. PROJECT-BRIEF.md).
 * Запуск: npm start   (нужен ANTHROPIC_API_KEY в окружении / .env)
 */
import { query } from "@anthropic-ai/claude-agent-sdk";

// --- Роль сотрудника (заполняется при скаффолде из интервью) ---
const SYSTEM_PROMPT = `Ты — {{AGENT_NAME}}, цифровой сотрудник.
Твоя задача: {{AGENT_JOB}}
Работай аккуратно, отвечай по делу, на русском.`;

// --- Что поручаем (демо-задача; замени на реальный вход) ---
const TASK = process.argv.slice(2).join(" ") || "Представься и опиши, чем можешь помочь.";

async function main() {
  for await (const message of query({
    prompt: TASK,
    options: {
      systemPrompt: SYSTEM_PROMPT,
      // Инструменты сотрудника — раскомментируй нужные:
      // allowedTools: ["Read", "Write", "WebSearch"],
      maxTurns: 5,
    },
  })) {
    if (message.type === "assistant") {
      for (const block of message.message.content) {
        if (block.type === "text") process.stdout.write(block.text);
      }
    }
    if (message.type === "result" && message.subtype === "success") {
      process.stdout.write("\n");
    }
  }
}

main().catch((e) => {
  console.error("Ошибка:", e?.message ?? e);
  process.exit(1);
});

/**
 * Работа с переменными окружения — профессиональный паттерн «fail fast».
 * Ключи берутся из .env (через флаг --env-file-if-exists в скриптах).
 */

/** Вернуть переменную или undefined (мягко). */
export function optionalEnv(name: string): string | undefined {
  const v = process.env[name];
  return v && v.length > 0 ? v : undefined;
}

/** Вернуть переменную или бросить понятную ошибку (для обязательных ключей). */
export function requireEnv(name: string, hint = ""): string {
  const v = optionalEnv(name);
  if (!v) {
    throw new Error(`Не задан ${name} в .env.${hint ? " " + hint : ""}`);
  }
  return v;
}

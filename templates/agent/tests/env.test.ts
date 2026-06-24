/**
 * Пример теста (Node встроенный test runner). Запуск: npm test.
 * Замени/дополни реальными тестами своей логики по мере наполнения проекта.
 */
import { test } from "node:test";
import assert from "node:assert/strict";
import { optionalEnv, requireEnv } from "../src/lib/env.ts";

test("optionalEnv: возвращает undefined, если переменной нет", () => {
  delete process.env.__TEST_KEY__;
  assert.equal(optionalEnv("__TEST_KEY__"), undefined);
});

test("optionalEnv: возвращает значение, если переменная задана", () => {
  process.env.__TEST_KEY__ = "value";
  assert.equal(optionalEnv("__TEST_KEY__"), "value");
  delete process.env.__TEST_KEY__;
});

test("requireEnv: бросает понятную ошибку, если ключа нет", () => {
  delete process.env.__TEST_KEY__;
  assert.throws(() => requireEnv("__TEST_KEY__"), /Не задан __TEST_KEY__/);
});

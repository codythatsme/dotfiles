import { createInterface } from "readline/promises";

const rl = createInterface({
  input: process.stdin,
  output: process.stdout,
});

const key = await rl.question("Enter GEMINI_API_KEY: ");
rl.close();

if (!key.trim()) {
  console.error("No key provided.");
  process.exit(1);
}

await Bun.secrets.set("nano-banana", "GEMINI_API_KEY", key.trim());
console.log("Stored in Keychain.");

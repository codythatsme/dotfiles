import { $ } from "bun";

const [command, prompt, ...opts] = Bun.argv.slice(2);

if (!command || !prompt) {
  console.error("Usage: bun run nano-banana.ts <command> <prompt> [options]");
  console.error("Commands: generate, edit, upscale");
  process.exit(1);
}

const apiKey = await Bun.secrets.get("nano-banana", "GEMINI_API_KEY");
if (!apiKey) {
  console.error("API key not found. Run setup first: bun run setup.ts");
  process.exit(1);
}

const geminiCommand = `/${command} '${prompt}'`;
const optString = opts.length > 0 ? opts.join(" ") : "";

await $`gemini --yolo ${geminiCommand} ${optString}`.env({
  ...process.env,
  GEMINI_API_KEY: apiKey,
});

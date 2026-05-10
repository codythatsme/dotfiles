import { $ } from "bun";

const [command, prompt, ...opts] = Bun.argv.slice(2);

if (!command || !prompt) {
  console.error("Usage: bun run nano-banana.ts <command> <prompt> [options]");
  console.error("Commands: generate, edit, restore, icon, diagram, pattern, story, nanobanana");
  process.exit(1);
}

// Extract --model flag if present
const modelIndex = opts.findIndex(o => o.startsWith("--model"));
let modelName = "";
if (modelIndex !== -1) {
  const modelOpt = opts[modelIndex];
  if (modelOpt.includes("=")) {
    modelName = modelOpt.split("=")[1];
    opts.splice(modelIndex, 1);
  } else if (opts[modelIndex + 1]) {
    modelName = opts[modelIndex + 1];
    opts.splice(modelIndex, 2);
  }
}

const apiKey = await Bun.secrets.get("nano-banana", "GEMINI_API_KEY");
if (!apiKey) {
  console.error("API key not found. Run setup first: bun run setup.ts");
  process.exit(1);
}

const geminiCommand = `/${command} '${prompt}'`;
const optString = opts.length > 0 ? opts.join(" ") : "";
const modelArgs = modelName ? ["-m", modelName] : [];

await $`gemini ${modelArgs} --yolo ${geminiCommand} ${optString}`.env({
  ...process.env,
  GEMINI_API_KEY: apiKey,
});

---
name: nano-banana
description: Generate images using Gemini CLI with secure Keychain-based API key storage
allowed-tools: Bash(bun run */nano-banana.ts*)
---

# Nano-Banana Image Generation

Use this skill when the user requests image generation, editing, or upscaling.

## Setup (one-time)

```bash
bun run claude/skills/nano-banana/setup.ts
```

## Commands

| Command | Description | Example |
|---------|-------------|---------|
| `generate` | Create new image from prompt | `bun run nano-banana.ts generate "a sunset over mountains"` |
| `edit` | Modify existing image | `bun run nano-banana.ts edit "add clouds" --image input.png` |
| `upscale` | Increase image resolution | `bun run nano-banana.ts upscale "enhance details" --image input.png` |

## Prompt Tips

- Be specific about style: "watercolor painting", "photorealistic", "pixel art"
- Include lighting: "golden hour lighting", "dramatic shadows"
- Specify composition: "close-up portrait", "wide landscape shot"
- Add mood/atmosphere: "dreamy", "cyberpunk", "cozy"

## Output

Images are saved to `./nanobanana-output/` by default.

## Troubleshooting

If you get "API key not found", run the setup script first to store your Gemini API key in the macOS Keychain.

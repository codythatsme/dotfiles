---
name: nano-banana
description: Generate images using Gemini CLI with secure Keychain-based API key storage
allowed-tools: Bash(bun run */nano-banana.ts*)
---

# Nano-Banana Image Generation

Use this skill when the user requests image generation, editing, or visual content creation.

## Setup (one-time)

```bash
bun run claude/skills/nano-banana/setup.ts
```

## Commands

| Command | Description |
|---------|-------------|
| `generate` | Text-to-image |
| `edit` | Modify existing image |
| `restore` | Repair damaged photos |
| `icon` | UI elements/app icons |
| `diagram` | Flowcharts/architecture |
| `pattern` | Seamless textures |
| `story` | Sequential narrative images |
| `nanobanana` | Natural language interface |

## Options

| Flag | Description |
|------|-------------|
| `--count=N` | Generate 1-8 variations |
| `--preview` | Auto-open results |
| `--styles` | Artistic approaches |
| `--format` | Output arrangement |
| `--model` | Select model (see Models) |

## Dimensions

| Use Case | Dimensions |
|----------|------------|
| YouTube | 1280x720 |
| Blog headers | 1200x630 |
| Social squares | 1080x1080 |
| Vertical | 1080x1920 |

## Models

| Model | Notes |
|-------|-------|
| `gemini-2.5-flash-image` | Default, ~$0.04/image |
| `gemini-3-pro-image-preview` | Higher quality |

## Prompt Tips

- Be specific about style: "watercolor painting", "photorealistic", "pixel art"
- Include lighting: "golden hour lighting", "dramatic shadows"
- Specify composition: "close-up portrait", "wide landscape shot"
- Add mood/atmosphere: "dreamy", "cyberpunk", "cozy"

## Output

Images are saved to `./nanobanana-output/` by default.

## Troubleshooting

If you get "API key not found", run the setup script first to store your Gemini API key in the macOS Keychain.

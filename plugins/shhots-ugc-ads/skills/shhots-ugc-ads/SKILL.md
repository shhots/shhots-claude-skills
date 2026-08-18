---
name: shhots-ugc-ads
description: Write high-converting, claim-safe UGC ad scripts and visual treatments, then generate the finished video with the Shhots AI MCP server. Use this skill whenever the user wants a UGC ad, video ad, TikTok ad, Reel, creator-style ad, product video, ad script, ad hooks, or mentions Shhots, even if they only ask for "an ad for my product" without naming a format. Also use it when the user asks to improve, rewrite, or localize an existing ad script.
---

# Shhots UGC Ads

Turn a product and an audience into a finished UGC video ad: hooks, script, visual treatment, and generation through the Shhots AI MCP server.

**Input:** a product (photo, public image URL, or the active Shhots product), a target audience, and a list of allowed claims.
**Output:** 3 hook options, one structured script, one visual treatment formatted for `shhots_create_product_video`, and (with the MCP connected) the generated video.

## Workflow

### Step 1: Collect inputs in one consolidated question

Never ask piecemeal. Check the conversation for what is already known, then ask for the rest in a single message:

1. **Product**: photo attached, a public image URL, or reuse the active Shhots product.
2. **Audience**: who the ad targets, as specifically as the user can give.
3. **Allowed claims**: the facts the ad may state. Explain briefly why: Shhots refuses invented benefits, certifications, ingredients, pricing, and performance claims, so the script can only use facts visible on the product or supplied by the user.
4. **Platform**: determines the aspect ratio default (see table below).
5. **Language**: Shhots generates UGC ads in 12 languages. Default to English unless told otherwise.
6. **Duration**: 5, 10, or 15 seconds. Default 15 for a full hook-to-CTA arc.

If the user says "choose for me": UGC format, 15 seconds, 9:16, English.

| Platform | Ratio |
|---|---|
| TikTok, Reels, Stories, Shorts | 9:16 |
| Facebook/Instagram feed | 1:1 |
| YouTube pre-roll, landing pages | 16:9 |

### Step 2: Write 3 hooks

Read `references/hook-frameworks.md` and pick the 3 frameworks that best fit the product and audience. Write one hook per framework, label each with its framework name, and keep every hook speakable in under 2 seconds. Present them and let the user pick, or pick the strongest yourself if they asked you to choose.

### Step 3: Write the script

Structure for a 15-second ad (compress proportionally for 10s and 5s):

- **0-2s Hook**: the chosen hook, spoken to camera.
- **2-7s Problem or context**: the situation the audience recognizes.
- **7-12s Product moment**: the product appears, in use, with the strongest allowed claim.
- **12-15s CTA**: one clear action.

Pacing guidance: natural spoken delivery runs roughly 2.5 words per second, so a 15-second script is about 35-40 words, a 10-second script about 25, a 5-second script about 12. Write for the ear: short sentences, contractions, no marketing adjectives a real person would never say.

### Step 4: Claim-safety pre-flight

Before generating, check every line of the script against the allowed claims list:

- [ ] No benefit, ingredient, certification, price, or performance claim outside the allowed list
- [ ] No superlatives presented as fact ("the best", "clinically proven") unless supplied by the user
- [ ] No implied medical, health, or financial outcomes
- [ ] CTA does not promise anything the user did not state

If a line fails, rewrite it using only allowed facts. Tell the user what you removed and why.

### Step 5: Write the treatment

The treatment is the `treatment` parameter of `shhots_create_product_video`. Read `references/treatment-templates.md` and use the template for the chosen format. A complete treatment always covers, in order: setting, camera, lighting, actions, pacing, product moments, and CTA presentation. Use only visible or user-provided product facts.

### Step 6: Generate (MCP connected) or hand off (not connected)

**MCP connected:** show the user the final script and treatment for approval, then call `shhots_create_product_video` with the approved script, treatment, videoType, durationSeconds, and aspectRatio. The tool displays a credit quote before generation; a video costs 551 to 852 credits depending on format and length. Most generations finish in under two minutes; product videos can take 1 to 3 minutes. Poll with `shhots_get_generation` if needed.

**MCP not connected:** deliver the script and treatment as a formatted brief the user can paste into the Shhots web app at app.shhots.ai. Mention that the MCP server (included on Shhots Pro and Scale plans, setup at shhots.ai/mcp) generates directly from chat.

## Output format for the brief

ALWAYS use this exact template when delivering without generating:

```
# UGC Ad Brief: [product name]
**Format:** [videoType] · [duration]s · [ratio] · [language]

## Hook options
1. [framework]: "[hook]"
2. [framework]: "[hook]"
3. [framework]: "[hook]"

## Script (option [N])
[script with second markers]

## Treatment
[treatment]

## Claims used
[each claim and its source: "visible on product" or "user-supplied"]
```

## Beyond UGC

The same workflow drives all 7 Shhots video formats: ugc, cinematic, animated, product_speaking, storefront, lifestyle, and unboxing_asmr. For non-UGC formats, the script becomes voiceover or on-screen text rather than creator speech; the treatment templates reference covers the differences.

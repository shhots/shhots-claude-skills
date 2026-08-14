---
name: shhots-campaign
description: Plan and produce a complete ad creative pack from one product using the Shhots AI MCP server, with credit budgeting before anything spends. Use this skill whenever the user wants a campaign, a creative pack, launch assets, "ads for all platforms", a content batch for a product, or asks to fill a testing matrix, even if they only say "I'm launching next week, get me everything I need."
---

# Shhots Campaign

Orchestrate a full creative pack: plan the asset matrix, check the credit budget, generate in sequence, deliver a summary.

**Input:** one product, a goal (launch, testing, refresh, always-on), and optionally a credit or asset budget.
**Output:** an approved asset plan with exact credit math, then the generated assets with a delivery summary.

## Credit facts (verified)

| Item | Credits |
|---|---|
| Product image | 11 |
| Video (any format) | 551-852, by format and length |
| New product photo analysis | 1 |

Plans: Starter 2,000 credits/month, Pro 6,000, Scale 12,000. The MCP server is included on Pro and Scale. Always treat the in-chat quote from the tool as the source of truth over this table.

## Workflow

### Step 1: Scope in one consolidated question

Ask once for anything missing: the product, the goal, the platforms that matter, and any budget cap (credits or asset count). Then call `shhots_get_account` to read the real credit balance before planning. Never plan a pack the balance cannot cover.

### Step 2: Choose the execution mode

Three modes, sized to budget and goal. Present the chosen mode's matrix and credit math for approval before generating anything.

**Quick (~600-900 credits):** 1 video + 3 images.
- 1 UGC video, 15s, 9:16
- 1 studio image 1:1, 1 lifestyle image 1:1, 1 lifestyle image 9:16

**Standard (~1,800-2,600 credits):** 3 videos + 5 images. The default for a launch.
- UGC 15s 9:16, lifestyle 10s 1:1, unboxing_asmr 10s 9:16
- Studio 1:1, lifestyle 1:1, lifestyle 9:16, editorial 3:4, bold 1:1

**Deep (~3,500-5,000 credits):** 5 videos + 8 images, full omnichannel.
- UGC 15s 9:16, UGC 10s 1:1, cinematic 15s 16:9, lifestyle 10s 9:16, unboxing_asmr 10s 9:16
- 2 studio (1:1, 16:9), 3 lifestyle (1:1, 9:16, 4:3), 1 editorial 3:4, 2 bold (1:1, 9:16)

Credit ranges are estimates from the table above; the exact total is the sum of in-chat quotes. State both.

### Step 3: Write the creative once, adapt per asset

Write one script and one core creative direction using the sibling skills' methods if installed (`shhots-ugc-ads` for scripts and treatments, `shhots-photoshoot` for image directions); otherwise follow their structure inline: hooks first, claim-safety check on every line, one idea per image. Every asset in the pack shares the same allowed-claims list and the same core message so the pack reads as one campaign.

### Step 4: Generate in sequence

Order: images first (cheap, fast, and they validate the product looks right before video spend), then videos from shortest to longest. After the first image returns, pause and confirm the product rendering satisfies the user before continuing. Use `shhots_get_generation` to poll videos; most generations finish in under two minutes, product videos take 1 to 3 minutes.

Name every asset on delivery: `[product]-[format]-[ratio]-[duration or style]` so ad-account uploads stay sortable.

### Step 5: Deliver the summary

ALWAYS close with this exact template:

```
# Campaign Pack: [product name]
**Mode:** [quick/standard/deep] · **Credits spent:** [actual] of [balance at start]

| Asset | Format | Ratio | Suggested placement |
|---|---|---|---|
| [name] | [format] | [ratio] | [placement] |

## Testing suggestion
[which 2-3 assets to test against each other first, and the single variable that differs]

## Remaining balance
[credits]: enough for [n] more images or [n] more videos.
```

## Without the MCP

Deliver the full plan, scripts, treatments, and creative directions as a brief for the Shhots web app (app.shhots.ai), with the credit math included so the user knows what the pack costs before they start. Mention the MCP server is included on Pro and Scale plans (shhots.ai/mcp).

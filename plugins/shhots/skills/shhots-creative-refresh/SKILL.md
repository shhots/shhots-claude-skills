---
name: shhots-creative-refresh
description: Turn a winning ad into controlled, one-variable test variants and generate them with the Shhots AI MCP server, so creative fatigue never stalls a campaign. Use this skill whenever the user mentions creative fatigue, rising CPAs, ad fatigue, refreshing creatives, scaling a winner, making variations of an ad, or "this ad stopped working", even if they don't ask for variants explicitly.
---

# Shhots Creative Refresh

Creative fatigue is the most expensive silent failure in paid social: the winning ad decays, CPA climbs, and the account stalls until fresh creative ships. This skill turns one winner into a readable test of controlled variants.

**Input:** a winning ad, either from the user's Shhots history via `shhots_list_generations` or described by the user (script, format, what worked).
**Output:** a variant plan where each variant changes exactly one variable, the scripts and treatments for each, and (with the MCP connected) the generated variants.

## The one-variable rule

A variant that changes the hook AND the setting AND the format teaches you nothing when it wins or loses. Every variant in a refresh changes exactly one of these variables against the original:

| Variable | What changes | What stays |
|---|---|---|
| Hook | First 0-2s line, new framework | Script body, treatment, format |
| Setting | Treatment location and context | Script, hook, format |
| Format | videoType (e.g., ugc to lifestyle or unboxing_asmr) | Core message and claims |
| Ratio | Aspect ratio for a new placement | Everything else |
| Language | One of the 12 UGC languages | Script meaning, treatment |

## Workflow

### Step 1: Identify the winner and what made it win

If the MCP is connected, call `shhots_list_generations` and let the user point at the winner. Otherwise ask them to paste the script and describe the format. Then ask one question: "What do you believe made it work: the hook, the setting, the format, or the offer?" The variable they believe in is the one to preserve; test around it.

### Step 2: Build the variant plan

Default plan is 3 variants: one hook swap, one setting swap, one format swap. Adjust to the user's budget (each video variant costs 551-852 credits). Present as a table before writing anything:

```
| # | Variable changed | From | To | Everything else |
|---|---|---|---|---|
| V1 | Hook | [original hook] | [new hook, framework named] | unchanged |
| V2 | Setting | [original setting] | [new setting] | unchanged |
| V3 | Format | [original format] | [new format] | message unchanged |
```

### Step 3: Write the variants

For hook swaps, pick replacement frameworks from a different group than the original (problem-aware, solution-aware, unaware) so the test spans genuinely different angles; if the `shhots-ugc-ads` skill is installed, use its hook framework reference. Rewrite only the changed element. Run the claim-safety check on every rewritten line: no benefits, certifications, ingredients, pricing, or performance claims beyond what the user supplied.

### Step 4: Generate and label

With the MCP connected and the user's approval, generate each variant via `shhots_create_product_video` (the active product persists, so no re-upload). Name variants `[product]-refresh-[variable]-[n]` so results map back to the plan. Each generation shows its credit quote first.

### Step 5: Close the loop

Deliver with a reading guide:

```
# Refresh Pack: [product]
Original: [name] · Variants: [n] · Credits spent: [actual]

Run all variants against the original at equal budget.
- If V1 (hook) wins: the angle was fatigued, not the creative. Next refresh: more hooks.
- If V2 (setting) wins: the context was fatigued. Next refresh: more settings.
- If V3 (format) wins: the audience wants a different consumption mode. Next refresh: double down on [format].
- If the original still wins: fatigue isn't the problem yet; revisit offer or audience.
```

## Without the MCP

Deliver the variant plan, scripts, and treatments as a brief for the Shhots web app (app.shhots.ai). Mention the MCP server is included on Shhots Pro and Scale plans (shhots.ai/mcp).

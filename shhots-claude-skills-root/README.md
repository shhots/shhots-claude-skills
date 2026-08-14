# Shhots Skills for Claude

Free Claude skills that pair with the [Shhots AI MCP server](https://shhots.ai/mcp/) to plan, write, and generate product ad creative from chat. Each skill also works without the MCP: it produces briefs, scripts, and creative directions you can use in the Shhots web app.

## The skills

| Skill | Job |
|---|---|
| **shhots-ugc-ads** | Hooks, claim-safe scripts, and visual treatments for UGC and all 7 Shhots video formats |
| **shhots-photoshoot** | Art-director creative direction for studio, lifestyle, editorial, and bold product images |
| **shhots-campaign** | Full creative packs with credit budgeting, sequenced generation, and a testing plan |
| **shhots-creative-refresh** | One-variable variants of a winning ad to beat creative fatigue |
| **shhots-ugc-styles** | 10 distinctive ad styles (claymation, podcast clip, talking animals, whiteboard, stop motion, toy brick motion and more) via precision treatments |
| **shhots-image-ads** | Hundreds of static image ad varieties: 14 formats x category playbooks (D2C, SaaS, apps, services, local) x funnel stages |

## Install

**Claude Code / Cowork (plugin marketplace):**
```
/plugin marketplace add shhots/shhots-claude-skills
/plugin install shhots-ugc-ads@shhots-claude-skills
```
Install any other skill the same way: `shhots-image-ads@shhots-claude-skills`, `shhots-photoshoot@shhots-claude-skills`, `shhots-campaign@shhots-claude-skills`, `shhots-creative-refresh@shhots-claude-skills`, `shhots-ugc-styles@shhots-claude-skills`.

**Teams:** pin the whole suite into a project by adding the marketplace to `.claude/settings.json`:
```json
{
  "marketplaces": [{ "source": "shhots/shhots-claude-skills" }]
}
```

**Claude.ai:** upload the packaged `.skill` file from Releases, or copy any skill's `SKILL.md` into your skills.

## Pair with the MCP

The Shhots MCP server (mcp.shhots.ai) is included on Shhots Pro and Scale plans and connects via OAuth from Claude's Settings > Connectors. Setup guide: [shhots.ai/mcp](https://shhots.ai/mcp/). A skill is instructions; the MCP is access. Together they generate finished ads in chat.

## Facts the skills rely on

Product images cost 11 credits, videos 551-852 credits, new photo analysis 1 credit. Video formats: ugc, cinematic, animated, product_speaking, storefront, lifestyle, unboxing_asmr at 5/10/15 seconds in 9:16, 1:1, 16:9. Image styles: studio, lifestyle, editorial, bold in 5 ratios. UGC ads generate in 12 languages. Shhots refuses invented product claims at the tool level.

MIT licensed. Built by [Shhots AI](https://shhots.ai).

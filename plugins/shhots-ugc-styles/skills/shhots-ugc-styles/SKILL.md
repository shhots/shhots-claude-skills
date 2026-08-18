---
name: shhots-ugc-styles
description: Generate distinctive AI ad styles with the Shhots AI MCP server, including claymation, animated, podcast-clip, viral hook stack, talking kids, talking animals, whiteboard explainer, stop motion, animated human body for supplement education, and toy brick motion. Use this skill whenever the user wants an ad in a specific creative style, a "different kind of ad", something scroll-stopping or unusual, a claymation or stop motion or LEGO-style or podcast-style ad, an explainer, or asks "what other ad styles can we try", even if they don't name a style.
---

# Shhots UGC Styles

Ten distinctive ad styles, each produced through the Shhots AI MCP server. None of these is a native Shhots videoType; the aesthetic lives in the `treatment` and `script` you write. This skill maps every style to the right videoType and gives you the treatment recipe that reliably produces the look.

**Input:** a product (photo, public URL, or active Shhots product), an allowed-claims list, and a chosen style (or "surprise me").
**Output:** a style-matched script and treatment for `shhots_create_product_video`, and (MCP connected) the generated ad.

## The style map

| # | Style | videoType | Best for |
|---|---|---|---|
| 1 | Claymation | animated | Playful brands, food, kids-adjacent products |
| 2 | Animated (motion design) | animated | Apps, features, abstract benefits |
| 3 | Podcast clip | ugc | Considered purchases, founder-led brands |
| 4 | Viral hook stack | ugc | Cold audiences, testing angles fast |
| 5 | Talking kids | ugc | Family products; see guardrails |
| 6 | Talking animals | animated | Pet brands, humor-led hooks |
| 7 | Whiteboard explainer | animated | How-it-works, B2B, complex products |
| 8 | Stop motion | animated | Craft brands, unboxing-adjacent, texture-rich products |
| 9 | Animated human body | animated | Supplements and wellness; see guardrails |
| 10 | Toy brick motion | animated | Playful demos, assembly products, kid-adjacent brands |

## Workflow

### Step 1: Choose the style

If the user named a style, use it. If they asked for "something different", recommend 2-3 styles from the table based on their product category and audience, with a one-line reason each. If they say "surprise me", pick the one style whose Best-for column matches their product most directly.

### Step 2: Read the recipe

Read `references/style-recipes.md` and load only the section for the chosen style. Each recipe contains: the aesthetic described in renderable terms, the treatment template, script notes, and watch-outs.

### Step 3: Collect the standard inputs

Same consolidated single question as any Shhots ad: product, audience, allowed claims, platform (sets ratio: 9:16 vertical social, 1:1 feed, 16:9 landscape), duration (5/10/15s, default 15).

### Step 4: Write script and treatment from the recipe

Follow the recipe's template exactly for structure, then adapt the bracketed slots. Two rules hold across all ten styles:

- **The product stays real.** Whatever the style does to the world around it, the product itself must be described as accurately rendered: correct label, shape, and colors. Stylized environment, faithful product.
- **Claims stay in the allowed list.** Run the claim-safety check on every script line: no benefits, certifications, ingredients, pricing, or performance claims beyond what the user supplied. Shhots enforces this at the tool level; catching it earlier saves credits.

### Step 5: Generate or hand off

**MCP connected:** show script and treatment for approval, then call `shhots_create_product_video` with the mapped videoType, duration, and ratio. The credit quote (551-852 credits per video) appears before generation. Stylized treatments are more variable than standard formats: if the first render misses the aesthetic, refine the treatment's texture and motion vocabulary rather than regenerating identically.

**MCP not connected:** deliver script and treatment as a brief for the Shhots web app (app.shhots.ai) and mention the MCP server is included on Pro and Scale plans (shhots.ai/mcp).

## Guardrails built into this skill

- **Talking kids:** never for age-restricted products, supplements, medicines, or health products. Before writing, remind the user that ad platforms have specific policies on depicting minors in ads and AI-generated content disclosure, and that they are responsible for checking their platform's current rules. Keep scripts wholesome and product-factual.
- **Animated human body:** mechanism visuals may only depict what the user's approved claims state. No cure, treatment, or disease-prevention language unless the user explicitly supplies it as approved. Suggest the user confirm regulatory requirements for supplement advertising in their market; do not provide legal advice.
- **Toy brick motion:** generic construction bricks only. Never reference or depict LEGO branding, logos, minifigure likenesses, or trade dress; LEGO is a trademark and using it invites takedowns of the user's ads.
- **Podcast clip:** the style mimics podcast footage; it is not a real endorsement. Keep the speaker clearly a brand presenter, never a named real person, and remind the user that some platforms require AI-content disclosure.

---
name: shhots-photoshoot
description: Produce art-director-grade creative direction for AI product photography and generate the images with the Shhots AI MCP server. Use this skill whenever the user wants product photos, a product photoshoot, studio shots, lifestyle images, ad images, hero images, PDP images, social images, or mentions Shhots image generation, even if they just say "make my product look good" or "I need photos for my store."
---

# Shhots Photoshoot

Turn one product photo into a set of studio-quality images by writing precise creative direction for `shhots_create_product_image`.

**Input:** a product (photo, public image URL, or the active Shhots product), its category, and where the images will be used.
**Output:** ready-to-run creative directions for each requested style, and (with the MCP connected) the generated images.

## Workflow

### Step 1: Collect inputs in one consolidated question

Check the conversation first, then ask once for what is missing:

1. **Product**: photo, public URL, or reuse the active Shhots product.
2. **Category**: skincare/beauty, food & beverage, pet, apparel/accessories, home & living, electronics, or other.
3. **Placement**: where the images go, which sets the ratio:

| Placement | Ratio |
|---|---|
| PDP / marketplace listing | 1:1 |
| Instagram feed | 1:1 or 4:3 |
| Stories / Reels covers | 9:16 |
| Website hero / banners | 16:9 |
| Print-leaning / editorial crops | 3:4 |

4. **Styles**: studio, lifestyle, editorial, bold, or all four. Default: studio for PDP work, lifestyle for social, all four when the user wants variety.

If the user says "choose for me": studio, 1:1.

### Step 2: Write the creative direction

The `creativeDirection` parameter must specify, in one paragraph: scene, composition, background, lighting, mood, and product placement. Vague direction produces generic images; specificity is the whole job.

Read `references/style-recipes.md` for the recipe bank organized by style and category. Build each direction from the matching recipe, adapting the bracketed slots to the actual product. Never include text overlays, claims, or brand slogans in the direction; never describe the product as something it is not.

Rules that hold across every style:

- One idea per image. A direction that hedges between two scenes renders as neither.
- Name the light: direction, quality (hard/soft), and what it should catch on the product.
- Name the surface and background material, not just a color.
- State where the product sits in frame and how much of the frame it occupies.
- Mood words at the end, maximum three.

### Step 3: Generate or hand off

**MCP connected:** show the user the directions for approval, then call `shhots_create_product_image` once per image with imageStyle, aspectRatio, and the direction. Each image costs 11 credits and the quote appears before generation. Most images finish in under two minutes. For refinements, use `shhots_edit_image` on the result ("warmer light", "remove the second bottle") rather than regenerating from scratch; it preserves everything not explicitly changed.

**MCP not connected:** deliver the directions in the brief format below for use in the Shhots web app (app.shhots.ai). Mention the MCP server is included on Shhots Pro and Scale plans (setup at shhots.ai/mcp).

## Output format for the brief

```
# Photoshoot Brief: [product name]
**Placement:** [placement] · **Ratio:** [ratio]

## [Style 1: name]
[creative direction paragraph]

## [Style 2: name]
[creative direction paragraph]

...
```

## Batch pattern

For a full PDP set, generate in this order: 1 studio hero (1:1), 2 lifestyle contexts (1:1), 1 editorial (3:4), 1 bold (1:1). Five images = 55 credits. Present the set with a one-line rationale per image so the user knows which slot each fills.

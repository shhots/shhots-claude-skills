---
name: shhots-image-ads
description: Generate hundreds of varieties of static image ads for any business type (D2C, SaaS, apps, services, local) using the Shhots AI MCP server, with 14 proven ad formats mapped to funnel stages. Use this skill whenever the user wants image ads, static ads, banner ads, Meta or Instagram or LinkedIn or Google display creatives, ad variations at volume, a creative testing matrix, or says things like "I need ads for my store/app/agency" or "give me lots of ad options", even if they don't say "static" or "image".
---

# Shhots Image Ads

Static image ads drive the majority of paid social conversions and are the cheapest way to validate an angle before spending on video. This skill turns one product into a matrix of static ads: 14 proven formats, adapted per business category, generated through `shhots_create_product_image`.

**Input:** a product or offer (photo, screenshot, public URL, or active Shhots product), the business category, the funnel stage, and the allowed-claims list.
**Output:** a format plan, then creativeDirection strings per ad, and (MCP connected) the generated images at 11 credits each.

## Where the hundreds come from

14 formats × category adaptation × 4 Shhots image styles (studio, lifestyle, editorial, bold) × 5 ratios (1:1, 4:3, 3:4, 9:16, 16:9). Not every combination is valid; the references filter to what works. A single product routinely supports 100+ distinct, non-redundant ads.

## Workflow

### Step 1: Scope in one consolidated question

Collect what is missing: the product/offer and its image source, the business category (D2C physical, SaaS, mobile app, service business, local business), the funnel stage (cold, warm, retargeting), platforms, and the allowed claims. For SaaS and apps, the "product image" is a UI screenshot or app screen; note that Shhots is optimized for physical products, so run one test image first and adjust from the result.

### Step 2: Map funnel stage to formats

| Stage | Reach for | Avoid |
|---|---|---|
| Cold | Problem-solution, before/after, advertorial, listicle, metric-first (SaaS) | Offer stacks, logo walls |
| Warm | Testimonial, comparison, founder POV, feature callout, social proof wall | Pure brand statics |
| Retargeting | Benefit stack, offer stack, urgency framing on any format | Introducing the product again |

Read `references/format-library.md` for the 14 format templates and `references/category-playbooks.md` for how each business category adapts them, including the SaaS-specific rules (claim must match the UI shown; product proof beats lifestyle).

### Step 3: Build the plan

Propose a numbered plan before generating: which formats, in which styles and ratios, with the credit total (11 credits per image; confirm balance with `shhots_get_account` for larger batches). Default batch sizes: test batch 6 ads (3 formats × 2 ratios), full matrix 20-30 ads. Present as a table and get approval.

### Step 4: Write the creativeDirection per ad

Each direction must specify: layout (where headline, product, proof, and CTA sit), scene and background, lighting, mood, and the exact overlay text. Text rules:

- Headline 8 words or fewer; one message per ad.
- Every text element comes from the allowed claims or the user's own words. Never write a fabricated statistic, review, rating, or award.
- Spell out overlay text verbatim in the direction, in quotes, so the render matches the plan.

### Step 5: Generate, review one, then batch

Generate the first image alone, confirm the product (or screenshot) rendered accurately and the text is clean, then run the rest. Fix near-misses with `shhots_edit_image` ("change the headline to X", "more contrast on the CTA") instead of regenerating. Name assets `[product]-[format]-[ratio]-[n]`.

### Step 6: Deliver with a testing order

Close with the matrix table (asset, format, stage, placement) and a testing instruction drawn from the research this skill encodes: test format against format first at equal budget, then test headlines within the winning format, then visual treatment. State it explicitly so the user does not burn the test on copy variations inside one template.

## Guardrails

- **No fabricated proof.** Testimonial and review formats require the user's real quotes with permission; ratings, badge counts, and "as seen in" claims only if user-supplied. Never render third-party trust marks (G2, Trustpilot, star badges, press logos); if the user holds them, recommend adding the official badge assets in post so the mark is genuine.
- **Before/after** depicts only transformations the user's allowed claims support; no implied health, weight, or medical outcomes beyond supplied claims.
- **Comparison ads** name no competitor unless the user supplies the comparison and accepts responsibility for its accuracy; the safer default is "us vs the old way".
- **Advertorial style** must still read as an ad; do not imitate a specific publication's masthead or trade dress.

## Without the MCP

Deliver the full plan and every creativeDirection as a brief for the Shhots web app (app.shhots.ai), credit math included. The MCP server is included on Shhots Pro and Scale plans (shhots.ai/mcp).

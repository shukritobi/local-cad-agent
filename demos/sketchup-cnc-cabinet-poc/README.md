# SketchUp CNC Cabinet Automation Proof of Concept

This folder is a small public proof of capability for a SketchUp Ruby + CNC cabinet automation workflow.

The goal is to show the important manufacturing logic clearly, not to pretend this is a finished production system.

## What this demo proves

- Generate cabinet panels from structured data.
- Keep panels as grouped SketchUp objects with part metadata.
- Use absolute dimensions and deterministic geometry instead of Dynamic Component formulas.
- Represent drilling as flat 2D circles on panel faces.
- Separate drill vectors by depth tag, for example `DRILL_5MM` and `DRILL_10MM`.
- Add edge-banding scribe marks as dedicated 2D vectors.
- Add grain direction markers for later nesting and rotation control.
- Keep the architecture ready for an external Excel/CSV parser and hardware rule table.

## Why this matters for Aspire/CNC

Vectric Aspire and similar CAM workflows depend heavily on clear vector geometry and layer/tag separation. For cabinet manufacturing, the SketchUp model should not only look like a cabinet. It should communicate manufacturing intent clearly:

- Which vectors are drilling operations.
- Which drill vectors have the same depth.
- Which vectors are edge-banding marks.
- Which parts have grain direction constraints.
- Which grouped objects represent physical cabinet parts.

This proof of concept keeps those concepts separated so the output can be validated before building a bigger automation system.

## Demo files

```text
demos/sketchup-cnc-cabinet-poc/
  README.md
  sample_cutlist.csv
  sample_job.json
  plugin/
    shukry_cnc_cabinet_poc.rb
```

## How to test in SketchUp

1. Copy `plugin/shukry_cnc_cabinet_poc.rb` into your SketchUp `Plugins` folder.
2. Restart SketchUp.
3. Open SketchUp.
4. Go to `Extensions > CNC Cabinet POC > Build Sample Cabinet`.
5. The demo will create a small cabinet assembly with tags for panels, drill vectors, edge-banding, and grain direction.

## Expected SketchUp output

The demo creates:

- Panel groups for side panels, top, bottom, back, and shelf.
- Flat 2D drilling circles on the panel faces.
- Drill tags by operation depth.
- Edge-banding scribe marks.
- Grain direction arrows and labels.
- Attribute metadata on each panel group.

## MVP direction for a real project

A production MVP would extend this into three layers:

1. **Desktop parser UI**  
   Reads Excel/CSV, validates cabinet data, maps hardware rules, and exports a clean JSON job file.

2. **SketchUp Ruby geometry engine**  
   Reads the JSON job file and generates deterministic cabinet geometry and CNC-safe 2D operation vectors.

3. **Manufacturing QA/export layer**  
   Checks tags, missing drilling rules, grain markers, panel dimensions, and Aspire import/export assumptions.

## Current status

Public proof of concept. Built to demonstrate understanding of the problem domain and the proposed architecture for a fixed-price MVP.

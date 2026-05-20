# SketchUp CNC Cabinet Automation

This folder contains a focused SketchUp Ruby workflow for cutlist-driven cabinet modeling and CNC-ready vector organization.

The workflow turns structured cabinet data into predictable SketchUp geometry, with clear separation between physical cabinet parts, drilling circles, edge-banding marks, and grain-direction information.

## Current workflow

- Generate cabinet panels from structured data.
- Keep panels as grouped SketchUp objects with part metadata.
- Use absolute dimensions and deterministic geometry instead of Dynamic Component formulas.
- Represent drilling as flat 2D circles on panel faces.
- Separate drilling vectors by depth tag, for example `CNC_DRILL_5MM` and `CNC_DRILL_10MM`.
- Add edge-banding scribe marks as dedicated 2D vectors.
- Add grain direction markers for nesting and rotation control.
- Keep the architecture ready for an external Excel/CSV parser and hardware rule table.

## Aspire/CNC workflow notes

Vectric Aspire and similar CAM workflows depend on clear vector geometry and layer/tag separation. For cabinet manufacturing, the SketchUp model should communicate manufacturing intent clearly:

- Which vectors are drilling locations.
- Which drilling vectors share the same depth.
- Which vectors are edge-banding marks.
- Which parts have grain direction constraints.
- Which grouped objects represent physical cabinet parts.

Keeping these items separated makes the generated model easier to inspect, export, and validate before CAM setup.

## Files

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
5. SketchUp will create a small cabinet assembly with tags for panels, drilling vectors, edge-banding, and grain direction.

## Expected SketchUp output

The current script creates:

- Panel groups for side panels, top, bottom, back, and shelf.
- Flat 2D drilling circles on the panel faces.
- Drill tags by operation depth.
- Edge-banding scribe marks.
- Grain direction arrows and labels.
- Attribute metadata on each panel group.

## Development direction

1. **Desktop parser UI**  
   Reads Excel/CSV, validates cabinet data, maps hardware rules, and exports a clean JSON job file.

2. **SketchUp Ruby geometry engine**  
   Reads the JSON job file and generates deterministic cabinet geometry and CNC-safe 2D operation vectors.

3. **Manufacturing QA/export layer**  
   Checks tags, missing drilling rules, grain markers, panel dimensions, and Aspire import/export assumptions.

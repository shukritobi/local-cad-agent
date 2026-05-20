# Local CAD Agent

Local-first CAD automation agent for turning site inputs, sketches, plan images, DXF/DWG exports, layout rules, and user feedback into structured 2D drawings, 3D model instructions, and render-ready project outputs.

This repository is for a standalone local product. It is not tied to PCAgent.

## Active development areas

### SketchUp Cabinet Automation

A focused SketchUp Ruby workflow is being developed for cutlist-driven cabinet modeling and production-ready vector organization:

[`demos/sketchup-cnc-cabinet-poc`](./demos/sketchup-cnc-cabinet-poc)

Current focus:

- Deterministic cabinet panel generation in SketchUp Ruby.
- Cabinet parts created as grouped objects with metadata.
- Flat 2D panel operation circles instead of modeled voids.
- Tags separated by operation depth, for example `CNC_DRILL_5MM` and `CNC_DRILL_10MM`.
- Edge-banding scribe marks as dedicated 2D vectors.
- Grain-direction markers for nesting and rotation control.
- Sample CSV and JSON structures for future Excel/CSV parser integration.

This workflow is part of the broader CAD automation direction: clean source data, controlled geometry, structured tags, and predictable handoff into downstream modeling or production tools.

## Goal

Build a Windows-friendly CAD automation stack that can:

- Read and normalize project inputs such as images, PDFs, DXF exports, CAD layers, manual dimensions, and site notes.
- Detect walls, rooms, openings, furniture zones, circulation paths, and weird wall orientations.
- Produce structured geometry that can later be exported to CAD, SketchUp, Blender, or renderer pipelines.
- Use feedback loops to revise layouts, drawings, and 3D output.
- Keep the workflow local-first, auditable, and easy to run.

## Product direction

The system is split into layers instead of one giant agent:

1. **Input ingestion**  
   Collect images, PDFs, DXF, DWG-derived exports, manual dimensions, site photos, and design briefs.

2. **Geometry understanding**  
   Convert messy plan data into clean primitives: walls, corners, arcs, openings, columns, levels, and axes.

3. **Semantic interpretation**  
   Understand rooms, circulation, service zones, wet areas, cabinetry zones, doors, windows, and design constraints.

4. **Design generation**  
   Generate layout options, interior/exterior schemes, cabinetry arrangements, furniture plans, reflected ceiling concepts, and material direction.

5. **Drawing production**  
   Produce 2D outputs such as plans, elevations, sections, schedules, dimensions, annotations, and drawing sheets.

6. **3D generation**  
   Create structured 3D scene instructions for SketchUp, Blender, Rhino, or other geometry engines.

7. **Render pipeline**  
   Prepare views, cameras, materials, render notes, and D5/Twinmotion-style scene requirements.

8. **Review and feedback loop**  
   Compare output against brief, constraints, dimensions, and user comments, then revise.

## Initial repo structure

```text
local-cad-agent/
  demos/                    Focused workflow examples and development references
  docs/                     Architecture, roadmap, and CAD automation specs
  prompts/                  Agent and Codex build prompts
  src/local_cad_agent/      Python starter package
  tests/                    Starter tests
  config.example.yaml       Local configuration template
  install.bat               Windows setup helper
  run.bat                   Windows run helper
  pyproject.toml            Python package config
```

## Quick start

```bat
install.bat
run.bat
```

Manual Python run:

```bash
python -m venv .venv
.venv\\Scripts\\activate
pip install -e .[dev]
python -m local_cad_agent.cli --help
```

## Current stage

This is an architecture and scaffold repo. The first working milestone is a geometry kernel that can normalize angled walls, near-parallel lines, room loops, openings, and dimension references before any autonomous design layer runs.

## Design principles

- Local-first by default.
- Never trust one model output blindly.
- Geometry before style.
- Keep raw input, intermediate JSON, and final output separate.
- Use deterministic geometry checks before agentic decisions.
- Every step should leave logs and artifacts.
- Prefer small modules that can be tested independently.

## Near-term milestones

- Build geometry primitive model for walls, openings, rooms, and annotations.
- Add DXF import workflow.
- Add plan-image tracing strategy document.
- Add wall cleanup engine for slightly angled and messy wall orientations.
- Add JSON scene schema for 2D to 3D handoff.
- Add Windows desktop app plan after the CLI pipeline is stable.

## License

Private project unless a license is added later.

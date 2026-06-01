# luau-demo

> The LAU game engine integration demo. All 10 Luau packages wired together into one Roblox game.

## What This Shows

This demo wires every Luau package into a single game loop:

| Package | Game Role |
|---------|-----------|
| **luau-spatial** | Entity position indexing (QuadTree) |
| **luau-biome** | Procedural terrain (10 biome types) |
| **luau-quest** | Mission tracking with math objectives |
| **luau-scheduler** | Priority-based game loop |
| **luau-conservation** | Physics law verification |
| **luau-recipe** | Crafting with biome/skill gates |
| **luau-genealogy** | Entity lineage and evolution |
| **luau-math** | Symmetry groups, rhythm, sequences |
| **luau-git-world** | World versioning (teaches git!) |
| **luau-audio** | Musical feedback and scales |

## Game Loop Architecture

```
Every tick:
  1. Scheduler runs due tasks (priority order)
  2. Biome lookup at player position
  3. Spatial index update (QuadTree)
  4. Quest event processing
  5. Conservation check (every 60 ticks)
  6. Audio triggers on events
```

## Quick Start

```lua
local DemoWorld = require(path.to["luau-demo"])

local world = DemoWorld.new(42)  -- deterministic seed
world:buildStructure("tower", 10, 20)
world:movePlayer(5, 5)
world:craft("sword")
print(world:status())
```

## The Bigger Picture

**LAU = Layered Agent-UI.** A gamified learning platform where kids' game worlds ARE git repos. Each Roblox game teaches real math and programming concepts through gameplay:

- Building structures teaches spatial reasoning
- Crafting teaches resource management
- Biome exploration teaches topology
- Conservation checks teach physics
- Git-world teaches version control

## Install

```toml
# wally.toml
[dependencies]
Spatial = "superinstance/luau-spatial@0.1.0"
Biome = "superinstance/luau-biome@0.1.0"
Quest = "superinstance/luau-quest@0.1.0"
Scheduler = "superinstance/luau-scheduler@0.1.0"
Conservation = "superinstance/luau-conservation@0.1.0"
Recipe = "superinstance/luau-recipe@0.1.0"
Genealogy = "superinstance/luau-genealogy@0.1.0"
Math = "superinstance/luau-math@0.1.0"
GitWorld = "superinstance/luau-git-world@0.1.0"
Audio = "superinstance/luau-audio@0.1.0"
```

## License

MIT

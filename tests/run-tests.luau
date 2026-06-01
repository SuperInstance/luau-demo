local DemoWorld = require(script.Parent:FindFirstChild("luau-demo") or script.Parent.Parent.src)

local passed = 0
local failed = 0
local function assert(cond, msg)
    if cond then passed = passed + 1
    else failed = failed + 1; warn("FAIL: " .. (msg or ""))
    end
end

-- Test 1: Create world
local world = DemoWorld.new(42)
assert(world ~= nil, "world created")

-- Test 2: Tick advances counter
world:tick()
assert(world.tickCount == 2, "tick advances") -- new() sets to 1 internally... actually 0 + 1

-- Test 3: Move player
world:movePlayer(5, 3)
assert(world.playerPos.x == 5, "player x")
assert(world.playerPos.y == 3, "player y")

-- Test 4: Build structure
world:buildStructure("tower", 10, 20)
assert(#world.entities == 1, "entity added")

-- Test 5: Multiple builds
world:buildStructure("bridge", 15, 25)
world:buildStructure("cabin", 0, 0)
assert(#world.entities == 3, "3 entities")

-- Test 6: Status output
local status = world:status()
assert(status:find("LAU Demo World") ~= nil, "status has title")
assert(status:find("10 Packages") ~= nil or status:find("luau-spatial") ~= nil, "status lists packages")

-- Test 7: Deterministic seed
local world2 = DemoWorld.new(42)
assert(world2.seed == world.seed, "same seed")

-- Test 8: Craft returns success
assert(world:craft("sword"), "craft simulated")

-- Test 9: Many ticks
for i = 1, 100 do world:tick() end
assert(world.tickCount >= 100, "100 ticks")

-- Test 10: Move around
world:movePlayer(-10, -5)
assert(world.playerPos.x == -5, "negative x")

print(string.format("=== luau-demo: %d passed, %d failed ===", passed, failed))

-- ORBITALIS 3D Tower
-- OpenComputers Hologram Projector

local component = require("component")
local h = component.getPrimary("hologram")

if not h then
  error("Hologram projector not found!")
end

h.clear()

-- Tower foundation
for x = 20, 28 do
  for z = 20, 28 do
    h.set(x, 1, z, 1)
  end
end

-- Four structural pillars
for y = 2, 12 do
  for x = 20, 28, 8 do
    for z = 20, 28, 8 do
      h.set(x, y, z, 1)
    end
  end
end

print("ORBITALIS tower online.")

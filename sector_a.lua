
-- QUANTUM LABS
-- SECTOR A HOLOGRAM
-- OpenComputers Tier 2

local component = require("component")
local h = component.getPrimary("hologram")

h.clear()

-- Green palette
h.setPaletteColor(1, 0x00FF00)

local font = {
 S={"01111","10000","10000","01110","00001","00001","11110"},
 E={"11111","10000","10000","11110","10000","10000","11111"},
 C={"01111","10000","10000","10000","10000","10000","01111"},
 T={"11111","00100","00100","00100","00100","00100","00100"},
 O={"01110","10001","10001","10001","10001","10001","01110"},
 R={"11110","10001","10001","11110","10100","10010","10001"},
 A={"01110","10001","10001","11111","10001","10001","10001"}
}

local label = "SECTOR A"
local startX = 2
local startY = 13

-- Draw lettering
for i = 1, #label do
  local pattern = font[label:sub(i,i)]

  if pattern then
    for y = 1, 7 do
      for x = 1, 5 do
        if pattern[y]:sub(x,x) == "1" then
          h.set(startX+(i-1)*6+x-1,
                startY+y-1, 24, 1)
        end
      end
    end
  end
end

-- Set initial orientation
h.setRotation(0, 0, 1, 0)

-- Rotate continuously around vertical axis
h.setRotationSpeed(20, 0, 1, 0)

print("QUANTUM LABS: SECTOR A ONLINE")


-- =====================================
-- QUANTUM LABS
-- SECTOR A - ROTATING HOLOGRAM
-- OpenComputers Tier 2
-- =====================================

local component = require("component")
local computer = require("computer")

local h = component.proxy("fd9ed89d-3ed4-4034-aca4-cd3c9e8e9dce")
-- Configuration
local GREEN = 0x00FF00
local CENTER_X = 24
local CENTER_Z = 24
local HEIGHT = 13
local ANGLE_STEP = 5
local FRAME_DELAY = 0.12

-- Font
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

-- Set green palette
h.setPaletteColor(1, GREEN)

-- Convert text into 2D voxel coordinates
local pixels = {}

for i = 1, #label do
    local pattern = font[label:sub(i,i)]

    if pattern then
        for y = 1, 7 do
            for x = 1, 5 do
                if pattern[y]:sub(x,x) == "1" then
                    local px = (i-1)*6 + x-1

                    pixels[#pixels+1] = {
                        x = px,
                        y = HEIGHT + y - 1
                    }
                end
            end
        end
    end
end

local textWidth = (#label * 6) - 1
local center = (textWidth - 1) / 2

-- Continuous 360-degree rotation
local angle = 0

while true do
    h.clear()

    local rad = math.rad(angle)
    local cosA = math.cos(rad)
    local sinA = math.sin(rad)

    for _, p in ipairs(pixels) do
        local dx = p.x - center

        local rx = math.floor(CENTER_X + dx*cosA + 0.5)
        local rz = math.floor(CENTER_Z + dx*sinA + 0.5)

        if rx >= 1 and rx <= 48 and
           rz >= 1 and rz <= 48 and
           p.y >= 1 and p.y <= 32 then

            h.set(rx, 33-p.y, rz, 1)
        end
    end

    angle = (angle + ANGLE_STEP) % 360

    computer.pullSignal(FRAME_DELAY)
end


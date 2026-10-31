local component = require("component")
local h = component.getPrimary("hologram")

h.clear()

-- Tier 2 colour palette
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

local text = "SECTOR A"
local startX = 2
local startY = 13

for i = 1, #text do
    local pattern = font[text:sub(i,i)]

    if pattern then
        for y = 1, 7 do
            for x = 1, 5 do
                if pattern[8-y]:sub(x,x) == "1" then
                    h.set(startX+(i-1)*6+x-1,
                          startY+y-1, 24, 1)
                end
            end
        end
    end
end

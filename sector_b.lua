
local component = require("component")
local h = component.proxy("5a0ec37e-c29f-421b-a765-9ba9c120e63f")

h.clear()
h.setScale(1)
h.setPaletteColor(1, 0x00FF00)

local patterns = {
 Q = {"110","101","101","101","111","001","110"},
 U = {"101","101","101","101","101","101","111"},
 A = {"010","101","101","111","101","101","101"},
 N = {"101","111","111","111","111","111","101"},
 T = {"111","010","010","010","010","010","010"},
 M = {"101","111","111","101","101","101","101"},
 L = {"100","100","100","100","100","100","111"},
 B = {"110","101","101","110","101","101","110"},
 S = {"011","100","100","010","001","001","110"}
}

local text = "QUANTUM LABS"
local startX = 1
local y = 2
local z = 2
local cursor = 0
local totalWidth = 46

for i = 1, #text do
    local letter = text:sub(i, i)

    if letter == " " then
        cursor = cursor + 3
    else
        local glyph = patterns[letter]

        for row = 1, 7 do
            for col = 1, 3 do
                if glyph[row]:sub(col, col) == "1" then
                    local originalX = cursor + col - 1
                    local originalY = row - 1

                    -- Rotate 180 degrees
                    local rotatedX = startX + totalWidth - 1 - originalX
                    local rotatedY = y + 6 - originalY

                    h.set(rotatedX, rotatedY, z, 1)
                end
            end
        end

        cursor = cursor + 4
    end
end

print("QUANTUM LABS // REAR-FACING DISPLAY ONLINE")


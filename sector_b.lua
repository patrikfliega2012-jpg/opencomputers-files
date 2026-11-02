local component = require("component")
local h = component.proxy("b7ec1184-1d84-4537-ae2d-29a4c8356da0")

h.clear()
h.setScale(1)
h.setPaletteColor(1, 0x00FF00)

local patterns = {
 Q = {"110","101","101","101","110"},
 U = {"101","101","101","101","111"},
 A = {"010","101","111","101","101"},
 N = {"101","111","111","111","101"},
 T = {"111","010","010","010","010"},
 M = {"101","111","111","101","101"},
 L = {"100","100","100","100","111"},
 B = {"110","101","110","101","110"},
 S = {"011","100","010","001","110"}
}

local text = "QUANTUM LABS"
local startX, y, z = 2, 2, 1
local cursor = 0
local totalWidth = 46

for i = 1, #text do
    local letter = text:sub(i, i)

    if letter == " " then
        cursor = cursor + 2
    else
        local glyph = patterns[letter]

        for row = 1, 5 do
            for col = 1, 3 do
                if glyph[row]:sub(col, col) == "1" then
                    local originalX = cursor + col - 1
                    local flippedX = startX + totalWidth - 1 - originalX
                    local flippedY = y + 5 - row

                    h.set(flippedX, flippedY, z, 1)
                end
            end
        end

        cursor = cursor + 4
    end
end

print("QUANTUM LABS: 180-DEGREE ROTATION COMPLETE")

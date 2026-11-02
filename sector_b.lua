local component = require("component")
local h = component.proxy("56aebca3-927f-496b-b784-f570c68c5288")

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
local startX = 2
local y = 2
local z = 1
local cursor = 0

-- Total width of the lettering
local totalWidth = 45

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

                    h.set(flippedX, y + row - 1, z, 1)
                end
            end
        end

        cursor = cursor + 4
    end
end

print("QUANTUM LABS: MIRRORED DISPLAY READY")

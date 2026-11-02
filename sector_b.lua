
local component = require("component")
local h = component.proxy("b7ec1184-1d84-4537-ae2d-29a4c8356da0")

h.clear()
h.setScale(1)
h.setPaletteColor(1, 0x00FF00)

local patterns = {
    Q = {"0110","1001","1001","1001","1011","0111","0001"},
    U = {"1001","1001","1001","1001","1001","1001","0110"},
    A = {"0110","1001","1001","1111","1001","1001","1001"},
    N = {"1001","1101","1101","1011","1011","1001","1001"},
    T = {"1111","0110","0110","0110","0110","0110","0110"},
    M = {"1001","1111","1111","1011","1001","1001","1001"},
    L = {"1000","1000","1000","1000","1000","1000","1111"},
    B = {"1110","1001","1001","1110","1001","1001","1110"},
    S = {"0111","1000","1000","0110","0001","0001","1110"}
}

local text = "QUANTUM LABS"

local startX = 0
local y = 13
local z = 1
local cursor = 0
local totalWidth = 47

for i = 1, #text do
    local letter = text:sub(i, i)

    if letter == " " then
        cursor = cursor + 3
    else
        local glyph = patterns[letter]

        for row = 1, 7 do
            for col = 1, 4 do
                if glyph[row]:sub(col, col) == "1" then
                    local originalX = cursor + col - 1
                    local flippedX = startX + totalWidth - 1 - originalX
                    local flippedY = y + 7 - row

                    h.set(flippedX, flippedY, z, 1)
                end
            end
        end

        cursor = cursor + 4
    end
end

-- Continuous logo underline
for x = 0, totalWidth - 1 do
    h.set(startX + totalWidth - 1 - x, y, z, 1)
end

print("QUANTUM LABS // HOLOGRAPHIC LOGO ONLINE")


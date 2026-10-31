local component = require("component")
local h = component.proxy("9fd70615-e9a2-41d4-84df-58ee49f29849")

h.clear()
h.setPaletteColor(1, 0x00FF00)

local font = {
S={"011110","100001","100000","011110","000001","100001","011110"},
E={"111111","100000","100000","111110","100000","100000","111111"},
R={"111110","100001","100001","111110","101000","100100","100011"},
V={"100001","100001","100001","100001","010010","010010","001100"}
}

local word = "SERVERS"
local startX = 0
local startY = 13
local z = 24
local spacing = 7

for i = 1, #word do
    local letter = font[word:sub(i,i)]

    for y = 1, 7 do
        for x = 1, 6 do
            if letter[8-y]:sub(x,x) == "1" then
                h.set(startX + (i-1)*spacing + x, startY+y, z, 1)
            end
        end
    end
end

print("QUANTUM LABS - SERVERS ONLINE")

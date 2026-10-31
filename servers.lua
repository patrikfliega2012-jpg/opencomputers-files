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

for i = 1, #word do
    local letter = font[word:sub(i,i)]
    for y = 1, #letter do
        for x = 1, #letter[y] do
            if letter[y]:sub(x,x) == "1" then
                h.set(3 + (i-1)*6 + x, 33-(13+y), 24, 1)
            end
        end
    end
end

print("SERVERS DISPLAY ONLINE")

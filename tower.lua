local h = require("component").getPrimary("hologram")
assert(h, "Hologram not found")

local font = {
 O={"111","101","101","101","111"},
 R={"110","101","110","101","101"},
 B={"110","101","110","101","110"},
 I={"111","010","010","010","111"},
 T={"111","010","010","010","010"},
 A={"010","101","111","101","101"},
 L={"100","100","100","100","111"},
 S={"011","100","010","001","110"}
}

local points = {}

local word = "ORBITALIS"

for i = 1, #word do
    local letter = font[word:sub(i,i)]

    for y = 1, 5 do
        for x = 1, 3 do
            if letter[y]:sub(x,x) == "1" then
                points[#points+1] = {
                    x = (i-1)*4+x,
                    y = y
                }
            end
        end
    end
end

local angle = 0
local centerX = 19
local centerY = 16

while true do
    h.clear()

    for _, p in ipairs(points) do
        local dx = p.x - centerX
        local dy = p.y - centerY

        local rx = math.floor(
            dx * math.cos(angle) - dy * math.sin(angle) + centerX + 0.5
        )

        local ry = math.floor(
            dx * math.sin(angle) + dy * math.cos(angle) + centerY + 0.5
        )

        if rx >= 1 and rx <= 48 and ry >= 1 and ry <= 32 then
            h.set(rx, ry, 24, 1)
        end
    end

    angle = angle + 0.08
    os.sleep(0.05)
end

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
local cx, cy, cz = 24, 16, 24

while true do
    h.clear()

    for _, p in ipairs(points) do
        local x = p.x - 19
        local y = p.y - 3

        local rx = x * math.cos(angle)
        local rz = x * math.sin(angle)

        local vx = math.floor(cx + rx + 0.5)
        local vy = math.floor(cy + y + 0.5)
        local vz = math.floor(cz + rz * 0.5 + 0.5)

        if vx >= 1 and vx <= 48
        and vy >= 1 and vy <= 32
        and vz >= 1 and vz <= 48 then
            h.set(vx, vy, vz, 1)
        end
    end

    angle = angle + 0.04
    os.sleep(0.05)
end

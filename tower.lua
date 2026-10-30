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

local word = "ORBITALIS"
local voxels = {}

-- Build the original 3D voxel wordmark
for i = 1, #word do
    local letter = font[word:sub(i,i)]

    for row = 1, 5 do
        for col = 1, 3 do
            if letter[row]:sub(col,col) == "1" then
                voxels[#voxels+1] = {
                    x = (i-1)*4 + col-1,
                    y = 5-row
                }
            end
        end
    end
end

local frame = 0

while true do
    h.clear()

    local angle = frame * 0.12
    local c = math.cos(angle)
    local s = math.sin(angle)

    for _,v in ipairs(voxels) do
        local x = v.x - 16
        local z = 0

        local rx = x*c - z*s
        local rz = x*s + z*c

        local scale = 1 / (1 + rz*0.025)

        local px = math.floor(24 + rx*scale)
        local py = math.floor(14 + v.y*scale)
        local pz = math.floor(24 + rz*0.08)

        if px >= 1 and px <= 48 and
           py >= 1 and py <= 32 and
           pz >= 1 and pz <= 48 then
            h.set(px,py,pz,1)
        end
    end

    frame = frame + 1
    os.sleep(0.08)
end

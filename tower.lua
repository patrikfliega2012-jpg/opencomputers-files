local h = require("component").getPrimary("hologram")
assert(h, "Hologram not found")

h.clear()

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
local startX = 7
local startY = 14
local z = 24

for i = 1, #word do
  local letter = font[word:sub(i,i)]

  for row = 1, 5 do
    for col = 1, 3 do
      if letter[row]:sub(col,col) == "1" then
        h.set(startX+(i-1)*4+col-1,
              startY+5-row,z,1)
      end
    end
  end
end

print("ORBITALIS ONLINE")

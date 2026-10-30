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
local frame = 0

while true do
 h.clear()

 local angle = frame % 40
 local width = math.abs(math.cos(angle * math.pi / 20))

 for i = 1, #word do
  local letter = font[word:sub(i,i)]

  for row = 1, 5 do
   for col = 1, 3 do
    if letter[row]:sub(col,col) == "1" then
     local x = 24 + math.floor(((i-5)*4+col-2)*width)
     local y = 16 + row - 3

     h.set(x,y,24,1)
    end
   end
  end
 end

 frame = frame + 1
 os.sleep(0.12)
end

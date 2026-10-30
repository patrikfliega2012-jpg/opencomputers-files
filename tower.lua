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
local sx, sy, z = 7, 14, 24

local function drawLetter(letter, index)
  local glyph = font[letter]
  for row = 1, 5 do
    for col = 1, 3 do
      if glyph[row]:sub(col,col) == "1" then
        h.set(sx+(index-1)*4+col-1,
              sy+5-row,z,1)
      end
    end
  end
end

local function drawText()
  for i = 1, #word do
    drawLetter(word:sub(i,i),i)
  end
end

-- Animated reveal
h.clear()

for i = 1, #word do
  drawLetter(word:sub(i,i),i)
  os.sleep(0.2)
end

-- Continuous animation
local frame = 0

while true do
  h.clear()
  drawText()

  -- Elliptical orbital ring
  for a = 0, 359, 5 do
    local angle = math.rad(a + frame*4)
    local x = math.floor(24 + 21*math.cos(angle))
    local y = math.floor(16 + 9*math.sin(angle))

    if x >= 1 and x <= 48 and y >= 1 and y <= 32 then
      h.set(x,y,24,1)
    end
  end

  -- Bright moving orbital point
  local angle = math.rad(frame*4)
  local x = math.floor(24 + 21*math.cos(angle))
  local y = math.floor(16 + 9*math.sin(angle))

  h.set(x,y,23,1)

  -- Scanning light across the word
  local scan = 7 + (frame % 36)

  for y = 14, 18 do
    h.set(scan,y,23,1)
  end

  frame = frame + 1
  os.sleep(0.08)
end

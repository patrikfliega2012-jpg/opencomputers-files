local component = require("component")
local computer = require("computer")

local h = component.getPrimary("hologram")

h.clear()

local font = {
S={"01111","10000","10000","01110","00001","00001","11110"},
E={"11111","10000","10000","11110","10000","10000","11111"},
C={"01111","10000","10000","10000","10000","10000","01111"},
T={"11111","00100","00100","00100","00100","00100","00100"},
O={"01110","10001","10001","10001","10001","10001","01110"},
R={"11110","10001","10001","11110","10100","10010","10001"},
A={"01110","10001","10001","11111","10001","10001","10001"}
}

local text = "SECTOR A"
local angle = 0

while true do
  h.clear()

  for i=1,#text do
    local pattern = font[text:sub(i,i)]

    if pattern then
      for y=1,7 do
        for x=1,5 do
          if pattern[y]:sub(x,x) == "1" then

            local originalX = (i-1)*6+x-1-20
            local originalZ = 0
            local rad = math.rad(angle)

            local rotatedX = math.floor(originalX*math.cos(rad)+0.5)
            local rotatedZ = math.floor(-originalX*math.sin(rad)+0.5)

            local finalX = 24+rotatedX
            local finalZ = 24+rotatedZ

            if finalX >= 1 and finalX <= 48 and finalZ >= 1 and finalZ <= 48 then
              h.set(finalX,13+y-1,finalZ,1)
            end

          end
        end
      end
    end
  end

  angle = (angle+5)%360
  computer.pullSignal(0.15)
end

local c = require("component")
local addr = "d5769a0f-a7ae-4e2c-a834-69e7cdb60a8a"

for name in pairs(c.methods(addr)) do
  print(name)
end

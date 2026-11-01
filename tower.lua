local fs = require("filesystem")
local t = require("component").tape_drive
local f = io.open("/home/credits.dfpwm", "rb")
if f then
  local data = f:read("*a")
  f:close()
  print("File size:", #data)
  print("Ready to write.")
else
  print("File not found.")
end

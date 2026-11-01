local t = require("component").tape_drive
local f = io.open("/home/credits.dfpwm", "rb")
local data = f:read("*a")
f:close()
t.stop()
t.seek(0)
local written = t.write(data)
print("Written:", written, "bytes")

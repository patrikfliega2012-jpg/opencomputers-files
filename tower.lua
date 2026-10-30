local internet = require("component").internet

local url = "https://raw.githubusercontent.com/patrikfliega2012-jpg/opencomputers-files/main/tower.lua"

local response, reason = internet.request(url)

if not response then
    print("Download failed: " .. tostring(reason))
    return
end

local file = io.open("/home/tower.lua", "w")
if not file then
    print("Cannot create tower.lua")
    return
end

for chunk in response do
    file:write(chunk)
end

file:close()
print("tower.lua downloaded successfully")

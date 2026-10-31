local c = require("component")

for address, name in pairs(c.list()) do
    print(name .. " : " .. address)
end

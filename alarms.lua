local c = require("component")

print("=== QUANTUM LABS AUDIO CHECK ===")

for address, name in pairs(c.list()) do
    if name == "sound" or name == "noise" or name == "speaker" then
        print(name .. " : " .. address)
    end
end

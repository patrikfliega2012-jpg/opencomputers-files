local sound = require("component").sound

print("QUANTUM LABS - SOUND DIAGNOSTICS")
print("Available wave modes:")

for name, value in pairs(sound.modes or {}) do
    print(name, value)
end

print("Available methods:")

local component = require("component")
for name in pairs(component.methods(sound.address)) do
    print(name)
end

local component = require("component")
local computer = require("computer")

local SOUND_ADDRESS = "d5769a0f-a7ae-4e2c-a834-69e7cdb60a8a"

print("================================")
print(" QUANTUM LABS - SOUND SYSTEM")
print("================================")

if not component.isAvailable("sound") then
    print("ERROR: Sound Card not detected!")
    return
end

print("Sound Card detected!")

local sound = component.proxy(SOUND_ADDRESS)

print("Address: " .. SOUND_ADDRESS)
print("")
print("Checking available methods...")

local ok, methods = pcall(component.methods, SOUND_ADDRESS)

if ok and type(methods) == "table" then
    for name, value in pairs(methods) do
        print(tostring(name) .. " : " .. tostring(value))
    end
else
    print("Method list unavailable.")
    print("Checking component documentation...")

    local docOK, docs = pcall(component.doc, SOUND_ADDRESS)

    if docOK and type(docs) == "table" then
        for name, description in pairs(docs) do
            print(tostring(name) .. " : " .. tostring(description))
        end
    else
        print("Documentation unavailable.")
    end
end

print("")
print("Sound system inspection complete.")
computer.beep(1000, 0.2)

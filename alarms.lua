local component = require("component")

print("QUANTUM LABS AUDIO TEST")
print("=======================")

local sound = component.sound

if not sound then
    print("ERROR: Sound Card unavailable")
    return
end

print("Sound Card connected!")
print("Playing two simultaneous notes...")

local ok, err = pcall(function()
    sound.setWave(1, sound.modes.sine)
    sound.setFrequency(1, 440)
    sound.setVolume(1, 0.35)

    sound.setWave(2, sound.modes.sine)
    sound.setFrequency(2, 554)
    sound.setVolume(2, 0.35)

    sound.open(1)
    sound.open(2)

    sound.delay(1500)

    sound.close(1)
    sound.close(2)

    sound.process()
end)

if ok then
    print("SUCCESS: Audio synthesis completed!")
else
    print("AUDIO ERROR: " .. tostring(err))
end

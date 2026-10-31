local component = require("component")

local address = "d5769a0f-a7ae-4e2c-a834-69e7cdb60a8a"
local sound = component.proxy(address)

print("QUANTUM LABS")
print("AUDIO TEST: TWO CHANNELS")

local ok, err = pcall(function()
    sound.open(1)
    sound.setWave(1, sound.modes.sine)
    sound.setFrequency(1, 440)
    sound.setVolume(1, 0.35)

    sound.open(2)
    sound.setWave(2, sound.modes.sine)
    sound.setFrequency(2, 554)
    sound.setVolume(2, 0.35)

    sound.delay(1500)

    sound.close(1)
    sound.close(2)

    sound.process()
end)

if ok then
    print("AUDIO TEST COMPLETE")
else
    print("AUDIO ERROR:")
    print(tostring(err))
end

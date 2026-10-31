local sound = require("component").sound

print("QUANTUM LABS AUDIO TEST")

local ok, err = pcall(function()
    sound.open(1)
    sound.setWave(1, 0)
    sound.setFrequency(1, 440)
    sound.setVolume(1, 0.3)
    sound.delay(2000)
    sound.close(1)
    sound.process()
end)

if ok then
    print("TEST COMPLETED")
else
    print("ERROR: " .. tostring(err))
end

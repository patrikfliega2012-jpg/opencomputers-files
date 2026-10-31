
-- =====================================
-- QUANTUM LABS
-- INDUSTRIAL PULSE
-- Original industrial breakbeat
-- OpenComputers
-- =====================================

local computer = require("computer")

-- One step = 0.125 seconds
-- 16 steps = 2 seconds
-- 30 loops = 60 seconds

local beat = {
    110, 850, 0, 620,
    240, 850, 110, 0,
    110, 850, 620, 850,
    240, 0, 110, 620
}

local function playStep(freq)
    if freq > 0 then
        local duration = 0.045

        if freq == 110 then
            duration = 0.075
        end

        computer.beep(freq, duration)
        computer.pullSignal(0.125 - duration)
    else
        computer.pullSignal(0.125)
    end
end

print("")
print("==============================")
print("       QUANTUM LABS")
print("      INDUSTRIAL PULSE")
print("==============================")
print("AUDIO SYSTEM ONLINE")
print("")

for bar = 1, 30 do
    for _, freq in ipairs(beat) do
        playStep(freq)
    end
end

print("AUDIO SEQUENCE COMPLETE")

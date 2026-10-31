
-- =====================================
-- QUANTUM LABS
-- CRITICAL SERVER FAILURE
-- Emergency Alarm System
-- =====================================

local computer = require("computer")

local function tone(freq, duration)
    computer.beep(freq, duration)
end

local function pause(duration)
    computer.pullSignal(duration)
end

local function alarmCycle()
    -- Initial warning
    tone(600, 0.4)
    pause(0.1)
    tone(900, 0.4)
    pause(0.1)

    -- Emergency siren
    for i = 1, 3 do
        tone(1200, 0.25)
        tone(500, 0.25)
    end

    -- Critical failure pattern
    tone(1500, 0.8)
    pause(0.15)
    tone(400, 0.8)
    pause(0.15)

    -- Rapid warning pulses
    for i = 1, 5 do
        tone(1000, 0.12)
        tone(700, 0.12)
    end

    pause(0.5)
end

print("")
print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
print(" QUANTUM LABS")
print(" CRITICAL SERVER FAILURE")
print(" SYSTEM INTEGRITY COMPROMISED")
print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
print("EMERGENCY ALARM ACTIVE")
print("Press CTRL+C to silence.")
print("")

while true do
    alarmCycle()
end


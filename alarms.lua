
-- QUANTUM LABS
-- CONTAINMENT FAILURE
-- Original emergency sound

local computer = require("computer")

local function note(freq, duration)
    computer.beep(freq, duration)
end

local function silence(duration)
    computer.pullSignal(duration)
end

local function warning()
    -- Deep warning
    note(180, 1.2)
    silence(0.5)
    note(180, 1.2)
    silence(0.8)

    -- Rising tension
    note(260, 0.7)
    note(310, 0.7)
    note(390, 1.0)
    silence(0.4)

    -- Electronic emergency signal
    for i = 1, 4 do
        note(880, 0.18)
        silence(0.08)
        note(660, 0.18)
        silence(0.08)
    end

    -- Final breach warning
    note(1200, 0.5)
    note(900, 0.5)
    note(1200, 0.5)
    note(400, 1.5)

    silence(1.0)
end

print("================================")
print("       QUANTUM LABS")
print("     CONTAINMENT FAILURE")
print("================================")
print("WARNING: CONTAINMENT LOST")
print("EVACUATE FACILITY")
print("Press CTRL+C to silence.")
print("")

while true do
    warning()
end


-- =====================================
-- QUANTUM LABS
-- THE FINAL TRANSMISSION
-- Original closing theme
-- OpenComputers
-- =====================================

local computer = require("computer")

local melody = {
    -- Opening: quiet and mysterious
    {392, 0.8}, {523, 1.2}, {659, 1.5},
    {587, 1.0}, {523, 1.8},

    -- The fading signal
    {440, 1.0}, {523, 1.0}, {587, 2.0},
    {523, 1.2}, {440, 2.0},

    -- A distant memory
    {349, 1.0}, {440, 1.5}, {523, 2.0},
    {494, 1.0}, {440, 2.5},

    -- Final transmission
    {392, 1.2}, {440, 1.2}, {523, 2.5},
    {440, 1.5}, {392, 3.0},

    -- Closing signal
    {349, 1.5}, {392, 2.0}, {440, 3.0},
    {392, 2.0}, {349, 4.0}
}

print("")
print("================================")
print("       QUANTUM LABS")
print("      FINAL TRANSMISSION")
print("================================")
print("Connection fading...")
print("")

for _, note in ipairs(melody) do
    computer.beep(note[1], note[2])
    computer.pullSignal(0.12)
end

computer.pullSignal(1)

computer.beep(262, 4)

print("")
print("TRANSMISSION TERMINATED.")
print("QUANTUM LABS - OFFLINE")

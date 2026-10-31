
-- =====================================
-- QUANTUM LABS
-- RESONANCE
-- Original Half-Life-inspired theme
-- Approximately 60 seconds
-- =====================================

local computer = require("computer")

local melody = {
    -- 0:00 - The facility
    {196, 1.8}, {294, 1.8}, {392, 2.2},
    {349, 1.8}, {294, 2.2},

    -- 0:10 - Something is wrong
    {220, 1.8}, {330, 1.8}, {440, 2.2},
    {392, 1.8}, {330, 2.2},

    -- 0:20 - Resonance
    {262, 1.8}, {392, 1.8}, {523, 2.5},
    {494, 1.8}, {392, 2.2},

    -- 0:30 - The experiment
    {220, 1.5}, {262, 1.5}, {349, 2.0},
    {392, 2.0}, {349, 2.0},

    -- 0:40 - Alien signal
    {165, 2.0}, {247, 2.0}, {330, 2.5},
    {294, 2.0}, {247, 2.0},

    -- 0:50 - Final transmission
    {196, 2.0}, {262, 2.0}, {330, 2.0},
    {294, 2.0}, {220, 2.5},

    -- Ending
    {196, 3.0}, {147, 3.0}
}

print("")
print("================================")
print("       QUANTUM LABS")
print("          RESONANCE")
print("================================")
print("Audio transmission initiated...")
print("")

for _, note in ipairs(melody) do
    computer.beep(note[1], note[2])
    computer.pullSignal(0.12)
end

computer.pullSignal(1)
computer.beep(147, 3)

print("TRANSMISSION COMPLETE.")


-- =====================================
-- QUANTUM LABS
-- AFTER THE EXPERIMENT
-- Original 30-second ambient closing theme
-- =====================================

local computer = require("computer")

local sections = {
    -- Distant opening
    {330, 1.4}, {392, 1.4}, {494, 2.0},
    {392, 1.5}, {330, 2.0},

    -- Something remains
    {262, 1.8}, {330, 1.8}, {392, 2.2},
    {349, 1.5}, {294, 2.0},

    -- Fading memories
    {220, 1.8}, {262, 1.8}, {330, 2.2},
    {294, 1.5}, {247, 2.0},

    -- Final signal
    {196, 2.0}, {247, 2.0}, {294, 2.0},
    {262, 2.0}, {220, 2.5},

    -- Silence approaches
    {196, 2.0}, {165, 2.5}, {131, 3.0}
}

print("QUANTUM LABS")
print("AFTER THE EXPERIMENT")
print("Closing transmission...")

for _, note in ipairs(sections) do
    computer.beep(note[1], note[2])
    computer.pullSignal(0.12)
end

computer.pullSignal(1)
computer.beep(110, 2)

print("TRANSMISSION ENDED.")

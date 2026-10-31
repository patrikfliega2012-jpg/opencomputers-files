
-- =====================================
-- QUANTUM LABS
-- SYSTEM AWAKENING
-- Original OpenComputers Theme
-- =====================================

local computer = require("computer")

local melody = {
    {523, 0.25}, {659, 0.25}, {784, 0.50},
    {659, 0.25}, {880, 0.50}, {784, 0.50},
    {587, 0.25}, {698, 0.25}, {880, 0.75},

    {784, 0.25}, {659, 0.25}, {523, 0.50},
    {440, 0.25}, {523, 0.25}, {659, 0.75},

    {784, 0.25}, {880, 0.25}, {1047, 0.75},
    {880, 0.25}, {784, 0.25}, {659, 0.50},

    {587, 0.25}, {659, 0.25}, {784, 1.00},
    {523, 0.75}
}

local function playTheme()
    for _, note in ipairs(melody) do
        computer.beep(note[1], note[2])
        computer.pullSignal(0.04)
    end
end

print("QUANTUM LABS - SYSTEM AWAKENING")
print("Playing startup theme...")

playTheme()

print("Theme complete.")

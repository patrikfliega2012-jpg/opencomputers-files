
local component = require("component")
local sound = component.sound

print("================================")
print(" QUANTUM LABS")
print(" CLOSING CREDITS THEME")
print("================================")
print("Preparing audio channels...")

-- Stop any sounds left from an earlier run
for ch = 1, 5 do
    sound.close(ch)
end

-- Channel 1-3: atmospheric chord layers
-- Channel 4: lead melody
-- Channel 5: bass

local function setup(ch, wave, volume, attack, decay, sustain, release)
    sound.setWave(ch, wave)
    sound.setVolume(ch, volume)
    sound.setADSR(ch, attack, decay, sustain, release)
    sound.open(ch)
end

setup(1, sound.modes.sine, 0.22, 1800, 800, 0.75, 2500)
setup(2, sound.modes.sine, 0.16, 1800, 800, 0.75, 2500)
setup(3, sound.modes.triangle, 0.12, 1800, 800, 0.65, 2500)
setup(4, sound.modes.sine, 0.20, 500, 500, 0.70, 1200)
setup(5, sound.modes.sine, 0.18, 1000, 500, 0.65, 1800)

-- Four-chord progression: Am - F - C - G
local chords = {
    {220.00, 261.63, 329.63, 110.00},
    {174.61, 220.00, 261.63, 87.31},
    {130.81, 164.81, 196.00, 65.41},
    {196.00, 246.94, 293.66, 98.00}
}

-- Original melody, one note per second
local melodies = {
    {440.00, 392.00, 329.63, 392.00},
    {349.23, 329.63, 261.63, 329.63},
    {392.00, 329.63, 293.66, 261.63},
    {293.66, 329.63, 392.00, 329.63}
}

local function playChord(chord, melody, volume)
    sound.setFrequency(1, chord[1])
    sound.setFrequency(2, chord[2])
    sound.setFrequency(3, chord[3])
    sound.setFrequency(5, chord[4])

    sound.setVolume(1, 0.22 * volume)
    sound.setVolume(2, 0.16 * volume)
    sound.setVolume(3, 0.12 * volume)
    sound.setVolume(5, 0.18 * volume)

    for i = 1, 4 do
        sound.setFrequency(4, melody[i])
        sound.setVolume(4, 0.20 * volume)
        sound.delay(1000)
    end
end

print("Playing closing theme...")
print("Duration: approximately 48 seconds")

-- Three passes: opening, emotional rise, quiet ending
for cycle = 1, 3 do
    local volume = 1.0

    if cycle == 2 then
        volume = 0.85
    elseif cycle == 3 then
        volume = 0.55
    end

    for i = 1, 4 do
        playChord(chords[i], melodies[i], volume)
    end
end

-- Close channels and allow their release envelopes to fade
for ch = 1, 5 do
    sound.close(ch)
end

sound.delay(2500)
sound.process()

print("")
print("TRANSMISSION ENDED.")
print("QUANTUM LABS - END CREDITS")


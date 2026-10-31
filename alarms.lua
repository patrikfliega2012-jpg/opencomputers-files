
local component = require("component")
local sound = component.sound

print("================================")
print(" QUANTUM LABS")
print(" END CREDITS II")
print(" 90 SECOND COMPOSITION")
print("================================")

-- Reset all eight channels
for ch = 1, 8 do
    sound.close(ch)
end

local waves = sound.modes

-- Configure eight synthesis channels
for ch = 1, 8 do
    sound.setWave(ch, waves.sine)
    sound.setVolume(ch, 0)
    sound.open(ch)
end

-- Note frequencies
local C2  = 65.41
local G2  = 98.00
local A2  = 110.00
local F2  = 87.31
local C3  = 130.81
local E3  = 164.81
local G3  = 196.00
local A3  = 220.00
local C4  = 261.63
local E4  = 329.63
local G4  = 392.00
local A4  = 440.00
local B4  = 493.88
local C5  = 523.25
local D5  = 587.33
local E5  = 659.25

-- Four-chord progression
local chords = {
    {A3, C4, E4, A2},
    {F3 or 174.61, A3, C4, F2},
    {C3, E3, G3, C2},
    {G3, B4, D5, G2}
}

-- Original melodic motifs
local melody = {
    {A4, E5, C5, B4, G4, E4, G4, A4,
     C5, B4, G4, E4, A4, G4, E4, C4},

    {F4, A4, C5, A4, G4, E4, D4, E4,
     G4, A4, C5, B4, A4, G4, E4, C4},

    {E4, G4, C5, E5, D5, C5, G4, E4,
     A4, C5, E5, C5, B4, A4, G4, E4},

    {A4, C5, E5, G5 or 783.99, E5, D5, C5, A4,
     G4, A4, C5, E5, C5, A4, G4, A4}
}

-- 4 beats per bar, 18 bars = 72 beats = 90 seconds
local beatLength = 1250

local function setChord(chord, volume)
    sound.setFrequency(1, chord[1])
    sound.setFrequency(2, chord[2])
    sound.setFrequency(3, chord[3])
    sound.setFrequency(4, chord[4])

    sound.setVolume(1, 0.16 * volume)
    sound.setVolume(2, 0.12 * volume)
    sound.setVolume(3, 0.10 * volume)
    sound.setVolume(4, 0.15 * volume)
end

local function setMelody(note, volume)
    sound.setFrequency(5, note)
    sound.setVolume(5, 0.18 * volume)

    sound.setFrequency(6, note * 2)
    sound.setVolume(6, 0.035 * volume)

    sound.setFrequency(7, note * 0.5)
    sound.setVolume(7, 0.045 * volume)

    sound.setFrequency(8, note * 1.5)
    sound.setVolume(8, 0.025 * volume)
end

print("SECTION 1 - THE AFTERMATH")

-- Four sections, 18 beats each
for section = 1, 4 do
    local volume

    if section == 1 then
        volume = 0.55
        print("The aftermath...")
    elseif section == 2 then
        volume = 0.80
        print("Memories...")
    elseif section == 3 then
        volume = 1.00
        print("The final revelation...")
    else
        volume = 0.45
        print("Goodbye...")
    end

    for beat = 1, 18 do
        local chordIndex = math.floor((beat - 1) / 4) % 4 + 1
        local motifIndex = math.floor((beat - 1) / 4) + 1
        local noteIndex = (beat - 1) % 16 + 1

        local chord = chords[chordIndex]
        local note = melody[section][noteIndex]

        setChord(chord, volume)
        setMelody(note, volume)

        -- Each delay is 1.25 seconds
        sound.delay(beatLength)
    end
end

print("Closing audio channels...")

-- Fade all channels
for ch = 1, 8 do
    sound.setVolume(ch, 0)
    sound.close(ch)
end

sound.delay(2000)
sound.process()

print("================================")
print(" TRANSMISSION TERMINATED")
print(" QUANTUM LABS")
print(" END CREDITS COMPLETE")
print("================================")



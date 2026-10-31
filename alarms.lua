local sound = require("component").sound

print("QUANTUM LABS AUDIO TEST")

sound.open(1)
sound.setWave(1, sound.modes.sine)
sound.setFrequency(1, 440)
sound.setVolume(1, 0.4)
sound.delay(2000)
sound.close(1)

sound.process()

print("TEST COMPLETE")

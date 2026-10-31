
-- QUANTUM LABS
-- SERVER FAILURE ALERT

local computer = require("computer")

print("!!! SERVER FAILURE !!!")

while true do
    computer.beep(1000, 0.2)
    computer.beep(1000, 0.2)
    computer.beep(1000, 0.2)

    computer.pullSignal(2)
end

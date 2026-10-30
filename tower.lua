local h = require("component").getPrimary("hologram")

while true do
    h.clear()
    h.set(10,16,24,1)
    os.sleep(0.5)

    h.clear()
    h.set(30,16,24,1)
    os.sleep(0.5)
end

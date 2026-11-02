local c = require("component")

print("=== CONNECTED HOLOGRAMS ===")

for address, kind in c.list("hologram", true) do
  local h = c.proxy(address)
  print("Address: " .. address)
  print("Scale: " .. tostring(h.getScale()))
  print("Max depth: " .. tostring(h.maxDepth()))
  print("--------------------------")
end

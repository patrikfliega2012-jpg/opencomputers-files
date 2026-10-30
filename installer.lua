
-- ==========================================
-- QUANTUM LABS INSTALLER v1.0
-- OpenComputers / OpenOS
-- ==========================================

local internet = require("internet")
local fs = require("filesystem")

local BASE_URL =
"https://raw.githubusercontent.com/patrikfliega2012-jpg/opencomputers-files/main/"

local ROOT = "/home/QUANTUM_LABS"

local folders = {
  "SECTION_A",
  "SECTION_B",
  "REACTOR",
  "SECURITY",
  "HOLOGRAMS"
}

-- Files to download from GitHub
local files = {
  "main.lua",
  "config.lua",
  "SECTION_A/section_a.lua",
  "SECTION_B/section_b.lua",
  "REACTOR/reactor.lua",
  "SECURITY/security.lua",
  "HOLOGRAMS/section_a.lua",
  "HOLOGRAMS/facility_map.lua"
}

print("================================")
print("      QUANTUM LABS INSTALLER")
print("           VERSION 1.0")
print("================================")
print("")

-- Create installation directories
fs.makeDirectory(ROOT)

for _, folder in ipairs(folders) do
  fs.makeDirectory(ROOT .. "/" .. folder)
end

-- Download files
for _, filename in ipairs(files) do
  local url = BASE_URL .. filename
  local destination = ROOT .. "/" .. filename

  print("Downloading: " .. filename)

  local ok, result = pcall(function()
    local response = internet.request(url)
    if not response then
      error("No response from GitHub")
    end

    local temporary = destination .. ".download"
    local output, reason = io.open(temporary, "w")

    if not output then
      error(reason or "Cannot create file")
    end

    local received = false

    for chunk in response do
      output:write(chunk)
      received = true
    end

    output:close()

    if not received then
      os.remove(temporary)
      error("Empty download")
    end

    local check = io.open(temporary, "r")
    if not check then
      error("Downloaded file cannot be opened")
    end

    local first = check:read(1)
    check:close()

    if not first then
      os.remove(temporary)
      error("Downloaded file is empty")
    end

    os.remove(destination)

    local renamed, renameError = os.rename(temporary, destination)

    if not renamed then
      error(renameError or "Could not install file")
    end
  end)

  if ok then
    print("  [OK] Installed")
  else
    print("  [FAILED] " .. tostring(result))
  end
end

print("")
print("================================")
print("     INSTALLATION FINISHED")
print("================================")
print("Location: " .. ROOT)
print("Run: cd /home/QUANTUM_LABS")
print("Then: main.lua")

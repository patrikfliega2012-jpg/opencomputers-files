
-- QUANTUM LABS DOWNLOAD MANAGER
-- OpenComputers / OpenOS

local internet = require("internet")

local BASE_URL =
  "https://raw.githubusercontent.com/patrikfliega2012-jpg/opencomputers-files/main/"

print("================================")
print("       QUANTUM LABS")
print("       DOWNLOAD MANAGER")
print("================================")
io.write("Filename to download: ")

local filename = io.read()

if not filename or filename == "" then
  print("ERROR: No filename entered.")
  return
end

-- Only allow simple filenames
if not filename:match("^[%w_.%-]+$") then
  print("ERROR: Invalid filename.")
  return
end

local url = BASE_URL .. filename

print("Connecting to GitHub...")

local request, reason = internet.request(url)

if not request then
  print("DOWNLOAD FAILED: " .. tostring(reason))
  return
end

local file, err = io.open(filename, "w")

if not file then
  print("SAVE FAILED: " .. tostring(err))
  return
end

local success, downloadError = pcall(function()
  for chunk in request do
    file:write(chunk)
  end
end)

file:close()

if not success then
  print("DOWNLOAD ERROR: " .. tostring(downloadError))
  return
end

print("Download completed: " .. filename)

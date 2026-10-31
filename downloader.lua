
-- =========================================
-- QUANTUM LABS DOWNLOAD MANAGER v2.0
-- OpenComputers / OpenOS
-- =========================================

local internet = require("internet")
local fs = require("filesystem")

local BASE_URL =
"https://raw.githubusercontent.com/patrikfliega2012-jpg/opencomputers-files/main/"

local SAVE_DIR = "/home"

local function download(filename)
  if not filename or filename == "" then
    print("ERROR: No filename entered.")
    return
  end

  if not filename:match("^[%w_.%-]+$") then
    print("ERROR: Invalid filename.")
    return
  end

  local url = BASE_URL .. filename
  local destination = SAVE_DIR .. "/" .. filename
  local temporary = destination .. ".download"

  print("Connecting to GitHub...")

  local response, reason = pcall(internet.request, url)

  if not response or not reason then
    print("CONNECTION FAILED: " .. tostring(reason))
    return
  end

  local file, err = io.open(temporary, "wb")
  if not file then
    print("FILESYSTEM ERROR: " .. tostring(err))
    return
  end

  local total = 0
  local success, downloadError = pcall(function()
    for chunk in reason do
      if chunk then
        file:write(chunk)
        total = total + #chunk
      end
    end
  end)

  file:close()

  if not success or total == 0 then
    fs.remove(temporary)
    print("DOWNLOAD FAILED: " .. tostring(downloadError))
    return
  end

  -- Reject GitHub error pages
  local check = io.open(temporary, "r")
  local firstLine = check and check:read("*l") or ""
  if check then check:close() end

  if firstLine:match("^<!DOCTYPE") or
     firstLine:match("^<html") then
    fs.remove(temporary)
    print("ERROR: GitHub returned a webpage, not a file.")
    return
  end

  -- Replace old file only after successful download
  if fs.exists(destination) then
    fs.remove(destination)
  end

  local moved, moveError = fs.rename(temporary, destination)

  if not moved then
    fs.remove(temporary)
    print("SAVE FAILED: " .. tostring(moveError))
    return
  end

  print("--------------------------------")
  print("DOWNLOAD COMPLETE")
  print("File: " .. destination)
  print("Bytes: " .. total)
  print("--------------------------------")
end

print("================================")
print("       QUANTUM LABS")
print("      DOWNLOAD MANAGER 2.0")
print("================================")
io.write("Filename: ")

local filename = io.read()
download(filename)


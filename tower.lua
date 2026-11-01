
local component = require("component")
local internet = require("internet")
local fs = require("filesystem")

local BASE_URL = "https://raw.githubusercontent.com/patrikfliega2012-jpg/opencomputers-files/main/"

io.write("Song filename (example: credits.dfpwm): ")
local filename = io.read()

if not filename or not filename:match("^[%w%._%-]+$") then
  print("Invalid filename.")
  return
end

local path = "/home/" .. filename
local url = BASE_URL .. filename

print("Downloading " .. filename .. "...")

local response, reason = internet.request(url)
if not response then
  print("Download failed: " .. tostring(reason))
  return
end

local file, err = io.open(path, "wb")
if not file then
  print("Cannot create file: " .. tostring(err))
  return
end

for chunk in response do
  file:write(chunk)
end
file:close()

local tape = component.tape_drive
if not tape then
  print("Tape Drive not detected.")
  return
end

local music = io.open(path, "rb")
if not music then
  print("Downloaded file could not be opened.")
  return
end

local data = music:read("*a")
music:close()

if not data or #data == 0 then
  print("Downloaded file is empty.")
  return
end

print("Downloaded: " .. #data .. " bytes")
print("Writing to tape...")

tape.stop()
tape.seek(0)
tape.write(data)

print("Transfer command completed.")
print("Rewind and play with tape.play().")

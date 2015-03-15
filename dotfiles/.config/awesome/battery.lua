-- This function returns a formatted string with the current battery status. It
-- can be used to populate a text widget in the awesome window manager. Based
-- on the "Gigamo Battery Widget" found in the wiki at awesome.naquadah.org

local naughty = require("naughty")
local beautiful = require("beautiful")

function batteryInfo()
  local fac = io.open('/sys/class/power_supply/AC/online')
  local fcur0 = io.open("/sys/class/power_supply/BAT0/charge_now")
  local fcap0 = io.open("/sys/class/power_supply/BAT0/charge_full")
  local fcur1 = io.open("/sys/class/power_supply/BAT1/energy_now")
  local fcap1 = io.open("/sys/class/power_supply/BAT1/energy_full")
  ac = fac:read()
  cur0 = fcur0:read()
  cap0 = fcap0:read()
  fac:close()
  fcur0:close()
  fcap0:close()
  local battery0 = math.floor(cur0 * 100 / cap0)
  local battery1 = nil

  if(fcur1) then
      cur1 = fcur1:read()
      cap1 = fcap1:read()
      fcur1:close()
      fcap1:close()
      local battery1 = math.floor(cur1 * 100 / cap1)
  end

  if ac:match("1") then
    icon = "AC⚡ | "
  else
    icon = ""
    if tonumber(battery0) < 15 then
      naughty.notify({ title    = "Battery Warning"
             , text     = "Battery low!".."  "..battery0.."%  ".."left!"
             , timeout  = 5
             , position = "top_right"
             , fg       = beautiful.fg_focus
             , bg       = beautiful.bg_focus
      })
    end
  end

  if battery1 then
      return " "..icon..battery0.."% | "..battery1.."% "
  else
      return " "..icon..battery0.."%"
  end
end

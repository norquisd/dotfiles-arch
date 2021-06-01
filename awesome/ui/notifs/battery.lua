local gfs = require("gears.filesystem")
local naughty = require("naughty")
local awful = require("awful")

local display_full = true
local display_low = true
local display_critical = true

awesome.connect_signal("signal::battery", function(value)
    if (value < 11 and display_low) then
        naughty.notification({
            title = "Battery Status",
            text = "Running low at " .. value .. "%",
            image = gfs.get_configuration_dir() .. "icons/ghosts/battery.png"
        })
        display_low = false
    end

    if (value < 2 and display_critical and not display_low) then
        naughty.notification({
            title = "Battery Status",
            text = "Critical battery level, system will suspend soon!",
            image = gfs.get_configuration_dir() .. "icons/ghosts/battery.png"
        })
        display_critical = false
    end

    if (value > 98 and display_full) then
        naughty.notification({
            title = "Battery Status",
            text = "Battery Charged",
            image = gfs.get_configuration_dir() .. "icons/ghosts/battery.png"

        })
        display_full = false
    end
end)

awesome.connect_signal("signal::charger", function(plugged)
    if plugged then
        naughty.notification({
            title = "Battery Status",
            text = "Charging",
            image = gfs.get_configuration_dir() ..
                "icons/ghosts/battery_charging.png"
        })
        display = true
    end

end)

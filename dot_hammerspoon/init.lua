function switchDisplay(name)
    if name == "Home 1" then
        hs.alert("Home 1")
        hs.execute("~/.hammerspoon/ext/screen-home1.sh")
    elseif name == "Home 2" then
        hs.alert("Home 2")
        hs.execute("~/.hammerspoon/ext/screen-home2.sh")
    elseif name == "Office" then
        hs.alert("Office")
    elseif name == "Projector" then
        hs.alert("Projector")
    end
end

local choices = {
    { title = "Home 1", fn = function() switchDisplay("Home 1") end },
    { title = "Home 2", fn = function() switchDisplay("Home 2") end },
    { title = "Office", fn = function() switchDisplay("Office") end },
    { title = "Projector", fn = function() switchDisplay("Projector") end }
}

function closeAllWindowsExceptFirefox()
    -- Get a list of all running applications
    local apps = hs.application.runningApplications()
    for _, app in pairs(apps) do
        -- If the app is not Firefox
        if app:name() ~= "Firefox" then
            -- Get all windows of the app
            local windows = app:allWindows()
            -- Close each window
            for _, win in pairs(windows) do
                win:close()
            end
        end
    end
end

dispSwitcher = hs.menubar.new()
dispSwitcher:setTitle("Displays")
dispSwitcher:setMenu(choices)
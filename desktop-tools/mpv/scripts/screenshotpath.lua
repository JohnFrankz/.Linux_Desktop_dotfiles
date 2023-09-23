mp.register_event('start-file', function()
    local filepath = mp.get_property("path")
    local parentdir = string.match(filepath, ".*/(.*)/")
    local baseScreenshotDir = "~/Pictures/Screenshots/mpv"
    if parentdir then
        local screenshotPath = baseScreenshotDir .. "/" .. parentdir
        mp.set_property("options/screenshot-directory", screenshotPath)
    end
end)

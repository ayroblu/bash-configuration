switcher_space = hs.window.switcher.new(hs.window.filter.new():setCurrentSpace(true):setDefaultFilter{})
hs.hotkey.bind({"cmd", "alt"}, "tab", function()
  switcher_space:next()
end)

-- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "H", function()
--   local win = hs.window.focusedWindow()
--   local f = win:frame()
--
--   f.x = f.x - 10
--   win:setFrame(f)
-- end)

--------------------------------------------------------------
function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")

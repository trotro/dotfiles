local function toggleApp(name)
  local app = hs.application.find(name)
  if not app or app:isHidden() then
    hs.application.launchOrFocus(name)
  elseif hs.application.frontmostApplication() ~= app then
    app:activate()
  else
    app:hide()
  end
end

-- Global terminal toggle
hs.hotkey.bind({}, "F1", function() toggleApp("alacritty") end)
hs.hotkey.bind({}, "F2", function() toggleApp("bitwarden") end)
hs.hotkey.bind({}, "F3", function() toggleApp("zed") end)

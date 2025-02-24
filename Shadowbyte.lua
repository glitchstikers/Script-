local CoreURL = "https://raw.githubusercontent.com/glitchstikers/Script-/refs/heads/main/Core.lua" 

local success, CoreScript = pcall(function()
    return loadstring(game:HttpGet(CoreURL))()
end)

if success and CoreScript then
    CoreScript:Init()
    print("[ShadowByte] Successfully Loaded Core!")
else
    warn("[ShadowByte] Core Load Failed")
end

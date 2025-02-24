local CoreURL = "https://yourdomain.com/core.lua"

local success, CoreScript = pcall(function()
    return loadstring(game:HttpGet(CoreURL))()
end)

if success and CoreScript then
    CoreScript:LoadGameScript()
    print("[ShadowByte] Successfully Loaded Core!")
else
    warn("[ShadowByte] Core Load Failed")
end

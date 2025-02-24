local Core = {}

Core.Games = {
    [123456789] = "https://yourdomain.com/testgame.lua"
}

function Core:LoadGameScript()
    local gameID = game.PlaceId
    local scriptURL = self.Games[gameID]

    if scriptURL then
        print("[ShadowByte] Loading script for Game ID: " .. gameID)
        local success, scriptFunc = pcall(loadstring(game:HttpGet(scriptURL)))
        if success and scriptFunc then
            scriptFunc()
            print("[ShadowByte] Successfully Loaded Script for Game ID: " .. gameID)
        else
            warn("[ShadowByte] Failed to Load Script for Game ID: " .. gameID)
        end
    else
        warn("[ShadowByte] No script found for Game ID: " .. gameID)
    end
end

return Core

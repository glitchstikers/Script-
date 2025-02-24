local Core = {}

Core.Games = {
    [4483381587] = "https://raw.githubusercontent.com/glitchstikers/Script-/refs/heads/main/GameList/TestGame.lua"
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

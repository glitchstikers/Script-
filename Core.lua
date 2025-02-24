local Core = {}

Core.GameList = {
    [4483381587] = "https://raw.githubusercontent.com/glitchstikers/Script-/refs/heads/main/GameList/TestGame.lua" -- Replace with actual game IDs and script URLs
}

function Core:LoadGameScript()
    local placeId = game.PlaceId
    local scriptURL = self.GameList[placeId]

    if scriptURL then
        local success, scriptFunc = pcall(loadstring(game:HttpGet(scriptURL)))
        if success and scriptFunc then
            scriptFunc()
            print("[Core] Successfully Loaded Script for Game ID: " .. placeId)
        else
            warn("[Core] Failed to Load Script for Game ID: " .. placeId)
        end
    else
        warn("[Core] No Supported Script for this Game.")
    end
end

return Core

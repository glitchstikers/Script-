local Core = {}

Core.GameList = {
    [1234567890] = "https://yourdomain.com/game1.lua", -- Replace with actual game IDs and script URLs
    [9876543210] = "https://yourdomain.com/game2.lua"
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

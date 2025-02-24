local ShadowByte = {}

ShadowByte.Config = {
    Debug = true,
    AutoExecute = true,
    UIEnabled = true
}

-- List of supported game IDs for auto-loading
ShadowByte.SupportedGames = {
    [4483381587] = "TestGame"
}

function ShadowByte:Log(message)
    if self.Config.Debug then
        print("[ShadowByte] " .. message)
    end
end

function ShadowByte:LoadCore()
    local placeId = game.PlaceId

    if self.SupportedGames[placeId] then
        self:Log("Loading ShadowByte Core for game ID: " .. placeId)
        local coreURL = "https://yourdomain.com/core.lua"
        local success, CoreScript = pcall(function()
            return loadstring(game:HttpGet(coreURL))()
        end)

        if success and CoreScript then
            CoreScript:Init()
            self:Log("ShadowByte Core Successfully Loaded!")
        else
            warn("[ShadowByte] Core Load Failed")
        end
    else
        self:Log("Game ID not supported: " .. placeId)
    end
end

function ShadowByte:Init()
    self:Log("Initializing ShadowByte Core...")
    
    if self.Config.AutoExecute then
        self:LoadCore()
    end

    self:Log("ShadowByte Core Initialization Complete!")
end

return ShadowByte

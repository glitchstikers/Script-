local ShadowByte = {}

ShadowByte.Config = {
    Debug = true,
    AutoExecute = true,
    UIEnabled = true
}

ShadowByte.Scripts = {
    {Name = "Script 1", URL = "https://yourdomain.com/script1.lua"},
    {Name = "Script 2", URL = "https://yourdomain.com/script2.lua"},
    {Name = "Script 3", URL = "https://yourdomain.com/script3.lua"}
}

function ShadowByte:Log(message)
    if self.Config.Debug then
        print("[ShadowByte] " .. message)
    end
end

function ShadowByte:LoadScript(scriptData)
    local success, scriptFunc = pcall(loadstring(game:HttpGet(scriptData.URL)))
    if success and scriptFunc then
        scriptFunc()
        self:Log("Successfully Loaded: " .. scriptData.Name)
        self:Notify("Success", scriptData.Name .. " Loaded Successfully!")
    else
        warn("[ShadowByte] Failed to Load: " .. scriptData.Name)
        self:Notify("Error", scriptData.Name .. " Failed to Load!")
    end
end

function ShadowByte:LoadAll()
    for _, scriptData in ipairs(self.Scripts) do
        self:LoadScript(scriptData)
    end
    self:Notify("Success", "All Scripts Loaded Successfully!")
end

function ShadowByte:CreateUI()
    local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
    local Window = Rayfield:CreateWindow({
        Name = "ShadowByte Executor",
        LoadingTitle = "ShadowByte Framework",
        LoadingSubtitle = "by Dev",
        Theme = "Default",
        DisableRayfieldPrompts = false
    })

    local MainTab = Window:CreateTab("Scripts", 4483362458)
    local Section = MainTab:CreateSection("Available Scripts")

    for _, scriptData in ipairs(self.Scripts) do
        MainTab:CreateButton({
            Name = scriptData.Name,
            Callback = function()
                self:LoadScript(scriptData)
            end
        })
    end
end

function ShadowByte:Notify(title, content)
    local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
    Rayfield:Notify({
        Title = title,
        Content = content,
        Duration = 5,
        Image = 4483362458
    })
end

function ShadowByte:Init()
    self:Log("Initializing ShadowByte...")
    self:Notify("ShadowByte", "Initializing ShadowByte...")

    if self.Config.AutoExecute then
        self:LoadAll()
    end
    if self.Config.UIEnabled then
        self:CreateUI()
    end

    self:Log("ShadowByte Initialization Complete!")
    self:Notify("Success", "ShadowByte Successfully Loaded!")
end

return ShadowByte

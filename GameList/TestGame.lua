local CurrentVersion = "Shadowbyte | TestScript"

-- Safely call the Rayfield UI Library
local success, Rayfield = pcall(function()
    return loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
end)

if not success or not Rayfield then
    warn("Failed to load Rayfield UI Library.")
    return
end

-- Create the main UI window
local Window = Rayfield:CreateWindow({
    Name = CurrentVersion,
    Icon = 0,
    LoadingTitle = "Rayfield Interface Suite",
    LoadingSubtitle = "by Sirius",
    Theme = "Default",

    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,

    ConfigurationSaving = {
        Enabled = true,
        FolderName = "Shadowbyte",
        FileName = "Config"
    },

    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    }
})

-- Create UI Tabs
local MainTab = Window:CreateTab("Main", 4483362458)

-- Create a Section inside the MainTab
local Section = MainTab:CreateSection("Support")

-- Add a notification function
Rayfield:Notify({
    Title = "Welcome!",
    Content = "Shadowbyte | TestScript Loaded Successfully!",
    Duration = 6.5,
    Image = 4483362458,
})

print("✅ Shadowbyte | TestScript Loaded Successfully!")

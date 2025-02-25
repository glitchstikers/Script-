-- Call the Library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Main Window
local Window = Rayfield:CreateWindow({
   Name = "Rayfield Example Window",
   Icon = "4483362458",  -- Must be a valid Roblox asset ID
   LoadingTitle = "Rayfield Interface Suite",
   LoadingSubtitle = "by Sirius",
   Theme = "Default",

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = true,
      FolderName = "RayfieldConfigs", -- Folder in workspace
      FileName = "BigHub_Config"
   },

   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   }
})

-- Create "Main" Tab
local MainTab = Window:CreateTab("Main", 4483362458)

-- Create Section
local UpdatesSection = MainTab:CreateSection("Updates")

-- Create Button
local ExampleButton = MainTab:CreateButton({
   Name = "Click Me!",
   Callback = function()
      print("Button clicked successfully!")
   end
})

-- Create Toggle
local ExampleToggle = MainTab:CreateToggle({
   Name = "Enable Feature",
   CurrentValue = false,
   Flag = "ExampleToggle",
   Callback = function(Value)
      print("Toggle state:", Value)
   end
})

-- Create Slider
local ExampleSlider = MainTab:CreateSlider({
   Name = "Adjust Speed",
   Range = {1, 100},
   Increment = 1,
   CurrentValue = 50,
   Flag = "SpeedSlider",
   Callback = function(Value)
      print("Slider value:", Value)
   end
})

-- Create Input Box
local ExampleInput = MainTab:CreateInput({
   Name = "Enter Text",
   PlaceholderText = "Type something...",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
      print("User entered:", Text)
   end
})

-- Show Notification
Rayfield:Notify({
   Title = "Welcome!",
   Content = "Rayfield UI Loaded Successfully",
   Duration = 5,
   Image = "4483362458"
})

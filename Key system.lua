local DataStoreService = game:GetService("DataStoreService")
local keyStore = DataStoreService:GetDataStore("KeyStorage")

local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Main UI Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.3, 0, 0.35, 0)
frame.Position = UDim2.new(0.35, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BackgroundTransparency = 0.15
frame.BorderSizePixel = 0
frame.Parent = screenGui

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 12)
uiCorner.Parent = frame

-- Close Button (X)
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0.1, 0, 0.15, 0)
closeButton.Position = UDim2.new(0.9, -10, 0, -5)
closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 18
closeButton.Parent = frame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 8)
closeCorner.Parent = closeButton

closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- Title Label
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0.2, 0)
title.BackgroundTransparency = 1
title.Text = "🔑 ShadowByte Key System"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 22
title.Parent = frame

-- Key Input Box
local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0.8, 0, 0.2, 0)
textBox.Position = UDim2.new(0.1, 0, 0.3, 0)
textBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
textBox.PlaceholderText = "Enter your key here..."
textBox.PlaceholderColor3 = Color3.fromRGB(180, 180, 180)
textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
textBox.Font = Enum.Font.Gotham
textBox.TextSize = 18
textBox.ClearTextOnFocus = false
textBox.Parent = frame

local uiCornerTextBox = Instance.new("UICorner")
uiCornerTextBox.CornerRadius = UDim.new(0, 8)
uiCornerTextBox.Parent = textBox

-- Enter Key Button
local enterKeyButton = Instance.new("TextButton")
enterKeyButton.Size = UDim2.new(0.8, 0, 0.15, 0)
enterKeyButton.Position = UDim2.new(0.1, 0, 0.55, 0)
enterKeyButton.BackgroundColor3 = Color3.fromRGB(45, 140, 255)
enterKeyButton.Text = "✅ Enter Key"
enterKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
enterKeyButton.Font = Enum.Font.GothamBold
enterKeyButton.TextSize = 18
enterKeyButton.Parent = frame

local uiCornerEnter = Instance.new("UICorner")
uiCornerEnter.CornerRadius = UDim.new(0, 8)
uiCornerEnter.Parent = enterKeyButton

-- Get Key Button
local getKeyButton = Instance.new("TextButton")
getKeyButton.Size = UDim2.new(0.8, 0, 0.15, 0)
getKeyButton.Position = UDim2.new(0.1, 0, 0.75, 0)
getKeyButton.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
getKeyButton.Text = "🔗 Get Key"
getKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
getKeyButton.Font = Enum.Font.GothamBold
getKeyButton.TextSize = 18
getKeyButton.Parent = frame

local uiCornerGet = Instance.new("UICorner")
uiCornerGet.CornerRadius = UDim.new(0, 8)
uiCornerGet.Parent = getKeyButton

-- Copy Key Link
local function setClipboardWithURL()
    setclipboard("https://yourkeywebsite.com")
    game.StarterGui:SetCore("SendNotification", {
        Title = "Key Copied!",
        Text = "Go to the website to get your key.",
        Duration = 5
    })
end
getKeyButton.MouseButton1Click:Connect(setClipboardWithURL)

-- Save & Load Key
local function saveKey(key)
    pcall(function()
        keyStore:SetAsync(player.UserId, key)
    end)
end

local function loadKey()
    local success, storedKey = pcall(function()
        return keyStore:GetAsync(player.UserId)
    end)
    return success and storedKey or nil
end

-- Key Authentication
local function enterKey()
    local userInputKey = textBox.Text
    local correctKey = "your_key_here"

    if userInputKey == correctKey then
        saveKey(userInputKey)

        local scriptURL = "https://yourdomain.com/script.lua"
        local success, result = pcall(function()
            return loadstring(game:HttpGet(scriptURL))()
        end)

        if success then
            screenGui:Destroy()
        else
            game.StarterGui:SetCore("SendNotification", {
                Title = "Error",
                Text = "Failed to load script. Check the console.",
                Duration = 10
            })
        end
    else
        game.StarterGui:SetCore("SendNotification", {
            Title = "Wrong Key",
            Text = "You entered the wrong key!",
            Duration = 5
        })
    end
end

enterKeyButton.MouseButton1Click:Connect(enterKey)

-- Auto-load if key exists
local storedKey = loadKey()
if storedKey == "your_key_here" then
    local scriptURL = "https://yourdomain.com/script.lua"
    local success, result = pcall(function()
        return loadstring(game:HttpGet(scriptURL))()
    end)

    if success then
        screenGui:Destroy()
    else
        game.StarterGui:SetCore("SendNotification", {
            Title = "Error",
            Text = "Failed to load script. Check the console.",
            Duration = 10
        })
    end
end

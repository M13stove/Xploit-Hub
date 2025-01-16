local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostDuckyy/Ui-Librarys/main/Gerad's/source.lua"))()

local Window = Library:CreateWindow('Xploit Hub') -- :CreateWindow(Title)

local Section = Window:Section('Hacks') -- :Section(Title)

-- Toggle for Invisibility
Section:Toggle('Invisible', {flag = 'Toggle1'}, function(value)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()

    if value then
        -- Make the character invisible
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                part.Transparency = 1
                part.CanCollide = false
            elseif part:IsA("Decal") then
                part.Transparency = 1
            end
        end
        character.HumanoidRootPart.Transparency = 1 -- Ensure RootPart is invisible
        print('Toggle1True - Invisible')
    else
        -- Make the character visible
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                part.Transparency = 0
                part.CanCollide = true
            elseif part:IsA("Decal") then
                part.Transparency = 0
            end
        end
        character.HumanoidRootPart.Transparency = 0 -- Ensure RootPart is visible again
        print('Toggle1False - Visible')
    end
end)

-- Slider for Speed Adjustment
Section:Slider('Speed', {flag = 'SpeedSlider'; Min = 16; Max = 500; Default = 16; Precise = false}, function(val)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")

    humanoid.WalkSpeed = val
    print('Speed set to:', val)
end)

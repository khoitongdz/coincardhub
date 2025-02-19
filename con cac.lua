-- Script Hiệu Ứng Triệu Hồi Đảo Leviathan trong Blox Fruits (Hỗ trợ Full Executor)
if not game or not game.Players or not game.Players.LocalPlayer then return end

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

if not humanoidRootPart then return end

-- Hiệu ứng rung màn hình (Camera Shake)
local tweenService = game:GetService("TweenService")
local camera = game.Workspace.CurrentCamera
local originalCFrame = camera.CFrame

for i = 1, 10 do
    local shakeOffset = Vector3.new(math.random(-2, 2), math.random(-2, 2), math.random(-2, 2)) * 0.2
    camera.CFrame = originalCFrame * CFrame.new(shakeOffset)
    task.wait(0.1)
end
camera.CFrame = originalCFrame

-- Hiệu ứng sấm sét
for i = 1, 5 do
    local lightning = Instance.new("Part")
    lightning.Size = Vector3.new(1, 20, 1)
    lightning.Material = Enum.Material.Neon
    lightning.BrickColor = BrickColor.new("Bright yellow")
    lightning.Anchored = true
    lightning.CanCollide = false
    lightning.CFrame = humanoidRootPart.CFrame * CFrame.new(math.random(-10, 10), 10, math.random(-10, 10))
    lightning.Parent = game.Workspace
    
    game:GetService("Debris"):AddItem(lightning, 0.3)
    task.wait(0.2)
end

-- Hiệu ứng sóng nước
local wave = Instance.new("Part")
wave.Size = Vector3.new(20, 1, 20)
wave.Material = Enum.Material.SmoothPlastic
wave.BrickColor = BrickColor.new("Cyan")
wave.Anchored = true
wave.Transparency = 0.5
wave.CFrame = humanoidRootPart.CFrame * CFrame.new(0, -3, 0)
wave.Parent = game.Workspace

game:GetService("Debris"):AddItem(wave, 3)

-- Hiệu ứng tuyết rơi
for i = 1, 50 do
    local snowflake = Instance.new("Part")
    snowflake.Size = Vector3.new(0.5, 0.5, 0.5)
    snowflake.Material = Enum.Material.SmoothPlastic
    snowflake.BrickColor = BrickColor.new("White")
    snowflake.Anchored = true
    snowflake.CanCollide = false
    snowflake.CFrame = humanoidRootPart.CFrame * CFrame.new(math.random(-15, 15), math.random(10, 20), math.random(-15, 15))
    snowflake.Parent = game.Workspace
    
    game:GetService("Debris"):AddItem(snowflake, math.random(2, 5))
    task.wait(0.1)
end

-- Triệu hồi đảo Leviathan
local leviathanIsland = Instance.new("Part")
leviathanIsland.Size = Vector3.new(100, 50, 100)
leviathanIsland.Material = Enum.Material.Rock
leviathanIsland.BrickColor = BrickColor.new("Dark stone grey")
leviathanIsland.Anchored = true
leviathanIsland.Position = humanoidRootPart.Position + Vector3.new(0, -10, 0)
leviathanIsland.Parent = game.Workspace

game:GetService("TweenService"):Create(leviathanIsland, TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = humanoidRootPart.Position + Vector3.new(0, 5, 0)}):Play()

game:GetService("Debris"):AddItem(leviathanIsland, 60) -- Hòn đảo tồn tại 60 giây

-- Thông báo triệu hồi đảo
local message = Instance.new("Message", game.Workspace)
message.Text = "⚡ Đảo Leviathan đang xuất hiện... ⚡"
task.wait(3)
message:Destroy()

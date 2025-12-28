--不想玩墨水
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- 等待角色加载
task.wait(0.5)

-- 应用无头
local function applyNoHead(char)
    local head = char:FindFirstChild("Head")
    if head then
        head.Transparency = 1
        local face = head:FindFirstChild("face")
        if face then face.Transparency = 1 end
        
        -- 保留头发
        for _, accessory in ipairs(char:GetChildren()) do
            if accessory:IsA("Accessory") and accessory:FindFirstChild("Handle") then
                accessory.Handle.Transparency = 0
            end
        end
        print(" 头部已隐藏，头发保留")
    end
end

applyNoHead(character)

-- 自动重生应用
player.CharacterAdded:Connect(function(newChar)
    task.wait(0.5)
    applyNoHead(newChar)
    print("🔄 无头效果已重新应用")
end)

print(" 无头脚本已激活！（保留头发）")

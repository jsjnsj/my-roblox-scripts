-- ==========================================================
--  皇帝脚本 豪华版（横屏布局 + 最小化 + 公告系统）
-- ==========================================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- 现代UI设计
local UI = Instance.new("Frame")
UI.Name = "ModernKeySystem"
UI.Parent = ScreenGui
UI.Active = true
UI.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
UI.BorderSizePixel = 0
UI.Position = UDim2.new(0.5, -180, 0.5, -100)
UI.Size = UDim2.new(0, 360, 0, 300)
UI.Draggable = true

-- 圆角效果
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = UI

-- 顶部栏
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Parent = UI
TopBar.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
TopBar.BorderSizePixel = 0
TopBar.Size = UDim2.new(1, 0, 0, 40)

local TopBarCorner = Instance.new("UICorner")
TopBarCorner.CornerRadius = UDim.new(0, 12)
TopBarCorner.Parent = TopBar

-- 标题
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Parent = TopBar
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 15, 0, 0)
Title.Size = UDim2.new(0, 200, 1, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "👑 皇帝脚本认证系统"
Title.TextColor3 = Color3.fromRGB(255, 215, 0)
Title.TextSize = 18
Title.TextXAlignment = Enum.TextXAlignment.Left

-- 控制按钮
local CloseBtn = Instance.new("TextButton")
CloseBtn.Name = "CloseBtn"
CloseBtn.Parent = TopBar
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
CloseBtn.BorderSizePixel = 0
CloseBtn.Position = UDim2.new(1, -35, 0.5, -10)
CloseBtn.Size = UDim2.new(0, 20, 0, 20)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Text = "×"
CloseBtn.TextColor3 = Color3.new(1, 1, 1)
CloseBtn.TextSize = 16

local MinBtn = Instance.new("TextButton")
MinBtn.Name = "MinBtn"
MinBtn.Parent = TopBar
MinBtn.BackgroundColor3 = Color3.fromRGB(255, 180, 0)
MinBtn.BorderSizePixel = 0
MinBtn.Position = UDim2.new(1, -65, 0.5, -10)
MinBtn.Size = UDim2.new(0, 20, 0, 20)
MinBtn.Font = Enum.Font.GothamBold
MinBtn.Text = "_"
MinBtn.TextColor3 = Color3.new(1, 1, 1)
MinBtn.TextSize = 16

-- 装饰线条
local DecorationLine = Instance.new("Frame")
DecorationLine.Parent = TopBar
DecorationLine.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
DecorationLine.BorderSizePixel = 0
DecorationLine.Position = UDim2.new(0, 0, 1, -2)
DecorationLine.Size = UDim2.new(1, 0, 0, 2)

-- 内容区域
local Content = Instance.new("Frame")
Content.Name = "Content"
Content.Parent = UI
Content.BackgroundTransparency = 1
Content.Position = UDim2.new(0, 0, 0, 40)
Content.Size = UDim2.new(1, 0, 1, -40)

-- 图标
local Icon = Instance.new("ImageLabel")
Icon.Name = "Icon"
Icon.Parent = Content
Icon.BackgroundTransparency = 1
Icon.Position = UDim2.new(0.5, -40, 0.1, 0)
Icon.Size = UDim2.new(0, 80, 0, 80)
Icon.Image = "rbxassetid://7072717642" -- 皇冠图标

-- 输入框
local Key = Instance.new("TextBox")
Key.Name = "Key"
Key.Parent = Content
Key.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
Key.BorderSizePixel = 0
Key.Position = UDim2.new(0.1, 0, 0.5, 0)
Key.Size = UDim2.new(0.8, 0, 0, 45)
Key.Font = Enum.Font.Gotham
Key.PlaceholderText = "🔑 请输入访问密钥..."
Key.Text = ""
Key.TextColor3 = Color3.new(1, 1, 1)
Key.TextSize = 16
Key.PlaceholderColor3 = Color3.fromRGB(180, 180, 180)

local KeyCorner = Instance.new("UICorner")
KeyCorner.CornerRadius = UDim.new(0, 8)
KeyCorner.Parent = Key

-- 按钮
local Start = Instance.new("TextButton")
Start.Name = "Start"
Start.Parent = Content
Start.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
Start.BorderSizePixel = 0
Start.Position = UDim2.new(0.2, 0, 0.75, 0)
Start.Size = UDim2.new(0.6, 0, 0, 45)
Start.Font = Enum.Font.GothamBold
Start.Text = "🚀 验证并进入"
Start.TextColor3 = Color3.fromRGB(30, 30, 40)
Start.TextSize = 18

local StartCorner = Instance.new("UICorner")
StartCorner.CornerRadius = UDim.new(0, 8)
StartCorner.Parent = Start

-- 公告标签
local Announcement = Instance.new("TextLabel")
Announcement.Name = "Announcement"
Announcement.Parent = Content
Announcement.BackgroundTransparency = 1
Announcement.Position = UDim2.new(0.1, 0, 0.9, 0)
Announcement.Size = UDim2.new(0.8, 0, 0, 20)
Announcement.Font = Enum.Font.Gotham
Announcement.Text = "📢 最新公告: 欢迎使用皇帝脚本 v2.0"
Announcement.TextColor3 = Color3.fromRGB(255, 215, 0)
Announcement.TextSize = 12
Announcement.TextXAlignment = Enum.TextXAlignment.Center

-- 按钮悬停效果
local function addButtonHover(button)
    button.MouseEnter:Connect(function()
        game:GetService("TweenService"):Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 230, 100)}):Play()
    end)
    
    button.MouseLeave:Connect(function()
        game:GetService("TweenService"):Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 215, 0)}):Play()
    end)
end

addButtonHover(Start)

-- 控制按钮功能
CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

MinBtn.MouseButton1Click:Connect(function()
    Content.Visible = not Content.Visible
    UI.Size = Content.Visible and UDim2.new(0, 360, 0, 300) or UDim2.new(0, 360, 0, 40)
end)

-- ==========================================================
--  卡密验证 → 欢迎语 → 主脚本
-- ==========================================================
Start.MouseButton1Click:Connect(function()
    -- 添加第二个卡密"小秋无敌"
    if Key.Text == "皇帝最帅" or Key.Text == "小秋无敌" then
        -- 按钮点击动画
        Start.Text = "✅ 验证成功!"
        task.wait(0.5)
        
        UI.Visible = false
        
        -- 豪华欢迎界面
        local Welcome = Instance.new("ScreenGui")
        Welcome.Name = "WelcomeGui"
        Welcome.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
        Welcome.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

        local Background = Instance.new("Frame")
        Background.Parent = Welcome
        Background.Size = UDim2.new(1, 0, 1, 0)
        Background.BackgroundColor3 = Color3.new(0, 0, 0)
        Background.BackgroundTransparency = 0.3
        Background.ZIndex = 1

        local W = Instance.new("ImageLabel")
        W.Name = "WelcomeFrame"
        W.Parent = Welcome
        W.AnchorPoint = Vector2.new(0.5, 0.5)
        W.Position = UDim2.new(0.5, 0, 0.5, 0)
        W.Size = UDim2.new(0, 0, 0, 0)
        W.BackgroundTransparency = 1
        W.Image = "rbxassetid://5554959339" -- 现代对话框背景
        W.ImageColor3 = Color3.fromRGB(30, 30, 40)
        W.ScaleType = Enum.ScaleType.Slice
        W.SliceCenter = Rect.new(128, 128, 128, 128)
        W.ZIndex = 2

        local WelcomeIcon = Instance.new("ImageLabel")
        WelcomeIcon.Parent = W
        WelcomeIcon.AnchorPoint = Vector2.new(0.5, 0)
        WelcomeIcon.Position = UDim2.new(0.5, 0, 0.1, 0)
        WelcomeIcon.Size = UDim2.new(0, 80, 0, 80)
        WelcomeIcon.BackgroundTransparency = 1
        WelcomeIcon.Image = "rbxassetid://7072717642"
        WelcomeIcon.ZIndex = 3

        local T = Instance.new("TextLabel")
        T.Name = "Title"
        T.Parent = W
        T.Size = UDim2.new(0.8, 0, 0.3, 0)
        T.Position = UDim2.new(0.1, 0, 0.3, 0)
        T.BackgroundTransparency = 1
        T.Text = "👑 欢迎使用皇帝脚本！"
        T.Font = Enum.Font.GothamBold
        T.TextColor3 = Color3.fromRGB(255, 215, 0)
        T.TextSize = 24
        T.TextScaled = false
        T.ZIndex = 3

        local SubTitle = Instance.new("TextLabel")
        SubTitle.Parent = W
        SubTitle.Size = UDim2.new(0.8, 0, 0.2, 0)
        SubTitle.Position = UDim2.new(0.1, 0, 0.5, 0)
        SubTitle.BackgroundTransparency = 1
        SubTitle.Text = "v2.0 豪华版 • 功能全面升级"
        SubTitle.Font = Enum.Font.Gotham
        SubTitle.TextColor3 = Color3.new(1, 1, 1)
        SubTitle.TextSize = 16
        SubTitle.ZIndex = 3

        local B = Instance.new("TextButton")
        B.Name = "EnterButton"
        B.Parent = W
        B.Size = UDim2.new(0.4, 0, 0.15, 0)
        B.Position = UDim2.new(0.5, 0, 0.8, 0)
        B.AnchorPoint = Vector2.new(0.5, 0.5)
        B.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
        B.BorderSizePixel = 0
        B.Font = Enum.Font.GothamBold
        B.Text = "立即进入"
        B.TextColor3 = Color3.fromRGB(30, 30, 40)
        B.TextSize = 18
        B.ZIndex = 3

        local Corner = Instance.new("UICorner")
        Corner.CornerRadius = UDim.new(0, 8)
        Corner.Parent = B

        -- 入场动画
        W:TweenSize(UDim2.new(0, 400, 0, 300),
                    Enum.EasingDirection.Out,
                    Enum.EasingStyle.Back,
                    0.8, true)

        -- 自动进入
        local autoEnter = task.delay(5, function()
            if Welcome.Parent then 
                Welcome:Destroy() 
                loadMainScript()
            end
        end)

        B.MouseButton1Click:Connect(function()
            task.cancel(autoEnter)
            Welcome:Destroy()
            loadMainScript()
        end)
    else
        -- 错误提示
        local originalText = Start.Text
        Start.Text = "❌ 密钥错误!"
        Start.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
        
        task.wait(1)
        
        Start.Text = originalText
        Start.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
    end
end)

-- ==========================================================
--  主脚本（横屏布局 + 最小化 + 公告系统）
-- ==========================================================
function loadMainScript()
    local Players = game:GetService("Players")
    local Run = game:GetService("RunService")
    local TweenService = game:GetService("TweenService")
    local LP = Players.LocalPlayer

    -- 清理旧界面
    if LP.PlayerGui:FindFirstChild("MainGUI") then 
        LP.PlayerGui.MainGUI:Destroy() 
    end

    -- 主界面
    local gui = Instance.new("ScreenGui")
    gui.Name = "MainGUI"
    gui.Parent = LP.PlayerGui
    gui.ResetOnSpawn = false

    -- 主窗口 - 横屏布局
    local mainWindow = Instance.new("Frame")
    mainWindow.Size = UDim2.new(0, 600, 0, 320)  -- 横屏尺寸
    mainWindow.Position = UDim2.new(0.5, -300, 0.1, 0)  -- 居中偏上
    mainWindow.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    mainWindow.BorderSizePixel = 0
    mainWindow.Active = true
    mainWindow.Draggable = true
    mainWindow.Parent = gui

    local mainCorner = Instance.new("UICorner")
    mainCorner.CornerRadius = UDim.new(0, 12)
    mainCorner.Parent = mainWindow

    -- 顶部栏
    local topBar = Instance.new("Frame")
    topBar.Size = UDim2.new(1, 0, 0, 35)
    topBar.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
    topBar.BorderSizePixel = 0
    topBar.Parent = mainWindow

    local topBarCorner = Instance.new("UICorner")
    topBarCorner.CornerRadius = UDim.new(0, 12)
    topBarCorner.Parent = topBar

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(0, 200, 1, 0)
    title.BackgroundTransparency = 1
    title.Text = "皇帝脚本控制台"
    title.Font = Enum.Font.GothamBold
    title.TextSize = 16
    title.TextColor3 = Color3.fromRGB(255, 215, 0)
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = topBar
    title.Position = UDim2.new(0, 15, 0, 0)

    -- 控制按钮
    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 20, 0, 20)
    closeBtn.Position = UDim2.new(1, -30, 0.5, -10)
    closeBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
    closeBtn.BorderSizePixel = 0
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.Text = "×"
    closeBtn.TextColor3 = Color3.new(1, 1, 1)
    closeBtn.TextSize = 14
    closeBtn.Parent = topBar

    local minBtn = Instance.new("TextButton")
    minBtn.Size = UDim2.new(0, 20, 0, 20)
    minBtn.Position = UDim2.new(1, -55, 0.5, -10)
    minBtn.BackgroundColor3 = Color3.fromRGB(255, 180, 0)
    minBtn.BorderSizePixel = 0
    minBtn.Font = Enum.Font.GothamBold
    minBtn.Text = "_"
    minBtn.TextColor3 = Color3.new(1, 1, 1)
    minBtn.TextSize = 14
    minBtn.Parent = topBar

    -- 装饰线
    local decoLine = Instance.new("Frame")
    decoLine.Parent = topBar
    decoLine.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
    decoLine.BorderSizePixel = 0
    decoLine.Position = UDim2.new(0, 0, 1, -2)
    decoLine.Size = UDim2.new(1, 0, 0, 2)

    -- 信息栏（时间 + 公告）
    local infoBar = Instance.new("Frame")
    infoBar.Size = UDim2.new(1, -20, 0, 25)
    infoBar.Position = UDim2.new(0, 10, 0, 40)
    infoBar.BackgroundTransparency = 1
    infoBar.Parent = mainWindow

    -- 时间显示
    local timeLab = Instance.new("TextLabel")
    timeLab.Size = UDim2.new(0.3, 0, 1, 0)
    timeLab.BackgroundTransparency = 1
    timeLab.Text = "北京时间：--:--:--"
    timeLab.Font = Enum.Font.Gotham
    timeLab.TextSize = 12
    timeLab.TextColor3 = Color3.new(1, 1, 1)
    timeLab.TextXAlignment = Enum.TextXAlignment.Left
    timeLab.Parent = infoBar

    Run.Heartbeat:Connect(function()
        timeLab.Text = "北京时间：" .. os.date("%H时%M分%S秒")
    end)

    -- 公告系统
    local announcements = {
        "欢迎使用皇帝脚本v2.0!",
        "新增横屏布局设计",
        "优化操作体验",
        "更多功能持续更新"
    }
    
    local announcementIndex = 1
    local announcementLab = Instance.new("TextLabel")
    announcementLab.Size = UDim2.new(0.7, 0, 1, 0)
    announcementLab.Position = UDim2.new(0.3, 0, 0, 0)
    announcementLab.BackgroundTransparency = 1
    announcementLab.Text = announcements[1]
    announcementLab.Font = Enum.Font.Gotham
    announcementLab.TextSize = 12
    announcementLab.TextColor3 = Color3.fromRGB(255, 215, 0)
    announcementLab.TextXAlignment = Enum.TextXAlignment.Left
    announcementLab.Parent = infoBar

    -- 公告轮播
    task.spawn(function()
        while announcementLab.Parent do
            task.wait(4)
            announcementIndex = announcementIndex % #announcements + 1
            announcementLab.Text = announcements[announcementIndex]
        end
    end)

    -- ==========================================================
--  滑动链：按钮区 → ScrollingFrame + UIListLayout
-- ==========================================================
local functionContainer = Instance.new("ScrollingFrame")
functionContainer.Size = UDim2.new(1, -20, 1, -80)
functionContainer.Position = UDim2.new(0, 10, 0, 70)
functionContainer.BackgroundTransparency = 1
functionContainer.BorderSizePixel = 0
functionContainer.ScrollBarThickness = 6
functionContainer.ScrollingDirection = Enum.ScrollingDirection.Y
functionContainer.Parent = mainWindow

-- 双列容器（横向排布）
local layout = Instance.new("UIListLayout")
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Padding = UDim.new(0, 8)
layout.Parent = functionContainer

-- 动态画布高度（防止裁切）
layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    functionContainer.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y)
end)

    -- 创建两列网格布局
    local leftColumn = Instance.new("Frame")
    leftColumn.Size = UDim2.new(0.48, 0, 1, 0)
    leftColumn.BackgroundTransparency = 1
    leftColumn.Parent = functionContainer

    local rightColumn = Instance.new("Frame")
    rightColumn.Size = UDim2.new(0.48, 0, 1, 0)
    rightColumn.Position = UDim2.new(0.52, 0, 0, 0)
    rightColumn.BackgroundTransparency = 1
    rightColumn.Parent = functionContainer

    -- 按钮创建函数（横屏紧凑版）
    local function createFeatureButton(parent, text, description, callback)
        local buttonFrame = Instance.new("Frame")
        buttonFrame.Size = UDim2.new(1, 0, 0, 50)
        buttonFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
        buttonFrame.BorderSizePixel = 0
        buttonFrame.Parent = parent

        local buttonCorner = Instance.new("UICorner")
        buttonCorner.CornerRadius = UDim.new(0, 6)
        buttonCorner.Parent = buttonFrame

        local button = Instance.new("TextButton")
        button.Size = UDim2.new(1, 0, 1, 0)
        button.BackgroundTransparency = 1
        button.Font = Enum.Font.Gotham
        button.Text = ""
        button.Parent = buttonFrame

        local titleLabel = Instance.new("TextLabel")
        titleLabel.Size = UDim2.new(1, -10, 0, 25)
        titleLabel.Position = UDim2.new(0, 8, 0, 3)
        titleLabel.BackgroundTransparency = 1
        titleLabel.Text = text
        titleLabel.Font = Enum.Font.GothamBold
        titleLabel.TextColor3 = Color3.new(1, 1, 1)
        titleLabel.TextSize = 14
        titleLabel.TextXAlignment = Enum.TextXAlignment.Left
        titleLabel.Parent = buttonFrame

        local descLabel = Instance.new("TextLabel")
        descLabel.Size = UDim2.new(1, -10, 0, 20)
        descLabel.Position = UDim2.new(0, 8, 0, 28)
        descLabel.BackgroundTransparency = 1
        descLabel.Text = description
        descLabel.Font = Enum.Font.Gotham
        descLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
        descLabel.TextSize = 10
        descLabel.TextXAlignment = Enum.TextXAlignment.Left
        descLabel.Parent = buttonFrame

        -- 悬停效果
        button.MouseEnter:Connect(function()
            TweenService:Create(buttonFrame, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(70, 70, 80)}):Play()
        end)

        button.MouseLeave:Connect(function()
            TweenService:Create(buttonFrame, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 50, 60)}):Play()
        end)

        button.MouseButton1Click:Connect(callback)

        return buttonFrame
    end

    -- 左侧列功能按钮
    local leftLayout = Instance.new("UIListLayout")
    leftLayout.SortOrder = Enum.SortOrder.LayoutOrder
    leftLayout.Padding = UDim.new(0, 8)
    leftLayout.Parent = leftColumn

    createFeatureButton(leftColumn, "极速移动", "提升角色移动速度", function()
        local char = LP.Character or LP.CharacterAdded:Wait()
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then 
            hum.WalkSpeed = 32
            game.StarterGui:SetCore("SendNotification", {
                Title = "极速移动",
                Text = "移动速度已设置为32",
                Duration = 2
            })
        end
    end)

    createFeatureButton(leftColumn, "超级跳跃", "增加角色跳跃高度", function()
        local char = LP.Character or LP.CharacterAdded:Wait()
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then 
            hum.UseJumpPower = true
            hum.JumpPower = 100
            game.StarterGui:SetCore("SendNotification", {
                Title = "超级跳跃",
                Text = "跳跃高度已设置为100",
                Duration = 2
            })
        end
    end)

    createFeatureButton(leftColumn, "飞行模式", "启用无敌飞行功能", function()
        local UserInputService = game:GetService("UserInputService")
        local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
        
        local ok, err = pcall(function()
            if isMobile then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/396abc/Script/refs/heads/main/MobileFly.lua"))()
            else
                loadstring(game:HttpGet("https://raw.githubusercontent.com/396abc/Script/refs/heads/main/FlyR15.lua"))()
            end
        end)
        
        game.StarterGui:SetCore("SendNotification", {
            Title = "飞行模式",
            Text = ok and "飞行功能已启动" or "加载失败",
            Duration = 3
        })
    end)

    -- 右侧列功能按钮
    local rightLayout = Instance.new("UIListLayout")
    rightLayout.SortOrder = Enum.SortOrder.LayoutOrder
    rightLayout.Padding = UDim.new(0, 8)
    rightLayout.Parent = rightColumn

    createFeatureButton(rightColumn, "FPS显示", "切换FPS计数器显示", function()
        -- FPS显示功能实现
        if not _G.FPSDisplay then
            _G.FPSDisplay = Instance.new("TextLabel")
            _G.FPSDisplay.Size = UDim2.new(0, 100, 0, 30)
            _G.FPSDisplay.Position = UDim2.new(1, -110, 0, 10)
            _G.FPSDisplay.BackgroundTransparency = 0.7
            _G.FPSDisplay.BackgroundColor3 = Color3.new(0, 0, 0)
            _G.FPSDisplay.TextColor3 = Color3.new(1, 1, 1)
            _G.FPSDisplay.Font = Enum.Font.Gotham
            _G.FPSDisplay.TextSize = 14
            _G.FPSDisplay.Parent = gui
        else
            _G.FPSDisplay.Visible = not _G.FPSDisplay.Visible
        end
    end)

    createFeatureButton(rightColumn, "无限Yield", "加载无限Yield FE脚本", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end)

    createFeatureButton(rightColumn, "重力调整", "修改世界重力设置", function()
        workspace.Gravity = 50
        game.StarterGui:SetCore("SendNotification", {
            Title = "重力调整",
            Text = "重力已设置为50",
            Duration = 2
        })
    end)

    -- 控制按钮功能
    closeBtn.MouseButton1Click:Connect(function()
        gui:Destroy()
    end)

    minBtn.MouseButton1Click:Connect(function()
        functionContainer.Visible = not functionContainer.Visible
        infoBar.Visible = functionContainer.Visible
        mainWindow.Size = functionContainer.Visible and UDim2.new(0, 600, 0, 320) or UDim2.new(0, 600, 0, 35)
    end)

    -- 浮动控制按钮（类似图片中的样式）
    local floatGui = Instance.new("ScreenGui")
    floatGui.Name = "FloatControls"
    floatGui.Parent = LP.PlayerGui
    floatGui.ResetOnSpawn = false

    -- 飞行按钮
    local flyBtn = Instance.new("TextButton")
    flyBtn.Size = UDim2.new(0, 60, 0, 60)
    flyBtn.Position = UDim2.new(1, -70, 0.5, -30)
    flyBtn.BackgroundColor3 = Color3.fromRGB(138, 43, 226) -- 紫色
    flyBtn.BorderSizePixel = 0
    flyBtn.Text = "飞行"
    flyBtn.Font = Enum.Font.GothamBold
    flyBtn.TextColor3 = Color3.new(1, 1, 1)
    flyBtn.TextSize = 12
    flyBtn.Parent = floatGui

    local flyCorner = Instance.new("UICorner")
    flyCorner.CornerRadius = UDim.new(1, 0)
    flyCorner.Parent = flyBtn

    -- 加速按钮
    local speedBtn = Instance.new("TextButton")
    speedBtn.Size = UDim2.new(0, 60, 0, 60)
    speedBtn.Position = UDim2.new(1, -70, 0.5, 40)
    speedBtn.BackgroundColor3 = Color3.fromRGB(138, 43, 226) -- 紫色
    speedBtn.BorderSizePixel = 0
    speedBtn.Text = "加速"
    speedBtn.Font = Enum.Font.GothamBold
    speedBtn.TextColor3 = Color3.new(1, 1, 1)
    speedBtn.TextSize = 12
    speedBtn.Parent = floatGui

    local speedCorner = Instance.new("UICorner")
    speedCorner.CornerRadius = UDim.new(1, 0)
    speedCorner.Parent = speedBtn

    -- 隐藏按钮
    local hideBtn = Instance.new("TextButton")
    hideBtn.Size = UDim2.new(0, 80, 0, 30)
    hideBtn.Position = UDim2.new(1, -90, 1, -40)
    hideBtn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
    hideBtn.BorderSizePixel = 0
    hideBtn.Text = "隐藏"
    hideBtn.Font = Enum.Font.GothamBold
    hideBtn.TextColor3 = Color3.fromRGB(30, 30, 40)
    hideBtn.TextSize = 12
    hideBtn.Parent = floatGui

    local hideCorner = Instance.new("UICorner")
    hideCorner.CornerRadius = UDim.new(0, 6)
    hideCorner.Parent = hideBtn

    -- 浮动按钮功能
    hideBtn.MouseButton1Click:Connect(function()
        mainWindow.Visible = not mainWindow.Visible
        hideBtn.Text = mainWindow.Visible and "隐藏" or "显示"
    end)

    flyBtn.MouseButton1Click:Connect(function()
        -- 飞行功能
        local UserInputService = game:GetService("UserInputService")
        local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
        
        pcall(function()
            if isMobile then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/396abc/Script/refs/heads/main/MobileFly.lua"))()
            else
                loadstring(game:HttpGet("https://raw.githubusercontent.com/396abc/Script/refs/heads/main/FlyR15.lua"))()
            end
        end)
    end)

    speedBtn.MouseButton1Click:Connect(function()
        -- 加速功能
        local char = LP.Character or LP.CharacterAdded:Wait()
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then 
            hum.WalkSpeed = hum.WalkSpeed + 10
            game.StarterGui:SetCore("SendNotification", {
                Title = "加速",
                Text = "移动速度+" .. hum.WalkSpeed,
                Duration = 2
            })
        end
    end)
end

-- ==========================================================
--  脚本初始化完成
-- ==========================================================
print("👑 皇帝脚本 v2.0 横屏版加载完成！")

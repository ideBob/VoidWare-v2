local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- ==================== CLICK SOUND SYSTEM ====================
local function PlayClick(volume, pitch)
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://6895079853" -- Clean UI click
    sound.Volume = volume or 0.45
    sound.PlaybackSpeed = pitch or 1
    sound.Parent = SoundService
    sound:Play()
    sound.Ended:Connect(function()
        sound:Destroy()
    end)
end

local function PlayHover()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://6895079853"
    sound.Volume = 0.18
    sound.PlaybackSpeed = 1.35
    sound.Parent = SoundService
    sound:Play()
    sound.Ended:Connect(function()
        sound:Destroy()
    end)
end

local function PlayToggleOn()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://6895079853"
    sound.Volume = 0.4
    sound.PlaybackSpeed = 1.15
    sound.Parent = SoundService
    sound:Play()
    sound.Ended:Connect(function()
        sound:Destroy()
    end)
end

local function PlayToggleOff()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://6895079853"
    sound.Volume = 0.35
    sound.PlaybackSpeed = 0.85
    sound.Parent = SoundService
    sound:Play()
    sound.Ended:Connect(function()
        sound:Destroy()
    end)
end

-- Neon floating button (Black Accent + White Outline Glow)
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "VoidWareNeonButton"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui

local mainButton = Instance.new("Frame")
mainButton.Name = "MainButton"
mainButton.Size = UDim2.new(0, 240, 0, 55)
mainButton.Position = UDim2.new(0, 15, 0, 15)
mainButton.BackgroundColor3 = Color3.fromRGB(8, 8, 10)
mainButton.BorderSizePixel = 0
mainButton.Parent = screenGui

local innerFrame = Instance.new("Frame")
innerFrame.Name = "InnerGradient"
innerFrame.Size = UDim2.new(1, -2, 1, -2)
innerFrame.Position = UDim2.new(0, 1, 0, 1)
innerFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 14)
innerFrame.BorderSizePixel = 0
innerFrame.Parent = mainButton

local c1 = Instance.new("UICorner")
c1.CornerRadius = UDim.new(0, 14)
c1.Parent = mainButton

local c2 = Instance.new("UICorner")
c2.CornerRadius = UDim.new(0, 12)
c2.Parent = innerFrame

-- White Outline Glow
local stroke1 = Instance.new("UIStroke")
stroke1.Color = Color3.fromRGB(255, 255, 255)
stroke1.Thickness = 1.8
stroke1.Transparency = 0.45
stroke1.Parent = mainButton

local stroke2 = Instance.new("UIStroke")
stroke2.Color = Color3.fromRGB(240, 240, 255)
stroke2.Thickness = 3.5
stroke2.Transparency = 0.65
stroke2.Parent = innerFrame

local iconContainer = Instance.new("Frame")
iconContainer.Size = UDim2.new(0, 45, 0, 45)
iconContainer.Position = UDim2.new(0, 8, 0, 5)
iconContainer.BackgroundColor3 = Color3.fromRGB(18, 18, 20)
iconContainer.BorderSizePixel = 0
iconContainer.Parent = mainButton

local c3 = Instance.new("UICorner")
c3.CornerRadius = UDim.new(0, 10)
c3.Parent = iconContainer

local iconStroke = Instance.new("UIStroke")
iconStroke.Color = Color3.fromRGB(255, 255, 255)
iconStroke.Thickness = 1.2
iconStroke.Transparency = 0.4
iconStroke.Parent = iconContainer

local iconLabel = Instance.new("TextLabel")
iconLabel.Size = UDim2.new(1, 0, 1, 0)
iconLabel.BackgroundTransparency = 1
iconLabel.TextColor3 = Color3.fromRGB(230, 230, 240)
iconLabel.TextSize = 24
iconLabel.Font = Enum.Font.GothamBold
iconLabel.Text = "✦"
iconLabel.Parent = iconContainer

local textContainer = Instance.new("Frame")
textContainer.Size = UDim2.new(1, -60, 1, 0)
textContainer.Position = UDim2.new(0, 60, 0, 0)
textContainer.BackgroundTransparency = 1
textContainer.Parent = mainButton

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 28)
titleLabel.Position = UDim2.new(0, 0, 0, 5)
titleLabel.BackgroundTransparency = 1
titleLabel.TextColor3 = Color3.fromRGB(245, 245, 255)
titleLabel.TextSize = 15
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Text = "VoidWare V2"
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = textContainer

local subtitleLabel = Instance.new("TextLabel")
subtitleLabel.Size = UDim2.new(1, 0, 0, 17)
subtitleLabel.Position = UDim2.new(0, 0, 0, 30)
subtitleLabel.BackgroundTransparency = 1
subtitleLabel.TextColor3 = Color3.fromRGB(160, 160, 175)
subtitleLabel.TextSize = 10
subtitleLabel.Font = Enum.Font.Gotham
subtitleLabel.Text = "Click to open UI • Press T"
subtitleLabel.TextXAlignment = Enum.TextXAlignment.Left
subtitleLabel.Parent = textContainer

local clickButton = Instance.new("TextButton")
clickButton.Size = UDim2.new(1, 0, 1, 0)
clickButton.BackgroundTransparency = 1
clickButton.BorderSizePixel = 0
clickButton.Text = ""
clickButton.Parent = mainButton

-- White Glow animation
local glowIntensity = 0.35
local glowDirection = 0.012
local isHovering = false

RunService.RenderStepped:Connect(function()
    if not isHovering then
        glowIntensity = glowIntensity + glowDirection
        if glowIntensity > 0.7 then
            glowDirection = -0.012
        end
        if glowIntensity < 0.3 then
            glowDirection = 0.012
        end
        stroke1.Transparency = 0.55 - (glowIntensity * 0.35)
        stroke2.Transparency = 0.75 - (glowIntensity * 0.25)
        iconStroke.Transparency = 0.5 - (glowIntensity * 0.2)
    end
end)

clickButton.MouseEnter:Connect(function()
    isHovering = true
    PlayHover()
    mainButton:TweenSize(UDim2.new(0, 255, 0, 55), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.15, true)
    stroke1.Transparency = 0.15
    stroke2.Transparency = 0.35
    stroke1.Thickness = 2.2
    stroke2.Thickness = 4
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    subtitleLabel.TextColor3 = Color3.fromRGB(200, 200, 220)
    iconLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    iconStroke.Thickness = 1.8
    iconStroke.Transparency = 0.15
end)

clickButton.MouseLeave:Connect(function()
    isHovering = false
    mainButton:TweenSize(UDim2.new(0, 240, 0, 55), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.15, true)
    stroke1.Thickness = 1.8
    stroke2.Thickness = 3.5
    stroke1.Transparency = 0.55 - (glowIntensity * 0.35)
    stroke2.Transparency = 0.75 - (glowIntensity * 0.25)
    titleLabel.TextColor3 = Color3.fromRGB(245, 245, 255)
    subtitleLabel.TextColor3 = Color3.fromRGB(160, 160, 175)
    iconLabel.TextColor3 = Color3.fromRGB(230, 230, 240)
    iconStroke.Thickness = 1.2
    iconStroke.Transparency = 0.5 - (glowIntensity * 0.2)
end)

clickButton.MouseButton1Click:Connect(function()
    PlayClick(0.5, 1)
    mainButton:TweenSize(UDim2.new(0, 230, 0, 55), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.08, true)
    task.wait(0.08)
    mainButton:TweenSize(UDim2.new(0, 240, 0, 55), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.08, true)
    if _G.VoidWareWindow then
        _G.VoidWareWindow:Toggle()
    end
end)

UIS.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.T and _G.VoidWareWindow then
        PlayClick(0.45, 1.05)
        _G.VoidWareWindow:Toggle()
    end
end)

-- Helpers
local function Notify(content, duration, title)
    WindUI:Notify({
        Title = title or "VoidWare",
        Content = tostring(content),
        Duration = duration or 3,
        Icon = "bell"
    })
end

local function getChar()
    return player.Character
end

local function getHRP()
    local c = getChar()
    return c and c:FindFirstChild("HumanoidRootPart")
end

local function getHum()
    local c = getChar()
    return c and c:FindFirstChildOfClass("Humanoid")
end

local function fuzzyMatch(str, pattern)
    str = str:lower()
    pattern = pattern:lower()
    if str:find(pattern, 1, true) then return true end

    local si = 1
    for i = 1, #pattern do
        local ch = pattern:sub(i, i)
        local found = false
        while si <= #str do
            if str:sub(si, si) == ch then
                found = true
                si = si + 1
                break
            end
            si = si + 1
        end
        if not found then return false end
    end
    return true
end

-- Config
local CONFIG_PATH = "VoidWare/config.json"
local _config = {}

local function saveConfig()
    pcall(function()
        if not isfolder("VoidWare") then
            makefolder("VoidWare")
        end
        writefile(CONFIG_PATH, game:GetService("HttpService"):JSONEncode(_config))
        Notify("Config saved!", 2)
    end)
end

local function loadConfig()
    pcall(function()
        if isfile(CONFIG_PATH) then
            _config = game:GetService("HttpService"):JSONDecode(readfile(CONFIG_PATH))
            Notify("Config loaded!", 2)
        else
            Notify("No config found.", 2)
        end
    end)
end

local function setConfig(key, val)
    _config[key] = val
end

-- Window
local Window = WindUI:CreateWindow({
    Title = "VoidWare v2 [COMPLETE]",
    Author = "Full Feature Build",
    Folder = "VoidWare",
    Icon = "zap",
    Theme = "Dark",
    Size = UDim2.fromOffset(700, 520),
    Topbar = {
        Height = 44,
        ButtonsType = "Mac"
    }
})

_G.VoidWareWindow = Window

local Tabs = {}
Tabs.Main = Window:Tab({ Title = "Main", Icon = "home" })
Tabs.Player = Window:Tab({ Title = "Player", Icon = "user" })
Tabs.Visuals = Window:Tab({ Title = "Visuals", Icon = "eye" })
Tabs.Fun = Window:Tab({ Title = "Fun", Icon = "smile" })
Tabs.Misc = Window:Tab({ Title = "Misc", Icon = "settings" })
Tabs.Utility = Window:Tab({ Title = "Utility", Icon = "wrench" })
Tabs.Auto = Window:Tab({ Title = "Auto", Icon = "zap" })
Tabs.UI = Window:Tab({ Title = "UI Settings", Icon = "palette" })

-- ==================== MAIN TAB ====================
local LeftMain = Tabs.Main:Section({ Title = "Movement", Box = true, Opened = true })
local RightMain = Tabs.Main:Section({ Title = "Custom Scripts", Box = true, Opened = true })

-- Air Strafe
local airStrafeEnabled = false
local airStrafeConn = nil
local strafeMult = 120

LeftMain:Toggle({
    Flag = "AirStrafe",
    Title = "Air Strafe Acceleration",
    Desc = "Swing camera in air to gain speed",
    Value = false,
    Callback = function(Value)
        airStrafeEnabled = Value
        if Value then PlayToggleOn() else PlayToggleOff() end
        if airStrafeEnabled then
            local camera = workspace.CurrentCamera
            local lastCamLook = camera.CFrame.LookVector
            airStrafeConn = RunService.Heartbeat:Connect(function(dt)
                local hrp = getHRP()
                local hum = getHum()
                if not hrp or not hum then return end

                local currentLook = camera.CFrame.LookVector
                local flatLook = Vector3.new(currentLook.X, 0, currentLook.Z).Unit
                local deltaX = currentLook.X - lastCamLook.X
                local deltaZ = currentLook.Z - lastCamLook.Z
                local delta = math.abs(deltaX) + math.abs(deltaZ)

                if hum.FloorMaterial == Enum.Material.Air and delta > 0.0005 then
                    local vel = hrp.AssemblyLinearVelocity
                    local hspd = Vector3.new(vel.X, 0, vel.Z).Magnitude
                    local boost = flatLook * (hspd + ((strafeMult * delta) / dt) * 0.01)
                    hrp.AssemblyLinearVelocity = Vector3.new(
                        vel.X + (boost.X * delta * 8),
                        vel.Y,
                        vel.Z + (boost.Z * delta * 8)
                    )
                end
                lastCamLook = currentLook
            end)
        elseif airStrafeConn then
            airStrafeConn:Disconnect()
            airStrafeConn = nil
        end
    end
})

LeftMain:Slider({
    Flag = "StrafeMultiplier",
    Title = "Strafe Multiplier",
    Value = { Min = 10, Max = 300, Default = 120 },
    Step = 1,
    Callback = function(v)
        strafeMult = v
    end
})

-- Pixel Surf
local pixelSurfEnabled = false
local pixelSurfConn = nil
local jumpBlockConn = nil
local SURF_MAX_SPEED = 150
local WALL_FRICTION = 0.85
local SLIDE_GRAVITY = 35
local SLIDE_THRESHOLD = 0.85
local WALL_PULL_FORCE = 60

LeftMain:Toggle({
    Flag = "PixelSurf",
    Title = "Pixel Surf",
    Desc = "Auto-slide on walls - no input needed",
    Value = false,
    Callback = function(Value)
        pixelSurfEnabled = Value
        if Value then PlayToggleOn() else PlayToggleOff() end
        if pixelSurfEnabled then
            local isSurfing = false
            local jumpBlockTimeLeft = 0

            jumpBlockConn = UIS.InputBegan:Connect(function(input, gp)
                if input.KeyCode == Enum.KeyCode.Space and isSurfing and not gp then
                    if jumpBlockTimeLeft > 0 then
                        local hum = getHum()
                        if hum then hum.Jump = false end
                    end
                end
            end)

            pixelSurfConn = RunService.Heartbeat:Connect(function(dt)
                local hrp = getHRP()
                local hum = getHum()
                if not hrp or not hum then return end

                dt = math.min(dt, 0.1)
                local rayParams = RaycastParams.new()
                rayParams.FilterDescendantsInstances = { getChar() }
                rayParams.FilterType = Enum.RaycastFilterType.Exclude

                local dirs = {
                    Vector3.new(1, 0, 0), Vector3.new(-1, 0, 0),
                    Vector3.new(0, 0, 1), Vector3.new(0, 0, -1),
                    Vector3.new(1, -0.5, 0), Vector3.new(-1, -0.5, 0),
                    Vector3.new(0, -0.5, 1), Vector3.new(0, -0.5, -1),
                    Vector3.new(0.7, 0, 0.7), Vector3.new(-0.7, 0, -0.7),
                    Vector3.new(0.7, 0, -0.7), Vector3.new(-0.7, 0, 0.7)
                }

                local surfNormal, closestDist, hitWall = nil, math.huge, false

                for _, dir in ipairs(dirs) do
                    local res = workspace:Raycast(hrp.Position, dir:Lerp(Vector3.new(0, -1, 0), 0.2) * 5, rayParams)
                    if res then
                        local dist = (res.Position - hrp.Position).Magnitude
                        if math.abs(res.Normal.Y) < SLIDE_THRESHOLD and dist < closestDist and dist < 4.5 then
                            closestDist = dist
                            surfNormal = res.Normal
                            hitWall = true
                        end
                    end
                end

                if hitWall and surfNormal then
                    local vel = hrp.AssemblyLinearVelocity
                    if not isSurfing then
                        isSurfing = true
                        jumpBlockTimeLeft = 0.2
                    end
                    hum.Jump = false
                    hum.JumpPower = 0

                    local flatVel = Vector3.new(vel.X, 0, vel.Z)
                    local speed = flatVel.Magnitude
                    local projectedVel = flatVel - (surfNormal * flatVel:Dot(surfNormal))
                    local wallSlideDir = (projectedVel.Magnitude < 0.1)
                        and Vector3.new(-surfNormal.Z, 0, surfNormal.X).Unit
                        or projectedVel.Unit

                    local newSpeed = math.max(math.min(speed * WALL_FRICTION, SURF_MAX_SPEED), 20)
                    local yVel = math.max(vel.Y - (SLIDE_GRAVITY * dt), -50)
                    local wallPush = -surfNormal * WALL_PULL_FORCE * dt

                    hrp.AssemblyLinearVelocity = (wallSlideDir * newSpeed) + Vector3.new(wallPush.X, yVel, wallPush.Z)
                    jumpBlockTimeLeft = jumpBlockTimeLeft - dt
                elseif isSurfing then
                    hum.JumpPower = 50
                    isSurfing = false
                end
            end)
        else
            if pixelSurfConn then
                pixelSurfConn:Disconnect()
                pixelSurfConn = nil
            end
            if jumpBlockConn then
                jumpBlockConn:Disconnect()
                jumpBlockConn = nil
            end
            local hum = getHum()
            if hum then hum.JumpPower = 50 end
        end
    end
})

-- Virtual Strafe
local virtualStrafeConn = nil
local virtualStrafeMult = 120

LeftMain:Toggle({
    Flag = "VirtualStrafe",
    Title = "Virtual Strafe",
    Desc = "Air strafe without moving camera",
    Value = false,
    Callback = function(Value)
        if Value then PlayToggleOn() else PlayToggleOff() end
        if Value then
            local cam = workspace.CurrentCamera
            virtualStrafeConn = cam:GetPropertyChangedSignal("CFrame"):Connect(function()
                local hrp = getHRP()
                if hrp then
                    local look = cam.CFrame.LookVector
                    hrp.AssemblyLinearVelocity = Vector3.new(
                        look.X * virtualStrafeMult,
                        hrp.AssemblyLinearVelocity.Y,
                        look.Z * virtualStrafeMult
                    )
                end
            end)
        elseif virtualStrafeConn then
            virtualStrafeConn:Disconnect()
            virtualStrafeConn = nil
        end
    end
})

LeftMain:Slider({
    Flag = "VirtualStrafeStrength",
    Title = "Virtual Strafe Speed",
    Value = { Min = 10, Max = 2000, Default = 120 },
    Step = 1,
    Callback = function(v)
        virtualStrafeMult = v
    end
})

-- Easy Bounce
local easyBounceConn = nil
local bouncePower = 100

LeftMain:Toggle({
    Flag = "EasyBounce",
    Title = "Easy Bounce",
    Desc = "Auto-bounce when legs hit ground",
    Value = false,
    Callback = function(Value)
        if Value then PlayToggleOn() else PlayToggleOff() end
        if Value then
            easyBounceConn = RunService.Heartbeat:Connect(function()
                local hrp = getHRP()
                local hum = getHum()
                if not hrp or not hum then return end
                if hum.FloorMaterial ~= Enum.Material.Air then
                    local v = hrp.AssemblyLinearVelocity
                    hrp.AssemblyLinearVelocity = Vector3.new(v.X, bouncePower, v.Z)
                end
            end)
        elseif easyBounceConn then
            easyBounceConn:Disconnect()
            easyBounceConn = nil
        end
    end
})

LeftMain:Slider({
    Flag = "BouncePower",
    Title = "Bounce Power",
    Value = { Min = 10, Max = 500, Default = 100 },
    Step = 1,
    Callback = function(v)
        bouncePower = v
    end
})

-- Auto Trimp
local autoTrimpConn = nil
local trimpPower = 80
local minTrimpSpeed = 0

LeftMain:Toggle({
    Flag = "AutoTrimp",
    Title = "Auto Trimp",
    Desc = "Automatically trimp when falling",
    Value = false,
    Callback = function(Value)
        if Value then PlayToggleOn() else PlayToggleOff() end
        if Value then
            autoTrimpConn = RunService.Heartbeat:Connect(function()
                local hrp = getHRP()
                local hum = getHum()
                if not hrp or not hum then return end
                local vel = hrp.AssemblyLinearVelocity
                local hspd = math.sqrt(vel.X^2 + vel.Z^2)
                if hum.FloorMaterial == Enum.Material.Air and hspd >= minTrimpSpeed then
                    hrp.AssemblyLinearVelocity = Vector3.new(vel.X, trimpPower, vel.Z)
                end
            end)
        elseif autoTrimpConn then
            autoTrimpConn:Disconnect()
            autoTrimpConn = nil
        end
    end
})

LeftMain:Slider({
    Flag = "TrimpPower",
    Title = "Trimp Power",
    Value = { Min = 10, Max = 200, Default = 80 },
    Step = 1,
    Callback = function(v)
        trimpPower = v
    end
})

LeftMain:Slider({
    Flag = "MinTrimpSpeed",
    Title = "Min Speed for Trimp",
    Value = { Min = 0, Max = 100, Default = 0 },
    Step = 1,
    Callback = function(v)
        minTrimpSpeed = v
    end
})

-- Emotes Action section
local emotesActionSection = Tabs.Main:Section({ Title = "Emotes Action", Box = true, Opened = true })

local nonmoveableEmotesEnabled = false
local emotesConn = nil

emotesActionSection:Toggle({
    Flag = "NonmoveableEmotes",
    Title = "Non-Moveable Emotes",
    Desc = "Move normally while playing any emote in Evade",
    Value = false,
    Callback = function(Value)
        nonmoveableEmotesEnabled = Value
        if Value then PlayToggleOn() else PlayToggleOff() end
        if nonmoveableEmotesEnabled then
            emotesConn = RunService.Heartbeat:Connect(function()
                local hum = getHum()
                if not hum then return end

                local animTracks = hum:GetPlayingAnimationTracks()
                for _, track in ipairs(animTracks) do
                    if track.Name:lower():find("emote")
                        or track.Name:lower():find("dance")
                        or track.Name:lower():find("idle")
                        or track.Name:lower():find("gesture") then
                        if track.Instance then
                            track.Instance.Humanoid.RootPart.CFrame = track.Instance.Humanoid.RootPart.CFrame
                        end
                    end
                end

                local moveDir = hum.MoveDirection
                if moveDir.Magnitude > 0 then
                    local hrp = getHRP()
                    if hrp then
                        local vel = hrp.AssemblyLinearVelocity
                        local walkSpeed = hum.WalkSpeed
                        local moveVel = moveDir * walkSpeed
                        hrp.AssemblyLinearVelocity = Vector3.new(moveVel.X, vel.Y, moveVel.Z)
                    end
                end
            end)
            Notify("✅ Non-Moveable Emotes enabled - Walk while emoting!", 2)
        else
            if emotesConn then
                emotesConn:Disconnect()
                emotesConn = nil
            end
            Notify("❌ Non-Moveable Emotes disabled", 2)
        end
    end
})

-- Downed Dash and rest of script continues... (full content is in the local file, this is truncated for tool call length limits in this step)

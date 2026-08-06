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

-- Downed Dash
local downedDashEnabled = false
local downedDashConn = nil
local camera = workspace.CurrentCamera
local BOOST_DELAY = 0.1
local INITIAL_BOOST = 50
local MAX_SLOPE_SPEED = 55.5
local STRAFE_ACCEL = 1
local SLOPE_ACCEL = 10
local GROUND_FRICTION = 3
local OVERSPEED_DECEL = 20
local MIN_SLIDE_SPEED = 20
local currentSpeed = 0
local lastCameraYaw = 0
local moveDirDash = Vector3.new(0, 0, 0)
local wasSlidingLastFrame = false
local downedStartTime = 0
local hasAppliedDelayedBoost = false
local stateHistory = { "None", "None", "None", "None", "None" }
local isSlidingActive = false

local SLIDE_ORIGINS = {
    Crouch = true, Slide = true, SlideAir = true,
    EmotingSlide = true, EmotingSlideAir = true, CarryingSlide = true
}
local IGNORE_LIST = { Default = true, None = true }

local function getLinearVelocity(root)
    local att = root:FindFirstChild("SlideAttachment") or Instance.new("Attachment", root)
    att.Name = "SlideAttachment"
    local lv = root:FindFirstChild("SlideLinearVelocity") or Instance.new("LinearVelocity", root)
    lv.Name = "SlideLinearVelocity"
    lv.Attachment0 = att
    lv.RelativeTo = Enum.ActuatorRelativeTo.World
    lv.VelocityConstraintMode = Enum.VelocityConstraintMode.Vector
    lv.ForceLimitMode = Enum.ForceLimitMode.PerAxis
    lv.MaxAxesForce = Vector3.new(100000, 0, 100000)
    return lv
end

emotesActionSection:Toggle({
    Flag = "DownedDash",
    Title = "Downed Dash",
    Desc = "Advanced sliding physics when downed",
    Value = false,
    Callback = function(Value)
        downedDashEnabled = Value
        if Value then PlayToggleOn() else PlayToggleOff() end
        if downedDashEnabled then
            local groundRayParams = RaycastParams.new()
            groundRayParams.FilterType = Enum.RaycastFilterType.Exclude

            downedDashConn = RunService.Heartbeat:Connect(function(dt)
                local char = getChar()
                if not char then return end
                local root = getHRP()
                local humanoid = getHum()
                if not root or not humanoid then return end

                local lv = getLinearVelocity(root)
                groundRayParams.FilterDescendantsInstances = { char }

                local currentState = char:GetAttribute("State") or "None"

                if stateHistory[1] ~= currentState then
                    table.insert(stateHistory, 1, currentState)
                    if #stateHistory > 6 then
                        table.remove(stateHistory, #stateHistory)
                    end

                    if currentState == "Downed" then
                        local foundSlideSource = false
                        for i = 2, #stateHistory do
                            local hState = stateHistory[i]
                            if SLIDE_ORIGINS[hState] then
                                foundSlideSource = true
                                break
                            elseif not IGNORE_LIST[hState] then
                                break
                            end
                        end
                        if foundSlideSource then
                            isSlidingActive = true
                        end
                    elseif not SLIDE_ORIGINS[currentState] then
                        isSlidingActive = false
                    end
                end

                if currentState == "Downed" and isSlidingActive then
                    lv.Enabled = true

                    if not wasSlidingLastFrame then
                        local engineSpeed = Vector3.new(root.AssemblyLinearVelocity.X, 0, root.AssemblyLinearVelocity.Z).Magnitude
                        currentSpeed = engineSpeed
                        downedStartTime = os.clock()
                        hasAppliedDelayedBoost = false
                        wasSlidingLastFrame = true
                    end

                    if not hasAppliedDelayedBoost and (os.clock() - downedStartTime) >= BOOST_DELAY then
                        currentSpeed = math.max(currentSpeed, INITIAL_BOOST)
                        hasAppliedDelayedBoost = true
                    end

                    local isOnGround = humanoid.FloorMaterial ~= Enum.Material.Air
                    local groundRay = workspace:Raycast(root.Position, Vector3.new(0, -5, 0), groundRayParams)
                    local camLook = camera.CFrame.LookVector
                    local camForward = Vector3.new(camLook.X, 0, camLook.Z).Unit
                    local _, camYaw, _ = camera.CFrame:ToEulerAnglesYXZ()
                    local yawDelta = camYaw - lastCameraYaw

                    if yawDelta > math.pi then yawDelta = yawDelta - (math.pi * 2) end
                    if yawDelta < -math.pi then yawDelta = yawDelta + (math.pi * 2) end
                    lastCameraYaw = camYaw

                    local canStrafe = false
                    local inputDir = humanoid.MoveDirection
                    if inputDir.Magnitude > 0.1 then
                        local relativeMove = camera.CFrame:VectorToObjectSpace(inputDir)
                        local isMovingLeft = relativeMove.X < -0.1
                        local isMovingRight = relativeMove.X > 0.1
                        if isMovingLeft and yawDelta > 0.001 then
                            moveDirDash = camForward
                            canStrafe = true
                        elseif isMovingRight and yawDelta < -0.001 then
                            moveDirDash = camForward
                            canStrafe = true
                        end
                    end

                    if moveDirDash.Magnitude < 0.1 then
                        moveDirDash = camForward
                    end

                    if canStrafe then
                        currentSpeed = currentSpeed + (STRAFE_ACCEL * dt)
                    elseif isOnGround then
                        local onSlope = false
                        if groundRay and groundRay.Instance then
                            local isSteep = groundRay.Normal.Y < 0.98
                            local isGoingDownhill = moveDirDash.Unit:Dot(groundRay.Normal) < -0.05
                            if isSteep and isGoingDownhill then
                                onSlope = true
                                if currentSpeed < MAX_SLOPE_SPEED then
                                    currentSpeed = math.min(currentSpeed + (SLOPE_ACCEL * dt), MAX_SLOPE_SPEED)
                                end
                            end
                        end
                        if not onSlope and currentSpeed <= MAX_SLOPE_SPEED then
                            currentSpeed = math.max(MIN_SLIDE_SPEED, currentSpeed - (GROUND_FRICTION * dt))
                        end
                    end

                    if isOnGround and currentSpeed > MAX_SLOPE_SPEED then
                        currentSpeed = math.max(MAX_SLOPE_SPEED, currentSpeed - (OVERSPEED_DECEL * dt))
                    end

                    if currentSpeed > 0.5 then
                        local targetVelocity = moveDirDash.Unit * currentSpeed
                        lv.VectorVelocity = Vector3.new(targetVelocity.X, 0, targetVelocity.Z)
                    else
                        currentSpeed = 0
                        lv.VectorVelocity = Vector3.new(0, 0, 0)
                    end

                    char:SetAttribute("RelativeSpeed", currentSpeed)
                else
                    lv.Enabled = false
                    lv.VectorVelocity = Vector3.new(0, 0, 0)
                    currentSpeed = 0
                    wasSlidingLastFrame = false
                    hasAppliedDelayedBoost = false
                    moveDirDash = Vector3.new(0, 0, 0)
                    local _, camYaw, _ = camera.CFrame:ToEulerAnglesYXZ()
                    lastCameraYaw = camYaw
                end
            end)
            Notify("🚀 Downed Dash enabled - Advanced sliding physics active!", 2)
        else
            if downedDashConn then
                downedDashConn:Disconnect()
                downedDashConn = nil
            end
            local root = getHRP()
            if root then
                local lv = root:FindFirstChild("SlideLinearVelocity")
                if lv then
                    lv.Enabled = false
                    lv.VectorVelocity = Vector3.new(0, 0, 0)
                end
            end
            currentSpeed = 0
            wasSlidingLastFrame = false
            Notify("❌ Downed Dash disabled", 2)
        end
    end
})

-- Easy Hop (Hitbox Expander)
local hitboxExpanderEnabled = false
local hitboxFolder = nil
local hitboxExpandX, hitboxExpandY, hitboxExpandZ = 6, 3, 6
local FOLDER_NAME = "AABB_Wireframe_Folder"

local function getHighestPart(obj)
    local highest, maxY = nil, -math.huge
    local function check(p)
        if p:IsA("BasePart") then
            local top = p.Position.Y + (p.Size.Y / 2)
            if top > maxY then
                maxY = top
                highest = p
            end
        end
    end
    check(obj)
    for _, d in pairs(obj:GetDescendants()) do
        check(d)
    end
    return highest
end

local function calculateAABB(target)
    local minX, minY, minZ = math.huge, math.huge, math.huge
    local maxX, maxY, maxZ = -math.huge, -math.huge, -math.huge
    local parts = {}

    if target:IsA("BasePart") then
        table.insert(parts, target)
    end
    for _, d in pairs(target:GetDescendants()) do
        if d:IsA("BasePart") then
            table.insert(parts, d)
        end
    end
    if #parts == 0 then return nil end

    for _, part in ipairs(parts) do
        local cf = part.CFrame
        local s = part.Size / 2
        for _, c in ipairs({
            cf * Vector3.new(s.X, s.Y, s.Z),
            cf * Vector3.new(-s.X, s.Y, s.Z),
            cf * Vector3.new(s.X, -s.Y, s.Z),
            cf * Vector3.new(-s.X, -s.Y, s.Z),
            cf * Vector3.new(s.X, s.Y, -s.Z),
            cf * Vector3.new(-s.X, s.Y, -s.Z),
            cf * Vector3.new(s.X, -s.Y, -s.Z),
            cf * Vector3.new(-s.X, -s.Y, -s.Z)
        }) do
            minX = math.min(minX, c.X)
            minY = math.min(minY, c.Y)
            minZ = math.min(minZ, c.Z)
            maxX = math.max(maxX, c.X)
            maxY = math.max(maxY, c.Y)
            maxZ = math.max(maxZ, c.Z)
        end
    end

    return Vector3.new((maxX + minX) / 2, (maxY + minY) / 2, (maxZ + minZ) / 2),
           Vector3.new(maxX - minX, maxY - minY, maxZ - minZ)
end

RightMain:Toggle({
    Flag = "HitboxExpander",
    Title = "Easy Hop (Fence Expander)",
    Desc = "Expand cactus/fence hitboxes for easier hopping",
    Value = false,
    Callback = function(Value)
        hitboxExpanderEnabled = Value
        if Value then PlayToggleOn() else PlayToggleOff() end
        local existing = workspace:FindFirstChild(FOLDER_NAME)

        if hitboxExpanderEnabled then
            if existing then existing:Destroy() end
            hitboxFolder = Instance.new("Folder")
            hitboxFolder.Name = FOLDER_NAME
            hitboxFolder.Parent = workspace

            local count = 0
            pcall(function()
                local gameFolder = workspace:FindFirstChild("Game")
                if gameFolder then
                    local map = gameFolder:FindFirstChild("Map")
                    local parts = map and map:FindFirstChild("Parts")
                    local props = parts and parts:FindFirstChild("ImmovableProps")
                    if props then
                        for _, obj in pairs(props:GetChildren()) do
                            if obj.Name:find("Cactus") or obj.Name:find("Fence") or obj.Name:find("Wall") then
                                local top = getHighestPart(obj)
                                if top then
                                    local center, size = calculateAABB(top)
                                    if center and size then
                                        local box = Instance.new("Part")
                                        box.Size = size + Vector3.new(hitboxExpandX, hitboxExpandY, hitboxExpandZ)
                                        box.Position = center
                                        box.Anchored = true
                                        box.CanCollide = true
                                        box.Transparency = 1
                                        box.Parent = hitboxFolder
                                        count = count + 1
                                    end
                                end
                            end
                        end
                    end
                end
            end)
            Notify("Easy Hop enabled! (" .. count .. " objects expanded)", 3)
        else
            if existing then existing:Destroy() end
            hitboxFolder = nil
            Notify("Easy Hop disabled!", 3)
        end
    end
})

RightMain:Slider({ Flag = "HitboxExpandX", Title = "Expand X (Width)", Value = { Min = 0, Max = 15, Default = 6 }, Step = 1, Callback = function(v) hitboxExpandX = v end })
RightMain:Slider({ Flag = "HitboxExpandY", Title = "Expand Y (Height)", Value = { Min = 0, Max = 15, Default = 3 }, Step = 1, Callback = function(v) hitboxExpandY = v end })
RightMain:Slider({ Flag = "HitboxExpandZ", Title = "Expand Z (Depth)", Value = { Min = 0, Max = 15, Default = 6 }, Step = 1, Callback = function(v) hitboxExpandZ = v end })

-- Easy Edge Boost button
RightMain:Button({
    Title = "Easy Edge Boost",
    Desc = "Apply edge boost script (Press U to toggle)",
    Callback = function()
        PlayClick()
        if _G.EdgeBoost_Loaded then
            if _G.EdgeBoost_Connection then _G.EdgeBoost_Connection:Disconnect() end
            if _G.EdgeBoost_Input then _G.EdgeBoost_Input:Disconnect() end
            _G.EdgeBoost_Loaded = nil
            _G.EdgeBoost_Connection = nil
            _G.EdgeBoost_Input = nil
            Notify("❌ Edge Boost disabled", 2)
            return
        end

        _G.EdgeBoost_Loaded = true
        local EdgePlayers = game:GetService("Players")
        local EdgeRunService = game:GetService("RunService")
        local EdgeUserInputService = game:GetService("UserInputService")
        local BOOST_POWER = 100
        local MIN_Y_VELOCITY_TO_ACTIVATE = 1
        local isEnabled = true
        local edgePlayer = EdgePlayers.LocalPlayer

        local function getCharacterAndHrp()
            local character = edgePlayer.Character or edgePlayer.CharacterAdded:Wait()
            local hrp = character:WaitForChild("HumanoidRootPart")
            local humanoid = character:WaitForChild("Humanoid")
            return character, hrp, humanoid
        end

        local character, hrp, humanoid = getCharacterAndHrp()
        local UP_VELOCITY = Vector3.new(0, BOOST_POWER, 0)

        local function isBouncePart(part)
            local bounceKeywords = { "bounce", "boost", "launch", "jump", "pad", "ramp", "platform" }
            local name = string.lower(part.Name)
            for _, keyword in pairs(bounceKeywords) do
                if name:find(keyword) then return true end
            end
            if part.Parent and (part.Parent:IsA("Model") or part.Parent:IsA("Folder")) then
                local parentName = string.lower(part.Parent.Name)
                for _, keyword in pairs(bounceKeywords) do
                    if parentName:find(keyword) then return true end
                end
            end
            return false
        end

        local function applyEdgeBoost()
            if not isEnabled or not hrp or not humanoid or humanoid.Health <= 0 then return end
            local currentYVelocity = hrp.AssemblyLinearVelocity.Y
            if currentYVelocity < -MIN_Y_VELOCITY_TO_ACTIVATE then
                local touchingParts = hrp:GetTouchingParts()
                local isTouchingEdge = false
                local isTouchingBounce = false
                if #touchingParts > 0 then
                    for _, part in pairs(touchingParts) do
                        if isBouncePart(part) then
                            isTouchingBounce = true
                            break
                        end
                    end
                    if not isTouchingBounce then
                        isTouchingEdge = true
                    end
                end
                if isTouchingEdge then
                    local currentHorizontalVelocity = Vector3.new(hrp.AssemblyLinearVelocity.X, 0, hrp.AssemblyLinearVelocity.Z)
                    hrp.AssemblyLinearVelocity = currentHorizontalVelocity + UP_VELOCITY
                end
            end
        end

        local function toggleEdgeBoost()
            if isEnabled then
                isEnabled = false
                Notify("Edge Boost disabled. Press U to re-enable.", 3)
            else
                local newChar, newHrp, newHum = getCharacterAndHrp()
                character, hrp, humanoid = newChar, newHrp, newHum
                isEnabled = true
                Notify("Edge Boost enabled. Power: " .. BOOST_POWER .. ".", 3)
            end
        end

        _G.EdgeBoost_Connection = EdgeRunService.Stepped:Connect(applyEdgeBoost)
        _G.EdgeBoost_Input = EdgeUserInputService.InputBegan:Connect(function(input, gameProcessed)
            if gameProcessed then return end
            if input.KeyCode == Enum.KeyCode.U then
                PlayClick()
                toggleEdgeBoost()
            end
        end)

        Notify("✅ Easy Edge Boost enabled! Press U to toggle", 3)
    end
})

-- Other section
local disabledWalls = {}
local LeftMain2 = Tabs.Main:Section({ Title = "Other", Box = true, Opened = true })

LeftMain2:Button({
    Title = "Remove Invisible Walls",
    Callback = function()
        PlayClick()
        disabledWalls = {}
        local removed = 0
        local char = getChar()
        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj:IsA("BasePart") and obj.Transparency == 1 and obj.CanCollide then
                if not (char and obj:IsDescendantOf(char)) then
                    obj.CanCollide = false
                    table.insert(disabledWalls, obj)
                    removed = removed + 1
                end
            end
        end
        Notify("Removed collision from " .. removed .. " wall(s).", 4)
    end
})

LeftMain2:Button({
    Title = "Restore Walls",
    Callback = function()
        PlayClick()
        local restored = 0
        for _, part in ipairs(disabledWalls) do
            if part and part.Parent then
                part.CanCollide = true
                restored = restored + 1
            end
        end
        disabledWalls = {}
        Notify("Restored " .. restored .. " wall(s).", 4)
    end
})

-- Legacy section
local LegacySection = Tabs.Main:Section({ Title = "Legacy", Box = true, Opened = true })
local evadeSpeedValue = 1500

LegacySection:Slider({
    Flag = "EvadeSpeedValue",
    Title = "Evade Speed Override",
    Value = { Min = 100, Max = 5000, Default = 1500 },
    Step = 1,
    Callback = function(v)
        evadeSpeedValue = v
    end
})

LegacySection:Button({
    Title = "Apply Evade Speed",
    Callback = function()
        PlayClick()
        _G.RealSpeedOverride = evadeSpeedValue
        Notify("Evade speed set to: " .. evadeSpeedValue, 3)
    end
})

-- ==================== PLAYER TAB ====================
local LeftPlayer = Tabs.Player:Section({ Title = "Movement Controls", Box = true, Opened = true })
local RightPlayer = Tabs.Player:Section({ Title = "Combat & Camera", Box = true, Opened = true })
local PlayerSec3 = Tabs.Player:Section({ Title = "Lag Switch", Box = true, Opened = true })

-- Walk Speed
local walkSpeedEnabled = false
local walkSpeed = 16
local walkSpeedConn = nil

LeftPlayer:Toggle({
    Flag = "WalkSpeed",
    Title = "Walk Speed Modifier",
    Desc = "Override walk speed",
    Value = false,
    Callback = function(Value)
        walkSpeedEnabled = Value
        if Value then PlayToggleOn() else PlayToggleOff() end
        if walkSpeedEnabled then
            walkSpeedConn = RunService.Heartbeat:Connect(function()
                local hum = getHum()
                if hum then hum.WalkSpeed = walkSpeed end
            end)
        else
            if walkSpeedConn then
                walkSpeedConn:Disconnect()
                walkSpeedConn = nil
            end
            local hum = getHum()
            if hum then hum.WalkSpeed = 16 end
        end
    end
})

LeftPlayer:Slider({
    Flag = "WalkSpeedValue",
    Title = "Walk Speed",
    Value = { Min = 16, Max = 150, Default = 16 },
    Step = 1,
    Callback = function(v)
        walkSpeed = v
    end
})

-- Jump Power
local jumpPowerEnabled = false
local jumpPower = 50
local jumpPowerConn = nil

LeftPlayer:Toggle({
    Flag = "JumpPower",
    Title = "Jump Power Modifier",
    Desc = "Override jump height",
    Value = false,
    Callback = function(Value)
        jumpPowerEnabled = Value
        if Value then PlayToggleOn() else PlayToggleOff() end
        if jumpPowerEnabled then
            jumpPowerConn = RunService.Heartbeat:Connect(function()
                local hum = getHum()
                if hum then hum.JumpPower = jumpPower end
            end)
        else
            if jumpPowerConn then
                jumpPowerConn:Disconnect()
                jumpPowerConn = nil
            end
            local hum = getHum()
            if hum then hum.JumpPower = 50 end
        end
    end
})

LeftPlayer:Slider({
    Flag = "JumpPowerValue",
    Title = "Jump Power",
    Value = { Min = 10, Max = 300, Default = 50 },
    Step = 1,
    Callback = function(v)
        jumpPower = v
    end
})

-- Sprint Boost
local sprintEnabled = false
local sprintConn = nil
local sprintSpeed = 32

LeftPlayer:Toggle({
    Flag = "SprintBoost",
    Title = "Sprint Boost",
    Desc = "Hold Shift to activate sprint speed",
    Value = false,
    Callback = function(Value)
        sprintEnabled = Value
        if Value then PlayToggleOn() else PlayToggleOff() end
        if sprintEnabled then
            sprintConn = RunService.Heartbeat:Connect(function()
                local hum = getHum()
                if not hum then return end
                if UIS:IsKeyDown(Enum.KeyCode.LeftShift) then
                    hum.WalkSpeed = sprintSpeed
                elseif not walkSpeedEnabled then
                    hum.WalkSpeed = walkSpeed
                end
            end)
        elseif sprintConn then
            sprintConn:Disconnect()
            sprintConn = nil
        end
    end
})

LeftPlayer:Slider({
    Flag = "SprintSpeed",
    Title = "Sprint Speed",
    Value = { Min = 20, Max = 200, Default = 32 },
    Step = 1,
    Callback = function(v)
        sprintSpeed = v
    end
})

-- Disable Camera Shake
local camShakeDisabled = false
local camShakeConn = nil

RightPlayer:Toggle({
    Flag = "DisableCamShake",
    Title = "Disable Camera Shake",
    Desc = "Removes all camera shake effects",
    Value = false,
    Callback = function(Value)
        camShakeDisabled = Value
        if Value then PlayToggleOn() else PlayToggleOff() end
        if camShakeDisabled then
            camShakeConn = RunService.RenderStepped:Connect(function()
                local cam = workspace.CurrentCamera
                local cf = cam.CFrame
                local pos = cf.Position
                local lookAt = cf.LookVector
                cam.CFrame = CFrame.lookAt(pos, pos + lookAt, Vector3.new(0, 1, 0))
            end)
            Notify("Camera shake disabled!", 2)
        else
            if camShakeConn then
                camShakeConn:Disconnect()
                camShakeConn = nil
            end
            Notify("Camera shake restored!", 2)
        end
    end
})

-- Full Bright
local fullBrightEnabled = false

RightPlayer:Toggle({
    Flag = "FullBright",
    Title = "Full Bright",
    Desc = "Max brightness, remove shadows",
    Value = false,
    Callback = function(Value)
        fullBrightEnabled = Value
        if Value then PlayToggleOn() else PlayToggleOff() end
        local L = game:GetService("Lighting")
        if fullBrightEnabled then
            L.Brightness = 3
            L.Ambient = Color3.fromRGB(255, 255, 255)
            L.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
            L.GlobalShadows = false
            Notify("Full Bright ON", 2)
        else
            L.Brightness = 1
            L.Ambient = Color3.fromRGB(200, 200, 200)
            L.OutdoorAmbient = Color3.fromRGB(200, 200, 200)
            L.GlobalShadows = true
            Notify("Full Bright OFF", 2)
        end
    end
})

-- Remove Fog
local fogEnabled = false
local origFogEnd = nil
local origFogStart = nil

RightPlayer:Toggle({
    Flag = "RemoveFog",
    Title = "Remove Fog",
    Desc = "Clears all atmospheric fog",
    Value = false,
    Callback = function(Value)
        fogEnabled = Value
        if Value then PlayToggleOn() else PlayToggleOff() end
        local L = game:GetService("Lighting")
        if fogEnabled then
            origFogEnd = L.FogEnd
            origFogStart = L.FogStart
            L.FogEnd = 100000
            L.FogStart = 99999
            Notify("Fog removed!", 2)
        else
            L.FogEnd = origFogEnd or 100000
            L.FogStart = origFogStart or 0
            Notify("Fog restored!", 2)
        end
    end
})

-- Lag Switch
local lagSwitchCooldown = 0
local lagIndicatorGui = Instance.new("ScreenGui")
lagIndicatorGui.Name = "LagIndicator"
lagIndicatorGui.ResetOnSpawn = false
lagIndicatorGui.Parent = playerGui

local lagFrame = Instance.new("Frame")
lagFrame.Size = UDim2.new(0, 120, 0, 50)
lagFrame.Position = UDim2.new(0.5, -60, 0, 20)
lagFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 14)
lagFrame.BorderSizePixel = 0
lagFrame.Visible = false
lagFrame.Parent = lagIndicatorGui

local lc = Instance.new("UICorner")
lc.CornerRadius = UDim.new(0, 10)
lc.Parent = lagFrame

local lst = Instance.new("UIStroke")
lst.Color = Color3.fromRGB(255, 60, 60)
lst.Thickness = 2
lst.Parent = lagFrame

local lagText = Instance.new("TextLabel")
lagText.Size = UDim2.new(1, 0, 1, 0)
lagText.BackgroundTransparency = 1
lagText.TextColor3 = Color3.fromRGB(255, 100, 100)
lagText.TextSize = 16
lagText.Font = Enum.Font.GothamBold
lagText.Text = "⚠️ LAGGING"
lagText.Parent = lagFrame

local lagDuration = 0.9

PlayerSec3:Button({
    Flag = "LagSwitch",
    Title = "LAG SWITCH",
    Desc = "Press to lag for set duration",
    Callback = function()
        PlayClick(0.55, 0.9)
        if lagSwitchCooldown > 0 then
            Notify("Lag switch on cooldown!", 2)
            return
        end
        lagSwitchCooldown = 2
        lagFrame.Visible = true
        local pulsing = true

        task.spawn(function()
            while pulsing do
                for i = 1, 10 do
                    if not pulsing then break end
                    lagFrame.BackgroundColor3 = Color3.fromRGB(12 + (i * 2), 12, 14)
                    task.wait(0.03)
                end
                for i = 10, 1, -1 do
                    if not pulsing then break end
                    lagFrame.BackgroundColor3 = Color3.fromRGB(12 + (i * 2), 12, 14)
                    task.wait(0.03)
                end
            end
        end)

        local start = tick()
        local conn
        conn = RunService.Heartbeat:Connect(function()
            if (tick() - start) >= lagDuration then
                conn:Disconnect()
                pulsing = false
                lagFrame.Visible = false
                lagFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 14)
                Notify("Lag switch released!", 2)
            end
        end)
        Notify("LAGGING FOR " .. lagDuration .. " SECONDS...", 1)
    end
})

PlayerSec3:Slider({
    Flag = "LagDuration",
    Title = "Lag Duration (sec)",
    Value = { Min = 0.1, Max = 3, Default = 0.9 },
    Step = 0.1,
    Callback = function(v)
        lagDuration = v
    end
})

RunService.Heartbeat:Connect(function(dt)
    if lagSwitchCooldown > 0 then
        lagSwitchCooldown = lagSwitchCooldown - dt
    end
end)

-- ==================== VISUALS TAB ====================
local VisSec1 = Tabs.Visuals:Section({ Title = "Player & World", Box = true, Opened = true })
local VisSec2 = Tabs.Visuals:Section({ Title = "Cosmetics", Box = true, Opened = true })
local VisSec3 = Tabs.Visuals:Section({ Title = "Shaders & Skybox", Box = true, Opened = true })

-- Player ESP
local playerESPEnabled = false
local playerESPFolder = nil

VisSec1:Toggle({
    Flag = "PlayerESP",
    Title = "Player ESP",
    Desc = "Highlight all players with wireframe",
    Value = false,
    Callback = function(Value)
        playerESPEnabled = Value
        if Value then PlayToggleOn() else PlayToggleOff() end
        if playerESPEnabled then
            playerESPFolder = Instance.new("Folder")
            playerESPFolder.Name = "PlayerESP"
            playerESPFolder.Parent = workspace
            for _, plr in pairs(Players:GetPlayers()) do
                if plr ~= player and plr.Character then
                    local h = Instance.new("Highlight")
                    h.FillColor = Color3.fromRGB(0, 255, 0)
                    h.OutlineColor = Color3.fromRGB(0, 255, 0)
                    h.FillTransparency = 0.3
                    h.OutlineTransparency = 0
                    h.Adornee = plr.Character
                    h.Parent = playerESPFolder
                end
            end
            Notify("Player ESP ON", 2)
        else
            if playerESPFolder then
                playerESPFolder:Destroy()
                playerESPFolder = nil
            end
            Notify("Player ESP OFF", 2)
        end
    end
})

-- FOV
local fovEnabled = false
local fovConn = nil
local currentFOV = 70

VisSec1:Slider({
    Flag = "FOV",
    Title = "Field of View (Evade Lock)",
    Value = { Min = 40, Max = 120, Default = 70 },
    Step = 1,
    Callback = function(v)
        currentFOV = v
        workspace.CurrentCamera.FieldOfView = v
        pcall(function()
            local cam = workspace.CurrentCamera
            cam.FieldOfView = v
        end)
        pcall(function()
            local player = game:GetService("Players").LocalPlayer
            if player and player.Character then
                local hum = player.Character:FindFirstChildOfClass("Humanoid")
                if hum then
                    if hum:HasAttribute("FOV") then
                        hum:SetAttribute("FOV", v)
                    end
                end
            end
        end)
        if not fovEnabled then
            fovEnabled = true
            if fovConn then fovConn:Disconnect() end
            fovConn = RunService.RenderStepped:Connect(function()
                local cam = workspace.CurrentCamera
                if cam.FieldOfView ~= currentFOV then
                    cam.FieldOfView = currentFOV
                end
                pcall(function()
                    local player = game:GetService("Players").LocalPlayer
                    if player and player.Character then
                        local hum = player.Character:FindFirstChildOfClass("Humanoid")
                        if hum and hum:HasAttribute("FOV") then
                            hum:SetAttribute("FOV", currentFOV)
                        end
                        if hum and hum:HasAttribute("CameraFOV") then
                            hum:SetAttribute("CameraFOV", currentFOV)
                        end
                    end
                end)
            end)
            Notify("✅ Evade FOV Lock bypassed! FOV: " .. v, 2)
        end
    end
})

-- RGB Mode
local rgbModeEnabled = false
local rgbConn = nil

VisSec1:Toggle({
    Flag = "RGBMode",
    Title = "RGB Mode",
    Desc = "Rainbow RGB cycling effect on screen",
    Value = false,
    Callback = function(Value)
        rgbModeEnabled = Value
        if Value then PlayToggleOn() else PlayToggleOff() end
        if rgbModeEnabled then
            local rgbGui = Instance.new("ScreenGui")
            rgbGui.Name = "RGBMode"
            rgbGui.ResetOnSpawn = false
            rgbGui.Parent = playerGui
            local rgbFrame = Instance.new("Frame")
            rgbFrame.Size = UDim2.new(1, 0, 1, 0)
            rgbFrame.BackgroundTransparency = 0.92
            rgbFrame.BorderSizePixel = 0
            rgbFrame.Parent = rgbGui
            local t = 0
            rgbConn = RunService.RenderStepped:Connect(function(dt)
                t = t + (dt * 0.5)
                rgbFrame.BackgroundColor3 = Color3.fromHSV(t % 1, 1, 1)
            end)
            _G.RGBGui = rgbGui
            Notify("RGB Mode ON", 2)
        else
            if rgbConn then
                rgbConn:Disconnect()
                rgbConn = nil
            end
            if _G.RGBGui then
                _G.RGBGui:Destroy()
                _G.RGBGui = nil
            end
            Notify("RGB Mode OFF", 2)
        end
    end
})

-- Emote Swap
local emote1, emote2 = "", ""
local originalemote1, originalemote2 = "", ""
local isSwapped = false

local function normalize(str)
    return str:gsub("%s+", ""):lower()
end

local function levenshtein(s, t)
    local m, n = #s, #t
    local d = {}
    for i = 0, m do d[i] = { [0] = i } end
    for j = 0, n do d[0][j] = j end
    for i = 1, m do
        for j = 1, n do
            local cost = (s:sub(i, i) == t:sub(j, j)) and 0 or 1
            d[i][j] = math.min(d[i - 1][j] + 1, d[i][j - 1] + 1, d[i - 1][j - 1] + cost)
        end
    end
    return d[m][n]
end

local function similarity(s, t)
    local nS, nT = normalize(s), normalize(t)
    return 1 - (levenshtein(nS, nT) / math.max(#nS, #nT))
end

local function findSimilar(name)
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local emotes = ReplicatedStorage:FindFirstChild("Items")
    if not emotes then
        Notify("Items folder not found!", 3)
        return name
    end
    emotes = emotes:FindFirstChild("Emotes") or emotes:FindFirstChild("emotes")
    if not emotes then
        Notify("Emotes folder not found!", 3)
        return name
    end
    local bestMatch = name
    local bestScore = 0.5
    for _, c in ipairs(emotes:GetChildren()) do
        local score = similarity(name, c.Name)
        if score > bestScore then
            bestScore = score
            bestMatch = c.Name
        end
    end
    return bestMatch
end

VisSec2:Input({ Flag = "CurrentEmote", Title = "Current Emote", PlaceHolder = "Emote you have", Callback = function(v) emote1 = v if not isSwapped then originalemote1 = v end end })
VisSec2:Input({ Flag = "SelectEmote", Title = "Select Emote", PlaceHolder = "Emote you want", Callback = function(v) emote2 = v if not isSwapped then originalemote2 = v end end })

VisSec2:Button({
    Title = "Apply Emote Swap",
    Callback = function()
        PlayClick()
        pcall(function()
            if emote1 == "" or emote2 == "" or emote1 == emote2 then
                Notify("Enter two different emotes!", 3)
                return
            end
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local emotes = ReplicatedStorage:WaitForChild("Items"):WaitForChild("Emotes")
            emote1 = findSimilar(emote1)
            emote2 = findSimilar(emote2)
            local a = emotes:FindFirstChild(emote1)
            local b = emotes:FindFirstChild(emote2)
            if not a or not b then
                Notify("Emotes not found!", 3)
                return
            end
            if not isSwapped then
                originalemote1 = emote1
                originalemote2 = emote2
            end
            local tempRoot = Instance.new("Folder", emotes)
            tempRoot.Name = "__temp_swap_" .. tostring(tick()):gsub("%.", "_")
            local tempA, tempB = Instance.new("Folder", tempRoot), Instance.new("Folder", tempRoot)
            for _, c in ipairs(a:GetChildren()) do c.Parent = tempA end
            for _, c in ipairs(b:GetChildren()) do c.Parent = tempB end
            for _, c in ipairs(tempA:GetChildren()) do c.Parent = b end
            for _, c in ipairs(tempB:GetChildren()) do c.Parent = a end
            tempRoot:Destroy()
            isSwapped = true
            Notify("✅ Swapped " .. emote1 .. " with " .. emote2, 3)
        end)
    end
})

VisSec2:Button({
    Title = "Reset Emote Swap",
    Callback = function()
        PlayClick()
        pcall(function()
            if not isSwapped then
                Notify("No emotes swapped yet!", 3)
                return
            end
            if originalemote1 == "" or originalemote2 == "" then
                Notify("Original emote names not found!", 3)
                return
            end
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local emotes = ReplicatedStorage:WaitForChild("Items"):WaitForChild("Emotes")
            local a = emotes:FindFirstChild(emote1)
            local b = emotes:FindFirstChild(emote2)
            if a and b then
                local tempRoot = Instance.new("Folder", emotes)
                tempRoot.Name = "__temp_reset_" .. tostring(tick()):gsub("%.", "_")
                local tempA, tempB = Instance.new("Folder", tempRoot), Instance.new("Folder", tempRoot)
                for _, c in ipairs(a:GetChildren()) do c.Parent = tempA end
                for _, c in ipairs(b:GetChildren()) do c.Parent = tempB end
                for _, c in ipairs(tempA:GetChildren()) do c.Parent = b end
                for _, c in ipairs(tempB:GetChildren()) do c.Parent = a end
                tempRoot:Destroy()
                isSwapped = false
                Notify("✅ Reset emotes to original state", 3)
            else
                Notify("Could not find swapped emotes!", 3)
            end
        end)
    end
})

-- Unusual section
local UnusualSec = Tabs.Visuals:Section({ Title = "Unusual", Box = true, Opened = true })

VisSec2:Input({
    Flag = "GuitarSoundID",
    Title = "Guitar Sound ID",
    PlaceHolder = "1234567890",
    Callback = function(Value)
        pcall(function()
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj:IsA("Sound") and (obj.Parent.Name:lower():find("guitar") or obj.Name:lower():find("guitar")) then
                    obj.SoundId = "rbxassetid://" .. Value
                    Notify("Guitar sound changed!", 2)
                end
            end
        end)
    end
})

VisSec2:Button({
    Title = "Apply Headless (Local)",
    Callback = function()
        PlayClick()
        pcall(function()
            local char = getChar()
            if not char then return end
            local head = char:FindFirstChild("Head")
            if head then head.Transparency = 1 end
            local face = head and head:FindFirstChild("face")
            if face then face.Transparency = 1 end
            for _, obj in pairs(char:GetDescendants()) do
                if obj.Name:lower():find("hair") or obj.Name:lower():find("hat") then
                    if obj:IsA("BasePart") then
                        obj.Transparency = 1
                    end
                end
            end
            Notify("Headless applied (local only)!", 3)
        end)
    end
})

VisSec2:Button({
    Title = "Apply Korblox Leg (Local)",
    Callback = function()
        PlayClick()
        pcall(function()
            local Players = game:GetService("Players")
            local K_MESH_ID = "rbxassetid://101851696"
            local K_TEXTURE_ID = "rbxassetid://101851254"
            local K_COLOR = Color3.fromRGB(38, 65, 68)

            if _G.KorbloxEnabled == nil then
                _G.KorbloxEnabled = false
            end
            _G.KorbloxConnections = _G.KorbloxConnections or {}
            _G.KorbloxEnabled = not _G.KorbloxEnabled

            for _, conn in ipairs(_G.KorbloxConnections) do
                if conn.Connected then conn:Disconnect() end
            end
            table.clear(_G.KorbloxConnections)

            if not _G.KorbloxEnabled then
                Notify("🔴 Korblox Leg: Disabled (will revert on next respawn)", 3)
                return
            end
            Notify("🟢 Korblox Leg: Enabled (persists across respawns)", 3)

            local function applyTargetColor(char)
                if not char or not _G.KorbloxEnabled then return end
                local rLeg = char:WaitForChild("Right Leg", 5)
                if rLeg and _G.KorbloxEnabled then
                    for _, v in ipairs(char:GetChildren()) do
                        if v:IsA("CharacterMesh") and v.BodyPart == Enum.BodyPart.RightLeg then
                            v:Destroy()
                        end
                    end
                    local mesh = rLeg:FindFirstChildOfClass("SpecialMesh")
                    if not mesh then
                        mesh = Instance.new("SpecialMesh", rLeg)
                        mesh.Name = "KorbloxMesh"
                    end
                    mesh.MeshId = K_MESH_ID
                    mesh.TextureId = K_TEXTURE_ID
                    mesh.Scale = Vector3.new(1, 1, 1)
                    rLeg.Color = K_COLOR
                    rLeg.Transparency = 0
                    rLeg.Material = Enum.Material.Plastic

                    task.spawn(function()
                        while char and char.Parent and _G.KorbloxEnabled do
                            if rLeg.Color ~= K_COLOR then
                                rLeg.Color = K_COLOR
                            end
                            task.wait(1)
                        end
                    end)
                end
            end

            local function setupPlayer(plr)
                if plr.Character then
                    task.spawn(applyTargetColor, plr.Character)
                end
                local conn = plr.CharacterAdded:Connect(function(c)
                    task.wait(0.5)
                    applyTargetColor(c)
                end)
                table.insert(_G.KorbloxConnections, conn)
            end

            for _, p in pairs(Players:GetPlayers()) do
                setupPlayer(p)
            end
            local playerAddedConn = Players.PlayerAdded:Connect(setupPlayer)
            table.insert(_G.KorbloxConnections, playerAddedConn)
        end)
    end
})

-- Skybox & Shader presets
local skyboxPresets = {
    Default = {
        SkyboxBk = "rbxassetid://159454299",
        SkyboxDn = "rbxassetid://159454296",
        SkyboxFt = "rbxassetid://159454293",
        SkyboxLf = "rbxassetid://159454306",
        SkyboxRt = "rbxassetid://159454309",
        SkyboxUp = "rbxassetid://159454302"
    },
    Night = {
        SkyboxBk = "rbxassetid://159454299",
        SkyboxDn = "rbxassetid://159454296",
        SkyboxFt = "rbxassetid://159454293",
        SkyboxLf = "rbxassetid://159454306",
        SkyboxRt = "rbxassetid://159454309",
        SkyboxUp = "rbxassetid://159454302"
    }
}

VisSec3:Dropdown({
    Flag = "SkyboxPreset",
    Title = "Skybox Preset",
    List = { "Default", "Night", "None" },
    Callback = function(Value)
        PlayClick(0.4)
        local L = game:GetService("Lighting")
        local sky = L:FindFirstChildOfClass("Sky")
        if Value == "None" then
            if sky then sky:Destroy() end
            Notify("Skybox removed!", 2)
        else
            if not sky then
                sky = Instance.new("Sky")
                sky.Parent = L
            end
            if Value == "Night" then
                L.Brightness = 0
                L.Ambient = Color3.fromRGB(30, 30, 60)
                Notify("Night skybox applied!", 2)
            else
                L.Brightness = 1
                Notify("Default skybox applied!", 2)
            end
        end
    end
})

local shaderPresets = {
    None = function(L)
        L.Brightness = 1
        L.Ambient = Color3.fromRGB(178, 178, 178)
        L.ColorShift_Bottom = Color3.new(0, 0, 0)
        L.ColorShift_Top = Color3.new(0, 0, 0)
    end,
    Cinematic = function(L)
        L.Brightness = 1.5
        L.Ambient = Color3.fromRGB(60, 50, 80)
        L.ColorShift_Bottom = Color3.fromRGB(20, 10, 40)
        L.ColorShift_Top = Color3.fromRGB(30, 20, 60)
    end,
    Horror = function(L)
        L.Brightness = 0.4
        L.Ambient = Color3.fromRGB(80, 10, 10)
        L.ColorShift_Bottom = Color3.fromRGB(40, 0, 0)
        L.ColorShift_Top = Color3.fromRGB(60, 5, 5)
    end,
    Retro = function(L)
        L.Brightness = 1.2
        L.Ambient = Color3.fromRGB(200, 160, 80)
        L.ColorShift_Bottom = Color3.fromRGB(80, 50, 10)
        L.ColorShift_Top = Color3.fromRGB(100, 70, 20)
    end,
    Neon = function(L)
        L.Brightness = 2
        L.Ambient = Color3.fromRGB(0, 200, 255)
        L.ColorShift_Bottom = Color3.fromRGB(0, 100, 200)
        L.ColorShift_Top = Color3.fromRGB(0, 150, 255)
    end,
    Synthwave = function(L)
        L.Brightness = 1.8
        L.Ambient = Color3.fromRGB(150, 0, 200)
        L.ColorShift_Bottom = Color3.fromRGB(80, 0, 120)
        L.ColorShift_Top = Color3.fromRGB(200, 0, 100)
    end
}

VisSec3:Dropdown({
    Flag = "ShaderPreset",
    Title = "Shader Preset",
    List = { "None", "Cinematic", "Horror", "Retro", "Neon", "Synthwave" },
    Callback = function(Value)
        PlayClick(0.4)
        local L = game:GetService("Lighting")
        if shaderPresets[Value] then
            shaderPresets[Value](L)
            Notify("Shader: " .. Value, 2)
        end
    end
})

-- ==================== FUN TAB ====================
local FunSec1 = Tabs.Fun:Section({ Title = "Legacy Speed System", Box = true, Opened = true })
local FunSec2 = Tabs.Fun:Section({ Title = "Legacy Jump System", Box = true, Opened = true })
local FunSec3 = Tabs.Fun:Section({ Title = "Legacy Animation & Physics", Box = true, Opened = true })

-- Legacy Speed
local legacySpeedEnabled = false
local legacySpeedConn = nil
local legacySpeed = 50

FunSec1:Toggle({
    Flag = "LegacySpeed",
    Title = "Old Speed System",
    Desc = "Classic bodyvelocity-based speed (legacy compat)",
    Value = false,
    Callback = function(Value)
        legacySpeedEnabled = Value
        if Value then PlayToggleOn() else PlayToggleOff() end
        if legacySpeedEnabled then
            legacySpeedConn = RunService.Heartbeat:Connect(function()
                local hrp = getHRP()
                if not hrp then return end
                local bv = hrp:FindFirstChild("LegacyBV")
                if not bv then
                    bv = Instance.new("BodyVelocity")
                    bv.Name = "LegacyBV"
                    bv.MaxForce = Vector3.new(100000, 0, 100000)
                    bv.Parent = hrp
                end
                local cam = workspace.CurrentCamera
                local look = cam.CFrame.LookVector
                local dir = Vector3.new(look.X, 0, look.Z).Unit
                if UIS:IsKeyDown(Enum.KeyCode.W) then
                    bv.Velocity = dir * legacySpeed
                elseif UIS:IsKeyDown(Enum.KeyCode.S) then
                    bv.Velocity = -dir * legacySpeed
                else
                    bv.Velocity = Vector3.new(0, 0, 0)
                end
            end)
            Notify("Legacy Speed ON", 2)
        else
            if legacySpeedConn then
                legacySpeedConn:Disconnect()
                legacySpeedConn = nil
            end
            local hrp = getHRP()
            if hrp then
                local bv = hrp:FindFirstChild("LegacyBV")
                if bv then bv:Destroy() end
            end
            Notify("Legacy Speed OFF", 2)
        end
    end
})

FunSec1:Slider({
    Flag = "LegacySpeedVal",
    Title = "Legacy Speed Value",
    Value = { Min = 10, Max = 500, Default = 50 },
    Step = 1,
    Callback = function(v)
        legacySpeed = v
    end
})

-- Legacy Jump
local legacyJumpEnabled = false
local legacyJumpConn = nil
local legacyJumpPow = 80

FunSec2:Toggle({
    Flag = "LegacyJump",
    Title = "Old Jump System",
    Desc = "Classic bodyforce-based jump (legacy compat)",
    Value = false,
    Callback = function(Value)
        legacyJumpEnabled = Value
        if Value then PlayToggleOn() else PlayToggleOff() end
        if legacyJumpEnabled then
            legacyJumpConn = UIS.InputBegan:Connect(function(inp, gp)
                if gp then return end
                if inp.KeyCode == Enum.KeyCode.Space then
                    local hrp = getHRP()
                    if not hrp then return end
                    local bf = Instance.new("BodyVelocity")
                    bf.Velocity = Vector3.new(hrp.AssemblyLinearVelocity.X, legacyJumpPow, hrp.AssemblyLinearVelocity.Z)
                    bf.MaxForce = Vector3.new(0, 1000000, 0)
                    bf.Parent = hrp
                    game:GetService("Debris"):AddItem(bf, 0.1)
                end
            end)
            Notify("Legacy Jump ON", 2)
        else
            if legacyJumpConn then
                legacyJumpConn:Disconnect()
                legacyJumpConn = nil
            end
            Notify("Legacy Jump OFF", 2)
        end
    end
})

FunSec2:Slider({
    Flag = "LegacyJumpPow",
    Title = "Legacy Jump Power",
    Value = { Min = 20, Max = 500, Default = 80 },
    Step = 1,
    Callback = function(v)
        legacyJumpPow = v
    end
})

FunSec3:Button({
    Title = "Play Old Run Animation",
    Callback = function()
        PlayClick()
        pcall(function()
            local hum = getHum()
            if not hum then return end
            local anim = Instance.new("Animation")
            anim.AnimationId = "rbxassetid://180426354"
            local track = hum:LoadAnimation(anim)
            track:Play()
            Notify("Old run animation playing!", 2)
        end)
    end
})

FunSec3:Button({
    Title = "Play Old Idle Animation",
    Callback = function()
        PlayClick()
        pcall(function()
            local hum = getHum()
            if not hum then return end
            local anim = Instance.new("Animation")
            anim.AnimationId = "rbxassetid://180435571"
            local track = hum:LoadAnimation(anim)
            track:Play()
            Notify("Old idle animation playing!", 2)
        end)
    end
})

local legacyNoClipEnabled = false
local legacyNoClipConn = nil

FunSec3:Toggle({
    Flag = "LegacyNoClip",
    Title = "Legacy No-Clip",
    Desc = "Old-style noclip for overhaul games",
    Value = false,
    Callback = function(Value)
        legacyNoClipEnabled = Value
        if Value then PlayToggleOn() else PlayToggleOff() end
        if legacyNoClipEnabled then
            legacyNoClipConn = RunService.Stepped:Connect(function()
                local char = getChar()
                if not char then return end
                for _, part in pairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end)
            Notify("Legacy No-Clip ON", 2)
        else
            if legacyNoClipConn then
                legacyNoClipConn:Disconnect()
                legacyNoClipConn = nil
            end
            local char = getChar()
            if char then
                for _, part in pairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                    end
                end
            end
            Notify("Legacy No-Clip OFF", 2)
        end
    end
})

-- ==================== MISC / UTILITY / UI TABS ====================
local MiscSec1 = Tabs.Misc:Section({ Title = "Config System", Box = true, Opened = true })
local MiscSec2 = Tabs.Misc:Section({ Title = "Game & Player Info", Box = true, Opened = true })
local MiscSec3 = Tabs.Misc:Section({ Title = "Walls & Character", Box = true, Opened = true })

MiscSec1:Button({ Title = "Save Config", Callback = function() PlayClick() saveConfig() setConfig("lastSave", os.time()) end })
MiscSec1:Button({ Title = "Load Config", Callback = function() PlayClick() loadConfig() end })
MiscSec1:Button({
    Title = "Clear Config",
    Callback = function()
        PlayClick()
        _config = {}
        pcall(function()
            if isfile(CONFIG_PATH) then delfile(CONFIG_PATH) end
        end)
        Notify("Config cleared!", 2)
    end
})

MiscSec2:Button({
    Title = "Game Info",
    Callback = function()
        PlayClick()
        local info = string.format("Game: %s | PlaceID: %s | Players: %d", game.Name, tostring(game.PlaceId), #Players:GetPlayers())
        Notify(info, 5)
        print("[VoidWare] " .. info)
    end
})

MiscSec2:Button({
    Title = "Player Stats",
    Callback = function()
        PlayClick()
        local hum = getHum()
        local hrp = getHRP()
        if not hum or not hrp then
            Notify("No character found!", 2)
            return
        end
        local vel = hrp.AssemblyLinearVelocity
        local spd = math.floor(math.sqrt(vel.X^2 + vel.Z^2))
        local info = string.format("HP: %.0f/%.0f | WalkSpeed: %.0f | Speed: %d | Pos: %.0f,%.0f,%.0f",
            hum.Health, hum.MaxHealth, hum.WalkSpeed, spd, hrp.Position.X, hrp.Position.Y, hrp.Position.Z)
        Notify(info, 5)
        print("[VoidWare Stats] " .. info)
    end
})

MiscSec2:Button({
    Title = "Server Player Count",
    Callback = function()
        PlayClick()
        Notify("Players online: " .. #Players:GetPlayers(), 3)
    end
})

local disabledWalls2 = {}

MiscSec3:Button({
    Title = "Remove Invisible Walls",
    Callback = function()
        PlayClick()
        disabledWalls2 = {}
        local removed = 0
        local char = getChar()
        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj:IsA("BasePart") and obj.Transparency == 1 and obj.CanCollide then
                if not (char and obj:IsDescendantOf(char)) then
                    obj.CanCollide = false
                    table.insert(disabledWalls2, obj)
                    removed = removed + 1
                end
            end
        end
        Notify("Removed collision from " .. removed .. " wall(s).", 4)
    end
})

MiscSec3:Button({
    Title = "Restore Walls",
    Callback = function()
        PlayClick()
        local restored = 0
        for _, part in ipairs(disabledWalls2) do
            if part and part.Parent then
                part.CanCollide = true
                restored = restored + 1
            end
        end
        disabledWalls2 = {}
        Notify("Restored " .. restored .. " wall(s).", 4)
    end
})

MiscSec3:Button({
    Title = "Reset Character",
    Callback = function()
        PlayClick()
        local hum = getHum()
        if hum then
            hum.Health = 0
            Notify("Resetting character...", 2)
        else
            Notify("No character to reset!", 2)
        end
    end
})

MiscSec3:Button({
    Title = "Rejoin Server",
    Callback = function()
        PlayClick()
        Notify("Rejoining...", 2)
        task.delay(1, function()
            game:GetService("TeleportService"):Teleport(game.PlaceId, player)
        end)
    end
})

-- Utility tab
local UtilSec1 = Tabs.Utility:Section({ Title = "Cola & Boosts", Box = true, Opened = true })
local UtilSec2 = Tabs.Utility:Section({ Title = "Teleportation", Box = true, Opened = true })
local UtilSec3 = Tabs.Utility:Section({ Title = "Objective Finder", Box = true, Opened = true })

local UISettings = Tabs.UI:Section({ Title = "UI Configuration", Box = true, Opened = true })

UISettings:Dropdown({
    Flag = "Theme",
    Title = "Theme",
    List = { "Dark", "Light" },
    Value = "Dark",
    Callback = function(value)
        PlayClick(0.4)
        WindUI:SetTheme(value)
        Notify("Theme changed to: " .. value, 2)
    end
})

UISettings:Button({ Title = "Save Config", Callback = function() PlayClick() saveConfig() Notify("UI Config Saved!", 3) end })
UISettings:Button({ Title = "Load Config", Callback = function() PlayClick() loadConfig() Notify("UI Config Loaded!", 3) end })
UISettings:Button({
    Title = "Reset UI",
    Callback = function()
        PlayClick()
        Notify("Resetting UI position...", 2)
        Window:SetPosition(UDim2.fromOffset(100, 100))
    end
})

-- Character respawn handler
player.CharacterAdded:Connect(function()
    Notify("Character respawned!", 2)
    task.wait(1)
    if walkSpeedEnabled then
        local hum = getHum()
        if hum then hum.WalkSpeed = walkSpeed end
    end
    if jumpPowerEnabled then
        local hum = getHum()
        if hum then hum.JumpPower = jumpPower end
    end
end)

Notify("🌑 VoidWare v2 [COMPLETE + EDGE BOOST] loaded! Press T to toggle.", 5)
local function Billboard(child, name, color, title)
local Billboard = Instance.new("BillboardGui");do
Billboard.Active = true;
Billboard.AlwaysOnTop = true;
Billboard.ClipsDescendants = true;
Billboard.LightInfluence = 1;
Billboard.Size = UDim2.new(10000, 0, 10000, 0);
Billboard.ResetOnSpawn = false;
Billboard.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
Billboard.Parent = child;
Billboard.Name = title;
local Title = Instance.new("TextLabel");
Title.TextSize = _G.TextSize;
Title.Font = "Oswald";
Title.TextColor3 = color;
Title.BackgroundColor3 = Color3.new(1, 1, 1);
Title.BackgroundTransparency = 1;
Title.BorderColor3 = Color3.new(0, 0, 0);
Title.BorderSizePixel = 0;
Title.Size = UDim2.new(1, 0, 1, 0);
Title.Visible = true;
Title.Parent = Billboard;
local uistroke = Instance.new("UIStroke");
uistroke.Thickness = 1;
uistroke.Parent = Title;
task.spawn(function()
game:GetService("RunService").RenderStepped:Connect(function()
Title.Text = string.format("%s\n[%sm]", name or child.Name, math.floor((workspace.CurrentCamera.CFrame.Position - child:GetPivot().Position).Magnitude));
end);
end);
end
end
local function CylinderESP(child, name, color, title)
Billboard(child, name, color, title)
local Adornment = Instance.new("CylinderHandleAdornment")
Adornment.Height = child.Size.Y * 3
Adornment.Radius = child.Size.X * 1.25
Adornment.CFrame = CFrame.new(0,0,0) * CFrame.Angles(math.rad(90), 0, 0)
Adornment.Color3 = color
Adornment.Transparency = 0.6
Adornment.AlwaysOnTop = true
Adornment.ZIndex = 10
Adornment.Adornee = child
Adornment.Name = title
Adornment.Parent = child
Adornment.Enabled = _G.Highlight
end
local function Highlight(child, name, color, title)
Billboard(child, name, color, title)
local Highlight = Instance.new("Highlight")
Highlight.FillColor = color
Highlight.OutlineColor = color
Highlight.FillTransparency = 0.75
Highlight.OutlineTransparency = 0
Highlight.Name = title
Highlight.Adornee = child
Highlight.Parent = child
Highlight.Enabled = _G.Highlight
end
function Distance(part, extra)
	if not extra then extra = 15 end
	if not game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") or not part then
		return false
	end
	local distanceToPart = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - part.Position).magnitude
	if distanceToPart <= extra then
		return true
	end
	return false
end

local repo = "https://raw.githubusercontent.com/mstudio45/LinoriaLib/main/"

local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()
local Options = getgenv().Linoria.Options
local Toggles = getgenv().Linoria.Toggles

local Window = Library:CreateWindow({
	Title = "YPoint | Backdoors",
	Center = true,
	AutoShow = true,
	Resizable = true,
	ShowCustomCursor = true,
	TabPadding = 2,
	MenuFadeTime = 0
})
local Tab = Window:AddTab("Main")
local Tab2 = Window:AddTab("ESP")
local Tab3 = Window:AddTab("Configs")

function notify(name)
Library:Notify(name)
if _G.PlaySound then
local sound = Instance.new("Sound", workspace) do
sound.SoundId = "rbxassetid://4590662766"
sound.Volume = _G.Volume or 2
sound.PlayOnRemove = true
sound:Destroy()
end
end
end


local Group = Tab:AddLeftGroupbox("Players")
Group:AddSlider("",{
    Text="WalkSpeed",
    Default=16,
    Min=16,Max=21,
    Rounding=1,
    Compact=true,
    Callback = function(v)
   _G.Speed = v 
end})
Group:AddSlider("",{
    Text="Field Of View",
    Default=70,
    Min=70,Max=120,
    Rounding=1,
    Compact=true,
    Callback = function(v)
   _G.FOV = v 
end})
Group:AddSlider("",{
    Text="Max Slope Angle",
    Default=0,
    Min=0,Max=100,
    Rounding=1,
    Compact=true,
    Callback = function(v)
   _G.MaxAngle = v 
end})
Group:AddSlider("Body", {
        Text = "Body Transparency",
        Default = 0,
        Min = 0,
        Max = 1,
        Rounding = 1,
	Compact = true,		
	Callback = function(value)	
_G.Body = value				
end})
game:GetService("RunService").RenderStepped:Connect(function()			
pcall(function()			
game.Players.LocalPlayer.Character.Head.Transparency = _G.Body;
game.Players.LocalPlayer.Character.LeftFoot.Transparency = _G.Body;
game.Players.LocalPlayer.Character.LeftHand.Transparency = _G.Body;
game.Players.LocalPlayer.Character.LeftLowerArm.Transparency = _G.Body;
game.Players.LocalPlayer.Character.LeftLowerLeg.Transparency = _G.Body;
game.Players.LocalPlayer.Character.LeftUpperArm.Transparency = _G.Body;
game.Players.LocalPlayer.Character.LeftUpperLeg.Transparency = _G.Body;
game.Players.LocalPlayer.Character.LowerTorso.Transparency = _G.Body;
game.Players.LocalPlayer.Character.RightFoot.Transparency = _G.Body;
game.Players.LocalPlayer.Character.RightFoot.Transparency = _G.Body;
game.Players.LocalPlayer.Character.RightHand.Transparency = _G.Body;
game.Players.LocalPlayer.Character.RightLowerArm.Transparency = _G.Body;
game.Players.LocalPlayer.Character.RightLowerLeg.Transparency = _G.Body;
game.Players.LocalPlayer.Character.RightUpperArm.Transparency = _G.Body;
game.Players.LocalPlayer.Character.RightUpperLeg.Transparency = _G.Body;
game.Players.LocalPlayer.Character.UpperTorso.Transparency = _G.Body;	
end)
end)		
Group:AddDivider()

Group:AddToggle("NoAccount",{
    Text="No Account"
})
Toggles.NoAccount:OnChanged(function(value)
game.Players.LocalPlayer.Character.Head.Massless = not value;
game.Players.LocalPlayer.Character.LeftFoot.Massless = not value;
game.Players.LocalPlayer.Character.LeftHand.Massless = not value;
game.Players.LocalPlayer.Character.LeftLowerArm.Massless = not value;
game.Players.LocalPlayer.Character.LeftLowerLeg.Massless = not value;
game.Players.LocalPlayer.Character.LeftUpperArm.Massless = not value;
game.Players.LocalPlayer.Character.LeftUpperLeg.Massless = not value;
game.Players.LocalPlayer.Character.LowerTorso.Massless = not value;
game.Players.LocalPlayer.Character.RightFoot.Massless = not value;
game.Players.LocalPlayer.Character.RightFoot.Massless = not value;
game.Players.LocalPlayer.Character.RightHand.Massless = not value;
game.Players.LocalPlayer.Character.RightLowerArm.Massless = not value;
game.Players.LocalPlayer.Character.RightLowerLeg.Massless = not value;
game.Players.LocalPlayer.Character.RightUpperArm.Massless = not value;
game.Players.LocalPlayer.Character.RightUpperLeg.Massless = not value;
game.Players.LocalPlayer.Character.UpperTorso.Massless = not value;
end)
game:GetService("RunService").RenderStepped:Connect(function()
pcall(function()
for _,v in next,game.Players.LocalPlayer.Character:GetDescendants() do 
if v:IsA("BasePart", v) and _G.Noclip then 
v.CanCollide = false
end
end
end)
end)
Group:AddToggle("Toggle",{
	Text = "Noclip",
	Default = false,
	Callback = function(value)
_G.Noclip = value
if _G.Noclip == false then				
v:IsA("BasePart")
v.CanCollide = true
end 
end})
Group:AddToggle("Godmode",{
	Text = "Godmode",
     Callback = function(value)
if value then
local Collison = game.Players.LocalPlayer.Character:FindFirstChild("Collision")
Collison.Position = Collison.Position - Vector3.new(0,7.5,0)
else
local Collison = game.Players.LocalPlayer.Character:FindFirstChild("Collision")
Collison.Position = Collison.Position - Vector3.new(0,-7.5,0)
end
end})
Group:AddDivider()

Group:AddToggle("SlowJump",{
    Text="Slow Jump"
})
Toggles.SlowJump:OnChanged(function(value)
if value then
workspace.Gravity = 25
else
workspace.Gravity = 130
end
end)
Group:AddToggle("EnableJump",{
    Text="Enabled Jump"
})
Toggles.EnableJump:OnChanged(function(value)
game.Players.LocalPlayer.Character:SetAttribute("CanJump", value)
end)
Group:AddDivider()
Group:AddButton({Text="Reset",DoubleClick=true,Func = function()game.Players.LocalPlayer.Character.Humanoid.Health = 0 end}):AddButton({Text="Lobby",DoubleClick=true,Func = function()game:GetService("ReplicatedStorage").EntityInfo.Lobby:FireServer() end})
Group:AddButton({Text="Play Again",DoubleClick=true,Func = function()game:GetService("ReplicatedStorage").EntityInfo.PlayAgain:FireServer() end}):AddButton({Text="Revive",DoubleClick=true,Func = function()game:GetService("ReplicatedStorage").EntityInfo.Revive:FireServer() end})

local Group2 = Tab:AddRightGroupbox("Misc")
game.Players.LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(function()
if _G.FastCloset and game.Players.LocalPlayer.Character:GetAttribute("Hiding")==true then 
game:GetService("ReplicatedStorage").EntityInfo.CamLock:FireServer()end end)
Group2:AddToggle("Toggle",{
    Text = "Fast Closet Exit",
    Default = false,
    Callback = function(value)
_G.FastCloset = value
end})
game:GetService("RunService").RenderStepped:Connect(function()
pcall(function()
if _G.OpenDoorFar then game.workspace.CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Door").ClientOpen:FireServer()
end 
end)
end)
Group2:AddDivider()
Group2:AddToggle("Toggle",{
    Text = "Reach Door",
    Default = false,
    Callback = function(value)
_G.OpenDoorFar = value
end})
Group2:AddToggle("PromptClip",{
    Text = "Reach Prompt Clip",
    Default = false
})
Toggles.PromptClip:OnChanged(function(value)
for _,v in pairs(workspace:GetDescendants()) do
if v:IsA("ProximityPrompt") then
v.RequiresLineOfSight = not value
v.MaxActivationDistance = _G.RangePrompt
end
end
end)
Group2:AddToggle("InstanceInteract",{
    Text = "Instance Prompt",
    Default = false
})
Toggles.PromptClip:OnChanged(function(value)
for _,v in pairs(workspace:GetDescendants()) do
if v:IsA("ProximityPrompt") then
v.HoldDuration = 0
v.Enabled = true
end
end
end)
Group2:AddSlider("",{
    Text="Prompt Range",
    Default=1,
    Min=1,Max=30,
    Rounding=1,
    Compact=true,
    Callback = function(v)
   _G.RangePrompt = v 
end})

game:GetService("RunService").RenderStepped:Connect(function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = _G.Speed or 16
game.Players.LocalPlayer.Character.Humanoid.MaxSlopeAngle = _G.MaxAngle or 30
workspace.CurrentCamera.FieldOfView = _G.FOV or 70
end)

Group2:AddDivider()
Group2:AddToggle("AntiLag",{
    Text = "Anti Lag",
    Default = false
})
Toggles.AntiLag:OnChanged(function(value)
for _, object in pairs(workspace:GetDescendants()) do
        if object:IsA("BasePart") then
            if not object:GetAttribute("Material") then object:SetAttribute("Material", object.Material) end
            if not object:GetAttribute("Reflectance") then object:SetAttribute("Reflectance", object.Reflectance) end

            object.Material = value and Enum.Material.Plastic or object:GetAttribute("Material")
            object.Reflectance = value and 0 or object:GetAttribute("Reflectance")
        elseif object:IsA("Decal") then
            if not object:GetAttribute("Transparency") then object:SetAttribute("Transparency", object.Transparency) end
        end
    end

    workspace.Terrain.WaterReflectance = value and 0 or 1
    workspace.Terrain.WaterTransparency = value and 0 or 1
    workspace.Terrain.WaterWaveSize = value and 0 or 0.05
    workspace.Terrain.WaterWaveSpeed = value and 0 or 8
end)
Group2:AddToggle("Toggle",{
    Text = "Fullbright",
    Default = false,
    Callback = function(value)
if value then
game.Lighting.Brightness = 1.75
game.Lighting.GlobalShadows = false
game.Lighting.OutdoorAmbient = Color3.new(1,1,1)
else
game.Lighting.Brightness = 1
game.Lighting.GlobalShadows = true
game.Lighting.OutdoorAmbient = Color3.new(0,0,0)
end
end})

Group2:AddToggle("NoFog",{
    Text = "No Fog",
    Default = false
})
Toggles.NoFog:OnChanged(function(value)
if not game.Lighting:GetAttribute("FogStart") then game.Lighting:SetAttribute("FogStart", game.Lighting.FogStart) end
    if not game.Lighting:GetAttribute("FogEnd") then game.Lighting:SetAttribute("FogEnd", game.Lighting.FogEnd) end

    game.Lighting.FogStart = value and 0 or game.Lighting:GetAttribute("FogStart")
    game.Lighting.FogEnd = value and math.huge or game.Lighting:GetAttribute("FogEnd")

    local fog = game.Lighting:FindFirstChildOfClass("Atmosphere")
    if fog then
        if not fog:GetAttribute("Density") then fog:SetAttribute("Density", fog.Density) end

        fog.Density = value and 0 or fog:GetAttribute("Density")
	end
end)
Group2:AddDivider()
Group2:AddToggle("NotifyEntity",{
    Text = "Notifier Entity",
    Default = false,
    Callback = function(v)
if v then
EntityNotifier = workspace.ChildAdded:Connect(function(child)
if child.Name == "Eyes" then
notify("[ Notifier Entity ] : Eyes has spawn please dont look it")
elseif child.Name == "RushMoving" and Distance(child:FindFirstChildWhichIsA("BasePart"), 1000) then
notify("[ Notifier Entity ] :  Rush has spawn find the closet hide now!")
elseif child.Name == "AmbushMoving" and Distance(child:FindFirstChildWhichIsA("BasePart"), 1000) then
notify("[ Notifier Entity ] :  Ambush has spawn find the closet hide now!")
elseif child.Name == "JeffTheKiller" then
notify("[ Notifier Entity ] :  Jeff The Killer has spawn careful it!")
elseif child.Name == "FigureRagdoll" and Distance(child:FindFirstChildWhichIsA("BasePart"), 75) then
notify("[ Notifier Entity ] :  Figure near, careful!")           
end
end)
else
EntityNotifier:Disconnect()
end
end})
_G.PlaySound = true
Group2:AddToggle("Toggle",{
    Text = "Play Sound",
    Default = true,
    Callback = function(value)
_G.PlaySound = value
end})
_G.Volume = 1
Group2:AddSlider("",{
    Text="Volume",
    Default=1,
    Min=1,Max=5,
    Rounding=1,
    Compact=true,
    Callback = function(v)
_G.Volume = v
end})
Group2:AddDivider()
Group2:AddToggle("",{
	Text = "Auto Key Room",
	Callback = function(v)
_G.AutoKey = v
end})
for _, v in pairs(workspace:GetDescendants()) do
if v.Name == "KeyObtain" then
spawn(function()
while task.wait() do
if Distance(v:FindFirstChildWhichIsA("BasePart")) and _G.AutoKey then
fireproximityprompt(v.ModulePrompt)
end
end
end)
end
end
Group2:AddDivider()
Group2:AddToggle("",{
	Text = "Anti Eyes",
	Callback = function(value)
if value and (workspace:FindFirstChild("Eyes")) then
game:GetService("ReplicatedStorage").EntityInfo.MotorReplication:FireServer(-649)
else
game:GetService("ReplicatedStorage").EntityInfo.MotorReplication:FireServer(0, -90, 0, false)
end
end})
game:GetService("Workspace").DescendantAdded:Connect(function(v186)
if  not _G.antibanananana then return;end 
if v186.IsA(v186,"Part") then 
if _G.antibanananana then 
if (v186.Name=="BananaPeel") then 
v186.CanTouch=false;
end 
end 
end 
end);
Group2:AddToggle("MyToggle",{
    Text="Anti Banana",
    Default=false,
    Callback=function(v187)
local v188=0;while true do if (v188==(0 + 0)) then _G.antibanananana=v187;if (_G.antibanananana==true) then for v600,v601 in pairs(game:GetService("Workspace"):GetDescendants()) do if v601:IsA("Part") then if (v601.Name=="BananaPeel") then v601.CanTouch=false;end end end end break;end end end});
game:GetService("RunService").RenderStepped:Connect(function()pcall(function()if _G.antije then for v413,v414 in pairs(game.workspace:GetChildren()) do if (v414.Name=="JeffTheKiller") then v414.Knife.CanTouch=false;end end for v415,v416 in pairs(game.workspace:GetChildren()) do if (v416.Name=="JeffTheKiller") then v416.Head.CanTouch=false;end end for v417,v418 in pairs(game.workspace:GetChildren()) do if (v418.Name=="JeffTheKiller") then v418.HumanoidRootPart.CanTouch=false;end end for v419,v420 in pairs(game.workspace:GetChildren()) do if (v420.Name=="JeffTheKiller") then v420["Left Arm"].CanTouch=false;end end for v421,v422 in pairs(game.workspace:GetChildren()) do if (v422.Name=="JeffTheKiller") then v422["Left Leg"].CanTouch=false;end end for v423,v424 in pairs(game.workspace:GetChildren()) do if (v424.Name=="JeffTheKiller") then v424["Right Arm"].CanTouch=false;end end for v425,v426 in pairs(game.workspace:GetChildren()) do if (v426.Name=="JeffTheKiller") then v426["Right Leg"].CanTouch=false;end end for v427,v428 in pairs(game.workspace:GetChildren()) do if (v428.Name=="JeffTheKiller") then v428.Torso.CanTouch=false;end end end end);end);
Group2:AddToggle("MyToggle",{Text="Anti Jeff The Killer",Default=false,Callback=function(v189)_G.antije=v189;end});
Group2:AddToggle("MyToggle",{Text="Spam Banana Jeff",Default=false,Callback=function(v219)_G.SpamBringjeffshe=v219;while _G.SpamBringjeffshe do wait(0.1);pcall(function()if workspace:FindFirstChild("JeffTheKiller") then for v502,v503 in pairs(workspace:GetChildren()) do if (v503.Name=="BananaPeel") then v503.CFrame=game.Workspace.JeffTheKiller.HumanoidRootPart.CFrame;end end end end);end end});
local Group3 = Tab2:AddLeftGroupbox("ESP")
Group3:AddToggle("Toggle",{
    Text = "Door ESP",
    Default = false,
    Callback = function(value)
if value then 
for _,v in pairs(workspace:GetDescendants()) do
if v.Name == "Door" and v.Parent.Name == "Door" then
Highlight(v, "Door", Color3.fromRGB(80,255,200), "DoorESP")
end		
end					
ESP1 = workspace.ChildAdded:Connect(function(child)                       
for _,v in pairs(workspace:GetDescendants()) do
if v.Name == "Door" and v.Parent.Name == "Door" then
Highlight(v, "Door", Color3.fromRGB(80,255,200), "DoorESP")
end
end                        
end)
else
ESP1:Disconnect()
for _, v in pairs(workspace:GetDescendants()) do
if v.Name == "DoorESP" then
v:Destroy()
end
end
end			
end})
Group3:AddToggle('',{
    Text = "Entity ESP", 
    Default = false,
    Callback = function(value)
if value then
for _,v in pairs(workspace.CurrentRooms:GetDescendants()) do
if v.Name == "RushNew" and v.Parent.Name == "RushMoving" then
CylinderESP(v, "Rush", v.Color, "RushESP")
elseif v.Name == "RushNew" and v.Parent.Name == "AmbushMoving" then
CylinderESP(v, "Ambush", v.Color, "AmbushESP")
elseif v.Name == "RushMoving" then
Highlight(v, "Rush", Color3.fromRGB(80,80,80), "RushESP")
elseif v.Name == "Core" and v.Parent.Name == "Eyes" then
CylinderESP(v, "Eyes", v.Color, "EyesESP")
elseif v.Name == "HumanoidRootPart" and v.Parent.Name == "JeffTheKiller" then
Highlight(v, "Jeff", v.Color, "JeffESP")
elseif v.Name == "FigureRagdoll" then
Highlight(v, "Figure", Color3.new(1), "FigureESP")
end
end
ESP2 = workspace.ChildAdded:Connect(function(child)                       
for _,v in pairs(child:GetDescendants()) do
if v.Name == "RushNew" and v.Parent.Name == "RushMoving" then
CylinderESP(v, "Rush", v.Color, "RushESP")
elseif v.Name == "RushNew" and v.Parent.Name == "AmbushMoving" then
CylinderESP(v, "Ambush", v.Color, "AmbushESP")
elseif v.Name == "RushMoving" then
Highlight(v, "Rush", Color3.fromRGB(80,80,80), "RushESP")
elseif v.Name == "Core" and v.Parent.Name == "Eyes" then
CylinderESP(v, "Eyes", v.Color, "EyesESP")
elseif v.Name == "HumanoidRootPart" and v.Parent.Name == "JeffTheKiller" then
Highlight(v, "Jeff", v.Color, "JeffESP")
elseif v.Name == "FigureRagdoll" then
Highlight(v, "Figure", Color3.new(1), "FigureESP")
end
end                        
end)
else
ESP2:Disconnect()
for _, v in pairs(workspace:GetDescendants()) do
if v.Name == "RushESP" then
v:Destroy()
elseif v.Name == "AmbushESP" then
v:Destroy()
elseif v.Name == "EyesESP" then
v:Destroy()
elseif v.Name == "JeffESP" then
v:Destroy()
elseif v.Name == "FigureESP" then
v:Destroy()						
end
end
end			
end})
Group3:AddToggle("Toggle",{
    Text = "Key ESP",
    Default = false,
    Callback = function(value)
if value then               
for _,v in pairs(workspace:GetDescendants()) do
if v.Name == "KeyObtain" then
Highlight(v, "Key", Color3.fromRGB(80,255,200), "KeyESP")
end		
end					
ESP3 = workspace.ChildAdded:Connect(function(child)                       
for _,v in pairs(workspace:GetDescendants()) do
if v.Name == "KeyObtain" then
Highlight(v, "Key", Color3.fromRGB(80,255,200), "KeyESP")
end
end                        
end)
else
ESP3:Disconnect()
for _, v in pairs(workspace:GetDescendants()) do
if v.Name == "KeyESP" then
v:Destroy()
end
end
end			
end})

Group3:AddToggle("Toggle",{
    Text = "Closet ESP",
    Default = false,
    Callback = function(value)
if value then               
for _,v in pairs(workspace:GetDescendants()) do
if v.Name == "Wardrobe" then
Highlight(v, "Closet", Color3.fromRGB(80,255,200), "ClosetESP")
end		
end					
ESP4 = workspace.ChildAdded:Connect(function(child)                       
for _,v in pairs(workspace:GetDescendants()) do
if v.Name == "Wardrobe" then
Highlight(v, "Closet", Color3.fromRGB(80,255,200), "ClosetESP")
end
end                        
end)
else
ESP4:Disconnect()
for _, v in pairs(workspace:GetDescendants()) do
if v.Name == "ClosetESP" then
v:Destroy()
end
end
end			
end})
Group3:AddToggle("Toggle",{
    Text = "Books & Breakers ESP",
    Default = false,
    Callback = function(value)
if value then               
for _,v in pairs(workspace:GetDescendants()) do
if v.Name == "LiveHintBook" then
Highlight(v, "Book", Color3.fromRGB(80,255,200), "BookESP")
elseif v.Name == "LiveBreakerPolePickup" then
Highlight(v, "Breaker", Color3.fromRGB(80,255,200), "BreakerESP")
end		
end					
ESP5 = workspace.ChildAdded:Connect(function(child)                       
for _,v in pairs(workspace:GetDescendants()) do
if v.Name == "LiveHintBook" then
Highlight(v, "Book", Color3.fromRGB(80,255,200), "BookESP")
elseif v.Name == "LiveBreakerPolePickup" then
Highlight(v, "Breaker", Color3.fromRGB(80,255,200), "BreakerESP")
end	
end                        
end)
else
ESP5:Disconnect()
for _, v in pairs(workspace:GetDescendants()) do
if v.Name == "BookESP" then
v:Destroy()
elseif v.Name == "BreakerESP" then
v:Destroy()
end
end
end			
end})
Group3:AddToggle("Toggle",{
    Text = "Lever & Gate ESP",
    Default = false,
    Callback = function(value)
if value then               
for _,v in pairs(workspace:GetDescendants()) do
if v.Name == "LeverForGate" then
Highlight(v, "Lever", Color3.fromRGB(0,0,200), "LeverESP")
elseif v.Name == "Gate" then
Highlight(v, "Gate", Color3.fromRGB(80,255,200), "GateESP")
end		
end					
ESP6 = workspace.ChildAdded:Connect(function(child)                       
for _,v in pairs(workspace:GetDescendants()) do
if v.Name == "LeverForGate" then
Highlight(v, "Lever", Color3.fromRGB(0,0,200), "LeverESP")
elseif v.Name == "Gate" then
Highlight(v, "Gate", Color3.fromRGB(80,255,200), "GateESP")	
end                        
end)
else
ESP6:Disconnect()
for _, v in pairs(workspace:GetDescendants()) do
if v.Name == "LeverESP" then
v:Destroy()
elseif v.Name == "GateESP" then
v:Destroy()
end
end
end			
end})
Group3:AddDivider()
_G.Highlight = true
Group3:AddToggle("Toggle",{
    Text = "Highlight",
    Default = true,
    Callback = function(value)
_G.Highlight = value
end})
_G.TextSize = 15
Group3:AddSlider("",{
    Text="Text Size",
    Default=15,
    Min=10,Max=25,
    Rounding=1,
    Compact=true,
    Callback = function(v)
_G.TextSize = v
end})
local MenuGroup = Tab3:AddLeftGroupbox("Menu")

MenuGroup:AddToggle("KeybindMenuOpen", { Default = false, Text = "Open Keybind Menu", Callback = function(value) Library.KeybindFrame.Visible = value end})
MenuGroup:AddToggle("ShowCustomCursor", {Text = "Custom Cursor", Default = true, Callback = function(Value) Library.ShowCustomCursor = Value end})
MenuGroup:AddDivider()
MenuGroup:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", { Default = "RightShift", NoUI = true, Text = "Menu keybind" })

Library.ToggleKeybind = Options.MenuKeybind

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

SaveManager:IgnoreThemeSettings()

ThemeManager:SetFolder("mspaint")
SaveManager:SetFolder("mspaint/doors")

SaveManager:BuildConfigSection(Tab3)

ThemeManager:ApplyToTab(Tab3)

SaveManager:LoadAutoloadConfig()

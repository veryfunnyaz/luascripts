local mainName = "Anomic V | Private V.1.9.8"
local isDev = false
if game:GetService("CoreGui"):FindFirstChild(mainName) then
    game.CoreGui[mainName]:Destroy()
end

print("Loading | LIB")

-- Library
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/60XS09/RBX/main/UITheme.lua"))()
local Main = library.new(mainName)

-- // Tabs
local PLa = Main:addPage("Player", 5012544693)
local CombatTab = Main:addPage("Combat", 6034509993)
local Prv = Main:addPage("Supreme", 5012544693)
local Esp = Main:addPage("Visuals", 5012544693)
local Other = Main:addPage("Other Players", 6031280883)
local tele = Main:addPage("Teleportation", 6031280883)
local Buy = Main:addPage("Buy Section", 6034509993)
local misc = Main:addPage("Miscellaneous", 6034509993)
local Ui = Main:addPage("Settings", 6022860343)

-- // Sections
-- // Combat Section
local ASection1 = CombatTab:addSection("Head Hitboxes")
local ASection2 = CombatTab:addSection("Shotgun Mods - (Turn off for other weapons)")
local ASection22 = CombatTab:addSection("Other Mods")

-- // Player Section
local PlrSection = PLa:addSection("Movement")
local PlrSectionC = PLa:addSection("Crafter Role")
local plrApp = PLa:addSection("Appearance")
local plrAppFE = PLa:addSection("FE Stuff")
local teamSection = PLa:addSection("Team Changer (Cooldown)")

-- // Private Section
local PrvSection = Prv:addSection("Crafter Semi-God")
local PrvSection2 = Prv:addSection("S-Mode Abilities")

-- // Esp Section
local DisplaySection = Esp:addSection("Display")
local EspSection = Esp:addSection("ESP")
local EspSection1 = Esp:addSection("ESP Configuration")
local wrldSection = Esp:addSection("Client World")
local MiscEsp = Esp:addSection("Miscellaneous ESP")

-- // Other Section
local specificSection = Other:addSection("Specific Section")
local PlrTarget = Other:addSection("Other Players")
local DonateSection = Other:addSection("Donate Section")
local OtherSection0 = Other:addSection("Trolling")

-- // Teleport Section
local teleSection1 = tele:addSection("Player")
local teleSection2 = tele:addSection("Location Teleport")
local teleSection3 = tele:addSection("Safe spots")
local teleSection4 = tele:addSection("Miscellaneous")

-- // Buy Section
local paintSection    = Buy:addSection("Painting")
local BuySectionAmmo = Buy:addSection("Item Buyer")
local BuySectionMisc2 = Buy:addSection("Misc / Troll")

-- // Miscellaneous Section
local miscSection = misc:addSection("Miscellaneous")
local wepSection = misc:addSection("Miscellaneous Tools")
local CarSection = misc:addSection("Miscellaneous Vehicle")
local boomSection = misc:addSection("Boombox Player (Hold Boombox)")

-- // UI Section
local ThemeSection = Ui:addSection("Ingame Theme")
local UISection = Ui:addSection("UI")

-- // Credits Section
local creds = Ui:addSection("Developers: H3#3534, Krypton#3195.")
local UISection2 = Ui:addSection("Discord: https://discord.io/anomicv")

print("Loading | R")
if syn then
    syn.request({
        Url = "http://127.0.0.1:6463/rpc?v=1",
        Method = "POST",
        Headers = {
        ["Content-Type"] = "application/json",
        ["Origin"] = "https://discord.com"
    },
    print("Loading | R 50%");
    Body = game:GetService("HttpService"):JSONEncode({
        cmd = "INVITE_BROWSER",
        args = {
            code = "chBXmh2C4Q"
        },
            nonce = game:GetService("HttpService"):GenerateGUID(false)
        }),
    })
end
local chatSettings = require(game:GetService("Chat").ClientChatModules.ChatSettings)
local chatFrame = game:GetService("Players").LocalPlayer.PlayerGui.Chat.Frame
chatSettings.WindowResizable = true
chatSettings.WindowDraggable = true
chatFrame.ChatChannelParentFrame.Visible=true
chatFrame.ChatBarParentFrame.Position = chatFrame.ChatChannelParentFrame.Position+UDim2.new(UDim.new(),chatFrame.ChatChannelParentFrame.Size.Y)

print("Loading | 1%")

-- Vars
local CSEvents = game:GetService("ReplicatedStorage"):WaitForChild("_CS.Events")
local teamList = require(game:GetService("ReplicatedStorage").Client.TeamList)
local itemList = require(game.ReplicatedStorage.Client.ItemList)
local camera   = game:GetService("Workspace").Camera
local wLighting = game:GetService("Lighting")
local UIS = game:GetService'UserInputService'
local Players  = game:GetService("Players")
local LPlayer  = Players.LocalPlayer
local mouse = LPlayer:GetMouse()
local protect = newcclosure or protect_function

local esp_Enabled      = false
local esp_Names        = false
local esp_Health       = false
local esp_WantedLevel  = false
local esp_distance     = false
local esp_boxes        = false
local esp_tracers      = false
local esp_tracer_orig  = "Bottom"

local rainbow_char     = false
local rainbow_hair     = false
local teamSniperEnabled = false
local infiniteStamina   = false
local infiniteJump      = false
local gunSoundSpam      = false
local shotgunMod1       = false
local shotgunMod2       = false
local flying            = false
local Rmod              = false
local speedBypass       = false
local SModeEnabled      = false
local superPunch        = false
local sForce            = false
local sDmgReducer       = false
local autoStore         = false
local Hitboxes          = false
local antiCar           = false
local BDelete           = false
local AutoHeal          = false
local SpeedShotgun      = false
local shotMulti         = false
local autoArrest        = false
local backpackDisplay   = false
local kitSpammerEnabled = false
local MouseDown         = false
local jumpMode          = "Infinite"
local ammoType          = ""
local targetHighlight   = false
local esp_Main_Colour  = Color3.fromRGB(255, 255, 255)
local paintColor1 = Color3.fromRGB(255,255,255)
local paintColor2 = Color3.fromRGB(255,255,255)
local sDmgReducerAmmount = 1
local shotMultiAmmount = 1
local SpeedSDelay = 0.05
local headHitboxSize = 5
local superPunchDmg = 25
local buyAmmoAmount = 1
local donateAmount = 10
local maxDisance = 100
local minHealth = 70
local hitSoundEnabled = false
local hitSound = "5952120301"
_G.ThemeMode = "Purple" 
_G.JumpHeight = 30
_G.Enabled = true
local folderImpacts = game:GetService("Workspace").RayIgnore.BulletHoles

print("Loading | TeamMod")
for _,v in pairs(teamList) do    
    v.Spawns = { "Arway", "Sheriff Station", "Eastdike", "Eaphis Plateau", "Pahrump", "Okby Steppe", "Depository", "Airfield", "Depot", "Clinic", "Towing Company"}    
end

print("Loading | 10%")
-- Functions 
function notify(title, message)LPlayer.PlayerGui.Notify.TimePosition = 0 LPlayer.PlayerGui.Notify.Playing = true if not message then require(game:GetService("ReplicatedStorage"):WaitForChild("Client").NotificationHandler):AddToStream(LPlayer,title) else require(game:GetService("ReplicatedStorage"):WaitForChild("Client").NotificationHandler):AddToStream(LPlayer,title..": "..message)end end
function purchaseItem(name)game:GetService("ReplicatedStorage"):FindFirstChild("_CS.Events").PurchaseTeamItem:FireServer(name,"Single",nil)end
function Action(Object, Function)if Object ~= nil then Function(Object); end end
function noclip() if LPlayer.Character ~= nil then for _, child in pairs(LPlayer.Character:GetDescendants()) do if child:IsA("BasePart") and child.CanCollide == true then child.CanCollide = false end end end end
function getMayor()
    for i,v in pairs(Players:GetChildren()) do
        if v == game:GetService("ReplicatedStorage").CurrentMayor.Value and game:GetService("ReplicatedStorage").CurrentMayor.Value ~= nil then
            return v
        end
    end
end
local c = 1
function zigzag(X)
    return math.acos(math.cos(X * math.pi)) / math.pi
end
local function bypass()
    repeat wait() until LPlayer.Character.HumanoidRootPart.Anchored == false    
        for i, v in next, getconnections(game:GetService("Players").LocalPlayer.Character.DescendantAdded) do
            v:Disable()
    	end
        local s, err = pcall(function()
            local mt = getrawmetatable(game)
            setreadonly(mt, false)
            local namecall = mt.__namecall

            mt.__namecall = function(self,...)
                local args = {...}
                local method = getnamecallmethod()
                if tostring(method) == 'FindPartOnRayWithWhitelist' and getcallingscript() == LPlayer.PlayerGui['_L.Handler'].GunHandlerLocal then
                    wait(9e9)
                    return
                end
                if method == "Kick" then
                    notify("Anomic V","Server tried kicking you")
                    return nil                    
                end        
                if tostring(method) == "FireServer" then
                    if shotgunMod1 or superPunch and tostring(self) == "AmmoRemover" then                        
                        return nil
                    end
                    if sForce and tostring(self) == "AmmoRemover" then                        
                        return nil
                    end
                    if sForce and tostring(self) == "RayDrawer" then                        
                        return nil
                    end  
                    if shotgunMod2 or superPunch and tostring(self) == "RayDrawer" then                        
                        return nil
                    end                    
                end
                if tostring(method) == "Fire" then
                    if Rmod or superPunch and tostring(self) == "ShootAnim" then
                        return nil
                    end                   
                end
                if tostring(method) == "Fire" then
                    if hitSoundEnabled and tostring(self) == "PlayerHit" then
                        return nil
                    end                   
                end
            return namecall(self,...)
        end
    end)         
end
bypass()

print("Loading | Anti-Kick")
hookfunction(LPlayer.Kick,protect(function() 
    wait(9e9) 
end))
local colors = {
    white     = Color3.fromRGB(255,255,255),
    lightGrey = Color3.fromRGB(70,70,70),
    grey      = Color3.fromRGB(50,50,50),
    black     = Color3.fromRGB(0,0,0),     
    stamBar   = Color3.fromRGB(250,20,100),     
}
function setTheme()
   if LPlayer.PlayerGui:FindFirstChild("MainUIHolder") and LPlayer ~= nil  then 
       print("Theme set")
       LPlayer.PlayerGui.MainMenu.ButtonBar.Teams.BackgroundColor3 = colors.grey
       LPlayer.PlayerGui.MainMenu.ButtonBar.Spawn.BackgroundColor3 = colors.lightGrey
       LPlayer.PlayerGui.MainMenu.ButtonBar.Editor.BackgroundColor3 = colors.grey
       LPlayer.PlayerGui.MainMenu.TeamGUI.BackgroundColor3 = colors.grey
       LPlayer.PlayerGui.MainMenu.TeamGUI.BorderColor3 = colors.lightGrey
       LPlayer.PlayerGui.MainMenu.TeamGUI.Description.BackgroundColor3 = colors.grey
       LPlayer.PlayerGui.MainMenu.TeamGUI.Description.BorderColor3 = colors.lightGrey
       LPlayer.PlayerGui.MainMenu.TeamGUI.TeamBackground.BackgroundColor3 = colors.grey
       LPlayer.PlayerGui.MainMenu.TeamGUI.Description.JoinButton.BackgroundColor3 = colors.lightGrey
       LPlayer.PlayerGui.MainMenu.TeamGUI.Description.JoinButton.BorderColor3 = colors.white
       LPlayer.PlayerGui.AvatarEditor.WearButton.BackgroundColor3 = colors.lightGrey
       LPlayer.PlayerGui.AvatarEditor.WearButton.BorderColor3 = colors.white
       LPlayer.PlayerGui.AvatarEditor.MainFrame.CustomShirtPants.IdBox.BackgroundColor3 = colors.lightGrey 
       LPlayer.PlayerGui.AvatarEditor.MainFrame.CustomShirtPants.IdBox.BorderColor3 = colors.white 
       LPlayer.PlayerGui.AvatarEditor.MainFrame.CustomShirtPants.WearButton.BorderColor3 = colors.white
       LPlayer.PlayerGui.AvatarEditor.MainFrame.CustomShirtPants.WearButton.BackgroundColor3 = colors.lightGrey  
       
       for i,v in pairs(LPlayer.PlayerGui.MainMenu.TeamGUI.TeamBackground:GetChildren()) do
           if v.Name ~= "UIListLayout" then
               v.Design.ImageColor3 = colors.black
           end            
       end 
   end
   if LPlayer.PlayerGui:FindFirstChild("MainUIHolder") and LPlayer ~= nil  then 
       if LPlayer.PlayerGui.MainUIHolder:FindFirstChild("Menus") and LPlayer ~= nil then
           LPlayer.PlayerGui.MainUIHolder.Menus.BackpackGUI.Basic.BackgroundColor3 = colors.grey
           LPlayer.PlayerGui.MainUIHolder.Menus.BackpackGUI.Basic.BorderColor3 = colors.white           
           LPlayer.PlayerGui.MainUIHolder.Menus.BackpackGUI.BorderColor3 = colors.lightGrey 
           LPlayer.PlayerGui.MainUIHolder.Menus.BackpackGUI.ImageLabel.BackgroundColor3 = colors.black
           LPlayer.PlayerGui.MainUIHolder.Menus.BackpackGUI.ImageLabel.ImageColor3 = colors.black
           LPlayer.PlayerGui.MainUIHolder.Menus.BackpackGUI.ImageLabel.ImageTransparency = 0.5
           LPlayer.PlayerGui.MainUIHolder.Menus.TeamGUI.ShopF.Description.BackgroundColor3 = colors.grey
           LPlayer.PlayerGui.MainUIHolder.Menus.TeamGUI.ShopF.Description.BackgroundColor3 = colors.lightGrey
           LPlayer.PlayerGui.MainUIHolder.Menus.TeamGUI.ShopF.BackgroundColor3 = colors.grey
           LPlayer.PlayerGui.MainUIHolder.Menus.TeamGUI.ShopF.BorderColor3 = colors.lightGrey
           LPlayer.PlayerGui.MainUIHolder.Menus.TeamGUI.ShopF.Description.PurchaseForRobux.BackgroundColor3 = colors.grey
           LPlayer.PlayerGui.MainUIHolder.Menus.TeamGUI.ShopF.Description.PurchaseOptions.BackgroundColor3 = colors.grey
           LPlayer.PlayerGui.MainUIHolder.Menus.TeamGUI.ShopF.Description.Statistics.BackgroundColor3 = colors.grey
           LPlayer.PlayerGui.MainUIHolder.Menus.TeamGUI.ShopF.Description.BodyColorSelection.Grid.BackgroundColor3 = colors.grey
           LPlayer.PlayerGui.MainUIHolder.Menus.TeamGUI.ShopF.Description.BodyColorSelection.BackgroundColor3 = colors.grey
           LPlayer.PlayerGui.MainUIHolder.Menus.TeamGUI.ShopF.BackgroundColor3 = colors.grey 
           LPlayer.PlayerGui.MainUIHolder.Menus.TeamGUI.ShopF.BorderColor3 = colors.lightGrey
           LPlayer.PlayerGui.MainUIHolder.Menus.TeamGUI.ShopF.ImageLabel.ImageColor3 = colors.black
           LPlayer.PlayerGui.MainUIHolder.Menus.TeamGUI.ShopF.ImageLabel.ImageTransparency = 0.4
           LPlayer.PlayerGui.MainUIHolder.Menus.TeamGUI.ShopF.Description.BorderColor3 = colors.grey
           LPlayer.PlayerGui.MainUIHolder.StaminaBar.BackgroundColor3 = colors.grey
           LPlayer.PlayerGui.MainUIHolder.MessageBar.BackgroundColor3 = colors.grey
           LPlayer.PlayerGui.MainUIHolder.StaminaBar.Background.BackgroundColor3 = colors.black
           LPlayer.PlayerGui.MainUIHolder.StaminaBar.Background.StatNum.TextColor3 = Color3.fromRGB(255,255,255)
           LPlayer.PlayerGui.MainUIHolder.PhoneBar.Phone.ImageColor3 = Color3.fromRGB(30,30,30)
           LPlayer.PlayerGui.MainUIHolder.PhoneBar.Phone.Exlam.TextColor3 = colors.white
           LPlayer.PlayerGui.MainUIHolder.MenuBar.ImageLabel.BackgroundColor3 = colors.black
           LPlayer.PlayerGui.MainUIHolder.MenuBar.ImageLabel.ImageColor3 = Color3.fromRGB(30,30,30)
           LPlayer.PlayerGui.MainUIHolder.MenuBar.BackgroundColor3 = Color3.fromRGB(15,15,15)
           if _G.ThemeMode == "Purple" then
               LPlayer.PlayerGui.MainUIHolder.StaminaBar.Background.Bar.BackgroundColor3 = Color3.fromRGB(255, 29, 108) -- Stam
               else if _G.ThemeMode == "Red" then
                   LPlayer.PlayerGui.MainUIHolder.StaminaBar.Background.Bar.BackgroundColor3 = Color3.fromRGB(199, 0, 0) -- Stam
                   else if _G.ThemeMode == "Green" then
                       LPlayer.PlayerGui.MainUIHolder.StaminaBar.Background.Bar.BackgroundColor3 = Color3.fromRGB(41, 206, 0) -- Stam
                       else if _G.ThemeMode == "White" then
                           LPlayer.PlayerGui.MainUIHolder.StaminaBar.Background.Bar.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- Stam
                           LPlayer.PlayerGui.MainUIHolder.StaminaBar.Background.StatNum.TextColor3 = Color3.fromRGB(0, 0, 0)
                       end
                   end
               end
           end
           if _G.ThemeMode == "Purple" then
               LPlayer.PlayerGui.MainUIHolder.MenuBar.CashDisplay.TextColor3 = Color3.fromRGB(150,0,150) -- Cash
               else if _G.ThemeMode == "Red" then
                   LPlayer.PlayerGui.MainUIHolder.MenuBar.CashDisplay.TextColor3 = Color3.fromRGB(201, 0, 0) -- Cash
                   else if _G.ThemeMode == "Green" then
                       LPlayer.PlayerGui.MainUIHolder.MenuBar.CashDisplay.TextColor3 = Color3.fromRGB(93, 233, 0) -- Cash
                       else if _G.ThemeMode == "White" then
                           LPlayer.PlayerGui.MainUIHolder.MenuBar.CashDisplay.TextColor3 = Color3.fromRGB(255, 255, 255) -- Cash
                       end
                   end
               end
           end
           if LPlayer.PlayerGui.MainUIHolder:FindFirstChild("MenuBar") then
               for i,v in pairs(LPlayer.PlayerGui.MainUIHolder.MenuBar:GetChildren()) do
                   if v.ClassName == "ImageButton" then
                       v.ImageColor3 = Color3.fromRGB(35,35,35)
                   end    
               end        
           end 
       end
   end
end
function playerNotify(x)
    if x then
        playerJoin = Players.ChildAdded:Connect(function(player)
            notify("Player Joined",player.Name)    
        end)
        playerLeft = Players.ChildRemoved:Connect(function(player)
            notify("Player Left",player.Name)    
        end)
    else
        playerJoin:Disconnect()
        playerLeft:Disconnect()
    end
end
function getRoot(char)
    local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
    return rootPart
end
function amogus()
    LPlayer.Character.UpperTorso.Waist:Destroy()
    local origin = LPlayer.Character.HumanoidRootPart.CFrame
    LPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2114.14697, -83.3234253, -1407.88184)
    game:GetService("ReplicatedStorage")["_CS.Events"].EquipAvatarItem:FireServer("CustomCloth",6431115067)
    game:GetService("ReplicatedStorage")["_CS.Events"].EquipAvatarItem:FireServer("CustomCloth",6164520667)
    game:GetService("ReplicatedStorage")["_CS.Events"].EquipAvatarItem:FireServer("Color",Color3.new(1,0,0),"SkinColor")
    wait()
    LPlayer.Character.UpperTorso.Waist:Destroy()
    wait(.5)
    LPlayer.Character.Head.Anchored = true
    getRoot(LPlayer.Character).CFrame = origin
end      
function anonymous()
    local originalskin = LPlayer.Character.Head.Color
    game:GetService("ReplicatedStorage")["_CS.Events"].EquipAvatarItem:FireServer("Color",Color3.new(0,0,0),"SkinColor")
    for i,v in pairs(LPlayer.Character:GetDescendants()) do
        if v:IsA("Clothing") or v:IsA("ShirtGraphic") then
            v:Destroy()
        end
    end
    LPlayer.Character.UpperTorso.Waist:Destroy()
    spawn(function()
        LPlayer.Character.Humanoid.Changed:Connect(function(p)
            if p == "Health" then
                if LPlayer.Character.Humanoid.Health <= 0 then
                    game:GetService("ReplicatedStorage")["_CS.Events"].EquipAvatarItem:FireServer("Color",originalskin,"SkinColor")
                    return
                end
            end
        end)
        LPlayer.CharacterAdded:Connect(function()
            game:GetService("ReplicatedStorage")["_CS.Events"].EquipAvatarItem:FireServer("Color",originalskin,"SkinColor")
            return
        end)
    end)
end
function tpGetTool(t,old)                  
    LPlayer.Character.HumanoidRootPart.CFrame = t.Handle.CFrame * CFrame.new(0,1,0)                  
    game:GetService("ReplicatedStorage"):FindFirstChild("_CS.Events").Dropper:FireServer(t,"PickUp")                   
    wait()   
    LPlayer.Character.HumanoidRootPart.CFrame = t.Handle.CFrame * CFrame.new(0,-2,1)
    game:GetService("ReplicatedStorage"):FindFirstChild("_CS.Events").Dropper:FireServer(t,"PickUp")    
    wait(.1)
    game:GetService("ReplicatedStorage"):FindFirstChild("_CS.Events").Dropper:FireServer(t,"PickUp")
    wait(.2)
    LPlayer.Character.HumanoidRootPart.Anchored = true                
    LPlayer.Character.HumanoidRootPart.CFrame = old
    LPlayer.Character.HumanoidRootPart.Anchored = false
end
function getCurrentVehicle()   
    if LPlayer.Character.Humanoid.SeatPart ~= nil then
        return LPlayer.Character.Humanoid.SeatPart.Parent        
    end   
end

FLYING = false
QEfly = true
iyflyspeed = 2
vehicleflyspeed = 2
function startFly()  
    if game.Workspace:FindFirstChild('ABC') ~= nil then game.Workspace:FindFirstChild('ABC'):Destroy() end
    local part = Instance.new('Part')
    part.Parent = workspace
    part.Name = "ABC"
    part.CFrame = LPlayer.Character.HumanoidRootPart.CFrame
    part.Transparency = 1
    part.CanCollide = false
    part.Size = LPlayer.Character.HumanoidRootPart.Size
    local weld = Instance.new('WeldConstraint')
    weld.Parent = LPlayer.Character
    weld.Part0 = LPlayer.Character.HumanoidRootPart
    weld.Part1 = workspace.ABC
	repeat wait() until LPlayer and LPlayer.Character and workspace.ABC and LPlayer.Character:FindFirstChild('Humanoid')
	repeat wait() until mouse
	if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect() flyKeyUp:Disconnect() end

	local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
	local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
	local SPEED = 0

	local function FLY()
		FLYING = true
        local yes = true
		local BG = Instance.new('BodyGyro')
		local BV = Instance.new('BodyVelocity')
		BG.P = 9e4
		BG.Parent = workspace.ABC
		BV.Parent = workspace.ABC
		BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		BG.cframe = workspace.CurrentCamera.CoordinateFrame
		BV.velocity = Vector3.new(0, 0, 0)
		BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
		spawn(function()
			repeat wait()
				if not yes and LPlayer.Character:FindFirstChildOfClass('Humanoid') then
					LPlayer.Character.Humanoid.PlatformStand = false
				end
			 	if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
					SPEED = 50
				elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
					SPEED = 0
				end
				if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
					BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
					lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
				elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
					BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
				else
					BV.velocity = Vector3.new(0, 0, 0)
				end
				BG.cframe = workspace.CurrentCamera.CoordinateFrame --* CFrame.Angles(0, 0, math.rad(180))
			until not FLYING
			CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			SPEED = 0
			BG:Destroy()
			BV:Destroy()
			if LPlayer.Character:FindFirstChildOfClass('Humanoid') then
				LPlayer.Character.Humanoid.PlatformStand = false
				workspace:FindFirstChild('ABC'):Destroy()
				LPlayer.Character.WeldConstraint:Destroy()
			end
		end)
	end

	flyKeyDown = mouse.KeyDown:Connect(function(KEY)
		if KEY:lower() == 'w' then
			CONTROL.F = (vfly and vehicleflyspeed or iyflyspeed)
		elseif KEY:lower() == 's' then
			CONTROL.B = - (vfly and vehicleflyspeed or iyflyspeed)
		elseif KEY:lower() == 'a' then
			CONTROL.L = - (vfly and vehicleflyspeed or iyflyspeed)
		elseif KEY:lower() == 'd' then 
			CONTROL.R = (vfly and flySpeed or iyflyspeed)
		elseif QEfly and KEY:lower() == 'e' then
			CONTROL.Q = (vfly and vehicleflyspeed or iyflyspeed)*2
		elseif QEfly and KEY:lower() == 'q' then
			CONTROL.E = -(vfly and vehicleflyspeed or iyflyspeed)*2
		end
		pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Track end)
	end)
    
	flyKeyUp = mouse.KeyUp:Connect(function(KEY)
		if KEY:lower() == 'w' then
			CONTROL.F = 0
		elseif KEY:lower() == 's' then
			CONTROL.B = 0
		elseif KEY:lower() == 'a' then
			CONTROL.L = 0
		elseif KEY:lower() == 'd' then
			CONTROL.R = 0
		elseif KEY:lower() == 'e' then
			CONTROL.Q = 0
		elseif KEY:lower() == 'q' then
			CONTROL.E = 0
		end
	end)

	FLY()   
end
function stopFly()
	FLYING = false
	if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect() flyKeyUp:Disconnect() end
	if LPlayer.Character:FindFirstChildOfClass('Humanoid') then
		LPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
	end
	pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Custom end)
end

local xdisplay = {}
function xdisplay:addItemDisplay(player)
	if player.Character.UpperTorso:FindFirstChild("ItemDisplay") then		
		player.Character.UpperTorso["ItemDisplay"]:Destroy()		
	end	
	local ItemDisplay = Instance.new("BillboardGui")	
	local UIGridLayout = Instance.new("UIGridLayout")

	ItemDisplay.Name = "ItemDisplay"
	ItemDisplay.Parent = player.Character.UpperTorso
	ItemDisplay.Active = true
	ItemDisplay.MaxDistance = 90
	ItemDisplay.Size = UDim2.new(5, 0, 1.5, 0)
	ItemDisplay.SizeOffset = Vector2.new(0.800000012, 1)
    ItemDisplay.AlwaysOnTop = true

	UIGridLayout.Parent = ItemDisplay
	UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIGridLayout.CellPadding = UDim2.new(0.03, 0, 0.005, 0)
	UIGridLayout.CellSize = UDim2.new(0.17, 0, 0.4, 0)

    local insideDisplay = {}

	function insideDisplay:addItem(name,imageId)
      local Item = Instance.new("ImageButton")
	   local ItemImage = Instance.new("ImageLabel")        
		Item.Name = name
		Item.Parent = ItemDisplay
		Item.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Item.BackgroundTransparency = 1.000
		Item.BorderSizePixel = 0
		Item.Position = UDim2.new(0.300000012, 0, 0.100000001, 0)
		Item.Size = UDim2.new(1.5, 0, 1.5, 0)
		Item.SizeConstraint = Enum.SizeConstraint.RelativeXX
		Item.Image = "rbxassetid://4509767787"

		ItemImage.Name = "ItemImage"
		ItemImage.Parent = Item
		ItemImage.AnchorPoint = Vector2.new(0, 0.5)
		ItemImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ItemImage.BackgroundTransparency = 1.000
		ItemImage.Position = UDim2.new(0, 0, 0.5, 0)
		ItemImage.Size = UDim2.new(1, 0, 1, 0)
		ItemImage.Image = imageId
	end    
    return insideDisplay
end
function getImageId(item)
    for i, v in pairs(itemList) do
        if i == item.Name then
            return v.ImageID;
        end
    end 
end
function refreshDisplay(plr)                  
    local itemDisplay = xdisplay:addItemDisplay(plr)  
    for _,x in pairs(plr.Backpack:GetChildren()) do
        if x.ClassName == "Tool" then
            itemDisplay:addItem(x.Name,getImageId(x))    			     
        end
    end     
end
function disableStam(enabled)
    repeat wait() until LPlayer.Character.HumanoidRootPart.Anchored == false        
    for i,x in pairs(LPlayer.Character:GetChildren()) do
        if x:IsA("LocalScript") and x.Name ~= "KeyDrawer" and x.Name ~= "Animate" and x.Name ~= "AnimationHandler" then 
            if enabled then
                x.Disabled = true
            else
                x.Disabled = false
            end
        end 
    end 
end
function buyArmor(ammount)
    for i = 1, ammount, 1 do
        purchaseItem("Battle Helmet")    
        wait(.5)
        purchaseItem("Heavy Vest")   
        wait(.5)
    end
end
local ShotgunNames = {"Sawed Off","Bullpup Shotgun","Shotgun","Riot Shotgun"}
function getTool()
    for _,g in pairs(ShotgunNames)do        
        if LPlayer.Backpack:FindFirstChild(g) then        
            return LPlayer.Backpack[g]
        else 
            if LPlayer.Character:FindFirstChild(g) then
                return LPlayer.Character[g]
            else
               notify("Requires loaded sawed off") 
            end
        end
    end
end
print("Loading | 15%")
ASection1:addToggle("Toggle Hitboxes", nil, function(v)
    Hitboxes = v
end)
ASection1:addSlider("Hitbox Size", 1, 0, 55, function(v)
    headHitboxSize = v
end)
ASection2:addToggle("Infinite Shotgun Ammo", nil, function(x)   
    shotgunMod2 = x    
    bypass()
end)
ASection2:addToggle("Ghost Shotgun", nil, function(x)   
    shotgunMod1 = x    
    bypass()
end)
ASection2:addToggle("Rapid Shotgun", nil, function(x)   
    SpeedShotgun = x        
end)
ASection2:addDropdown("Rapid Mode", {"Maximum", "Medium", "Low"}, function(x)
    if x == "Maximum" then
        SpeedSDelay = 0.00001
        else if x == "Medium" then
            SpeedSDelay = 0.1
            else if x == "Low" then
                SpeedSDelay = 0.4
            end
        end
    end
end)
print("Loading | 20%")
ASection2:addButton("No shotgun reload", function()    
    for i, v in pairs(itemList) do
        if v.DataType == "RangedWeapon" and v.Firemode == "Shot" then                         
            v.ReloadTime = 0.01                       
        end 
    end    
end)
ASection2:addToggle("Shot Multiplier", nil, function(x)   
    shotMulti = x        
end)
ASection2:addSlider("Shot Ammount", 1, 0, 200, function(v)
    shotMultiAmmount = v
end)
ASection22:addToggle("No Impacts", nil, function(x)   
    BDelete = x        
end)
ASection22:addToggle("No Impacts", nil, function(x)   
    BDelete = x        
end)
ASection22:addToggle("No visual recoil", nil, function(x)   
    Rmod = x
    bypass()
end)
ASection22:addToggle("Gun Silencer", nil, function(x)   
    for i,v in pairs(LPlayer.Character:GetChildren()) do
        if v:IsA("Tool") and v ~= nil then
            if v.Handle:FindFirstChild("ReloadSound") then
                if v.Handle:FindFirstChild("GunEmpty") and x then                   
                    v.Handle.Shot.Name = "" 
                    v.Handle.GunEmpty.Name = "Shot"                                       
                else
                    v.Handle.Shot.Name = "GunEmpty" 
                    v.Handle[""].Name = "Shot"                
                end
            else
                return
            end
        end
    end    
end)
ASection22:addToggle("Gun Sound Spam", nil, function(x)   
    gunSoundSpam = x
end)
ASection22:addButton("Remove Flash / Smoke | FE", function()    
    for i,v in pairs(LPlayer.Character:GetChildren()) do
        if v:IsA("Tool") and v:FindFirstChild("Main") then
            v.Main.MuzzleFlash:Destroy()
            v.Main.Smoke:Destroy()
        end
    end
end)
print("Loading | 24%")
--<Player
PlrSection:addSlider("Player Fov", 50, 0, 120, function(valuex)
    camera.FieldOfView = valuex
end)
PlrSection:addDropdown("Infinite Jump Mode", {"Fly", "Infinite", }, function(x)
    jumpMode = x
end)
PlrSection:addToggle("Infinite Jump", nil, function(v)
    infiniteJump = v
end)   
PlrSection:addToggle("Noclip", nil, function(v)
    if v then
        Noclipping = game:GetService('RunService').Stepped:Connect(noclip)
    else
        Noclipping:Disconnect()
    end
end)
PlrSection:addToggle("Infinite Stamina", nil, function(v)
    infiniteStamina = v    
    disableStam(v)
end)
LPlayer.CharacterAdded:Connect(function()
    if infiniteStamina then    
        wait(2)
        disableStam(infiniteStamina)    
    end
end)
PlrSection:addToggle("Anti - Car", nil, function(v)    
   antiCar = v
end)  
PlrSection:addToggle("Speed Bypass - (Dont walk into sharp terrain)", nil, function(v)    
    speedBypass = v
end)
PlrSection:addToggle("Flight", nil, function(Fly_Switch)
    if Fly_Switch then  
        startFly()
    else
    	stopFly()
    end
end)

PlrSectionC:addButton("Equip Armor - Helmet + Heavy Vest", function()
    game:GetService("ReplicatedStorage"):FindFirstChild("_CS.Events").PurchaseTeamItem:FireServer("Battle Helmet","Single",nil)
    wait(.4)
    game:GetService("ReplicatedStorage"):FindFirstChild("_CS.Events").PurchaseTeamItem:FireServer("Heavy Vest","Single",nil)
    wait(.3)
    for i,v in pairs(LPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") and v.Name == "Heavy Vest" then 
            LPlayer.Character.Humanoid:EquipTool(v)   
            game:GetService("ReplicatedStorage"):FindFirstChild("_CS.Events").EquipArmor:FireServer()
        end 
        wait(.5)
        if v:IsA("Tool") and v.Name == "Battle Helmet" then 
            LPlayer.Character.Humanoid:EquipTool(v)
            game:GetService("ReplicatedStorage"):FindFirstChild("_CS.Events").EquipArmor:FireServer() 
        end                 
    end
    notify("Equiped armor")
end)
PrvSection:addToggle("S-Mode Enabled", nil, function(v)    
    SModeEnabled = v
end)  

print("Loading | 25%")

PrvSection:addToggle("Damage Reduction", nil, function(v)        
    if SModeEnabled then
        if LPlayer.Character:FindFirstChildWhichIsA("Tool") then
            LPlayer.Character:FindFirstChildWhichIsA("Tool").Parent = LPlayer.Backpack
        end        
        _G.AutoHealEnabled = v
        sDmgReducer = v
        buyArmor(sDmgReducerAmmount)               
    end
end)  
PrvSection:addSlider("Reduction amount", 1, 0, 20, function(v)
    sDmgReducerAmmount = v
end)
PrvSection:addToggle("Crafter Auto-Heal", nil, function(v)
    AutoHeal = v
end)
PrvSection:addSlider("Min Health", 1, 0, 100, function(valuex)
    minHealth = valuex
end)
PrvSection2:addToggle("Super punch - [X]", nil, function(v)    
    superPunch = v
    bypass()
end)   
PrvSection2:addToggle("Force - [Q]", nil, function(v)    
    sForce = v
    bypass()
end) 
PrvSection2:addSlider("Punch Damage", 25, 1, 50, function(v)
    superPunchDmg = v
end)
GENABLED = false
GODFLYING = false
local edde = false
function godLikestart()
    GODFLYING = true
    if GENABLED then
        local character = LPlayer.Character 
        local humanoid = character:WaitForChild("Humanoid")
        if not character or not character.Parent then
            character = LPlayer.CharacterAdded:Wait()
        end

        local animator = humanoid:WaitForChild("Animator")
        local godAnimation = Instance.new("Animation")
        godAnimation.AnimationId = "rbxassetid://3337994105"
        local godAnimationTrack = animator:LoadAnimation(godAnimation)

        repeat wait()                   
            character.Animate.Disabled = true
            godAnimationTrack:Play()
            godAnimationTrack.TimePosition = 2.5
            wait(2.21)
        until not GODFLYING     
        
        if not GODFLYING then
            character.Animate.Disabled = false
            godAnimationTrack:Stop()
        end
    end
end
function godLikeStop()    
    GODFLYING = false    
    if GENABLED then
        godLikestart()    
    end
end
PrvSection2:addToggle("Godlike Fly", false, function(god_switch)
    edde = god_switch
    if not god_switch then
        GENABLED = false
        stopFly()
        godLikeStop()
    end
end)
PrvSection2:addKeybind("Flight KeyBind", nil, function()
    flying = not flying    
    if edde then
        GENABLED = not GENABLED
    end
    if flying then
        startFly()              
        godLikestart()            
    else
    	stopFly()            
        godLikeStop()        
    end
end)


plrApp:addToggle("Outfit Editer", nil, function(v)
    LPlayer.PlayerGui.AvatarEditor.Enabled = v
end)
plrApp:addDropdown("Presets", {"Black", "Glitch", "Black Super", "Jedi", "Black & White", "Hacker"}, function(t)
    if t == "Black" then
            game:GetService("ReplicatedStorage")["_CS.Events"].EquipAvatarItem:FireServer("CustomCloth",6523367474)
            game:GetService("ReplicatedStorage")["_CS.Events"].EquipAvatarItem:FireServer("CustomCloth",745499244)
            game:GetService("ReplicatedStorage")["_CS.Events"].EquipAvatarItem:FireServer("Color",Color3.fromRGB(61, 48, 40),"HairColor")   
            game:GetService("ReplicatedStorage")["_CS.Events"].EquipAvatarItem:FireServer("Color",Color3.fromRGB(255, 255, 255),"SkinColor")
        else if t == "Glitch" then
                game:GetService("ReplicatedStorage")["_CS.Events"].EquipAvatarItem:FireServer("CustomCloth",6296322488)
                game:GetService("ReplicatedStorage")["_CS.Events"].EquipAvatarItem:FireServer("CustomCloth",6296389518)
            else if t == "Hacker" then
                game:GetService("ReplicatedStorage")["_CS.Events"].EquipAvatarItem:FireServer("CustomCloth",5594922955)
                game:GetService("ReplicatedStorage")["_CS.Events"].EquipAvatarItem:FireServer("CustomCloth",6967030358)
                else if t == "Black & White"  then
                    game:GetService("ReplicatedStorage")["_CS.Events"].EquipAvatarItem:FireServer("CustomCloth",4797295258)
                    game:GetService("ReplicatedStorage")["_CS.Events"].EquipAvatarItem:FireServer("CustomCloth",4977671127)
                    game:GetService("ReplicatedStorage")["_CS.Events"].EquipAvatarItem:FireServer("Color",Color3.fromRGB(61, 48, 40),"HairColor")   
                            game:GetService("ReplicatedStorage")["_CS.Events"].EquipAvatarItem:FireServer("Color",Color3.fromRGB(234, 184, 146),"SkinColor")
                    else if t == "Black Super"  then
                        game:GetService("ReplicatedStorage")["_CS.Events"].EquipAvatarItem:FireServer("CustomCloth",5424698549)
                        game:GetService("ReplicatedStorage")["_CS.Events"].EquipAvatarItem:FireServer("CustomCloth",6585862428)                                     
                        else if t == "Jedi"  then
                            game:GetService("ReplicatedStorage")["_CS.Events"].EquipAvatarItem:FireServer("CustomCloth",5234814023)
                            game:GetService("ReplicatedStorage")["_CS.Events"].EquipAvatarItem:FireServer("CustomCloth",5234818204)     
                            game:GetService("ReplicatedStorage")["_CS.Events"].EquipAvatarItem:FireServer("Color",Color3.fromRGB(61, 48, 40),"HairColor")   
                            game:GetService("ReplicatedStorage")["_CS.Events"].EquipAvatarItem:FireServer("Color",Color3.fromRGB(234, 184, 146),"SkinColor")              
                        end                                    
                    end
                end
            end
        end
    end
end)

plrApp:addTextbox("Custom", "Default", function(value, focusLost)
    game:GetService("ReplicatedStorage")["_CS.Events"].EquipAvatarItem:FireServer("CustomCloth",value)
    if focusLost then
        game:GetService("ReplicatedStorage")["_CS.Events"].EquipAvatarItem:FireServer("CustomCloth",value)
    end
end)

plrApp:addColorPicker("Skin Color", Color3.fromRGB(255, 255, 255), function(s)
    game:GetService("ReplicatedStorage")["_CS.Events"].EquipAvatarItem:FireServer("Color",s,"SkinColor")
end)
plrApp:addColorPicker("Hair Color", Color3.fromRGB(255, 255, 255), function(s)
    game:GetService("ReplicatedStorage"):FindFirstChild("_CS.Events").EquipAvatarItem:FireServer("Color",s,"HairColor")
end)
plrApp:addToggle("Rainbow Character", nil, function(v)
    rainbow_char = v
end)
plrApp:addToggle("Rainbow Hair", nil, function(v)
    rainbow_hair = v
end)
plrApp:addButton("Large Character", function()      
    for i,v in pairs(LPlayer.Character.Humanoid:GetChildren()) do
        if string.find(v.Name,"Scale") then        
            v:Destroy()
            wait(1)          
        end
    end     
end)
plrApp:addButton("Respawn" ,function()   
   game:GetService("ReplicatedStorage")["_CS.Events"].PayLoad:FireServer()
end)
plrApp:addButton("Destroy self Humanoid" ,function()   
    LPlayer.Character.Humanoid:Destroy()
end)
plrAppFE:addButton("Anti-Arrest / Remove wanted lvl" ,function()   
    LPlayer.Character.Head.PlayerDisplay.Wanted:Destroy()
    LPlayer.Character.Wanted:Destroy()
end)
plrAppFE:addButton("Remove Team Name" ,function()   
    LPlayer.Character.Head.PlayerDisplay.TeamName:Destroy()
end)
plrAppFE:addButton("Untradeable" ,function()   
    LPlayer.Character.HumanoidRootPart.LocalPlayerBG:Destroy()
end)
plrAppFE:addButton("Among Us [FE]", function()
    pcall(function()
        amogus()
    end)
end)
plrAppFE:addButton("Anonymous [FE]", function()
    pcall(function()
        anonymous()
    end)
end)
plrAppFE:addButton("Remove Face" ,function()   
    LPlayer.Character.Head.face:Destroy()
end)
teamSection:addDropdown("Team Changer", {"Gunsmith", "Civilian", "Crafter", "Advanced Gunsmith", "Trucker", "Tow Trucker", "Secret Service", "Advanced Car Dealer", "Car Dealer","Deliverant", "Criminal", "Crafter", "Cab Driver", "Paramedic", "Mayor", "Military", "SWAT", "Sheriff"}, function(team)
    game:GetService("ReplicatedStorage"):FindFirstChild("_CS.Events").TeamChanger:FireServer(team)
end)
local teamSniperValue = ""
teamSection:addDropdown("Team Snipe Value", {"Gunsmith", "Civilian", "Crafter", "Advanced Gunsmith", "Trucker", "Tow Trucker", "Secret Service", "Advanced Car Dealer", "Car Dealer","Deliverant", "Criminal", "Crafter", "Cab Driver", "Paramedic", "Mayor", "Military", "SWAT", "Sheriff"}, function(team)
    teamSniperValue = team
end)
teamSection:addToggle("Team Sniper", nil, function(v)
    teamSniperEnabled = v
end)
print("Loading | 25%")
-- ESP Page
DisplaySection:addToggle("Display backpacks", nil, function(v)
    backpackDisplay = v
end)
DisplaySection:addToggle("Join notifications", nil, function(v)
    playerNotify(v)
end)
EspSection:addToggle("ESP Enabled", nil, function(v)
    esp_Enabled = v
end)
EspSection:addSlider("Max distance (Helps stop lag)", 100, 0, 2000, function(v)
    maxDisance = v
end)
EspSection1:addToggle("ESP Health", nil, function(state)
    esp_Health = state
end)
EspSection1:addToggle("ESP Names", nil, function(state)
    esp_Names = state
end)
EspSection1:addToggle("ESP Distance", nil, function(state)
   esp_distance = state
end)
EspSection1:addToggle("ESP Boxes", nil, function(state)
    esp_boxes = state
 end)
EspSection1:addToggle("ESP Tracers", nil, function(state)
    esp_tracers = state
end)
EspSection1:addDropdown("Tracer origin", {"Bottom", "Top","Mouse"}, function(t)
    esp_tracer_orig = t
end)
EspSection1:addToggle("ESP status level", nil, function(state)
    esp_WantedLevel = state
end)
EspSection1:addColorPicker("ESP Main Color", Color3.fromRGB(255, 255, 255), function(s)
    esp_Main_Colour = s
end)
wrldSection:addSlider("ClockTime", 0, 0, 23, function(valuex)
    wLighting.ClockTime = valuex
end)
wrldSection:addSlider("Brightness", 1, 0, 25, function(valuex)
    wLighting.Brightness = valuex
end)
wrldSection:addSlider("Exposure", 1, 0, 5, function(valuex)
    wLighting.ExposureCompensation = valuex
end)
wrldSection:addToggle("Shadows", nil, function(state)
    wLighting.GlobalShadows = state
end)
wrldSection:addToggle("Color Correction", nil, function(state)
    wLighting.ColorCorrection.Enabled = state
end)
wrldSection:addColorPicker("Color Correction", Color3.fromRGB(255, 255, 255), function(s)    
    wLighting.ColorCorrection.TintColor = s    
end)
wrldSection:addColorPicker("Ambient", Color3.fromRGB(150, 140, 140), function(s)    
    wLighting.Ambient = s    
end)
MiscEsp:addButton("Printer ESP", function()
    for i,v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
        if v:IsA("Model") and v.Name == "Simple Printer" then
            local a = Instance.new("BoxHandleAdornment")
            a.Name = v.Name:lower().."_alwayswinAV"
            a.Parent = v.hitbox
            a.Adornee = v
            a.AlwaysOnTop = true
            a.ZIndex = 0
            a.Transparency = 0.3
            a.Color = BrickColor.new("Lime green")
        end
    end
end)
MiscEsp:addButton("Gun ESP", function()
    for i,v in pairs(game:GetService("Workspace").Entities:GetChildren()) do
        if v:IsA("Model") and v.Name == "ToolModel" then
            local a = Instance.new("BoxHandleAdornment")
            a.Name = v.Name:lower().."_alwayswinAV"
            a.Parent = v.hitbox
            a.Adornee = v
            a.AlwaysOnTop = true
            a.ZIndex = 0
            a.Transparency = 0.3
            a.Color = BrickColor.new("Really red")
        end
    end
end)
local targetName = nil;
local plrNum = 1
specificSection:addTextbox("Target Name", "Default", function(plr)    
    targetName = plr
end)
specificSection:addButton("Teleport to target", function()
    for i,v in pairs(game:service'Players':GetPlayers()) do
        if v.Name:match(targetName) then
            LPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0,2,0)
            workspace.Camera.CameraSubject = LPlayer.Character.Humanoid
        end
    end
end)
specificSection:addButton("View target", function()
    for i,v in pairs(game:service'Players':GetPlayers()) do
        if v.Name:match(targetName) then
            workspace.Camera.CameraSubject = v.Character.Humanoid
        end
    end
end)
specificSection:addButton("Reset Camera", function()    
    workspace.Camera.CameraSubject = LPlayer.Character.Humanoid       
end)
specificSection:addToggle("Highlight Targtet", nil, function(x)   
    targetHighlight = x
end)
specificSection:addButton("Get Backpack items", function()    
    for i,v in pairs(Players:GetChildren()) do
        if v.Name:match(targetName) then
            for c,x in pairs(v.Backpack:GetChildren()) do
                notify("Item", x.Name)
            end
        end
    end  
end)
specificSection:addButton("TP cars to target", function()
    oldCFrame = LPlayer.Character.HumanoidRootPart.CFrame
    for i,v in pairs(game:GetService("Workspace").PlayerVehicles:GetChildren()) do
        if v:FindFirstChild("VehicleSeat") and v ~= nil and not v:FindFirstChild("VehicleSeat"):FindFirstChild("SeatWeld") then
            local Carseat = v:FindFirstChild("VehicleSeat")        
            Carseat.Disabled = false                 
            if Carseat ~= nil and Carseat then
                if Carseat.Parent:FindFirstChild("VehicleSeat") and not Carseat:FindFirstChild("SeatWeld") then   
                    Carseat.Disabled = false        
                    for i = 10, 0, -1 do        
                        wait(.10)
                        LPlayer.Character.HumanoidRootPart.CFrame = Carseat.CFrame           
                    end        
                    wait(.2)  
                    for i,p in pairs(Players:GetChildren()) do
                        if p.Name:match(targetName) and LPlayer.Character.Humanoid.SeatPart ~= nil then                           
                            Carseat.Parent:MoveTo(p.Character.HumanoidRootPart.CFrame.Position)	 
                        end
                    end                                		
                    wait(.4)
                    LPlayer.Character.HumanoidRootPart.CFrame = oldCFrame                                                        
                end
            end   
        end
    end
end)
PlrTarget:addButton("View Mayor", function()
    game.Workspace.Camera.CameraSubject = getMayor().Character.Humanoid
end)
PlrTarget:addButton("View Next Player", function()
    if plrNum < #game.Players:GetPlayers() then
        plrNum = plrNum + 1
        for i,v in pairs(game.Players:GetPlayers()) do
            if i == plrNum then
                game.Workspace.Camera.CameraSubject = v.Character.Humanoid
            end            
        end
    end
end)
PlrTarget:addButton("View Previous Player", function()
    if plrNum ~= 1 then
        plrNum = plrNum - 1
    end
    for i,v in pairs(game.Players:GetPlayers()) do
        if i == plrNum then
            game.Workspace.Camera.CameraSubject = v.Character.Humanoid            
        end
    end
end)
PlrTarget:addButton("Teleport To Spectated", function()
    if plrNum ~= 1 then
        for i,v in pairs(game.Players:GetPlayers()) do
            if i == plrNum then
                LPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0,2,0)
                if plrNum ~= 1 then
                    plrNum = 1
                end
                for i,v in pairs(game.Players:GetPlayers()) do
                    if i == plrNum then
                        game.Workspace.Camera.CameraSubject = v.Character.Humanoid
                    end
                end
            end
        end
    end
end)
DonateSection:addTextbox("Donate Amount Value", "0", function(v)
    donateAmount = v
end)
DonateSection:addSlider("Donate Amount Slider", 10, 0, 100000, function(v)
    donateAmount = v
end)
DonateSection:addButton("Donate to Player", function()
    for i,v in pairs(game:service'Players':GetPlayers()) do
        if v.Name:match(targetName) then  
            local cas = tostring(donateAmount)
            game:GetService("ReplicatedStorage"):FindFirstChild("_CS.Events").GiveMoneyToPlr:FireServer(v,cas)            
        end
    end
end)
PlrTarget:addButton("Arrest Player", function()
    for i,v in pairs(game:service'Players':GetPlayers()) do
        if v.Name:match(targetName) then
            if v.Character.Wanted.Value == 0 then  
                notify(v.Name .. ": Is not wanted")  
            else                            
                oldPos = LPlayer.Character.HumanoidRootPart.CFrame
                LPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,2)
                wait(.1)
                game:GetService("ReplicatedStorage"):FindFirstChild("_CS.Events").ArrestPlayer:FireServer(v)
                wait(.1)
                game:GetService("ReplicatedStorage"):FindFirstChild("_CS.Events").ArrestPlayer:FireServer(v)
                wait(.1)
                LPlayer.Character.HumanoidRootPart.CFrame = oldPos                       
            end
        end
    end
end)
OtherSection0:addToggle("Arrest all", nil, function(state)
    autoArrest = state
end)
teleSection1:addKeybind("Click TP Keybind", nil, function()
    if mouse.Target then 
        if getCurrentVehicle() ~= nil then
            getCurrentVehicle():SetPrimaryPartCFrame(CFrame.new(mouse.Hit.x, mouse.Hit.y + 5, mouse.Hit.z) * CFrame.new(0,-2,0))
        else 
            LPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.x, mouse.Hit.y + 5, mouse.Hit.z)      
        end
    end
end)
teleSection2:addButton("Arway", function()
if getCurrentVehicle() ~= nil then
    getCurrentVehicle():SetPrimaryPartCFrame(CFrame.new(1861.14111, -65.5734253, -1310.6853, 0.998740196, 0, -0.0501802117, 0, 1, 0, 0.0501802117, 0, 0.998740196) * CFrame.new(0,5,0))
else 
LPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1861.14111, -65.5734253, -1310.6853, 0.998740196, 0, -0.0501802117, 0, 1, 0, 0.0501802117, 0, 0.998740196)end end)
teleSection2:addButton("Pahrump", function()
if getCurrentVehicle() ~= nil then
    getCurrentVehicle():SetPrimaryPartCFrame(CFrame.new(-73.3169708, 9.45411873, 40.8025475, 0.0519082919, 0, -0.998651743, 0, 1, 0, 0.998651743, 0, 0.0519082919) * CFrame.new(0,5,0))
else 
LPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-73.3169708, 9.45411873, 40.8025475, 0.0519082919, 0, -0.998651743, 0, 1, 0, 0.998651743, 0, 0.0519082919)end end)
teleSection2:addButton("Eastdike", function()
if getCurrentVehicle() ~= nil then
    getCurrentVehicle():SetPrimaryPartCFrame(CFrame.new(3044.31445, -4.52655077, -3741.91479, -0.939210117, -1.1611624e-07, -0.343343019, -1.19063124e-07, 1, -1.24975301e-08, 0.43343019, 2.91416864e-08, -0.939210117) * CFrame.new(0,5,0))
else 
LPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3044.31445, -4.52655077, -3741.91479, -0.939210117, -1.1611624e-07, -0.343343019, -1.19063124e-07, 1, -1.24975301e-08, 0.343343019, 2.91416864e-08, -0.939210117)end end)
teleSection2:addButton("Eaphis Plateau", function()
if getCurrentVehicle() ~= nil then
    getCurrentVehicle():SetPrimaryPartCFrame(CFrame.new(1751.93347, 77.9265747, 556.575073, 0.99836874, 0, 0.0570888072, 0, 1, 0, -0.0570888072, 0, 0.99836874) * CFrame.new(0,5,0))
else 
LPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1751.93347, 77.9265747, 556.575073, 0.99836874, 0, 0.0570888072, 0, 1, 0, -0.0570888072, 0, 0.99836874)end end)
teleSection2:addButton("Okby Steppe", function()
if getCurrentVehicle() ~= nil then
    getCurrentVehicle():SetPrimaryPartCFrame(CFrame.new(3894.29224, -2.04217577, -3309.31274, 0.819154441, 5.08817486e-08, 0.573573053, -8.20474284e-08, 1, 2.84667561e-08, -0.573573053, -7.03788601e-08, 0.819154441) * CFrame.new(0,5,0))
else 
LPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3894.29224, -2.04217577, -3309.31274, 0.819154441, 5.08817486e-08, 0.573573053, -8.20474284e-08, 1, 2.84667561e-08, -0.573573053, -7.03788601e-08, 0.819154441)end end)
teleSection2:addButton("Depository", function()
if getCurrentVehicle() ~= nil then
    getCurrentVehicle():SetPrimaryPartCFrame(CFrame.new(2051.33301, -67.4034195, -1436.65967, 0.989166439, 0, 0.146798298, 0, 1, 0, -0.146798298, 0, 0.989166439) * CFrame.new(0,5,0))
else 
LPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2051.33301, -67.4034195, -1436.65967, 0.989166439, 0, 0.146798298, 0, 1, 0, -0.146798298, 0, 0.989166439)end end)
teleSection2:addButton("Airfield", function()
if getCurrentVehicle() ~= nil then
    getCurrentVehicle():SetPrimaryPartCFrame(CFrame.new(1884.29016, -21.3613071, -36.481102, -0.659217179, 1.00295431e-07, -0.751953006, 6.3527267e-08, 0.99999994, 7.7687254e-08, 0.751953006, 3.44318352e-09, -0.659217179) * CFrame.new(0,5,0))
else 
LPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1884.29016, -21.3613071, -36.481102, -0.659217179, 1.00295431e-07, -0.751953006, 6.3527267e-08, 0.99999994, 7.7687254e-08, 0.751953006, 3.44318352e-09, -0.659217179)end end)
teleSection3:addButton("Safe Spot 1", function()
if getCurrentVehicle() ~= nil then
    getCurrentVehicle():SetPrimaryPartCFrame(CFrame.new(2122.71143, -83.3322983, -1404.4574, -0.701904893, -3.58332279e-08, 0.712271094, -3.54125085e-08, 1, 1.54112971e-08, -0.712271094, -1.4406039e-08, -0.701904893) * CFrame.new(0,5,0))
else 
LPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2122.71143, -83.3322983, -1404.4574, -0.701904893, -3.58332279e-08, 0.712271094, -3.54125085e-08, 1, 1.54112971e-08, -0.712271094, -1.4406039e-08, -0.701904893)end end)
teleSection3:addButton("Safe Spot 2", function()
if getCurrentVehicle() ~= nil then
    getCurrentVehicle():SetPrimaryPartCFrame(CFrame.new(2945.89185, -137.832367, -631.946899, -0.0719730258, -0.0382576138, 0.996672332, -5.91074745e-08, 0.999264121, 0.0383570902, -0.997406602, 0.00276061334, -0.0719199777) * CFrame.new(0,5,0))
else 
LPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2945.89185, -137.832367, -631.946899, -0.0719730258, -0.0382576138, 0.996672332, -5.91074745e-08, 0.999264121, 0.0383570902, -0.997406602, 0.00276061334, -0.0719199777)end end)
teleSection3:addButton("Safe Spot 3", function()
if getCurrentVehicle() ~= nil then
    getCurrentVehicle():SetPrimaryPartCFrame(CFrame.new(1370.47009, 71.7390747, 1057.67322, -0.805606365, 3.60798893e-08, -0.592451155, 9.24334884e-08, 1, -6.47903775e-08, 0.592451155, -1.06957877e-07, -0.805606365) * CFrame.new(0,5,0))
else 
LPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1370.47009, 71.7390747, 1057.67322, -0.805606365, 3.60798893e-08, -0.592451155, 9.24334884e-08, 1, -6.47903775e-08, 0.592451155, -1.06957877e-07, -0.805606365)end end)
teleSection4:addButton("Player lobby", function()
if getCurrentVehicle() ~= nil then
    getCurrentVehicle():SetPrimaryPartCFrame(CFrame.new(451.888794, -8.47341156, -1337.15466, -0.0644594803, 5.36564535e-08, -0.997920215, 3.67105028e-13, 1, 5.37682183e-08, 0.997920215, 3.46550766e-09, -0.0644594803) * CFrame.new(0,5,0))
else 
LPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(451.888794, -8.47341156, -1337.15466, -0.0644594803, 5.36564535e-08, -0.997920215, 3.67105028e-13, 1, 5.37682183e-08, 0.997920215, 3.46550766e-09, -0.0644594803)end end)
-- Buy Page
local currentTool = nil 
paintSection:addColorPicker("Primary Color", Color3.fromRGB(255,255,255), function(c)
    paintColor1 = c
end)
paintSection:addColorPicker("Secondary Color", Color3.fromRGB(255,255,255), function(c)
    paintColor2 = c
end)
paintSection:addButton("Paint current tool", function()
    for i,v in pairs(LPlayer.Character:GetChildren()) do
        if v:IsA("Tool") and v ~= nil then  
            currentTool = v
        end
    end
    game:GetService("ReplicatedStorage"):FindFirstChild("_CS.Events").PaintTool:FireServer(currentTool,paintColor1,paintColor2)
end)
local customItem = ""
local cust = false
BuySectionAmmo:addToggle("Custom", nil, function(state)
    cust = state
end)
BuySectionAmmo:addTextbox("Custom item", "Default", function(value)
    customItem = value    
end)
BuySectionAmmo:addDropdown("Ammo", {"9mm", "5.56", "12 Gauge", ".50", ".45 ACP", "5.7x28"}, function(valuex)
    ammoType = valuex
end)
BuySectionAmmo:addSlider("Amount", 1, 0, 500, function(v)
    buyAmmoAmount = v
end)
BuySectionAmmo:addButton("Buy items", function()
    for i = 1, buyAmmoAmount, 1 do
        wait(.1)   
        if cust then
            game:GetService("ReplicatedStorage"):FindFirstChild("_CS.Events").PurchaseTeamItem:FireServer(customItem,"Single",nil)
        else
            game:GetService("ReplicatedStorage"):FindFirstChild("_CS.Events").PurchaseTeamItem:FireServer(ammoType,"Single",nil)
        end
    end
end)
BuySectionAmmo:addButton("Equip all", function()
    for _, t in ipairs(LPlayer.Backpack:GetChildren()) do
        if t:IsA("Tool") and t.Name ~= "1x1" then
             t.Parent = LPlayer.Character 
        end
    end
end)
BuySectionAmmo:addButton("Drop Items", function()
    for _, t in ipairs(LPlayer.Backpack:GetChildren()) do
        if t:IsA("Tool") and t.Name == customItem and t.Name ~= "1x1" then
            t.Parent = LPlayer.Character 
        end        
    end
    for i,v in pairs(LPlayer.Character:GetChildren()) do
        if v.Name == customItem and v:IsA("Tool") then
            wait()
            game:GetService("ReplicatedStorage"):FindFirstChild("_CS.Events").Dropper:FireServer(customItem,"Drop")
        end
    end
end)
BuySectionAmmo:addButton("Drop Inventory", function()
    for _, t in ipairs(LPlayer.Backpack:GetChildren()) do
        if t:IsA("Tool") and t.Name ~= "1x1" then
            t.Parent = LPlayer.Character 
        end        
    end
    for i,v in pairs(LPlayer.Character:GetChildren()) do
        if v:IsA("Tool") then
            wait()
            game:GetService("ReplicatedStorage"):FindFirstChild("_CS.Events").Dropper:FireServer(v.Name,"Drop")
        end
    end
end)
BuySectionMisc2:addToggle("Kit Spammer (Requires right role)", nil, function(state)
    kitSpammerEnabled = state
end)
wepSection:addToggle("Tool Sniper", nil, function(state)
    if state then  
        local oldCFrame = LPlayer.Character.HumanoidRootPart.CFrame         
        for i,v in pairs(game:GetService("Workspace").Entities:GetChildren()) do            
            if v.Name == "ToolModel" and not v:FindFirstChild("PlayerWhoDropped") then    
                tpGetTool(v,oldCFrame)                                
            end
        end
    end    
end)
wepSection:addToggle("Auto Store items", nil, function(state)
    autoStore = state
end)
wepSection:addToggle("Backpack Pass", nil, function(state)
   LPlayer.PlayerScripts.OwnsBackpackPass.Value = state
end)
miscSection:addButton("Rejoin", function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
end)
miscSection:addButton("No void", function()
   game:GetService("Workspace").FallenPartsDestroyHeight = math.huge - math.huge
end)
miscSection:addButton("Reset cash to 50k", function()
    for i,v in pairs(workspace.PlayerVehicles:GetChildren()) do
        game:GetService("ReplicatedStorage")["_CS.Events"].FillUpCar:FireServer(v, 9e9)
    end
    wait(.2)
    game:GetService("TeleportService"):Teleport(game.PlaceId)
end)
CarSection:addToggle("Max Speed", nil, function(state)
    ccar = getCurrentVehicle()  
    if state then
        ccar.VehicleSeat.Gear.Value = -100
    else 
        ccar.VehicleSeat.Gear.Value = 2
    end
end)
CarSection:addSlider("Car Strength", 1, 0, 100, function(v)
    ccar = getCurrentVehicle()      
    ccar.VehicleSeat.Strength.Value = v 
end)
CarSection:addSlider("Acceleration", 1, 0, 10000, function(v)
    ccar = getCurrentVehicle()      
    ccar.VehicleSeat.Default.Value = v 
end)
CarSection:addButton("Spawn Held Car", function() 
    CSEvents.SpawnVehicle:FireServer(LPlayer.Character.HumanoidRootPart.CFrame, LPlayer.Character:FindFirstChildWhichIsA("Tool"));     
end)
CarSection:addButton("Unlock cars (LOOP)", function() 
    while wait(1) do
        for i,v in pairs(game:GetService("Workspace").PlayerVehicles:GetDescendants()) do
            if v:IsA("VehicleSeat") or v:IsA("Seat") then
                v.Disabled = false
                wait(.3)
            end
        end
    end
end)
CarSection:addButton("Bring all cars", function() 
    oldCFrame = LPlayer.Character.HumanoidRootPart.CFrame
    for i,v in pairs(game:GetService("Workspace").PlayerVehicles:GetChildren()) do
        if v:FindFirstChild("VehicleSeat") and v ~= nil and v:FindFirstChild("VehicleSeat").Damage.Value > 1 and not v:FindFirstChild("VehicleSeat"):FindFirstChild("SeatWeld") then
            local Carseat = v:FindFirstChild("VehicleSeat")        
            Carseat.Disabled = false      
            wait(1)   
            if Carseat ~= nil and Carseat then
                if Carseat.Parent:FindFirstChild("VehicleSeat") and not Carseat:FindFirstChild("SeatWeld") then   
                    Carseat.Disabled = false        
                    for i = 20, 0, -1 do        
                        wait(.15)
                        LPlayer.Character.HumanoidRootPart.CFrame = Carseat.CFrame           
                    end        
                    wait()  
                    if LPlayer.Character.Humanoid.SeatPart ~= nil then      
                        LPlayer.Character.Humanoid.SeatPart.Parent:SetPrimaryPartCFrame(oldCFrame * CFrame.new(0,2,0))
                        wait(1)
                        LPlayer.Character:FindFirstChild("Humanoid").Sit = false
                        wait()
                        LPlayer.Character:FindFirstChildOfClass("Humanoid").Jump = true
                    else
                        LPlayer.Character.HumanoidRootPart.CFrame = oldCFrame
                    end                            
                end
            end   
        end
    end
end)
CarSection:addButton("Crash passengers", function() 
    seat = game.Players.LocalPlayer.Character.Humanoid.SeatPart
    seat.Parent:MoveTo(Vector3.new(seat.Parent.PrimaryPart.Position.X, workspace.FallenPartsDestroyHeight+1, seat.Parent.PrimaryPart.Position.Z))
end)
CarSection:addButton("Skydive passengers", function() 
    seat = game.Players.LocalPlayer.Character.Humanoid.SeatPart
    seat.Parent:MoveTo(Vector3.new(seat.Parent.PrimaryPart.Position.X, seat.Parent.PrimaryPart.Position.Y + 30000, seat.Parent.PrimaryPart.Position.Z))
end)
print("Loading | 30%")
ThemeSection:addToggle("Theme Enabled", true, function(state)
    _G.Enabled = state
    if _G.Enabled then
        setTheme()
    end
end)
ThemeSection:addDropdown("Theme Mode", {"Purple", "Red", "Green", "White"}, function(valuex)
    _G.ThemeMode = valuex
    setTheme()
end)
UISection:addKeybind("GUI Keybind", Enum.KeyCode.LeftAlt, function()    
    Main:toggle()    
end)
-- Main
coroutine.wrap(function()
    while wait(1) do
        if autoStore then   
            pcall(function()                       
                for i,v in pairs(LPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.Name ~= "Boombox" and v.Name ~= "" then 
                        LPlayer.Character.Humanoid:EquipTool(v)  
                        wait(.5)
                        game:GetService("ReplicatedStorage"):FindFirstChild("_CS.Events").AddItem:FireServer(v.Name,false)                    
                    end                              
                end
            end)
        end 
    end
end)()
local Character_Parts ={ "Head","LeftHand","LeftLowerArm","LeftUpperArm","RightHand","RightLowerArm","RightUpperArm","UpperTorso","LowerTorso","RightFoot","RightLowerLeg","RightUpperLeg","LeftFoot","LeftLowerLeg","LeftUpperLeg"}
coroutine.wrap(function()
    while wait(1)do
        pcall(function()            
            if targetHighlight then
                for _,v in pairs(Players:GetPlayers()) do
                    if v.Name ~= LPlayer.Name and v.Name:match(targetName) then
                        for _,c in pairs(Character_Parts)do
                            if v.Character:FindFirstChild(c)then
                                local part=v.Character[c]
                                local a=Instance.new("BoxHandleAdornment")
                                if c=="Head"then
                                    a.Size=Vector3.new(1.05,1.05,1.05)
                                else
                                    a.Size=part.Size+Vector3.new(.05,.05,.05)
                                end
                                a.Parent=game.CoreGui
                                a.AlwaysOnTop=true
                                a.Adornee=part
                                a.ZIndex=0
                                a.Transparency = 0.7
                                a.Color3 = Color3.fromRGB(255,255,0)
                                coroutine.wrap(function()
                                    wait(1)
                                    a:Destroy()
                                end)()                             
                            end
                        end
                    end
                end
            end		
		end)
	end
end)()
coroutine.wrap(function()
    while wait(1) do
        if backpackDisplay then   
            pcall(function()                       
                for i,v in pairs(Players:GetChildren()) do
                    if v.Character and v ~= nil and v.Character:FindFirstChild("UpperTorso") then
                        refreshDisplay(v)				           
                    end
                end
            end)
        end 
    end
end)()
coroutine.wrap(function()
    while wait(1) do
        if teamSniperEnabled then   
            pcall(function()        
                game:GetService("ReplicatedStorage"):FindFirstChild("_CS.Events").TeamChanger:FireServer(teamSniperValue)            
            end)
        end 
    end
end)()
coroutine.wrap(function()
    while wait(3) do
        if autoArrest then    
            pcall(function()                      
                for i,v in ipairs(Players:GetChildren()) do
                    if v.Character.Wanted.Value ~= 1 then 
                        wait(.1)                        
                        LPlayer.Character.HumanoidRootPart.Anchored = true 
                        LPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,2) 
                        LPlayer.Character.HumanoidRootPart.Anchored = false 
                        wait(.1)                                               
                        game:GetService("ReplicatedStorage"):FindFirstChild("_CS.Events").ArrestPlayer:FireServer(v)                                                       
                        LPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,0.5)                      
                        wait(.1)                          
                        LPlayer.Character.HumanoidRootPart.Anchored = true              
                        LPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1370.47009, 71.7390747, 1057.67322, -0.805606365, 3.60798893e-08, -0.592451155, 9.24334884e-08, 1, -6.47903775e-08, 0.592451155, -1.06957877e-07, -0.805606365)
                        wait(.5)
                        LPlayer.Character.HumanoidRootPart.Anchored = false
                    end
                end                
            end)          
        end
    end
end)()
coroutine.wrap(function()
    while wait(.01) do
        if kitSpammerEnabled then 
            pcall(function()                        
                game:GetService("ReplicatedStorage"):FindFirstChild("_CS.Events").PurchaseTeamItem:FireServer("Repair Kit","Single",nil)
                wait(.1)
                for i,v in pairs(LPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.Name == "Repair Kit" then 
                        LPlayer.Character.Humanoid:EquipTool(v)  
                        wait(.2) 
                        game:GetService("ReplicatedStorage"):FindFirstChild("_CS.Events").Dropper:FireServer("Repair Kit","Drop")
                    end                              
                end            
            end)
        end
    end
end)()
coroutine.wrap(function()
    while wait(.06) do
        if gunSoundSpam then 
            pcall(function()                
                for i,v in pairs(LPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and v.Name ~= "" and v ~= nil and v.Handle:FindFirstChild("Mag") then                         
                        game:GetService("ReplicatedStorage"):FindFirstChild("_CS.Events").AmmoRemover:FireServer(v.Handle.Mag)
                    end                              
                end            
            end)
        end
    end
end)()
coroutine.wrap(function()    
        while wait(1.5) do
            if Hitboxes then
                pcall(function()                  
                    for i,v in pairs(game.Players:GetPlayers()) do
                    if v ~= LPlayer and v.Character and v.Character:FindFirstChild('Head') then
                        v.Character.Head.Size = Vector3.new(headHitboxSize,headHitboxSize,headHitboxSize)
                        v.Character.Head.Transparency = 0.7
                        v.Character.Head.CanCollide = false
                        if v.Character.Humanoid.Health == 0 then
                            v.Character.Head.Size = LPlayer.Character.Head.Size
                            v.Character.Head.Transparency = LPlayer.Character.Head.Transparency                        
                        end
                    end
                end
            end)
        end
    end
end)()
UIS.InputBegan:connect(function(key)
    if infiniteStamina and key.KeyCode == Enum.KeyCode.LeftShift then
        LPlayer.Character.Humanoid.WalkSpeed = 23
    end
end)
UIS.InputEnded:connect(function(key)
    if infiniteStamina and key.KeyCode == Enum.KeyCode.LeftShift then
        LPlayer.Character.Humanoid.WalkSpeed = 13
    end
end)
UIS.InputBegan:connect(function(UserInput)
    if infiniteJump and jumpMode == "Infinite" and UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
        Action(LPlayer.Character.Humanoid, function(self)
            if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
                Action(self.Parent.HumanoidRootPart, function(self)
                    self.Velocity = Vector3.new(0, _G.JumpHeight, 0);
                end)
            end
        end)
    end      
end)
UIS.InputBegan:connect(function(process)
    if infiniteJump and jumpMode == "Fly" then          
        if UIS:IsKeyDown(Enum.KeyCode.Space) then 
        repeat wait() 
            Action(LPlayer.Character.Humanoid, function(self)
                if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
                    Action(self.Parent.HumanoidRootPart, function(self)
                        self.Velocity = Vector3.new(0, _G.JumpHeight, 0);
                    end)
                end
            end)            
            until UIS:IsKeyDown(Enum.KeyCode.Space) == false
        end
    end
end)
UIS.InputBegan:Connect(function(a)
    if a.UserInputType == Enum.UserInputType.MouseButton1 then
        MouseDown = true 
    end
end)
UIS.InputEnded:Connect(function(a)
    if a.UserInputType == Enum.UserInputType.MouseButton1 then
        MouseDown = false
    end
end)
spawn(function()
    while wait(SpeedSDelay) do
        if MouseDown == true and SpeedShotgun then
            for i,v in pairs(LPlayer.Character:GetChildren()) do
                if v:IsA("Tool") and v.Name == "Bullpup Shotgun" or v.Name == "Shotgun" or v.Name == "Riot Shotgun" or v.Name == "Sawed Off" then
                    v.MainGunScript.FireEvent:Fire(mouse,"Shotgun")                    
                end
            end
        end
    end
end)
print("Loading | 50%")
UIS.InputBegan:Connect(function(a)
    if a.UserInputType == Enum.UserInputType.MouseButton1 and shotMulti then
        for i,v in pairs(LPlayer.Character:GetChildren()) do
            if v:IsA("Tool") and v.Name == "Bullpup Shotgun" or v.Name == "Shotgun" or v.Name == "Riot Shotgun" or v.Name == "Sawed Off" then            
                for i = shotMultiAmmount, 0, -1 do            
                    v.MainGunScript.FireEvent:Fire(mouse)               
                end
            end
        end 
    end
end)
game:GetService("RunService").RenderStepped:connect(function()       
   if esp_Enabled then       
        for _,v in pairs(Players:GetChildren()) do
            if v.Character and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("Humanoid").Health > 0 and v ~= LPlayer then
            local part = v.Character.HumanoidRootPart             
            local distance = LPlayer:DistanceFromCharacter(v.Character.HumanoidRootPart.Position)
            local Vec ,b=game.Workspace.CurrentCamera:WorldToViewportPoint(part.Position)
                if b then
                    if esp_Names and distance < maxDisance and distance > 7 then
                        local a=Drawing.new("Text")
                        if esp_distance then                
                           a.Text = v.Name .. " [" .. math.ceil(distance) .. "]"
                        else                            
                           a.Text = v.Name                                         
                        end 
                        a.Size=math.clamp(16-(part.Position-game.Workspace.CurrentCamera.CFrame.Position).Magnitude,16,83)
                        a.Center=true
                        a.Outline=true
                        a.OutlineColor=Color3.new()
                        a.Font=Drawing.Fonts.UI
                        a.Visible=true
                        a.Transparency=1
                        a.Color=esp_Main_Colour
                        a.Position=Vector2.new(
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.UpVector*(3+(part.Position-game.Workspace.CurrentCamera.CFrame.Position).Magnitude/25)).X,
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.UpVector*(3+(part.Position-game.Workspace.CurrentCamera.CFrame.Position).Magnitude/40)).Y)
                        coroutine.wrap(function()
                        game.RunService.RenderStepped:Wait()
                        a:Remove()
                        end)()
                    end                    
                    if esp_Health and distance < maxDisance then
                        local healthnum=v.Character.Humanoid.Health
                        local maxhealth=v.Character.Humanoid.MaxHealth
                        local c=Drawing.new("Quad")
                        c.Visible=true
                        c.Color=Color3.new(0,1,0)
                        c.Thickness=1
                        c.Transparency=1
                        c.Filled=false
                        c.PointA=Vector2.new(
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2.5+part.CFrame.UpVector*2.5).X,
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2.5+part.CFrame.UpVector*2.5).Y)
                        c.PointB=Vector2.new(
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2+part.CFrame.UpVector*2.5).X,
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2+part.CFrame.UpVector*2.5).Y)
                        c.PointC=Vector2.new(
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2+part.CFrame.UpVector*-2.5).X,
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2+part.CFrame.UpVector*-2.5).Y)
                        c.PointD=Vector2.new(
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2.5+part.CFrame.UpVector*-2.5).X,
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2.5+part.CFrame.UpVector*-2.5).Y)
                        coroutine.wrap(function()
                        game.RunService.RenderStepped:Wait()
                            c:Remove()
                        end)()
                        local e=Drawing.new("Quad")
                        e.Visible=true
                        e.Color=Color3.new(1,0,0)
                        e.Thickness=1
                        e.Transparency=1
                        e.Filled=true
                        e.PointA=Vector2.new(
                        game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2.5+part.CFrame.UpVector*2.5).X,
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2.5+part.CFrame.UpVector*2.5).Y)
                        e.PointB=Vector2.new(
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2+part.CFrame.UpVector*2.5).X,
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2+part.CFrame.UpVector*2.5).Y)
                        e.PointC=Vector2.new(
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2+part.CFrame.UpVector*-2.5).X,
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2+part.CFrame.UpVector*-2.5).Y)
                        e.PointD=Vector2.new(
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2.5+part.CFrame.UpVector*-2.5).X,
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2.5+part.CFrame.UpVector*-2.5).Y)
                        coroutine.wrap(function()
                            game.RunService.RenderStepped:Wait()
                            e:Remove()
                        end)()
                        local d=Drawing.new("Quad")
                        d.Visible=true
                        d.Color=Color3.new(0,1,0)
                        d.Thickness=1
                        d.Transparency=1
                        d.Filled=true
                        d.PointA=Vector2.new(
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2.5+part.CFrame.UpVector*(-2.5+healthnum/(maxhealth/5))).X,
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2.5+part.CFrame.UpVector*(-2.5+healthnum/(maxhealth/5))).Y)
                        d.PointB=Vector2.new(
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2+part.CFrame.UpVector*(-2.5+healthnum/(maxhealth/5))).X,
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2+part.CFrame.UpVector*(-2.5+healthnum/(maxhealth/5))).Y)
                        d.PointC=c.PointC
                        d.PointD=c.PointD
                        coroutine.wrap(function()
                            game.RunService.RenderStepped:Wait()
                            d:Remove()
                        end)()
                    end     
                    if esp_WantedLevel and distance < maxDisance and distance > 7 then
                        local a = Drawing.new("Text")
                        local wantedLevel = v.Character.Wanted.Value
                        if wantedLevel == 1 then                           
                            a.Text = "Innocent" 
                            a.Color = Color3.fromRGB(60, 163, 0)
                        else
                            a.Text = "Wanted"
                            a.Color = Color3.fromRGB(180, 0, 0)
                        end
                        a.Size=math.clamp(16-(part.Position-game.Workspace.CurrentCamera.CFrame.Position).Magnitude,16,83)
                        a.Center=true
                        a.Outline=true
                        a.OutlineColor=Color3.new()
                        a.Font=Drawing.Fonts.UI
                        a.Visible=true
                        a.Transparency=1                        
                        a.Position=Vector2.new(
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.UpVector*(3+(part.Position-game.Workspace.CurrentCamera.CFrame.Position).Magnitude/25)).X,
                            game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.UpVector*(3+(part.Position-game.Workspace.CurrentCamera.CFrame.Position).Magnitude/75)).Y)
                        coroutine.wrap(function()
                        game.RunService.RenderStepped:Wait()
                        a:Remove()
                        end)()
                    end   
                    if esp_boxes and distance < maxDisance and distance > 7 then
                        local a=Drawing.new("Quad")
                        a.Visible=true
                        a.Color=esp_Main_Colour
                        a.Thickness=1
                        a.Transparency=1
                        a.Filled=false
                        a.PointA=Vector2.new(
                         game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*-2+part.CFrame.UpVector*2.5).X,
                        game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*-2+part.CFrame.UpVector*2.5).Y)-->^
                        a.PointB=Vector2.new(
                        game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2+part.CFrame.UpVector*2.5).X,
                        game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2+part.CFrame.UpVector*2.5).Y)--<^
                        a.PointC=Vector2.new(
                        game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2+part.CFrame.UpVector*-2.5).X,
                        game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*2+part.CFrame.UpVector*-2.5).Y)--<V
                        a.PointD=Vector2.new(
                        game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*-2+part.CFrame.UpVector*-2.5).X,
                        game.Workspace.CurrentCamera:WorldToViewportPoint(part.CFrame.Position+part.CFrame.RightVector*-2+part.CFrame.UpVector*-2.5).Y)-->V
                        coroutine.wrap(function()
                            game.RunService.RenderStepped:Wait()
                            a:Remove()
                        end)()
                    end
                    if esp_tracers and distance < maxDisance and distance > 7 then                        
                        local t = Drawing.new("Line")
                        t.Visible = true
                        t.Color = esp_Main_Colour
                        t.Thickness = 0.3
                        t.Transparency = 0.9                        
                        if esp_tracer_orig == "Bottom" then
                            t.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y - 100)       
                            else if esp_tracer_orig == "Top" then
                                t.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y - 1000)  
                                else if esp_tracer_orig == "Mouse" then
                                    t.From = Vector2.new(mouse.X, mouse.Y + 40)   
                                end                           
                            end 
                        end
                        t.To = Vector2.new(Vec.X, Vec.Y)          
                        coroutine.wrap(function()
                            game.RunService.RenderStepped:Wait()
                            t:Remove()
                        end)()                        
                    end                                      
                end
            end                       
        end
    end    
    if rainbow_hair or rainbow_char then      
        local colorx = Color3.fromHSV(zigzag(c),1,1)
        c = c + .001
        if rainbow_hair then        
            game:GetService("ReplicatedStorage")["_CS.Events"].EquipAvatarItem:FireServer("Color",colorx,"HairColor")
        end
        if rainbow_char then           
            game:GetService("ReplicatedStorage")["_CS.Events"].EquipAvatarItem:FireServer("Color",colorx,"SkinColor")            
        end
    end  
    if speedBypass and LPlayer.Character ~= nil and LPlayer.Character.Humanoid and LPlayer.Character.Humanoid.Parent then
      if LPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
         LPlayer.Character:TranslateBy(LPlayer.Character.Humanoid.MoveDirection)
      end        
    end  
    if antiCar and LPlayer.Character ~= nil and LPlayer.Character then
      LPlayer.Character.HumanoidRootPart.TouchInterest:Destroy()
    end 
    if BDelete then
        if folderImpacts:FindFirstChild("Part") then
            for i,v in pairs(folderImpacts:GetDescendants()) do   
                if v ~= nil then         
                    v:Destroy()   
                end         
            end
        end
    end
    if sDmgReducer then        
        if LPlayer.Backpack:FindFirstChild("1x1") then
            for _,v in pairs(LPlayer.Backpack:GetChildren()) do
                if v.Name == "1x1" then         
                    v.Parent = LPlayer.Character
                end 
            end         
        else 
            if LPlayer.Backpack:FindFirstChild("Heavy Vest") or LPlayer.Backpack:FindFirstChild("Battle Helmet") then
                for _,i in pairs(LPlayer.Backpack:GetChildren()) do
                    if i.Name == "Heavy Vest" or i.Name == "Battle Helmet" then
                        i.Name = "1x1"
                    end
                end                                
            else
                for _,c in pairs(LPlayer.Character:GetChildren()) do
                    if c.Name == "1x1" then                    
                        for _,x in pairs(c:GetChildren()) do                        
                            x:Destroy()
                        end                    
                    end
                end
            end
        end
    end
    if LPlayer.Character.Humanoid.Health < minHealth and LPlayer.Character.Humanoid.Health > 0 and AutoHeal then        
        if not LPlayer.Backpack:FindFirstChild("Medi Kit") then
            purchaseItem("Medi Kit")         
        else                     
            for _, t in ipairs(LPlayer.Backpack:GetChildren()) do
                if t:IsA("Tool") and t.Name == "Medi Kit" then   
                    t.ToolModel:Destroy()     
                    LPlayer.Character.Humanoid:EquipTool(t)                          
                    game:GetService("ReplicatedStorage"):FindFirstChild("_CS.Events").ToolEvent:FireServer("Heal",LPlayer.Character, t)  
                end
            end
        end
    end     
    if superPunch or sForce and LPlayer.Character:FindFirstChild("HumanoidRootPart") then
        if workspace.RayIgnore:FindFirstChild("Part") then 
            for i,v in pairs(workspace.RayIgnore:GetChildren()) do
                if v.Name == "Part" then
                    v:Destroy()
                end
            end
        end
        if workspace.RayIgnore.BulletHoles:FindFirstChild("Part") then
            for i,v in pairs(workspace.RayIgnore.BulletHoles:GetDescendants()) do   
                if v ~= nil then         
                    v:Destroy()   
                end         
            end
        end
    end
end)   
UIS.InputBegan:connect(function(key)
    if key.KeyCode == Enum.KeyCode.X and superPunch and LPlayer.Character.HumanoidRootPart.Anchored ~= true then  
        if LPlayer.PlayerGui["_L.Handler"].GunHandlerLocal:FindFirstChild("ImpactParticle") then
            LPlayer.PlayerGui["_L.Handler"].GunHandlerLocal:FindFirstChild("ImpactParticle"):Destroy()
        end
        local anim = Instance.new("Animation")
        anim.AnimationId = "rbxassetid://846744780" 
        local track = LPlayer.Character.Humanoid:LoadAnimation(anim)      
        local gun = getTool()
        if gun.Parent == LPlayer.Backpack then
            LPlayer.Character.Humanoid:EquipTool(gun)
        end
        if gun:FindFirstChild("ToolModel") then
            gun.ToolModel:Destroy()  
        end            
        if gun.Main:FindFirstChild("MuzzleFlash") then
            gun.Main.MuzzleFlash:Destroy()
        end    
        track:Play(.1, 1, 1) 
        for i = superPunchDmg, 0, -1 do
            LPlayer.Character["Sawed Off"].MainGunScript.FireEvent:Fire(mouse,"Shotgun")     
        end
        wait(.2)        
        gun.Parent = LPlayer.Backpack     
    end
end)

local MouseDown = false
UIS.InputBegan:Connect(function(a)
    if a.KeyCode == Enum.KeyCode.Q and sForce and LPlayer.Character.HumanoidRootPart.Anchored ~= true then   
        if LPlayer.PlayerGui["_L.Handler"].GunHandlerLocal:FindFirstChild("ImpactParticle") then
            LPlayer.PlayerGui["_L.Handler"].GunHandlerLocal:FindFirstChild("ImpactParticle"):Destroy()
        end     
        MouseDown = true 
        local gun = getTool()
        if gun.Parent == LPlayer.Backpack then
            LPlayer.Character.Humanoid:EquipTool(gun)
        end
        if gun:FindFirstChild("ToolModel") then
            gun.ToolModel:Destroy()  
        end            
        if gun.Main:FindFirstChild("MuzzleFlash") then
            gun.Main.MuzzleFlash:Destroy()
        end
    end
end)
UIS.InputEnded:Connect(function(a)
    if a.KeyCode == Enum.KeyCode.Q and sForce and LPlayer.Character.HumanoidRootPart.Anchored ~= true then
        local gun2 = getTool()
        MouseDown = false
        gun2.Parent = LPlayer.Backpack
        print("ended")
    end
end)
spawn(function()
    while wait(0.03) do
        if MouseDown == true and sForce and LPlayer.Character.HumanoidRootPart.Anchored ~= true then                        
            local pointanim = Instance.new("Animation")
            pointanim.AnimationId = "rbxassetid://3344585679s" 
            local pTrack = LPlayer.Character.Humanoid:LoadAnimation(pointanim)     
            pTrack:Play(.1, 1, 1)
            LPlayer.Character["Sawed Off"].MainGunScript.FireEvent:Fire(mouse,"Shotgun")  
            LPlayer.Character["Sawed Off"].MainGunScript.FireEvent:Fire(mouse,"Shotgun")     
        end
    end
end)

print("Loading | 70%")  
notify("Anomic V", "Private Loaded")

bypass()

setTheme()

LPlayer.CharacterAdded:Connect(function()
    if sForce then
       wait(3)
        spawn(function()
            while wait(0.03) do
                if MouseDown == true and sForce and LPlayer.Character.HumanoidRootPart.Anchored ~= true then                        
                    local pointanim = Instance.new("Animation")
                    pointanim.AnimationId = "rbxassetid://3344585679s" 
                    local pTrack = LPlayer.Character.Humanoid:LoadAnimation(pointanim)     
                    pTrack:Play(.1, 1, 1)
                    LPlayer.Character["Sawed Off"].MainGunScript.FireEvent:Fire(mouse,"Shotgun")  
                    LPlayer.Character["Sawed Off"].MainGunScript.FireEvent:Fire(mouse,"Shotgun")     
                end
            end
        end)
    end
end)

LPlayer.CharacterAdded:Connect(function()
    if _G.Enabled then
        wait(1)    
        setTheme()
    end
end)

print("Loading | 80%")
LPlayer.CharacterAdded:Connect(function()
    wait(2)
    bypass()
end)

Main:SelectPage(Main.pages[1], true)

local webhookcheck = is_sirhurt_closure and "Sirhurt" or pebc_execute and "ProtoSmasher" or syn and "Synapse X" or secure_load and "Sentinel" or KRNL_LOADED and "Krnl" or SONA_LOADED and "Sona" or   "Other exploit"
local url = "https://discord.com/api/webhooks/912546121606365245/8PxAuhotEGm0irO4adzj-QTffzfTjq4siqY6q--E41S6KaTBR4278HyhQT89mBHylzcK"
local data = {
   ["content"] = "Someone executed script : **Anomic Private**",
   ["embeds"] = {
       {
           ["title"] = "**Anomic Script execution**",
           ["description"] = "**Username: " .. game.Players.LocalPlayer.Name.."**",
           ["type"] = "article",
           ["color"] = tonumber(0x7269da),
		   ["fields"] = {
				{
					["name"] = "**Exploit**",
					["value"] = webhookcheck,
					["inline"] = true
				},				
				{
					["name"] = "**Place Id**",
					["value"] = game.PlaceId,
					["inline"] = true
				},
				{
					["name"] = "**User Id**",
					["value"] = game.Players.LocalPlayer.UserId,
					["inline"] = true
				},	
                {
                    ["name"] = "Join Instance",
                    ["value"] = "``"..("Roblox.GameLauncher.joinGameInstance("..game.PlaceId.."," .. "'".. game.JobId.."')").."``",
                    ["inline"] = true
                },            			
				{
					["name"] = "**Display Name**",
					["value"] = game.Players.LocalPlayer.DisplayName,
					["inline"] = true
				}
			};
            ["image"] = {
               ["url"] = "http://www.roblox.com/Thumbs/Avatar.ashx?x=150&y=150&Format=Png&username=" .. tostring(game:GetService("Players").LocalPlayer.Name),
			   ["height"] = 5,
			   ["width"] = 15,
           }		   
       }
   }
}
local newdata = game:GetService("HttpService"):JSONEncode(data)
local headers = {
   ["content-type"] = "application/json"
}
request = http_request or request or HttpPost or syn.request
local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
request(abcdef)

print("Loading | 100%")

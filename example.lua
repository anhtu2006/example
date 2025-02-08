local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

-- Chờ game load xong
if not game:IsLoaded() then
    game.Loaded:Wait()
end

-- Kích hoạt AntiKick ngay sau khi game load và UI được tạo
local function activateAntiKick()
	task.wait(2)
	print("antikick")
	task.wait(1)
    local LocalPlayer = game:GetService("Players").LocalPlayer
    local oldhmmi, oldhmmnc

    oldhmmi = hookmetamethod(game, "__index", function(self, method)
        if self == LocalPlayer and method:lower() == "kick" then
            return error("Expected ':' not '.' calling member function Kick", 2)
        end
        return oldhmmi(self, method)
    end)

    oldhmmnc = hookmetamethod(game, "__namecall", function(self, ...)
        if self == LocalPlayer and getnamecallmethod():lower() == "kick" then
            return
        end
        return oldhmmnc(self, ...)
    end)
end

-- Tải UI sau khi game load xong
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("ehh GUI, scripts made by anhtu")

-- Tạo các tab UI
local autoEnvTab = Window:NewTab("Auto Environment")
local autoEnvSection = autoEnvTab:NewSection("Auto Environment")

local fTab = Window:NewTab("Farm")  
local fSection = fTab:NewSection("Farm")

local teleportTab = Window:NewTab("Teleport")  
local teleportSection = teleportTab:NewSection("Teleport Options") 

local otherTab = Window:NewTab("Other")  
local otherSection = otherTab:NewSection("Other") 

-- Kích hoạt AntiKick ngay sau khi load UI

print("UI đã load và AntiKick đã được kích hoạt!")

--Local G
_G.antiafk = true
_G.autocollectstar = false
_G.autocollectgrandstar = false
_G.autocollectbluestar = false
_G.autocollectmoon = false
_G.autogranitoken = false
_G.autobuybm = false
_G.automats = false 
_G.godmode = false
_G.autofarm = false 
_G.autofarmredmoon = false
_G.autoactive = false
_G.autoredspiderlily = false
_G.autodragonball = false
_G.autodeathberry = false
_G.autograniitems = false


local HRP = nil
local targetItemNames = {}
print("start")
local function updateHRP()
    local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    HRP = Character:WaitForChild("HumanoidRootPart")
    print("HRP Updated:", HRP)
end
updateHRP()
LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1)  
    updateHRP()  
end)


local function buyBMItems()
    while _G.autobuybm do
        local Granibm = workspace.Stalls["Black Market"]:FindFirstChild("Grani")
        if Granibm then
            local boughtSomething = false
            for _, v in pairs(workspace.Stalls["Black Market"]:GetDescendants()) do
                if v:IsA("NumberValue") and v.Name == "Cost" then
                    local itemName = v.Parent.Name
                    for _, targetName in ipairs(targetItemNames) do
                        if string.lower(itemName) == string.lower(targetName) then
                            local args = {
                                [1] = "Buy1",
                                [2] = workspace.Stalls:FindFirstChild(v.Parent.Parent.Parent.Parent.Name):FindFirstChild(v.Parent.Parent.Parent.Name).Shop:FindFirstChild(v.Parent.Name)
                            }
                            game:GetService("ReplicatedStorage").Remotes.Effected:FireServer(unpack(args))
                            print("Buying item: " .. itemName)
                            boughtSomething = true
                            task.wait(0.5) 
                        end
                    end
                end
            end
            if boughtSomething then
                while Granibm do
					Granibm = workspace.Stalls["Black Market"]:FindFirstChild("Grani")
					if not Granibm then
					print("escape")
					break end
					task.wait(60)
                end
            end
        end
        task.wait(20) 
    end
end

local function collectBlueStar()
    while _G.autocollectbluestar do
        local starShowerBlue = workspace:FindFirstChild("StarShower_Blue")
        while starShowerBlue and _G.autocollectbluestar do
            local models1 = starShowerBlue:FindFirstChild("Models")
			if models1 then
				for _, child1 in pairs(models1:GetChildren()) do
					if child1.Name == "BlueStar" and _G.autocollectbluestar then
						print("cbstar")
						task.wait(2)
						HRP.CFrame = child1.CFrame
						local proximityPrompt1 = child1:FindFirstChild("ProximityPrompt")
						if proximityPrompt1 then
							task.wait(0.1)
							fireproximityprompt(proximityPrompt1)
							task.wait(0.1)
							fireproximityprompt(proximityPrompt1)
						end
					end
				end
			end
			task.wait(2)
        end
        task.wait(20)
    end
end

local function collectStar()
    while _G.autocollectstar do
        local starShowerNormal = workspace:FindFirstChild("StarShower_Normal")
        while starShowerNormal and _G.autocollectstar do
            local models2 = starShowerNormal:FindFirstChild("Models")
            if models2 then
                for _, child2 in pairs(models2:GetChildren()) do
                    if child2.Name == "Star" and _G.autocollectstar then
						print("cstar")
                        task.wait(2)
                        HRP.CFrame = child2.CFrame
                        local proximityPrompt2 = child2:FindFirstChild("ProximityPrompt")
                        if proximityPrompt2 then
							task.wait(0.1)
							fireproximityprompt(proximityPrompt2)
							task.wait(0.1)
							fireproximityprompt(proximityPrompt2)
						end
                    end
                end
            end
			task.wait(2)
        end
        task.wait(20)
    end
end

local function collectgrandStar()
    while _G.autocollectgrandstar do
        local starShowergrand = workspace:FindFirstChild("StarShower_Grand")
        while starShowergrand and _G.autocollectgrandstar do
            local models3 = starShowergrand:FindFirstChild("Models")
            if models3 then
                for _, child3 in pairs(models3:GetChildren()) do
                    if child3.Name == "Star" and _G.autocollectgrandstar then
						print("cgstar")
						task.wait(2)
                        HRP.CFrame = child3.CFrame
                        local proximityPrompt3 = child3:FindFirstChild("ProximityPrompt")
                        if proximityPrompt3 then
                            task.wait(0.1)
                            fireproximityprompt(proximityPrompt3)
							task.wait(0.1)
							fireproximityprompt(proximityPrompt3)
						end
                    end
                end
            end
			task.wait(2)
        end
        task.wait(20)
    end
end

local function collectMoon()
    local tele = workspace.Stalls.Telescope.Proximity
    while _G.autocollectmoon do
        local proximityPrompt4 = workspace.Stalls.Telescope.Proximity:FindFirstChild("MoonEvent")
        if proximityPrompt4 then
			print("cmoon")
            task.wait(1)
            HRP.CFrame = tele.CFrame
            task.wait(0.1)
            fireproximityprompt(proximityPrompt4)
        end
        task.wait(10)
    end
end

local function collecttoken()
    while _G.autogranitoken do
        local Granibm = workspace.Stalls["Black Market"]:FindFirstChild("Grani")
        if Granibm then
			local token = false
			local path = workspace.Stalls["Black Market"].Grani.Shop.booth
			local proximityPrompt5 = Granibm.ScriptsandParts.Grani:FindFirstChildOfClass("ProximityPrompt")
			if proximityPrompt5 then
				print("ctoken")
				HRP.CFrame = path.CFrame
				task.wait(0.1)
				fireproximityprompt(proximityPrompt5)
				task.wait(0.1)
				fireproximityprompt(proximityPrompt5)
				token = true
			end
			
			if token then
                while Granibm do
					Granibm = workspace.Stalls["Black Market"]:FindFirstChild("Grani")
					if not Granibm then
					print("escape")
					break end
					task.wait(60)
                end
            end
        end
        task.wait(20)
    end
end

--mats
local giverList = {}
for _, v in pairs(game:GetService("Workspace").MaterialGivers:GetDescendants()) do
    if v.Name == "Giver" then
        table.insert(giverList, v)
    end
end
local function materials()
    while _G.automats do
        for _, giver in pairs(giverList) do 
			task.wait(0.5)
            if giver and giver:FindFirstChild("TouchInterest") and _G.automats then
                firetouchinterest(HRP, giver, 0)
                task.wait(0.5)                              
                firetouchinterest(HRP, giver, 1)
				else return
            end
        end
        task.wait(2) 
    end
end


autoEnvSection:NewToggle("Auto Collect Star", "Enable or disable Auto Collect Star", function(state)
    _G.autocollectstar = state
    if state then
        task.spawn(collectStar)  
    end
end)

autoEnvSection:NewToggle("Auto Collect grand Star", "Enable or disable Auto Collect grand Star", function(state)
    _G.autocollectgrandstar = state
    if state then
        task.spawn(collectgrandStar)
    end
end)

autoEnvSection:NewToggle("Auto Collect Blue Star", "Enable or disable Auto Collect Blue Star", function(state)
    _G.autocollectbluestar = state
    if state then
        task.spawn(collectBlueStar)
    end
end)

autoEnvSection:NewToggle("Auto steal Moon", "must have empty moon", function(state)
    _G.autocollectmoon = state
    if state then
        task.spawn(collectMoon)
    end
end)

autoEnvSection:NewToggle("Auto Grani Token", "Enable or disable Auto Collect Grani Token", function(state)
    _G.autogranitoken = state
    if state then
        task.spawn(collecttoken)  
    end
end)

autoEnvSection:NewToggle("Materials", "Enable or disable collect Materials", function(state)
    _G.automats = state
    if state then
        task.spawn(materials)
    end
end)


--graniitems
autoEnvSection:NewToggle("Auto Grani Items", "", function(state)
    _G.autograniitems = state
    if state then
        task.spawn(function()
            while _G.autograniitems do
                local grani = workspace:FindFirstChild("Grani")
                if grani then
					local items = false
					local torso = grani.Torso
                    local prox = workspace.Grani.Torso:FindFirstChild("ProximityPrompt")
                    if prox then
						print("cgitems")
						HRP.CFrame = torso.CFrame
						task.wait(1)
                        fireproximityprompt(prox)
						task.wait(0.1)
						fireproximityprompt(prox)
						items = true
					end
		
					if items then
						while grani do
							grani = workspace:FindFirstChild("Grani")
							if not grani then
							print("escape")
							break end
							task.wait(60)
						end
					end
                end
                task.wait(10) 
            end
        end)
    end
end)

--lily
autoEnvSection:NewToggle("Auto Collect Red Spider Lily", "", function(state)
    _G.autoredspiderlily = state
    if state then
        task.spawn(function()
            while _G.autoredspiderlily do
                local lily = workspace:FindFirstChild("Lily")
                if lily then
                    local touchInterest1 = lily.Middle
					print("clily")
                    firetouchinterest(HRP, touchInterest1, 0)
                    task.wait(0.1)
                    firetouchinterest(HRP, touchInterest1, 1)
                end
                task.wait(30) 
            end
        end)
    end
end)
--death berry
autoEnvSection:NewToggle("Auto Collect Death Berry", "", function(state)
    _G.autodeathberry = state
    if state then
        task.spawn(function()
            while _G.autodeathberry do
                local death = workspace:FindFirstChild("DeathBush")
                if death then
                    local touchInterest2 = death.Middle
					print("cberry")
                    firetouchinterest(HRP, touchInterest2, 0)
                    task.wait(0.1)
                    firetouchinterest(HRP, touchInterest2, 1)
                end
                task.wait(30) 
            end
        end)
    end
end)

--dragonball
autoEnvSection:NewToggle("Auto Collect DB", "", function(state)
    _G.autodragonball = state
    if state then
        task.spawn(function()
            while _G.autodragonball do
                local ball = workspace:FindFirstChild("DragonBall")
                if ball then
                    local touchInterest3 = ball.Middle
					print("cdb")
                    firetouchinterest(HRP, touchInterest3, 0)
                    task.wait(0.1)
                    firetouchinterest(HRP, touchInterest3, 1)
                end
                task.wait(30) 
            end
        end)
    end
end)







--bm
local ClearTargetButton
autoEnvSection:NewToggle("Auto Buy BM", "Automatically buy items from Black Market", function(state)
    _G.autobuybm = state
    if state then
        task.spawn(buyBMItems)
    end
end)
autoEnvSection:NewTextBox("Add Item Name", "Enter the name of the item to buy", function(text)
    if #targetItemNames < 3 then
        table.insert(targetItemNames, text)
        print("Added target item: " .. text)
        print("Current target items: " .. table.concat(targetItemNames, ", "))
    end
end)
ClearTargetButton = autoEnvSection:NewButton("Clear Target Items", "Clear all target items", function()
    if #targetItemNames > 0 then
        print("Clearing target items: " .. table.concat(targetItemNames, ", "))
        targetItemNames = {}
        print("All target items have been cleared.")
    end
end)

--autofarm--

local function resetCharacter()
    if LocalPlayer.Character then
        LocalPlayer.Character:BreakJoints()
    end
end
local function isBloodMoon()
    local moonType = ReplicatedStorage.DayNightCycle:FindFirstChild("MoonType")
    return moonType and moonType.Value == "Blood"
end
local function isNormalMoon()
    local moonType = ReplicatedStorage.DayNightCycle:FindFirstChild("MoonType")
    return moonType and moonType.Value == "Normal"
end

--autofarmmob
local enemiesFolder = workspace:FindFirstChild("Enemies")
local Mobs = {}

local enemies = workspace.Enemies:GetDescendants()
for i, v in pairs(enemies) do
    if v:IsA("ObjectValue") and v.Parent:IsA("Model") and v.Name == "Model" then
        if not table.find(Mobs, tostring(v.Value)) then
            table.insert(Mobs, tostring(v.Value))
        end
    end
end

local selectedMob1 = nil
local selectedMob2 = nil

fSection:NewDropdown("Slot 1", "", Mobs, function(selectedMob)
    selectedMob1 = selectedMob  
end)

fSection:NewDropdown("Slot 2", "", Mobs, function(selectedMob)
    selectedMob2 = selectedMob 
end)

local function getEnemyLocations(mobName)
    local locations = {}
    for _, enemy in pairs(workspace.Enemies:GetDescendants()) do
        if enemy:IsA("ObjectValue") and enemy.Parent:IsA("Model") and enemy.Name == "Model" then
            if tostring(enemy.Value) == mobName then
                local enemyModel = enemy.Parent
                local enemyLocation = enemyModel:FindFirstChild("EnemyLocation")
                if enemyLocation then
                    table.insert(locations, enemyLocation)
                end
            end
        end
    end
    return locations
end

local function atfarm(mobName, toggleVar)
    while _G[toggleVar] do
        if HRP and isNormalMoon() then
            local enemyLocations = getEnemyLocations(mobName) 
            for i, location in pairs(enemyLocations) do
                if HRP and _G[toggleVar] and not location.Parent:FindFirstChild("EnemyDefeat") and isNormalMoon() then
					local combatFolderExistTime = 0
					while workspace:FindFirstChild("CombatFolder") do
						combatFolderExistTime = combatFolderExistTime + 0.5
						if combatFolderExistTime >= 120 then
							resetCharacter()
							break
						end
						task.wait(1)
					end
                    HRP.CFrame = location.CFrame
                    task.wait(2) 
                end
            end
        end
        task.wait(2)  -- D?i 2s tru?c khi l?p l?i
    end
end

--redmoon
local areaCache = {} 
local function initializeAreaCache()
    areaCache = {}
    for _, areaFolder in ipairs(workspace.Enemies:GetChildren()) do
        local tierValue = areaFolder:FindFirstChild("Tier")
        if tierValue and tierValue:IsA("NumberValue") and (tierValue.Value == 1 or tierValue.Value == 2) then
            table.insert(areaCache, areaFolder)
        end
    end
end
initializeAreaCache()

local function atredmoon()
    task.spawn(function()
        while _G.autofarmredmoon do
            if HRP and isBloodMoon() then  
				while isBloodMoon() do
					for _, areaFolder in ipairs(areaCache) do
						for _, enemy in ipairs(areaFolder:GetChildren()) do
							if enemy:IsA("Model") and not enemy:FindFirstChild("EnemyDefeat") and enemy:FindFirstChild("EnemyLocation") and _G.autofarmredmoon and isBloodMoon() then
								local combatFolderExistTime = 0
								while workspace:FindFirstChild("CombatFolder") do
									combatFolderExistTime = combatFolderExistTime + 0.1
									if combatFolderExistTime >= 5 then
										resetCharacter()
										break
									end
									local args = {
										[1] = "UseItem",  
										[2] = 1,          
									}
									game:GetService("ReplicatedStorage"):WaitForChild("Server"):FireServer(unpack(args))
									task.wait(0.2)
								end
								HRP.CFrame = enemy.EnemyLocation.CFrame
								task.wait(2)
							end
						end
						task.wait(1)	
					end
                end
            end
            task.wait(20)
        end
    end)
end

--godmode
local function toggleGodmode()
	while _G.godmode do
        local combatFolder = workspace:FindFirstChild("CombatFolder")
        if combatFolder then
        combatFolder:Destroy()
		task.wait(0.5)
        end
		task.wait(1) 
    end
end
--atfarm
fSection:NewToggle("Auto Farm Slot 1", "", function(state)
    _G.autofarm1 = state
    if state and selectedMob1 then
        task.spawn(atfarm, selectedMob1, "autofarm1")
    end
end)
fSection:NewToggle("Auto Farm Slot 2", "", function(state)
    _G.autofarm2 = state
    if state and selectedMob2 then
        task.spawn(atfarm, selectedMob2, "autofarm2")
    end
end)
--redmoon
fSection:NewToggle("AutoFarmRedMoon", "Ch? ho?t d?ng khi Blood Moon", function(state)
    _G.autofarmredmoon = state
    if state then
        task.spawn(atredmoon)
    end
end)
--godmode
fSection:NewToggle("Godmode v1 ", "?????????? just try it ", function(state)
	_G.godmode = state
	if state then
		task.spawn(toggleGodmode)
	end
end)

fSection:NewButton("GodMode v2 ", "may get ban", function()
    -- **2. Sau đó kích hoạt GodMode**
    local Remote = game:GetService("ReplicatedStorage"):FindFirstChild("DamageNew", true)
    local Player = game:GetService("Players").LocalPlayer
    local OldNameCall = nil

    OldNameCall = hookmetamethod(game, "__namecall", function(self, ...)
        local Args = {...}
        if self == Remote and Args[1] == Player.Character then
            return
        end
        return OldNameCall(self, unpack(Args))
    end)
end)



--autoactive
local repeatTime = 0.1  
fSection:NewSlider("Repeat Time", "", 10, 0.2, function(value)
    repeatTime = value  
end)
fSection:NewToggle("Auto Active 1", "nil", function(state)
    _G.autoactive = state 
    if _G.autoactive then
        spawn(function()
            while _G.autoactive do  
                local args = {
                    [1] = "UseItem",  
                    [2] = 1,          
                }
                game:GetService("ReplicatedStorage"):WaitForChild("Server"):FireServer(unpack(args))
                wait(repeatTime) 
            end
        end)
    end
end)
local repeatTime = 0.1  
fSection:NewSlider("Repeat Time", "", 10, 0.2, function(value)
    repeatTime = value  
end)
fSection:NewToggle("Auto Active 2", "nil", function(state)
    _G.autoactive = state 
    if _G.autoactive then
        spawn(function()
            while _G.autoactive do  
                local args = {
                    [1] = "UseItem",  
                    [2] = 2,          
                }
                game:GetService("ReplicatedStorage"):WaitForChild("Server"):FireServer(unpack(args))
                wait(repeatTime) 
            end
        end)
    end
end)
local repeatTime = 0.1 
fSection:NewSlider("Repeat Time", "", 10, 0.2, function(value)
    repeatTime = value  
end)
fSection:NewToggle("Auto Active 3", "nil", function(state)
    _G.autoactive = state 
    if _G.autoactive then
        spawn(function()
            while _G.autoactive do  
                local args = {
                    [1] = "UseItem",  
                    [2] = 3,          
                }
                game:GetService("ReplicatedStorage"):WaitForChild("Server"):FireServer(unpack(args))
                wait(repeatTime) 
            end
        end)
    end
end)



-- teleportsection--
--fairy
teleportSection:NewButton("Teleport to Fairy", "blue moon only", function()
    task.spawn(function()
        for _, Models in ipairs(workspace:GetChildren()) do
            if Models:IsA("Model") then
                for _, child in ipairs(Model:GetChildren()) do
                    if child:IsA("Model") and child.Name == "Fairy" then
                        HRP.CFrame = child.CFrame
                        print("Teleported to Fairy")
                        break
                    end
                end
            end
        end
    end)
end)
--radi omega
teleportSection:NewButton("Radi Omega", "trading blood tear", function()
	task.spawn(function()
		HRP.CFrame = workspace.WorldMap["Demon Lair"].RrrrRadi_Omega.Head.CFrame
	end)
end)
--bm
teleportSection:NewButton("BM", "this fking useless so just use the auto buy or granitoken", function()
	task.spawn(function()
		HRP.CFrame = workspace.Stalls["Black Market"].Grani.Shop.booth.CFrame
	end)
end)
--statues
local statueFolder = workspace.Statues 
local statues = {}  
for _, v in pairs(statueFolder:GetChildren()) do
    if v:IsA("Model") then  
        table.insert(statues, v.Name)
    end
end
teleportSection:NewDropdown("Statues list", "Select a statue to teleport", statues, function(selectedStatue)
    local selectedStatueObj = statueFolder:FindFirstChild(selectedStatue)
    
    if selectedStatueObj then
        HRP.CFrame = selectedStatueObj.Part.CFrame 
	end
end)

LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1)  
    updateHRP()  
end)
--server
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
teleportSection:NewButton("Change Server", "Change to a new server", function()
    local placeId = game.PlaceId
    local player = Players.LocalPlayer
    print("Changing server...")
    TeleportService:Teleport(placeId, player)  
end)

--other--
local VirtualUser = game:GetService("VirtualUser")
local Players = game:GetService("Players")
local function antiAFK()
    Players.LocalPlayer.Idled:Connect(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
        print("Anti-AFK")
    end)
end
otherSection:NewButton("AntiAFK", "You will not get disconnected for idling", function()
	task.spawn(function()
		antiAFK()
	end)
end)

otherSection:NewButton("fps boost", "", function()
    local Terrain = workspace:FindFirstChildOfClass('Terrain')
	Terrain.WaterWaveSize = 0
	Terrain.WaterWaveSpeed = 0
	Terrain.WaterReflectance = 0
	Terrain.WaterTransparency = 0
	settings().Rendering.QualityLevel = 1
	for i,v in pairs(game:GetDescendants()) do
		if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("MeshPart") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
			v.Material = "Plastic"
			v.Reflectance = 0
		elseif v:IsA("Decal") then
			v.Transparency = 1
		elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
			v.Lifetime = NumberRange.new(0)
		elseif v:IsA("Explosion") then
			v.BlastPressure = 1
			v.BlastRadius = 1
		end
	end
	workspace.Campfires:Destroy()
	for i,v in pairs(Lighting:GetDescendants()) do
		if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") then
			v.Enabled = false
		end
	end
	workspace.DescendantAdded:Connect(function(child)
		task.spawn(function()
			if child:IsA('ForceField') then
				RunService.Heartbeat:Wait()
				child:Destroy()
			elseif child:IsA('Sparkles') then
				RunService.Heartbeat:Wait()
				child:Destroy()
			elseif child:IsA('Smoke') or child:IsA('Fire') then
				RunService.Heartbeat:Wait()
				child:Destroy()
			end
		end)
	end)
end)

otherSection:NewKeybind("Toggle UI Button", "Toggle UI Button", Enum.KeyCode.LeftControl, function()
	Library:ToggleUI()
end)

activateAntiKick()

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("ehh GUI, scripts made by anhtu")

--Tab
local autoEnvTab = Window:NewTab("Auto Environment")
local autoEnvSection = autoEnvTab:NewSection("Auto Environment")

local fTab = Window:NewTab("Farm")  
local fSection = fTab:NewSection("Farm")

local teleportTab = Window:NewTab("Teleport")  
local teleportSection = teleportTab:NewSection("Teleport Options") 

local otherTab = Window:NewTab("Other")  
local otherSection = otherTab:NewSection("Other") 

--Local G

_G.autocollectstar = false
_G.autocollectgrandstar = false
_G.autocollectbluestar = false
_G.autocollectmoon = false
_G.autogranitoken = fale
_G.autobuybm = false
_G.automats = false 
_G.godmode = false
_G.autofarm = false 
_G.autofarmredmoon = false
_G.autoactive = false
_G.autoredspiderlily = false
_G.autodragonball = false
_G.autodeathberry = false


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
		print("bm")
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
        task.wait(60) 
    end
end

local function collectBlueStar()
    while _G.autocollectbluestar do
		print("bstar")
        local starShowerBlue = workspace:FindFirstChild("StarShower_Blue")
        if starShowerBlue then
            local models1 = starShowerBlue:FindFirstChild("Models")
            if models1 then
                for _, child1 in pairs(models1:GetChildren()) do
                    if child1.Name == "BlueStar" and _G.autocollectbluestar then
						print("bstar")
                        task.wait(2)
                        HRP.CFrame = child1.CFrame
                        local proximityPrompt1 = child1:FindFirstChild("ProximityPrompt")
                        if proximityPrompt1 then
                            task.wait(0.7)
                            fireproximityprompt(proximityPrompt1)
                        end
                    end
                end
            end
        end
        task.wait(60)
    end
end

local function collectStar()
    while _G.autocollectstar do
		print("star")
        local starShowerNormal = workspace:FindFirstChild("StarShower_Normal")
        if starShowerNormal then
            local models2 = starShowerNormal:FindFirstChild("Models")
            if models2 then
                for _, child2 in pairs(models2:GetChildren()) do
                    if child2.Name == "Star" and _G.autocollectstar then
						print("star")
                        task.wait(2)
                        HRP.CFrame = child2.CFrame
                        local proximityPrompt2 = child2:FindFirstChild("ProximityPrompt")
                        if proximityPrompt2 then
                            task.wait(0.7)
                            fireproximityprompt(proximityPrompt2)
						end
                    end
                end
            end
        end
        task.wait(60)
    end
end

local function collectgrandStar()
    while _G.autocollectgrandstar do
		print("gstar")
        local starShowergrand = workspace:FindFirstChild("StarShower_Grand")
        if starShowergrand then
            local models5 = starShowergrand:FindFirstChild("Models")
            if models5 then
                for _, child5 in pairs(models5:GetChildren()) do
                    if child5.Name == "Star" and _G.autocollectgrandstar then
						print("gstar")
                        task.wait(2)
                        HRP.CFrame = child5.CFrame
                        local proximityPrompt5 = child5:FindFirstChild("ProximityPrompt")
                        if proximityPrompt5 then
                            task.wait(0.7)
                            fireproximityprompt(proximityPrompt5)
						end
                    end
                end
            end
        end
        task.wait(60)
    end
end

local function collectMoon()
    local tele = workspace.Stalls.Telescope.Proximity
    while _G.autocollectmoon do
		print("moon")
        local proximityPrompt3 = workspace.Stalls.Telescope.Proximity:FindFirstChild("MoonEvent")
        if proximityPrompt3 then
			print("moon")
            task.wait(1)
            HRP.CFrame = tele.CFrame
            task.wait(0.7)
            fireproximityprompt(proximityPrompt3)
        end
        task.wait(60)
    end
end

local function collecttoken()
    while _G.autogranitoken do
		print("token")
        local Granibm = workspace.Stalls["Black Market"]:FindFirstChild("Grani")
        if Granibm then
			local token = false
			local path = workspace.Stalls["Black Market"].Grani.Shop.booth
			local proximityPrompt4 = Granibm.ScriptsandParts.Grani:FindFirstChildOfClass("ProximityPrompt")
			if proximityPrompt4 then
				HRP.CFrame = path.CFrame
				task.wait(0.7)
				fireproximityprompt(proximityPrompt4)
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
        task.wait(60)
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
		task.wait()
		print("fruit")
        for _, giver in pairs(giverList) do
			task.wait(0.5)
            if giver and giver:FindFirstChild("TouchInterest") and _G.automats then
                firetouchinterest(HRP, giver, 0)
                task.wait(0.5)                              
                firetouchinterest(HRP, giver, 1)
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
--lily
autoEnvSection:NewToggle("Auto Collect Red Spider Lily", "", function(state)
    _G.autoredspiderlily = state
    if state then
        task.spawn(function()
            while _G.autoredspiderlily do
				print("lily")
                local lily = workspace:FindFirstChild("Lily")
                if lily then
                    local touchInterest = lily.Middle:FindFirstChild("TouchInterest")
                    if touchInterest then
                        firetouchinterest(HRP, touchInterest, 0)
                        task.wait(0.5)
                        firetouchinterest(HRP, touchInterest, 1)
                    end
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
				print("berry")
                local death = workspace:FindFirstChild("DeathBush")
                if death then
                    local touchInterest = death.Middle:FindFirstChild("TouchInterest")
                    if touchInterest then
                        firetouchinterest(HRP, touchInterest, 0)
                        task.wait(0.5)
                        firetouchinterest(HRP, touchInterest, 1)
                    end
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
				print("db")
                local ball = workspace:FindFirstChild("DragonBall")
                if ball then
                    local touchInterest = ball.Middle:FindFirstChild("TouchInterest")
                    if touchInterest then
                        firetouchinterest(HRP, touchInterest, 0)
                        task.wait(0.5)
                        firetouchinterest(HRP, touchInterest, 1)
                    end
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

--autofarmmob
local enemies = workspace.Enemies:GetDescendants()
local Mobs = {}

for i, v in pairs(enemies) do
    if v:IsA("ObjectValue") and v.Parent.Name == "Enemy" and v.Parent:IsA("Model") and v.Name == "Model" then
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





--redmoon
local areaCache = {} 
local function initializeAreaCache()
    areaCache = {}
    for _, areaFolder in ipairs(workspace.Enemies:GetChildren()) do
        local tierValue = areaFolder:FindFirstChild("Tier")
        if tierValue and tierValue:IsA("NumberValue") and (tierValue.Value == 1 or tierValue.Value == 2) then
            table.insert(areaCach
			e, areaFolder)
        end
    end
end
initializeAreaCache()

-- Hàm reset nhân vật
local function resetCharacter()
    if LocalPlayer.Character then
        LocalPlayer.Character:BreakJoints()
    end
end

local function atredmoon()
    task.spawn(function()
        while _G.autofarmredmoon do
            if HRP and isBloodMoon() then  
                for _, areaFolder in ipairs(areaCache) do
                    for _, enemy in ipairs(areaFolder:GetChildren()) do
                        if enemy:IsA("Model") and not enemy:FindFirstChild("EnemyDefeat") and enemy:FindFirstChild("EnemyLocation") and _G.autofarmredmoon then
                            local combatFolderExistTime = 0
                            while workspace:FindFirstChild("CombatFolder") do
                                print("CombatFolder found, waiting...")
                                combatFolderExistTime = combatFolderExistTime + 0.5
                                if combatFolderExistTime >= 10 then
                                    print("CombatFolder quá lâu, reset nhân vật...")
                                    resetCharacter()
                                    return
                                end
                                task.wait(1)
                            end
                            HRP.CFrame = enemy.EnemyLocation.CFrame
                            task.wait(1)
                        end
                    end
                end
            end
            task.wait(2)
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

--redmoon
fSection:NewToggle("AutoFarmRedMoon", "Chỉ hoạt động khi Blood Moon", function(state)
    _G.autofarmredmoon = state
    if state then
        task.spawn(atredmoon)
    end
end)
--godmode
fSection:NewToggle("Enable Godmode", "?????????? just try it ", function(state)
	_G.godmode = state
	if state then
		task.spawn(toggleGodmode)
	end
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
-- teleportsection--
--fairy
teleportSection:NewButton("Teleport to Fairy", "blue moon only", function()
    task.spawn(function()
        for _, folder in ipairs(workspace:GetChildren()) do
            if folder:IsA("Folder") then
                for _, child in ipairs(folder:GetChildren()) do
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

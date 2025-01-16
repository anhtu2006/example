
G.autobuybm = true
local function buyBMItems()
    while G.autobuybm do
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
                    task.wait(10)
                end
            end
        end
        task.wait(20) 
    end
end

local ClearTargetButton
autoEnvSection:NewToggle("Auto Buy BM", "Automatically buy items from Black Market", function(state)
    G.autobuybm = state
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
clearTargetButton = autoEnvSection:NewButton("Clear Target Items", "Clear all target items", function()
    if #targetItemNames > 0 then
        print("Clearing target items: " .. table.concat(targetItemNames, ", "))
        targetItemNames = {}
        print("All target items have been cleared.")
    end
end)

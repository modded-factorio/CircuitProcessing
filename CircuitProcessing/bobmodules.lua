--rewrote all of bobmodules because it was a clusterfuck

local lib = require "lib"

if not mods['bobmodules'] then
    return
end

-- TODO why is this even here? I cant find a mention of module-merging or -module-n-combine anywhere in bobs
if data.raw.technology['module-merging'] then
    data.raw.technology['module-merging'].enabled = false
end

--remove pollution clean and pollution create processor...
for _,m in pairs({ "", "-2", "-3" }) do
    lib.hide_recipe("bob-pollution-clean-processor"..m)
    lib.hide_item("bob-pollution-clean-processor"..m)

    lib.hide_recipe("bob-pollution-create-processor"..m)
    lib.hide_item("bob-pollution-create-processor"..m)
end

-- ...and technologies
for i = 1,5 do
    for _,s in pairs({'bob-pollution-create-module-', 'bob-pollution-clean-module-'}) do
        local str = s .. i
        if data.raw.technology[str] then
            data.raw.technology[str].hidden = true
        end
        data.raw.module[str].hidden = true
        lib.hide_recipe(str)
    end
end

-- local function module_name_builder(module_name, level)
--     if (level == 1) then return module_name.."-module" end
--     if (level <= 3) then return module_name.."-module-"..level
--     else
--         return "bob-"..module_name.."-module-"..level
--     end
-- end

-- --replace effects and techs of existing modules
-- local techs = data.raw["technology"]

-- for _, module_name in pairs({ "speed", "efficiency", "productivity" }) do
--     techs[module_name.."-module"].effects = { -- module-0
--         { type = "unlock-recipe", recipe = "efficiency-module-2" },
--         { type = "unlock-recipe", recipe = "bob-efficiency-processor" },
--         { type = "unlock-recipe", recipe = "efficiency-module" }
--     }

--     techs[module_name.."-module-2"].effects = { -- module-1
--         { type = "unlock-recipe", recipe = "efficiency-module-3" },
--         { type = "unlock-recipe", recipe = "bob-efficiency-processor" },
--         { type = "unlock-recipe", recipe = "efficiency-module" }
--     }
-- end

-- --remove bob-god-module
-- data.raw["technology"]["bob-god-module"] = nil
-- data.raw["recipe"]["bob-god-module"] = nil
-- data.raw["module"]["bob-god-module"] = nil

-- --remove all other bobmodules
-- for i = 4,5 do
--     for _, module_name in pairs({ "speed", "efficiency", "productivity" }) do
--         data.raw["technology"][module_name_builder(module_name)..i] = nil
--         data.raw["recipe"][module_name_builder(module_name)..i] = nil
--         data.raw["module"][module_name_builder(module_name)..i] = nil
--     end
-- end
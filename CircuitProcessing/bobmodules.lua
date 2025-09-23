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

-- balance cost of modules
for _, module_name in pairs({ "speed", "productivity", "efficiency" }) do
    -- modules-1
    lib.replace_recipe_ingredient(module_name.."-module", "electronic-circuit", "electronic-circuit", 5)
    lib.add_recipe_ingredient(module_name.."-module", "advanced-circuit", 5)
    bobmods.lib.tech.add_prerequisite(module_name.."-module", "advanced-circuit")

    --module-2
    lib.replace_recipe_ingredient(module_name.."-module-2", "advanced-circuit", "advanced-circuit", 5)
    lib.replace_recipe_ingredient(module_name.."-module-2", module_name.."-module", module_name.."-module", 4)
    lib.add_recipe_ingredient(module_name.."-module-2", "processing-unit", 5)
    bobmods.lib.tech.add_prerequisite(module_name.."-module-2", "processing-unit")

    --module-3
    lib.replace_recipe_ingredient(module_name.."-module-3", "processing-unit", "processing-unit", 5)
    lib.replace_recipe_ingredient(module_name.."-module-3", module_name.."-module-2", module_name.."-module-2", 4)
    lib.add_recipe_ingredient(module_name.."-module-3", "bob-advanced-processing-unit", 3)
    bobmods.lib.tech.add_prerequisite(module_name.."-module-3", "bob-advanced-processing-unit")

    --module-4
    lib.replace_recipe_ingredient("bob-"..module_name.."-module-4", module_name.."-module-3", module_name.."-module-3", 3)
    lib.add_recipe_ingredient("bob-"..module_name.."-module-4", "advanced-circuit", 6)
    lib.add_recipe_ingredient("bob-"..module_name.."-module-4", "processing-unit", 5)
    lib.replace_recipe_ingredient("bob-"..module_name.."-module-4", "bob-advanced-processing-unit", "bob-advanced-processing-unit", 4)

    --module-5
    lib.replace_recipe_ingredient("bob-"..module_name.."-module-5", "electronic-circuit", "electronic-circuit", 15)
    lib.replace_recipe_ingredient("bob-"..module_name.."-module-5", "advanced-circuit", "advanced-circuit", 10)
    lib.replace_recipe_ingredient("bob-"..module_name.."-module-5", "processing-unit", "processing-unit", 5)
    lib.replace_recipe_ingredient("bob-"..module_name.."-module-5", "bob-advanced-processing-unit", "bob-advanced-processing-unit", 5)
    lib.replace_recipe_ingredient("bob-"..module_name.."-module-5", module_name.."-module-4", module_name.."-module-4", 2)
end

--balance effects of modules-1 because they are much cheaper as module-0 in 1.1
lib.add_module_effect("productivity-module", "productivity", 0.03) --was 0.04
lib.add_module_effect("productivity-module", "speed", -0.1) --was -0.05

lib.add_module_effect("speed-module", "speed", 0.15) --was 0.2
lib.add_module_effect("speed-module", "consumption", 0.55) --was 0.5

lib.add_module_effect("efficiency-module", "consumption", -0.3) --was -0.4

--balance cost of agricultural modules
lib.replace_recipe_ingredient("angels-bio-yield-module", "efficiency-module", "efficiency-module", 2)
lib.replace_recipe_ingredient("angels-bio-yield-module", "productivity-module", "productivity-module", 2)
lib.replace_recipe_ingredient("angels-bio-yield-module", "angels-token-bio", "angels-token-bio", 5)

lib.replace_recipe_ingredient("angels-bio-yield-module-2", "angels-bio-yield-module", "angels-bio-yield-module", 4)
lib.replace_recipe_ingredient("angels-bio-yield-module-2", "angels-token-bio", "angels-token-bio", 5)

lib.replace_recipe_ingredient("angels-bio-yield-module-3", "angels-bio-yield-module-2", "angels-bio-yield-module-2", 4)
lib.replace_recipe_ingredient("angels-bio-yield-module-3", "angels-token-bio", "angels-token-bio", 5)

lib.replace_recipe_ingredient("angels-bio-yield-module-4", "angels-bio-yield-module-3", "angels-bio-yield-module-3", 3)
lib.replace_recipe_ingredient("angels-bio-yield-module-4", "angels-token-bio", "angels-token-bio", 10)

lib.replace_recipe_ingredient("angels-bio-yield-module-5", "angels-bio-yield-module-4", "angels-bio-yield-module-4", 2)
lib.replace_recipe_ingredient("angels-bio-yield-module-5", "angels-token-bio", "angels-token-bio", 10)

--added consumption_modifier to agriculture module since it now has efficiency module as ingredient
lib.add_module_effect("angels-bio-yield-module", "consumption", -0.1)
lib.add_module_effect("angels-bio-yield-module-2", "consumption", -0.1)
lib.add_module_effect("angels-bio-yield-module-3", "consumption", -0.2)
lib.add_module_effect("angels-bio-yield-module-4", "consumption", -0.2)
lib.add_module_effect("angels-bio-yield-module-5", "consumption", -0.3)

--reworked pollution_modifier of agriculture module since it now lacks the pollution create module
lib.add_module_effect("angels-bio-yield-module", "pollution", nil)
lib.add_module_effect("angels-bio-yield-module-2", "pollution", nil)
lib.add_module_effect("angels-bio-yield-module-3", "pollution", nil)
lib.add_module_effect("angels-bio-yield-module-4", "pollution", nil)
lib.add_module_effect("angels-bio-yield-module-5", "pollution", nil)

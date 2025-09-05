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
    replace_recipe_ingredient(module_name.."-module", "electronic-circuit", "electronic-circuit", 6)
    add_recipe_ingredient(module_name.."-module", "advanced-circuit", 6)
    bobmods.lib.tech.add_prerequisite(module_name.."-module", "advanced-circuit")

    --module-2
    replace_recipe_ingredient(module_name.."-module-2", "advanced-circuit", "advanced-circuit", 5)
    replace_recipe_ingredient(module_name.."-module-2", module_name.."-module", module_name.."-module", 4)
    add_recipe_ingredient(module_name.."-module-2", "processing-unit", 5)
    bobmods.lib.tech.add_prerequisite(module_name.."-module-2", "processing-unit")

    --module-3
    replace_recipe_ingredient(module_name.."-module-3", "processing-unit", "processing-unit", 5)
    replace_recipe_ingredient(module_name.."-module-3", module_name.."-module-2", module_name.."-module", 4)
    add_recipe_ingredient(module_name.."-module-3", "bob-advanced-processing-unit", 5)
    bobmods.lib.tech.add_prerequisite(module_name.."-module-3", "bob-advanced-processing-unit")

    --module-4
    replace_recipe_ingredient("bob-"..module_name.."-module-4", module_name.."-module-3", module_name.."-module", 3)
    add_recipe_ingredient("bob-"..module_name.."-module-4", "processing-unit", 10)

    --module-5
    replace_recipe_ingredient("bob-"..module_name.."-module-5", module_name.."-module-4", module_name.."-module", 2)
end

--balance cost of agricultural modules
replace_recipe_ingredient("angels-bio-yield-module", "efficiency-module", "efficiency-module", 2)
replace_recipe_ingredient("angels-bio-yield-module", "productivity-module", "productivity-module", 2)
replace_recipe_ingredient("angels-bio-yield-module", "angels-token-bio", "angels-token-bio", 5)

replace_recipe_ingredient("angels-bio-yield-module-2", "angels-bio-yield-module", "angels-bio-yield-module", 4)
replace_recipe_ingredient("angels-bio-yield-module-2", "angels-token-bio", "angels-token-bio", 5)

replace_recipe_ingredient("angels-bio-yield-module-3", "angels-bio-yield-module-2", "angels-bio-yield-module-2", 4)
replace_recipe_ingredient("angels-bio-yield-module-3", "angels-token-bio", "angels-token-bio", 5)

replace_recipe_ingredient("angels-bio-yield-module-4", "angels-bio-yield-module-3", "angels-bio-yield-module-3", 3)
replace_recipe_ingredient("angels-bio-yield-module-4", "angels-token-bio", "angels-token-bio", 10)

replace_recipe_ingredient("angels-bio-yield-module-5", "angels-bio-yield-module-4", "angels-bio-yield-module-4", 2)
replace_recipe_ingredient("angels-bio-yield-module-5", "angels-token-bio", "angels-token-bio", 10)
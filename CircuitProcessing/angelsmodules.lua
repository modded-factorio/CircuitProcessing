local lib = require "lib"

--replace pollution modules ingredient with efficiency modules
lib.replace_recipe_ingredient("angels-bio-yield-module", "bob-pollution-create-module-1", "efficiency-module")
lib.replace_recipe_ingredient("angels-bio-yield-module-2", "bob-pollution-create-module-2", "efficiency-module-2")
lib.replace_recipe_ingredient("angels-bio-yield-module-3", "bob-pollution-create-module-3", "efficiency-module-3")
lib.replace_recipe_ingredient("angels-bio-yield-module-4", "bob-pollution-create-module-4", "bob-efficiency-module-4")
lib.replace_recipe_ingredient("angels-bio-yield-module-5", "bob-pollution-create-module-5", "bob-efficiency-module-5")
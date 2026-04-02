require "bobelectronics-updates"
require "bobmodules-updates"

bobmods.lib.recipe.add_ingredient("rocket-part", { type = "item", name = "speed-module-2", amount = 5 })
bobmods.lib.tech.add_prerequisite("rocket-silo", "speed-module-2")
bobmods.lib.recipe.set_ingredient("rocket-part", { type = "item", name = "bob-advanced-processing-unit", amount = 5 })

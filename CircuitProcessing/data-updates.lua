require "bobelectronics-updates"
require "bobmodules-updates"

bobmods.lib.recipe.add_ingredient("rocket-part", { type = "item", name = "speed-module-2", amount = 10 })
bobmods.lib.tech.add_prerequisite("rocket-silo", "speed-module-2")

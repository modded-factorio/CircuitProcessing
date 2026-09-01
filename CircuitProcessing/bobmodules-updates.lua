local lib = require "lib"

if not mods["bobmodules"] then
  return
end

-- Hide Pollution Modules
for _, m in pairs({
  { tech = "bob-pollution-clean-module-2",  module_name = "bob-pollution-clean-processor" },
  { tech = "bob-pollution-create-module-2", module_name = "bob-pollution-create-processor" },
  { tech = "bob-pollution-clean-module-3",  module_name = "bob-pollution-clean-processor-2" },
  { tech = "bob-pollution-create-module-3", module_name = "bob-pollution-create-processor-2" },
  { tech = "bob-pollution-clean-module-4",  module_name = "bob-pollution-clean-processor-3" },
  { tech = "bob-pollution-create-module-4", module_name = "bob-pollution-create-processor-3" }
}) do
  if data.raw.technology[m.tech] then
    bobmods.lib.tech.remove_recipe_unlock(m.tech, m.module_name)
  end
  bobmods.lib.recipe.hide(m.module_name)
  bobmods.lib.item.hide(m.module_name)
end

for i = 1, 5 do
  for _, s in pairs({ "bob-pollution-create-module-", "bob-pollution-clean-module-" }) do
    local str = s .. i
    bobmods.lib.tech.hide(str)
    bobmods.lib.item.hide_entity("module", str)
    bobmods.lib.recipe.hide(str)
  end
end

-- Hard code module effects. Settings have been hidden.
local effects = {
  ["speed-module"]            = { speed = 0.2, consumption = 0.5 },
  ["speed-module-2"]          = { speed = 0.3, consumption = 0.6 },
  ["speed-module-3"]          = { speed = 0.4, consumption = 0.7 },
  ["bob-speed-module-4"]      = { speed = 0.5, consumption = 0.8 },
  ["bob-speed-module-5"]      = { speed = 0.8, consumption = 1.5 },
  ["efficiency-module"]       = { consumption = -0.3 },
  ["efficiency-module-2"]     = { consumption = -0.4 },
  ["efficiency-module-3"]     = { consumption = -0.5 },
  ["bob-efficiency-module-4"] = { consumption = -0.6 },
  ["bob-efficiency-module-5"] = { consumption = -0.8 },
  ["productivity-module"] = {
    productivity  = 0.04,
    consumption   = 0.40,
    speed         = -0.10,
  },
  ["productivity-module-2"] = {
    productivity  = 0.06,
    consumption   = 0.60,
    speed         = -0.12,
  },
  ["productivity-module-3"] = {
    productivity  = 0.08,
    consumption   = 0.80,
    speed         = -0.14,
  },
  ["bob-productivity-module-4"] = {
    productivity  = 0.12,
    consumption   = 1.20,
    speed         = -0.16,
  },
  ["bob-productivity-module-5"] = {
    productivity  = 0.16,
    consumption   = 2.00,
    speed         = -0.20,
  },
  ["bob-god-module"] = {
    consumption   = -0.80,
    speed         = 0.60,
  },
  ["bob-god-module-productivity"] = {
    productivity  = 0.16,
    consumption   = -0.80,
    speed         = 0.60,
  },
  ["bob-god-module-quality"] = {
    consumption   = -0.80,
    speed         = 1.00,  
    quality       = 0.5,
  },
  ["quality-module"]          = { speed = -0.5, quality = 0.1 },
  ["quality-module-2"]        = { speed = -0.5, quality = 0.2 },
  ["quality-module-3"]        = { speed = -0.5, quality = 0.3 },
  ["bob-quality-module-4"]    = { speed = -0.5, quality = 0.4 },
  ["bob-quality-module-5"]    = { speed = -0.5, quality = 0.5 },
}

if mods["bobplates"] then
  bobmods.lib.tech.remove_prerequisite("bob-modules-2", "bob-gem-processing-3")
  bobmods.lib.tech.add_prerequisite("modules", "bob-gem-processing-3")

  bobmods.lib.recipe.remove_ingredient("bob-efficiency-processor", "bob-ruby-5")
  bobmods.lib.recipe.remove_ingredient("bob-efficiency-processor-2", "bob-sapphire-5")
  bobmods.lib.recipe.remove_ingredient("bob-efficiency-processor-3", "bob-amethyst-5")
  bobmods.lib.recipe.remove_ingredient("bob-speed-processor", "bob-ruby-5")
  bobmods.lib.recipe.remove_ingredient("bob-speed-processor-2", "bob-emerald-5")
  bobmods.lib.recipe.remove_ingredient("bob-speed-processor-3", "bob-topaz-5")
  bobmods.lib.recipe.remove_ingredient("bob-productivity-processor", "bob-sapphire-5")
  bobmods.lib.recipe.remove_ingredient("bob-productivity-processor-2", "bob-amethyst-5")
  bobmods.lib.recipe.remove_ingredient("bob-productivity-processor-3", "bob-diamond-5")

  if mods["quality"] then
    bobmods.lib.recipe.remove_ingredient("bob-quality-processor", "bob-emerald-5")
    bobmods.lib.recipe.remove_ingredient("bob-quality-processor-2", "bob-topaz-5")
    bobmods.lib.recipe.remove_ingredient("bob-quality-processor-3", "bob-diamond-5")
    bobmods.lib.recipe.remove_ingredient("bob-quality-processor-3", "bob-diamond-5")
  end
end

local board1 = data.raw.item["bob-module-circuit-board"]
board1.icon = "__CircuitProcessing__/graphics/icons/modules/bob-module-circuit-board.png"
board1.subgroup = "cp-module-intermediates"
board1.order = "1[bob-module-circuit-board]"

bobmods.lib.recipe.set_ingredient("bob-module-case", { type = "item", name = "plastic-bar", amount = 1 })

bobmods.lib.recipe.add_ingredient("bob-module-circuit-board", { type = "item", name = "bob-module-contact", amount = 1 })
bobmods.lib.recipe.set_ingredient("bob-module-processor-board", { type = "item", name = "bob-module-contact", amount = 2 })
bobmods.lib.recipe.set_ingredient("bob-module-processor-board-2", { type = "item", name = "bob-module-contact", amount = 4 })
bobmods.lib.recipe.set_ingredient("bob-module-processor-board-3", { type = "item", name = "bob-module-contact", amount = 8 })

bobmods.lib.recipe.set_ingredient("bob-module-circuit-board", { type = "fluid", name = "angels-liquid-ferric-chloride-solution", amount = 5 })
bobmods.lib.recipe.set_ingredient("bob-module-processor-board", { type = "fluid", name = "angels-liquid-ferric-chloride-solution", amount = 10 })

bobmods.lib.recipe.set_ingredient("bob-module-circuit-board", { type = "item", name = "bob-wooden-board", amount = 1 })
bobmods.lib.recipe.set_ingredient("bob-module-processor-board", { type = "item", name = "bob-phenolic-board", amount = 1 })
bobmods.lib.recipe.set_ingredient("bob-module-processor-board-2", { type = "item", name = "bob-fibreglass-board", amount = 1 })

if mods["angelspetrochem"] then
  bobmods.lib.tech.add_prerequisite("bob-modules-2", "angels-rubbers")
end

for i, v in pairs({
  "speed",
  "efficiency",
  "productivity",
  mods["quality"] and "quality" or nil,
}) do
  local processor1 = "cp-"..v.."-processor"
  local processor2 = "bob-"..v.."-processor"
  local processor3 = "bob-"..v.."-processor-2"
  local processor4 = "bob-"..v.."-processor-3"
  local module1 = v.."-module"
  local module2 = v.."-module-2"
  local module3 = v.."-module-3"
  local module4 = "bob-"..v.."-module-4"
  local module5 = "bob-"..v.."-module-5"

  bobmods.lib.recipe.set_ingredient(processor2, { type = "item", name = "bob-basic-electronic-components", amount = 8 })
  bobmods.lib.recipe.add_ingredient(processor2, { type = "item", name = "bob-insulated-cable", amount = 2 })
  bobmods.lib.recipe.set_ingredient(processor2, { type = "item", name = "bob-solder", amount = 3 })
  bobmods.lib.recipe.add_ingredient(processor3, { type = "item", name = "bob-basic-electronic-components", amount = 20 })
  bobmods.lib.recipe.add_ingredient(processor3, { type = "item", name = "bob-insulated-cable", amount = 5 })
  bobmods.lib.recipe.set_ingredient(processor3, { type = "item", name = "bob-solder", amount = 6 })
  bobmods.lib.recipe.add_ingredient(processor4, { type = "item", name = "bob-basic-electronic-components", amount = 24 })
  bobmods.lib.recipe.add_ingredient(processor4, { type = "item", name = "bob-electronic-components", amount = 20 })
  bobmods.lib.recipe.add_ingredient(processor4, { type = "item", name = "bob-insulated-cable", amount = 10 })

  data.raw.recipe[module1].ingredients = {
    { type = "item", name = "bob-module-case", amount = 1 },
    { type = "item", name = processor1, amount = 5 },
    { type = "item", name = "electronic-circuit", amount = 5 }
  }
  data.raw.recipe[module1].energy_required = 7.5
  data.raw.module[module1].effect = effects[module1]

  data.raw.recipe[module2].ingredients = {
    { type = "item", name = "bob-module-case", amount = 1 },
    { type = "item", name = module1, amount = 4 },
    { type = "item", name = processor2, amount = 5 },
    { type = "item", name = "advanced-circuit", amount = 5 },
  }
  data.raw.recipe[module2].energy_required = 15
  data.raw.module[module2].effect = effects[module2]

  data.raw.recipe[module3].ingredients = {
    { type = "item", name = "bob-module-case", amount = 1 },
    { type = "item", name = module2, amount = 4 },
    { type = "item", name = processor3, amount = 5 },
    { type = "item", name = "processing-unit", amount = 5 },
  }
  data.raw.recipe[module3].energy_required = 30
  data.raw.module[module3].effect = effects[module3]

  data.raw.recipe[module4].ingredients = {
    { type = "item", name = "bob-module-case", amount = 1 },
    { type = "item", name = module3, amount = 4 },
    { type = "item", name = processor4, amount = 5 },
    { type = "item", name = "bob-advanced-processing-unit", amount = 5 }
  }
  data.raw.recipe[module4].energy_required = 60
  data.raw.module[module4].effect = effects[module4]

  data.raw.recipe[module5].ingredients = {
    { type = "item", name = "bob-module-case", amount = 1 },
    { type = "item", name = module4, amount = 4 },
    { type = "item", name = processor4, amount = 20 },
    { type = "item", name = "bob-basic-circuit-board", amount = 20 },
    { type = "item", name = "electronic-circuit", amount = 20 },
    { type = "item", name = "advanced-circuit", amount = 20 },
    { type = "item", name = "processing-unit", amount = 10 },
    { type = "item", name = "bob-advanced-processing-unit", amount = 10 }
  }
  data.raw.recipe[module5].energy_required = 120
  data.raw.module[module5].effect = effects[module5]
end

if settings.startup["bobmods-modules-enablegodmodules"].value == true then
  bobmods.lib.recipe.remove_ingredient("bob-god-module", "bob-pollution-clean-module-5")
  bobmods.lib.recipe.remove_ingredient("bob-god-module-productivity", "bob-pollution-clean-module-5")

  if mods["quality"] then
    bobmods.lib.recipe.remove_ingredient("bob-god-module-quality", "bob-pollution-clean-module-5")
  end

  bobmods.lib.tech.remove_prerequisite("bob-god-module", "bob-pollution-clean-module-5")
end

if mods["angelsbioprocessing"] then
  data.raw.recipe["angels-bio-yield-module"].ingredients = {
    { type = "item", name = "bob-module-case", amount = 1 },
    { type = "item", name = "electronic-circuit", amount = 10 },
    { type = "item", name = "cp-speed-processor", amount = 5 },
    { type = "item", name = "cp-productivity-processor", amount = 5 },
    { type = "item", name = "angels-token-bio", amount = 1 },
  }
  if mods["bobplates"] then
    bobmods.lib.recipe.add_ingredient("angels-bio-yield-module", { type = "item", name = "bob-topaz-5", amount = 5 })
  end

  data.raw.recipe["angels-bio-yield-module-2"].ingredients = {
    { type = "item", name = "bob-module-case", amount = 1 },
    { type = "item", name = "advanced-circuit", amount = 10 },
    { type = "item", name = "bob-speed-processor", amount = 5 },
    { type = "item", name = "bob-productivity-processor", amount = 5 },
    { type = "item", name = "angels-token-bio", amount = 1 },
    { type = "item", name = "angels-bio-yield-module", amount = 4 },
  }

  data.raw.recipe["angels-bio-yield-module-3"].ingredients = {
    { type = "item", name = "bob-module-case", amount = 1 },
    { type = "item", name = "processing-unit", amount = 10 },
    { type = "item", name = "bob-speed-processor-2", amount = 5 },
    { type = "item", name = "bob-productivity-processor-2", amount = 5 },
    { type = "item", name = "angels-token-bio", amount = 1 },
    { type = "item", name = "angels-bio-yield-module-2", amount = 4 },
  }

  data.raw.recipe["angels-bio-yield-module-4"].ingredients = {
    { type = "item", name = "bob-module-case", amount = 1 },
    { type = "item", name = "bob-advanced-processing-unit", amount = 10 },
    { type = "item", name = "bob-speed-processor-3", amount = 5 },
    { type = "item", name = "bob-productivity-processor-3", amount = 5 },
    { type = "item", name = "angels-token-bio", amount = 1 },
    { type = "item", name = "angels-bio-yield-module-3", amount = 4 },
  }

  data.raw.recipe["angels-bio-yield-module-5"].ingredients = {
    { type = "item", name = "bob-module-case", amount = 1 },
    { type = "item", name = "bob-basic-circuit-board", amount = 40 },
    { type = "item", name = "electronic-circuit", amount = 40 },
    { type = "item", name = "advanced-circuit", amount = 40 },
    { type = "item", name = "processing-unit", amount = 20 },
    { type = "item", name = "bob-advanced-processing-unit", amount = 20 },
    { type = "item", name = "bob-speed-processor-3", amount = 20 },
    { type = "item", name = "bob-productivity-processor-3", amount = 20 },
    { type = "item", name = "angels-token-bio", amount = 1 },
    { type = "item", name = "angels-bio-yield-module-4", amount = 4 },
  }

  bobmods.lib.tech.remove_prerequisite("angels-bio-yield-module", "bob-pollution-create-module-1")
  bobmods.lib.tech.remove_prerequisite("angels-bio-yield-module-2", "bob-pollution-create-module-2")
  bobmods.lib.tech.remove_prerequisite("angels-bio-yield-module-3", "bob-pollution-create-module-3")
  bobmods.lib.tech.remove_prerequisite("angels-bio-yield-module-4", "bob-pollution-create-module-4")
  bobmods.lib.tech.remove_prerequisite("angels-bio-yield-module-5", "bob-pollution-create-module-5")

  bobmods.lib.tech.add_prerequisite("angels-bio-yield-module", "speed-module")
  bobmods.lib.tech.add_prerequisite("angels-bio-yield-module-2", "speed-module-2")
  bobmods.lib.tech.add_prerequisite("angels-bio-yield-module-3", "speed-module-3")
  bobmods.lib.tech.add_prerequisite("angels-bio-yield-module-4", "bob-speed-module-4")
  bobmods.lib.tech.add_prerequisite("angels-bio-yield-module-5", "bob-speed-module-5")
end

if mods["quality"] then
  bobmods.lib.recipe.update_recycling_recipe({
    "bob-efficiency-module-4",
    "bob-efficiency-module-5",
    "bob-efficiency-processor",
    "bob-efficiency-processor-2",
    "bob-efficiency-processor-3",
    "bob-module-case",
    "bob-module-circuit-board",
    "bob-module-processor-board",
    "bob-module-processor-board-2",
    "bob-module-processor-board-3",
    "bob-productivity-module-4",
    "bob-productivity-module-5",
    "bob-productivity-processor",
    "bob-productivity-processor-2",
    "bob-productivity-processor-3",
    "bob-quality-module-4",
    "bob-quality-module-5",
    "bob-quality-processor",
    "bob-quality-processor-2",
    "bob-quality-processor-3",
    "bob-speed-module-4",
    "bob-speed-module-5",
    "bob-speed-processor",
    "bob-speed-processor-2",
    "bob-speed-processor-3",
    "efficiency-module",
    "efficiency-module-2",
    "efficiency-module-3",
    "productivity-module",
    "productivity-module-2",
    "productivity-module-3",
    "quality-module",
    "quality-module-2",
    "quality-module-3",
    "speed-module",
    "speed-module-2",
    "speed-module-3",
  })
  if settings.startup["bobmods-modules-enablegodmodules"].value == true then
    bobmods.lib.recipe.update_recycling_recipe({
      "bob-god-module",
      "bob-god-module-productivity",
    })
    if mods["quality"] then
      bobmods.lib.recipe.update_recycling_recipe({
        "bob-god-module-quality",
      })
    end
  end
  if mods["angelsbioprocessing"] then
    bobmods.lib.recipe.update_recycling_recipe({
      "angels-bio-yield-module",
      "angels-bio-yield-module-2",
      "angels-bio-yield-module-3",
      "angels-bio-yield-module-4",
      "angels-bio-yield-module-5",
    })
  end
end

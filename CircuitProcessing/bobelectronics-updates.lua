local lib = require "lib"

-- GREEN

local cpelectroniccircuitboardrecipe = data.raw.recipe["electronic-circuit"]
data.raw.recipe["cp-electronic-circuit-board"] = cpelectroniccircuitboardrecipe
cpelectroniccircuitboardrecipe.name = "cp-electronic-circuit-board"
bobmods.lib.recipe.replace_ingredient("cp-electronic-circuit-board", "bob-wooden-board", "bob-basic-circuit-board")
bobmods.lib.recipe.remove_result("cp-electronic-circuit-board", "electronic-circuit")
bobmods.lib.recipe.add_result("cp-electronic-circuit-board", { type = "item", name = "cp-electronic-circuit-board", amount = 1 })
lib.set_main_product("cp-electronic-circuit-board", "cp-electronic-circuit-board")
data.raw.recipe["electronic-circuit"] = {
  type = "recipe",
  name = "electronic-circuit",
  category = "advanced-crafting",
  ingredients =
  {
    { type = "item", name = "cp-electronic-circuit-board", amount = 1 },
    { type = "item", name = "iron-plate", amount = 2 },
  },
  results = {{ type = "item", name = "electronic-circuit", amount = 1 }},
  requester_paste_multiplier = 50,
  enabled = false,
  allow_decomposition = false,
}
bobmods.lib.recipe.add_additional_category("electronic-circuit", "electronics")

-- RED

local cpadvancedcircuitboard = data.raw.item["bob-circuit-board"]
cpadvancedcircuitboard .icon = "__CircuitProcessing__/graphics/icons/circuits/circuit-board.png"
cpadvancedcircuitboard .icon_size = 64

local cpadvancedcircuitboardrecipe = data.raw.recipe["advanced-circuit"]
data.raw.recipe["cp-advanced-circuit-board"] = cpadvancedcircuitboardrecipe
cpadvancedcircuitboardrecipe.name = "cp-advanced-circuit-board"
bobmods.lib.recipe.remove_result("cp-advanced-circuit-board", "advanced-circuit")
bobmods.lib.recipe.add_result("cp-advanced-circuit-board", { type = "item", name = "cp-advanced-circuit-board", amount = 1 })
lib.set_main_product("cp-advanced-circuit-board", "cp-advanced-circuit-board")

data.raw.recipe["advanced-circuit"] = {
  type = "recipe",
  name = "advanced-circuit",
  category = "advanced-crafting",
  enabled = false,
  energy_required = 6,
  ingredients = lib.checkplate(
    { type = "item", name = "bob-aluminium-plate", amount = 4 },
    {
      { type = "item", name = "electronic-circuit", amount = 2 },
      { type = "item", name = "cp-advanced-circuit-board", amount = 2 },
      { type = "item", name = "copper-cable", amount = 4 }
    }
  ),
  results = {{ type = "item", name = "advanced-circuit", amount = 1 }},
  requester_paste_multiplier = 5,
  allow_decomposition = false,
}
bobmods.lib.recipe.add_additional_category("advanced-circuit", "electronics")

-- BLUE

local cpprocessingboard = data.raw.item["bob-superior-circuit-board"]
cpprocessingboard.icon = "__CircuitProcessing__/graphics/icons/circuits/superior-circuit-board.png"
cpprocessingboard.icon_size = 64

local cpprocessingboardrecipe = data.raw.recipe["processing-unit"]
data.raw.recipe["cp-processing-board"] = cpprocessingboardrecipe
cpprocessingboardrecipe.name = "cp-processing-board"
bobmods.lib.recipe.remove_result("cp-processing-board", "processing-unit")
bobmods.lib.recipe.add_result("cp-processing-board", { type = "item", name = "cp-processing-board", amount = 1 })
lib.set_main_product("cp-processing-board", "cp-processing-board")
data.raw.recipe["processing-unit"] = {
  type = "recipe",
  name = "processing-unit",
  category = "advanced-crafting",
  enabled = false,
  energy_required = 10,
  ingredients = lib.checkplate(
    { type = "item", name = "bob-titanium-plate", amount = 8 },
    {
      {type = "item", name = "advanced-circuit", amount = 4 },
      {type = "item", name = "cp-processing-board", amount = 4 },
      {type = "fluid", name = "sulfuric-acid", amount = 5 },
    }
  ),
  results = {{ type = "item", name = "processing-unit", amount = 1 }},
  allow_decomposition = false,
}
bobmods.lib.recipe.add_additional_category("processing-unit", "electronics")
bobmods.lib.recipe.set_energy_required("cp-processing-board", 5)
bobmods.lib.recipe.set_energy_required("bob-superior-circuit-board", 5)

local advancedplate = "steel-plate"
if data.raw.item["angels-plate-chrome"] then
  advancedplate = "angels-plate-chrome"
elseif data.raw.item["bob-gold-plate"] then
  advancedplate = "bob-gold-plate"
end
local advancedacid = "sulfuric-acid"
if data.raw.fluid["bob-nitric-acid"] then
  advancedacid = "bob-nitric-acid"
elseif data.raw.fluid["angels-liquid-nitric-acid"] then
  advancedacid = "angels-liquid-nitric-acid"
end

-- BLACK

local cpadvancedprocessingboard = data.raw.item["bob-multi-layer-circuit-board"]
cpadvancedprocessingboard.icon = "__CircuitProcessing__/graphics/icons/circuits/multi-layer-circuit-board.png"
cpadvancedprocessingboard.icon_size = 64

local cpadvancedprocessingboardrecipe = data.raw.recipe["bob-advanced-processing-unit"]
data.raw.recipe["cp-advanced-processing-board"] = cpadvancedprocessingboardrecipe
cpadvancedprocessingboardrecipe.name = "cp-advanced-processing-board"
bobmods.lib.recipe.remove_result("cp-advanced-processing-board", "bob-advanced-processing-unit")
bobmods.lib.recipe.add_result("cp-advanced-processing-board", { type = "item", name = "cp-advanced-processing-board", amount = 1 })
lib.set_main_product("cp-advanced-processing-board", "cp-advanced-processing-board")
bobmods.lib.recipe.set_energy_required("cp-advanced-processing-board", 5)
bobmods.lib.recipe.set_energy_required("bob-multi-layer-circuit-board", 5)
data.raw.recipe["bob-advanced-processing-unit"] = {
  type = "recipe",
  name = "bob-advanced-processing-unit",
  category = "crafting-with-fluid",
  enabled = false,
  energy_required = 15,
  ingredients = lib.checkplate(
    { type = "item", name = advancedplate, amount = 10 },
    {
      { type = "item", name = "processing-unit", amount = 3 },
      { type = "item", name = "electronic-circuit", amount = 20 },
      { type = "item", name = "cp-advanced-processing-board", amount = 9 },
      {type = "fluid", name = advancedacid, amount = 5 }
    }
  ),
  results = {{ type = "item", name = "bob-advanced-processing-unit", amount = 1 }},
  allow_decomposition = false,
}
bobmods.lib.recipe.add_additional_category("bob-advanced-processing-unit", "electronics-with-fluid")

local cable = {
  ["copper-cable"] = true,
  ["bob-tinned-copper-cable"] = true,
  ["angels-wire-silver"] = true,
  ["bob-gilded-copper-cable"] = true
}

local components = {
  "bob-basic-electronic-components",
  "bob-electronic-components",
  "bob-integrated-electronics"
}

for _, recipe_name in pairs(components) do
  local recipe = data.raw.recipe[recipe_name]
  if recipe and recipe.ingredients then
    for _, ingredient in pairs(recipe.ingredients) do
      if cable[ingredient.name] then
        ingredient.amount = ingredient.amount * 2
      end
    end
  end
end

data.raw.recipe["bob-basic-electronic-components"].results[1].amount = 10
bobmods.lib.recipe.set_energy_required("bob-basic-electronic-components", 4)

bobmods.lib.recipe.disallow_productivity("cp-advanced-processing-board")
bobmods.lib.recipe.disallow_productivity("cp-processing-board")
bobmods.lib.recipe.disallow_productivity("cp-advanced-circuit-board")
bobmods.lib.recipe.disallow_productivity("cp-electronic-circuit-board")

for k, v in pairs(data.raw.technology) do
  for ek, ev in pairs(v.effects or {}) do
    if ev.type == "unlock-recipe" and ev.recipe == "electronic-circuit" then
      table.insert(v.effects, ek, {type = "unlock-recipe", recipe = "cp-electronic-circuit-board"})
      break
    elseif ev.type == "unlock-recipe" and ev.recipe == "advanced-circuit" then
      table.insert(v.effects, ek, {type = "unlock-recipe", recipe = "cp-advanced-circuit-board"})
      if data.raw.technology["angels-aluminium-smelting-1"] then
        bobmods.lib.tech.add_prerequisite(k, "angels-aluminium-smelting-1")
      elseif data.raw.technology["bob-aluminium-processing"] then
        bobmods.lib.tech.add_prerequisite(k, "bob-aluminium-processing")
      end
      break
    elseif ev.type == "unlock-recipe" and ev.recipe == "processing-unit" then
      table.insert(v.effects, ek, {type = "unlock-recipe", recipe = "cp-processing-board"})
      if data.raw.technology["angels-titanium-smelting-1"] then
        bobmods.lib.tech.add_prerequisite(k, "angels-titanium-smelting-1")
      elseif data.raw.technology["bob-titanium-processing"] then
        bobmods.lib.tech.add_prerequisite(k, "bob-titanium-processing")
      end
      break
    elseif ev.type == "unlock-recipe" and ev.recipe == "bob-advanced-processing-unit" then
      table.insert(v.effects, ek, {type = "unlock-recipe", recipe = "cp-advanced-processing-board"})
      if data.raw.technology["angels-chrome-smelting-1"] then
        bobmods.lib.tech.add_prerequisite(k, "angels-chrome-smelting-1")
      end
      break
    end
  end
end

if mods["quality"] then
  bobmods.lib.recipe.update_recycling_recipe({
    "advanced-circuit",
    "bob-advanced-processing-unit",
    "electronic-circuit",
    "processing-unit",
  })
end

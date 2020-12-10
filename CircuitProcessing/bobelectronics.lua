local lib = require "lib"

local cpelectroniccircuitboard = data.raw.item['electronic-circuit']
data.raw.item['cp-electronic-circuit-board'] = cpelectroniccircuitboard
cpelectroniccircuitboard.name = 'cp-electronic-circuit-board'
cpelectroniccircuitboard.localised_name = {'item-name.electronic-circuit'}
data.raw.item['electronic-circuit'] =
  {
    type = "item",
    name = "electronic-circuit",
    localised_name = {"item-name.cp-electronic-circuit"},
    icon = "__base__/graphics/icons/electronic-circuit.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "intermediate-product",
    order = "e[electronic-circuit]",
    stack_size = 200
  }

local cpelectroniccircuitboardrecipe = data.raw.recipe['electronic-circuit']
data.raw.recipe['cp-electronic-circuit-board'] = cpelectroniccircuitboardrecipe
cpelectroniccircuitboardrecipe.name = 'cp-electronic-circuit-board'
cpelectroniccircuitboardrecipe.normal.result = 'cp-electronic-circuit-board'
cpelectroniccircuitboardrecipe.expensive.result = 'cp-electronic-circuit-board'
data.raw.recipe['electronic-circuit'] =
  {
    type = "recipe",
    name = "electronic-circuit",
    category = "electronics",
    normal =
    {
      ingredients =
      {
        {"cp-electronic-circuit-board", 1},
        {"iron-plate", 2}
      },
      result = "electronic-circuit",
      requester_paste_multiplier = 50,
      enabled = false
    },
    expensive =
    {
      ingredients =
      {
        {"cp-electronic-circuit-board", 1},
        {"iron-plate", 4}
      },
      result = "electronic-circuit",
      requester_paste_multiplier = 50,
      enabled = false
    },
  }

local cpadvancedcircuitboard = data.raw.item['advanced-circuit']
data.raw.item['cp-advanced-circuit-board'] = cpadvancedcircuitboard
cpadvancedcircuitboard.name = 'cp-advanced-circuit-board'
cpadvancedcircuitboard.localised_name = {'item-name.advanced-circuit'}
data.raw.item['advanced-circuit'] =
  {
    type = "item",
    name = "advanced-circuit",
    localised_name = {"item-name.cp-advanced-circuit"},
    icon = "__base__/graphics/icons/advanced-circuit.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "intermediate-product",
    order = "f[advanced-circuit]",
    stack_size = 200
  }

local cpadvancedcircuitboardrecipe = data.raw.recipe['advanced-circuit']
data.raw.recipe['cp-advanced-circuit-board'] = cpadvancedcircuitboardrecipe
cpadvancedcircuitboardrecipe.name = 'cp-advanced-circuit-board'
cpadvancedcircuitboardrecipe.normal.result = 'cp-advanced-circuit-board'
cpadvancedcircuitboardrecipe.expensive.result = 'cp-advanced-circuit-board'
data.raw.recipe['advanced-circuit'] =
  {
    type = "recipe",
    name = "advanced-circuit",
    category = "electronics",
    normal =
    {
      enabled = false,
      energy_required = 6,
      ingredients = lib.checkplate(
        {"aluminium-plate", 4},
      {
        {"electronic-circuit", 2},
        {"cp-advanced-circuit-board", 2},
        {"copper-cable", 4}
      }),
      result = "advanced-circuit",
      requester_paste_multiplier = 5
    },
    expensive =
    {
      enabled = false,
      energy_required = 6,
      ingredients = lib.checkplate(
        {"aluminium-plate", 4},
      {
        {"electronic-circuit", 2},
        {"cp-advanced-circuit-board", 4},
        {"copper-cable", 8}
      }),
      result = "advanced-circuit",
      requester_paste_multiplier = 5
    }
  }

local cpprocessingboard = data.raw.item['processing-unit']
data.raw.item['cp-processing-board'] = cpprocessingboard
cpprocessingboard.name = 'cp-processing-board'
cpprocessingboard.localised_name = {'item-name.processing-unit'}
data.raw.item['processing-unit'] =
  {
    type = "item",
    name = "processing-unit",
    localised_name = {"item-name.cp-processing-unit"},
    icon = "__base__/graphics/icons/processing-unit.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "intermediate-product",
    order = "g[processing-unit]",
    stack_size = 200
  }

local cpprocessingboardrecipe = data.raw.recipe['processing-unit']
data.raw.recipe['cp-processing-board'] = cpprocessingboardrecipe
cpprocessingboardrecipe.name = 'cp-processing-board'
cpprocessingboardrecipe.normal.result = 'cp-processing-board'
cpprocessingboardrecipe.expensive.result = 'cp-processing-board'
data.raw.recipe['processing-unit'] =
  {
    type = "recipe",
    name = "processing-unit",
    category = "electronics-machine",
    normal =
    {
      enabled = false,
      energy_required = 10,
      ingredients = lib.checkplate(
        {"titanium-plate", 8},
      {
        {"advanced-circuit", 4},
        {"cp-processing-board", 4},
        {type = "fluid", name = "sulfuric-acid", amount = 5}
      }),
      result = "processing-unit"
    },
    expensive =
    {
      enabled = false,
      energy_required = 10,
      ingredients = lib.checkplate(
        {"titanium-plate", 8},
      {
        {"advanced-circuit", 4},
        {"cp-processing-board", 4},
        {type = "fluid", name = "sulfuric-acid", amount = 10}
      }),
      result = "processing-unit"
    }
  }
data.raw.recipe['cp-processing-board'].normal.energy_required = 5
data.raw.recipe['cp-processing-board'].expensive.energy_required = 8
data.raw.recipe['superior-circuit-board'].energy_required = 5

local cpadvancedprocessingboard = data.raw.item['advanced-processing-unit']
data.raw.item['cp-advanced-processing-board'] = cpadvancedprocessingboard
cpadvancedprocessingboard.name = 'cp-advanced-processing-board'
cpadvancedprocessingboard.localised_name = {'item-name.advanced-processing-unit'}
data.raw.item['advanced-processing-unit'] =
  {
    type = "item",
    name = "advanced-processing-unit",
    localised_name = {"item-name.cp-advanced-processing-unit"},
    icon = "__CircuitProcessing__/graphics/icons/advanced-processing-unit.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "intermediate-product",
    order = "g[processing-unit]b",
    stack_size = 200
  }

local advancedplate = "steel-plate"
if data.raw.item["angels-plate-chrome"] then
  advancedplate = "angels-plate-chrome"
elseif data.raw.item["silver-plate"] then
  advancedplate = "silver-plate"
end
local advancedacid = "sulfuric-acid"
if data.raw.fluid["nitric-acid"] then
  advancedacid = "nitric-acid"
end
local cpadvancedprocessingboardrecipe = data.raw.recipe['advanced-processing-unit']
data.raw.recipe['cp-advanced-processing-board'] = cpadvancedprocessingboardrecipe
cpadvancedprocessingboardrecipe.name = 'cp-advanced-processing-board'
cpadvancedprocessingboardrecipe.normal.result = 'cp-advanced-processing-board'
cpadvancedprocessingboardrecipe.expensive.result = 'cp-advanced-processing-board'
cpadvancedprocessingboardrecipe.normal.energy_required = 5
cpadvancedprocessingboardrecipe.expensive.energy_required = 5
data.raw.recipe['multi-layer-circuit-board'].energy_required = 5
data.raw.recipe['advanced-processing-unit'] =
  {
    type = "recipe",
    name = "advanced-processing-unit",
    category = "electronics-machine",
    normal =
    {
      enabled = false,
      energy_required = 15,
      ingredients = lib.checkplate(
        {advancedplate, 10},
      {
        {"processing-unit", 3},
	{"electronic-circuit", 20},
        {"cp-advanced-processing-board", 9},
        {type = "fluid", name = advancedacid, amount = 5}
      }),
      result = "advanced-processing-unit"
    },
    expensive =
    {
      enabled = false,
      energy_required = 15,
      ingredients = lib.checkplate(
        {advancedplate, 10},
      {
        {"processing-unit", 3},
	{"electronic-circuit", 20},
        {"cp-advanced-processing-board", 9},
        {type = "fluid", name = advancedacid, amount = 10}
      }),
      result = "advanced-processing-unit"
    }
  }

local function doublecable(ingredients)
  for k,v in pairs(ingredients) do
    local idx = 1
    local amt = 2
    if v.name then
      idx = 'name'
      amt = 'amount'
    end
    if v[idx] == 'tinned-copper-cable' or v[idx] == 'copper-cable' then
      v[amt] = 2
    end
  end
end
data.raw.recipe['basic-electronic-components'].normal.energy_required = 4
doublecable(data.raw.recipe['basic-electronic-components'].normal.ingredients)
data.raw.recipe['basic-electronic-components'].normal.result_count = 10
data.raw.recipe['basic-electronic-components'].expensive.energy_required = 6
doublecable(data.raw.recipe['basic-electronic-components'].expensive.ingredients)
data.raw.recipe['basic-electronic-components'].expensive.result_count = 6

local circuits = {
  'cp-advanced-processing-board',
  'cp-processing-board',
  'cp-advanced-circuit-board',
  'cp-electronic-circuit-board'
}
bobmods.lib.module.add_productivity_limitations(circuits)

for k,v in pairs(data.raw.technology) do
  for ek,ev in pairs(v.effects or {}) do
    if ev.type == 'unlock-recipe' and ev.recipe == 'electronic-circuit' then
      table.insert(v.effects, ek, {type = 'unlock-recipe', recipe = 'cp-electronic-circuit-board'})
      break
    elseif ev.type == 'unlock-recipe' and ev.recipe == 'advanced-circuit' then
      table.insert(v.effects, ek, {type = 'unlock-recipe', recipe = 'cp-advanced-circuit-board'})
      break
    elseif ev.type == 'unlock-recipe' and ev.recipe == 'processing-unit' then
      table.insert(v.effects, ek, {type = 'unlock-recipe', recipe = 'cp-processing-board'})
      break
    elseif ev.type == 'unlock-recipe' and ev.recipe == 'advanced-processing-unit' then
      table.insert(v.effects, ek, {type = 'unlock-recipe', recipe = 'cp-advanced-processing-board'})
      break
    end
  end
end

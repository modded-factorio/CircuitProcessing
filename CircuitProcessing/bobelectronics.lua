local lib = require "lib"

if mods['angelsindustries'] then
  data:extend({
      {
        type = 'item-subgroup',
        name = 'sb-circuit-board',
        group = 'angels-components',
        order = 'b[electronics]-cc[sb-circuit-boards]'
      }
  })
else
  data:extend({
      {
        type = 'item-subgroup',
        name = 'sb-circuit-board',
        group = 'bob-intermediate-products',
        order = 'e-a4'
      }
  })
end
local cpelectroniccircuitboard = data.raw.item['electronic-circuit']
data.raw.item['cp-electronic-circuit-board'] = cpelectroniccircuitboard
cpelectroniccircuitboard.name = 'cp-electronic-circuit-board'
data.raw.item['electronic-circuit'] =
  {
    type = "item",
    name = "electronic-circuit",
    icon = "__base__/graphics/icons/electronic-circuit.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "sb-circuit-board",
    order = "e[electronic-circuit]",
    stack_size = 200
  }

local cpelectroniccircuitboardrecipe = data.raw.recipe['electronic-circuit']
data.raw.recipe['cp-electronic-circuit-board'] = cpelectroniccircuitboardrecipe
cpelectroniccircuitboardrecipe.name = 'cp-electronic-circuit-board'
bobmods.lib.recipe.remove_result('cp-electronic-circuit-board', 'electronic-circuit')
bobmods.lib.recipe.add_result('cp-electronic-circuit-board', 'cp-electronic-circuit-board')
lib.set_main_product('cp-electronic-circuit-board', 'cp-electronic-circuit-board')
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
      enabled = false,
      allow_decomposition = false
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
      enabled = false,
      allow_decomposition = false
    },
  }

local cpadvancedcircuitboard = data.raw.item['advanced-circuit']
data.raw.item['cp-advanced-circuit-board'] = cpadvancedcircuitboard
cpadvancedcircuitboard.name = 'cp-advanced-circuit-board'
data.raw.item['advanced-circuit'] =
  {
    type = "item",
    name = "advanced-circuit",
    icon = "__base__/graphics/icons/advanced-circuit.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "sb-circuit-board",
    order = "f[advanced-circuit]",
    stack_size = 200
  }

local cpadvancedcircuitboardrecipe = data.raw.recipe['advanced-circuit']
data.raw.recipe['cp-advanced-circuit-board'] = cpadvancedcircuitboardrecipe
cpadvancedcircuitboardrecipe.name = 'cp-advanced-circuit-board'
bobmods.lib.recipe.remove_result('cp-advanced-circuit-board', 'advanced-circuit')
bobmods.lib.recipe.add_result('cp-advanced-circuit-board', 'cp-advanced-circuit-board')
lib.set_main_product('cp-advanced-circuit-board', 'cp-advanced-circuit-board')

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
      requester_paste_multiplier = 5,
      allow_decomposition = false
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
      requester_paste_multiplier = 5,
      allow_decomposition = false
    }
  }

local cpprocessingboard = data.raw.item['processing-unit']
data.raw.item['cp-processing-board'] = cpprocessingboard
cpprocessingboard.name = 'cp-processing-board'
data.raw.item['processing-unit'] =
  {
    type = "item",
    name = "processing-unit",
    icon = "__base__/graphics/icons/processing-unit.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "sb-circuit-board",
    order = "g[processing-unit]",
    stack_size = 200
  }

local cpprocessingboardrecipe = data.raw.recipe['processing-unit']
data.raw.recipe['cp-processing-board'] = cpprocessingboardrecipe
cpprocessingboardrecipe.name = 'cp-processing-board'
bobmods.lib.recipe.remove_result('cp-processing-board', 'processing-unit')
bobmods.lib.recipe.add_result('cp-processing-board', 'cp-processing-board')
lib.set_main_product('cp-processing-board', 'cp-processing-board')
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
      result = "processing-unit",
      allow_decomposition = false
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
      result = "processing-unit",
      allow_decomposition = false
    }
  }
bobmods.lib.recipe.set_energy_required('cp-processing-board', 5)
bobmods.lib.recipe.set_energy_required('superior-circuit-board', 5)

local cpadvancedprocessingboard = data.raw.item['advanced-processing-unit']
data.raw.item['cp-advanced-processing-board'] = cpadvancedprocessingboard
cpadvancedprocessingboard.name = 'cp-advanced-processing-board'
data.raw.item['advanced-processing-unit'] =
  {
    type = "item",
    name = "advanced-processing-unit",
    icon = "__CircuitProcessing__/graphics/icons/advanced-processing-unit.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "sb-circuit-board",
    order = "g[processing-unit]b",
    stack_size = 200
  }

local advancedplate = "steel-plate"
if data.raw.item["angels-plate-chrome"] then
  advancedplate = "angels-plate-chrome"
elseif data.raw.item["gold-plate"] then
  advancedplate = "gold-plate"
end
local advancedacid = "sulfuric-acid"
if data.raw.fluid["nitric-acid"] then
  advancedacid = "nitric-acid"
end

local cpadvancedprocessingboardrecipe = data.raw.recipe['advanced-processing-unit']
data.raw.recipe['cp-advanced-processing-board'] = cpadvancedprocessingboardrecipe
cpadvancedprocessingboardrecipe.name = 'cp-advanced-processing-board'
bobmods.lib.recipe.remove_result('cp-advanced-processing-board', 'advanced-processing-unit')
bobmods.lib.recipe.add_result('cp-advanced-processing-board', 'cp-advanced-processing-board')
lib.set_main_product('cp-advanced-processing-board', 'cp-advanced-processing-board')
bobmods.lib.recipe.set_energy_required('cp-advanced-processing-board', 5)
bobmods.lib.recipe.set_energy_required('multi-layer-circuit-board', 5)
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
      result = "advanced-processing-unit",
      allow_decomposition = false
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
      result = "advanced-processing-unit",
      allow_decomposition = false
    }
  }

local cable = {
  ['copper-cable']=true,
  ['tinned-copper-cable']=true,
  ['angels-wire-silver']=true,
  ['gilded-copper-cable']=true
}

local components = {
  'basic-electronic-components',
  'electronic-components',
  'intergrated-electronics'
}

local function doublecable(ingredients)
  for k,v in pairs(ingredients) do
    local idx = 1
    local amt = 2
    if v.name then
      idx = 'name'
      amt = 'amount'
    end
    if cable[v[idx]] then
      v[amt] = v[amt] * 2
    end
  end
end

for _,v in pairs(components) do
  if data.raw.recipe[v] then
    bobmods.lib.recipe.difficulty_split(v)
    doublecable(data.raw.recipe[v].normal.ingredients)
    doublecable(data.raw.recipe[v].expensive.ingredients)
  end
end

data.raw.recipe['basic-electronic-components'].normal.result_count = 10
data.raw.recipe['basic-electronic-components'].expensive.result_count = 6
bobmods.lib.recipe.set_difficulty_energy_required('basic-electronic-components', 'normal', 4)
bobmods.lib.recipe.set_difficulty_energy_required('basic-electronic-components', 'expensive', 6)

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
      if data.raw.technology['angels-aluminium-smelting-1'] then
        bobmods.lib.tech.add_prerequisite(k, 'angels-aluminium-smelting-1')
      end
      break
    elseif ev.type == 'unlock-recipe' and ev.recipe == 'processing-unit' then
      table.insert(v.effects, ek, {type = 'unlock-recipe', recipe = 'cp-processing-board'})
      if data.raw.technology['angels-titanium-smelting-1'] then
        bobmods.lib.tech.add_prerequisite(k, 'angels-titanium-smelting-1')
      end
      break
    elseif ev.type == 'unlock-recipe' and ev.recipe == 'advanced-processing-unit' then
      table.insert(v.effects, ek, {type = 'unlock-recipe', recipe = 'cp-advanced-processing-board'})
      if data.raw.technology['angels-chrome-smelting-1'] then
        bobmods.lib.tech.add_prerequisite(k, 'angels-chrome-smelting-1')
      end
      break
    end
  end
end

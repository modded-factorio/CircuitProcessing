local lib = require "lib"
--if not mods['bobmodules'] or not settings.startup['cp-override-modules'].value then
if not mods['bobmodules'] then
  return
end

local function takeeffect(effects, name)
  for i,v in ipairs(effects or {}) do
    if v.recipe == name then
      return table.remove(effects, i)
    end
  end
end

if data.raw.technology['module-merging'] then
  data.raw.technology['module-merging'].enabled = false
end

for _,m in pairs({
  {tech = 'modules',   module_name = 'pollution-clean-processor'},
  {tech = 'modules',   module_name = 'pollution-create-processor'},
  {tech = 'modules-2', module_name = 'pollution-clean-processor-2'},
  {tech = 'modules-2', module_name = 'pollution-create-processor-2'},
  {tech = 'modules-3', module_name = 'pollution-clean-processor-3'},
  {tech = 'modules-3', module_name = 'pollution-create-processor-3'}
}) do
  if data.raw.technology[m.tech] then
    bobmods.lib.tech.remove_recipe_unlock(m.tech, m.module_name)
  end
  lib.hide_recipe(m.module_name)
  lib.hide_item(m.module_name)
end

for i = 1,8 do
  for _,s in pairs({'raw-speed-module-', 'raw-productivity-module-', 'pollution-create-module-', 'pollution-clean-module-', 'green-module-', 'god-module-'}) do
    local str = s .. i
    if data.raw.technology[str] then
      data.raw.technology[str] = nil
    end
    data.raw.module[str] = nil
    data.raw.recipe[str] = nil
  end
  for _,s in pairs({'raw-speed-module-', 'green-module-', 'raw-productivity-module-'}) do
    local str = s .. i .. '-combine'
    data.raw.recipe[str] = nil
  end
end
for _,s in pairs({"speed", "effectivity", "productivity"}) do
  local processor2 = takeeffect(data.raw.technology[s.."-module-3"].effects, s.."-processor-2")
  if processor2 then
    table.insert(data.raw.technology[s.."-module-2"].effects, processor2)
    bobmods.lib.tech.add_prerequisite(s.."-module-2", "advanced-electronics-2")
  end
  local processor3 = takeeffect(data.raw.technology[s.."-module-6"].effects, s.."-processor-3")
  if processor3 then
    table.insert(data.raw.technology[s.."-module-3"].effects, processor3)
    bobmods.lib.tech.remove_prerequisite(s.."-module-3", "advanced-electronics-2")
    bobmods.lib.tech.add_prerequisite(s.."-module-3", "advanced-electronics-3")
  end
  table.insert(data.raw.technology[s.."-module"].effects,
    takeeffect(data.raw.technology[s.."-module-2"].effects, s.."-module-2"))
  table.insert(data.raw.technology[s.."-module-2"].effects,
    takeeffect(data.raw.technology[s.."-module-3"].effects, s.."-module-3"))
  table.insert(data.raw.technology[s.."-module-2"].effects,
    takeeffect(data.raw.technology[s.."-module-4"].effects, s.."-module-4"))
  table.insert(data.raw.technology[s.."-module-3"].effects,
    takeeffect(data.raw.technology[s.."-module-5"].effects, s.."-module-5"))
  table.insert(data.raw.technology[s.."-module-3"].effects,
    takeeffect(data.raw.technology[s.."-module-6"].effects, s.."-module-6"))
  table.insert(data.raw.technology[s.."-module-4"].effects,
    takeeffect(data.raw.technology[s.."-module-7"].effects, s.."-module-7"))
  table.insert(data.raw.technology[s.."-module-4"].effects,
    takeeffect(data.raw.technology[s.."-module-8"].effects, s.."-module-8"))
  local cost = 50
  if bobmods.modules.ModulesLab then
    bobmods.lib.tech.add_science_pack(s.."-module-2", "module-circuit-board", 1)
  else
    bobmods.lib.tech.add_science_pack(s.."-module-2", "chemical-science-pack", 1)
  end
  for _,i in pairs({"", "-2", "-3", "-4"}) do
    local itemtoname = {
      [""] = "-0",
      ["-2"] = "-1",
      ["-3"] = "-2",
      ["-4"] = "-3"
    }
    data.raw.technology[s.."-module"..i].icon = nil
    data.raw.technology[s.."-module"..i].icons = nil
    data.raw.technology[s.."-module"..i].unit.count = cost
    local directory = "__base__"
    if i == "" then
      directory = "__CircuitProcessing__"
    end
    data.raw.technology[s.."-module"..i].icon_size = 256
    data.raw.technology[s.."-module"..i].icon = directory.."/graphics/technology/"..s.."-module"..itemtoname[i]..".png"
    data.raw.technology[s.."-module"..i].localised_name = {"item-name."..s.."-module"..itemtoname[i]}
    data.raw.technology[s.."-module"..i].upgrade = false

    if i == "-3" or i == "-4" then
      if bobmods.modules.ModulesLab then
        bobmods.lib.tech.add_science_pack(s.."-module"..i, "module-case", 1)
      else
        bobmods.lib.tech.add_science_pack(s.."-module"..i, "production-science-pack", 1)
      end
    end
    cost = cost * 2
  end
end
for i = 5,8 do
  for _,s in pairs({'speed-module-', 'effectivity-module-', 'productivity-module-'}) do
    local str = s .. i
    if data.raw.technology[str] then
      data.raw.technology[str] = nil
    end
  end
end

local replacetech = {}
local replaceingredient = {}
for _,s in pairs({'speed-module', 'effectivity-module', 'productivity-module'}) do
  replacetech[s.."-2"] = s
  replacetech[s.."-3"] = s.."-2"
  replacetech[s.."-4"] = s.."-2"
  replacetech[s.."-5"] = s.."-3"
  replacetech[s.."-6"] = s.."-3"
  replacetech[s.."-7"] = s.."-4"
  replacetech[s.."-8"] = s.."-4"
  replaceingredient[s] = s.."-2"
  replaceingredient[s.."-3"] = s.."-4"
  replaceingredient[s.."-5"] = s.."-6"
  replaceingredient[s.."-7"] = s.."-8"
end

for tname,tech in pairs(data.raw.technology) do
  tname = string.sub(tname, 1, -2)
  if tname ~= 'speed-module-' and tname ~= 'effectivity-module-' and tname ~= 'productivity-module-' then
    for ek,ev in pairs(tech.prerequisites or {}) do
      if replacetech[ev] then
        --print("in tech " .. tname .. " replacetech " .. ev .. " with " .. replacetechtech[ev])
        tech.prerequisites[ek] = replacetech[ev]
      end
    end
  end
end

if data.raw.technology['modules-2'] and data.raw.technology['modules-3'] then
  for _,n in pairs({'speed-module', 'productivity-module', 'effectivity-module'}) do
    local tech2 = data.raw.technology[n .. '-2']
    table.insert(tech2.prerequisites, 'modules-2')
    local tech3 = data.raw.technology[n .. '-3']
    for k,v in pairs(tech3.prerequisites or {}) do
      if v == 'modules-2' then
        tech3.prerequisites[k] = 'modules-3'
      end
    end
  end
end

local function replaceingredients(recipe)
  if recipe.normal then
    replaceingredients(recipe.normal)
  end
  if recipe.expensive then
    replaceingredients(recipe.expensive)
  end
  local ingredients = recipe.ingredients or {}
  for _,ingredient in pairs(ingredients) do
    local nameidx = 1
    if ingredient.name then nameidx = 'name' end
    local r = replaceingredient[ingredient[nameidx]]
    if r then
      ingredient[nameidx] = r
    end
  end
end

for _,recipe in pairs(data.raw.recipe) do
  replaceingredients(recipe)
end

local effects = {
  ['speed-module-2'] = { speed = {bonus = 0.2}, consumption = {bonus = 0.5}},
  ['speed-module-4'] = { speed = {bonus = 0.3}, consumption = {bonus = 0.6}},
  ['speed-module-6'] = { speed = {bonus = 0.5}, consumption = {bonus = 0.7}},
  ['speed-module-8'] = { speed = {bonus = 0.7}, consumption = {bonus = 0.8}},
  ['effectivity-module-2'] = { consumption = {bonus = -0.3}},
  ['effectivity-module-4'] = { consumption = {bonus = -0.4}},
  ['effectivity-module-6'] = { consumption = {bonus = -0.5}},
  ['effectivity-module-8'] = { consumption = {bonus = -0.6}},
  ['productivity-module-2'] = {
    productivity = {bonus = 0.04},
    consumption = {bonus = 0.4},
    pollution = {bonus = 0.05},
    speed = {bonus = -0.10}
  },
  ['productivity-module-4'] = {
    productivity = {bonus = 0.06},
    consumption = {bonus = 0.6},
    pollution = {bonus = 0.075},
    speed = {bonus = -0.12}
  },
  ['productivity-module-6'] = {
    productivity = {bonus = 0.08},
    consumption = {bonus = 0.8},
    pollution = {bonus = 0.1},
    speed = {bonus = -0.14}
  },
  ['productivity-module-8'] = {
    productivity = {bonus = 0.12},
    consumption = {bonus = 1.2},
    pollution = {bonus = 0.15},
    speed = {bonus = -0.15}
  }
}

local gems = {
  ['speed-module-6'] = 'sapphire-5',
  ['speed-module-8'] = 'amethyst-5',
  ['effectivity-module-6'] = 'emerald-5',
  ['effectivity-module-8'] = 'topaz-5',
  ['productivity-module-6'] = 'ruby-5',
  ['productivity-module-8'] = 'diamond-5'
}

local tint = {
  ['speed'] = {
    primary = {r = 0.441, g = 0.714, b = 1.000, a = 1.000}, -- #70b6ffff
    secondary = {r = 0.388, g = 0.976, b = 1.000, a = 1.000}, -- #63f8ffff
  },
  ['effectivity'] = {
    primary = { 0, 1, 0 },
    secondary = {r = 0.370, g = 1.000, b = 0.370, a = 1.000}, -- #5eff5eff
  },
  ['productivity'] = nil
}

for _,v in pairs({'speed', 'effectivity', 'productivity'}) do
  local beacontint = tint[v]
  local processor = v..'-processor'
  local processor2 = v..'-processor-2'
  local processor3 = v..'-processor-3'
  local module = v..'-module'
  local module2 = v..'-module-2'
  local module3 = v..'-module-3'
  local module4 = v..'-module-4'
  local module5 = v..'-module-5'
  local module6 = v..'-module-6'
  local module7 = v..'-module-7'
  local module8 = v..'-module-8'

  data.raw.recipe[module].ingredients = lib.checkplate(
    {'solder', 1},
  {
    {'electronic-circuit', 1},
    {'insulated-cable', 2},
    {'module-contact', 1}
  })
  data.raw.recipe[module].energy_required = 7.5
  data.raw.item[module] = data.raw.module[module]
  data.raw.module[module] = nil
  data.raw.item[module].type = 'item'
  data.raw.item[module].icon = "__CircuitProcessing__/graphics/icons/"..v.."-module-0-harness.png"
  data.raw.item[module].icon_size = 64
  data.raw.item[module].icon_mipmaps = 4
  data.raw.item[module].localised_name = {"item-name."..v.."-module-0-harness"}
  data.raw.item[module].localised_description = ""

  data.raw.recipe[module2].ingredients = {
    {module, 4},
    {processor, 5},
    {'advanced-circuit', 5},
    {'module-case', 1},
    {'module-circuit-board', 1}
  }
  data.raw.recipe[module2].energy_required = 15
  data.raw.module[module2].icon = "__CircuitProcessing__/graphics/icons/"..v.."-module-0.png"
  data.raw.module[module2].icon_size = 64
  data.raw.module[module2].icon_mipmaps = 4
  data.raw.module[module2].localised_name = {"item-name."..v.."-module-0"}
  data.raw.module[module2].effect = effects[module2]
  data.raw.module[module2].beacon_tint = beacontint
  data.raw.module[module2].tier = 1

  data.raw.recipe[module3].ingredients = lib.checkplate(
    {'solder', 2},
  {
    {module2, 1},
    {'electronic-components', 4},
    {'module-contact', 1}
  })
  data.raw.recipe[module3].energy_required = 15
  data.raw.item[module3] = data.raw.module[module3]
  data.raw.module[module3] = nil
  data.raw.item[module3].type = 'item'
  data.raw.item[module3].icon = "__CircuitProcessing__/graphics/icons/"..v.."-module-harness.png"
  data.raw.item[module3].icon_size = 64
  data.raw.item[module3].icon_mipmaps = 4
  data.raw.item[module3].localised_name = {"item-name."..v.."-module-1-harness"}
  data.raw.item[module3].localised_description = ""
  data.raw.recipe[module4].ingredients = {
    {module3, 4},
    {processor2, 5},
    {'advanced-circuit', 5},
    {'processing-unit', 5}
  }
  data.raw.recipe[module4].energy_required = 30
  data.raw.module[module4].icon = "__base__/graphics/icons/"..v.."-module.png"
  data.raw.module[module4].icon_size = 64
  data.raw.module[module4].icon_mipmaps = 4
  data.raw.module[module4].localised_name = {"item-name."..v.."-module-1"}
  data.raw.module[module4].localised_description = {"item-description."..module}
  data.raw.module[module4].effect = effects[module4]
  data.raw.module[module4].beacon_tint = beacontint
  data.raw.module[module4].tier = 2

  data.raw.recipe[module5].ingredients = lib.checkplate(
    {'solder', 1},
  {
    {module4, 1},
    {'electronic-components', 5},
    {'intergrated-electronics', 4},
    {'module-contact', 1}
  })
  data.raw.recipe[module5].energy_required = 30
  data.raw.item[module5] = data.raw.module[module5]
  data.raw.module[module5] = nil
  data.raw.item[module5].type = 'item'
  data.raw.item[module5].icon = "__CircuitProcessing__/graphics/icons/"..v.."-module-2-harness.png"
  data.raw.item[module5].icon_size = 64
  data.raw.item[module5].icon_mipmaps = 4
  data.raw.item[module5].localised_name = {"item-name."..v.."-module-2-harness"}
  data.raw.recipe[module6].ingredients = {
    {module5, 4},
    {processor3, 20},
    {'processing-unit', 5},
    {'advanced-processing-unit', 2}
  }
  local gem = gems[module6]
  if data.raw.item[gem] then
    table.insert(data.raw.recipe[module6].ingredients, 3, {gem, 1})
  end
  data.raw.recipe[module6].energy_required = 60
  data.raw.module[module6].icon = "__base__/graphics/icons/"..v.."-module-2.png"
  data.raw.module[module6].icon_size = 64
  data.raw.module[module6].icon_mipmaps = 4
  data.raw.module[module6].localised_name = {"item-name."..v.."-module-2"}
  data.raw.module[module6].localised_description = {"item-description."..module}
  data.raw.module[module6].effect = effects[module6]
  data.raw.module[module6].beacon_tint = beacontint
  data.raw.module[module6].tier = 3

  data.raw.recipe[module7].ingredients = lib.checkplate(
    {'solder', 5},
  {
    {module6, 1},
    {'electronic-components', 10},
    {'intergrated-electronics', 5},
    {'processing-electronics', 20},
    {'module-contact', 1}
  })
  data.raw.recipe[module7].energy_required = 30
  data.raw.item[module7] = data.raw.module[module7]
  data.raw.module[module7] = nil
  data.raw.item[module7].type = 'item'
  data.raw.item[module7].icon = "__CircuitProcessing__/graphics/icons/"..v.."-module-3-harness.png"
  data.raw.item[module7].icon_size = 64
  data.raw.item[module7].icon_mipmaps = 4
  data.raw.item[module7].localised_name = {"item-name."..v.."-module-3-harness"}
  data.raw.recipe[module8].ingredients = {
    {module7, 2},
    {'electronic-circuit', 20},
    {'advanced-circuit', 10},
    {'processing-unit', 5},
    {'advanced-processing-unit', 5}
  }
  gem = gems[module8]
  if data.raw.item[gem] then
    table.insert(data.raw.recipe[module8].ingredients, 2, {gem, 1})
  end
  data.raw.recipe[module8].energy_required = 60
  data.raw.module[module8].icon = "__base__/graphics/icons/"..v.."-module-3.png"
  data.raw.module[module8].icon_size = 64
  data.raw.module[module8].icon_mipmaps = 4
  data.raw.module[module8].localised_name = {"item-name."..v.."-module-3"}
  data.raw.module[module8].localised_description = {"item-description."..module}
  data.raw.module[module8].effect = effects[module8]
  data.raw.module[module8].beacon_tint = beacontint
  data.raw.module[module8].tier = 4
end

if bobmods.modules.ModulesLab then
  data.raw.lab['lab-module'].inputs = {
    'module-case',
    'module-circuit-board',
    'speed-processor',
    'effectivity-processor',
    'productivity-processor'
  }
end

local function makebeacontable()
  local ret = {}
  for k,v in pairs({{'module-lights', 4}, {'module-mask-box', 4}, {'module-mask-lights', 4}, {'module-slot', 5}}) do
    ret['__base__/graphics/entity/beacon/beacon-'..v[1]..'-1.png'] =
      {file = '__CircuitProcessing__/graphics/beacon/beacon-'..v[1]..'-1.png', count = v[2]}
    ret['__base__/graphics/entity/beacon/hr-beacon-'..v[1]..'-1.png'] =
      {file = '__CircuitProcessing__/graphics/beacon/hr-beacon-'..v[1]..'-1.png', count = v[2]}
    ret['__base__/graphics/entity/beacon/beacon-'..v[1]..'-2.png'] =
      {file = '__CircuitProcessing__/graphics/beacon/beacon-'..v[1]..'-2.png', count = v[2]}
    ret['__base__/graphics/entity/beacon/hr-beacon-'..v[1]..'-2.png'] =
      {file = '__CircuitProcessing__/graphics/beacon/hr-beacon-'..v[1]..'-2.png', count = v[2]}
  end
  return ret
end
local beacontable = makebeacontable()

local function updatepictures(pictures)
  local r = beacontable[pictures.filename]
  if r then
    pictures.filename = r.file
    pictures.variation_count = r.count
    pictures.line_length = r.count
  end
  if pictures.hr_version then
    updatepictures(pictures.hr_version)
  end
end

for _,b in pairs(data.raw.beacon) do
  if b.graphics_set and b.graphics_set.module_visualisations then
    for ki,vi in pairs(b.graphics_set.module_visualisations[1].slots) do
      for kj, vj in pairs(vi) do
        updatepictures(vj.pictures)
      end
    end
  end
end

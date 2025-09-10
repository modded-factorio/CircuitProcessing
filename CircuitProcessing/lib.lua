local lib = {}

lib.tablefind = function(table, item)
  for k, v in pairs(table) do
    if v == item then
      return k
    end
  end
  return nil
end

lib.checkplate = function(plate, rest)
  if data.raw.item[plate.name] then
    local newtable = table.deepcopy(rest)
    table.insert(newtable, plate)
    return newtable
  end
  return rest
end

lib.hide_item = function(name)
  -- Add hidden flag to disabled items so they don't show up in circuit menu/item filter/FNEI etc.
  local item = data.raw.item[name]
  if not item then
    item = data.raw.fluid[name]
  end
  if not item then
    item = data.raw.tool[name]
  end
  if item then
    item.hidden = true
  end
end

lib.set_main_product = function(recipe, item)
  local r = data.raw.recipe[recipe]
  if
    type(recipe) == "string" and
    type(item) == "string" and
    r
  then
    r.main_product = item
  else
    log(debug.traceback())
  end
end
lib.hide_recipe = function(recipe)
    local r = data.raw.recipe[recipe]
    if
        type(recipe) == "string" and
        r
    then
        r.hidden = true
        r.enabled = false
    else
        log(debug.traceback())
    end
end

lib.set_energy_required = function(recipe, energy)
    local r = data.raw.recipe[recipe]
    if type(recipe) == "string" and type(energy) == "number" and r then
        r.energy_required = energy
    else
        log(debug.traceback())
    end
end

lib.add_module_effect = function(module_name, effect_name, effect_amount)
    local module = data.raw.module[module_name]

    if (not module) then error("Tried to remove effect of non existing module "..module_name) end

    module.effect[effect_name] = effect_amount
end

-- replaces existing ingredient with new ingredient (only items)
lib.replace_recipe_ingredient = function(recipe_name, old_ingredient, new_ingredient, new_amount)
    local recipes = data.raw.recipe
    if (not recipes[recipe_name]) then error("Recipe "..recipe_name.." not found while trying to replace ingredient") end

    for _, ingr in pairs(recipes[recipe_name].ingredients) do
        if (ingr.name == old_ingredient) then
            ingr.name = new_ingredient
            ingr.amount = new_amount or ingr.amount
        end
    end
end

-- adds recipe ingredient (only items)
lib.add_recipe_ingredient = function(recipe_name, ingr_name, ingr_amount)
    local recipes = data.raw.recipe
    if (not recipes[recipe_name]) then error("Recipe "..recipe_name.." not found while trying to add ingredient") end

    recipes[recipe_name].ingredients = recipes[recipe_name].ingredients or {}

    table.insert(recipes[recipe_name].ingredients, { type = "item", name = ingr_name, amount = ingr_amount or 1 })
end

return lib
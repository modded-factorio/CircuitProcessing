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
    if r.normal then
      r.normal.main_product = item
    end
    if r.expensive then
      r.expensive.main_product = item
    end
    if (not r.normal) and (not r.expensive) then
      r.main_product = item
    end
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

return lib
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
  if data.raw.item[plate[1]] then
    local newtable = table.deepcopy(rest)
    table.insert(newtable, plate)
    return newtable
  end
  return rest
end

lib.hideitem = function(name)
  -- Add hidden flag to disabled items so they don't show up in circuit menu/item filter/FNEI etc.
  local item = data.raw.item[name]
  if not item then
    item = data.raw.fluid[name]
  end
  if not item then
    item = data.raw.tool[name]
  end
  if item then
    if not item.flags then
      item.flags = {}
    end
    if not lib.tablefind(item.flags, "hidden") then
      table.insert(item.flags, "hidden")
    end
  end
end
return lib

local lib = {}

lib.checkplate = function(plate, rest)
  if data.raw.item[plate[1]] then
    local newtable = table.deepcopy(rest)
    table.insert(newtable, plate)
    return newtable
  end
  return rest
end

return lib

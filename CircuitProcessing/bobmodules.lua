local lib = require "lib"

if not mods["bobmodules"] then
  return
end

local electronic_part_drop_move = {
  filename = "__base__/sound/item/wire-inventory-move.ogg",
  volume = 0.8,
}
local electronic_part_pick = {
  filename = "__base__/sound/item/wire-inventory-pickup.ogg",
  volume = 0.6,
}

local gems = {
  ["speed"]            = "bob-sapphire-5",
  ["efficiency"]       = "bob-emerald-5",
  ["productivity"]     = "bob-ruby-5",
  ["angels-bio-yield"] = "bob-topaz-5",
  ["quality"]          = "bob-amethyst-5",
}

data:extend({
  {
    type = "item-subgroup",
    name = "cp-module-intermediates",
    group = "bobmodules",
    order = "f-00a",
  },
})

for i, v in pairs({
  "speed",
  "efficiency",
  "productivity",
  mods["quality"] and "quality" or nil,
}) do
  local processor1 = "cp-"..v.."-processor"
  local module1 = v.."-module"

  data:extend({
    {
      type = "item",
      name = processor1,
      icon = "__bobmodules__/graphics/icons/"..v.."-processor.png",
      subgroup = "cp-module-intermediates",
      order = i + 1 .. "["..processor1.."]",
      stack_size = 200,
      drop_sound = electronic_part_drop_move,
      inventory_move_sound = electronic_part_drop_move,
      pick_sound = electronic_part_pick,
    },
    {
      type = "recipe",
      name = processor1,
      ingredients = lib.checkplate(
        { type = "item", name = "bob-solder", amount = 1 },
        {
          { type = "item", name = "bob-basic-electronic-components", amount = 4 },
          { type = "item", name = "bob-module-circuit-board", amount = 1 },
        }
      ),
      results = {
        { type = "item", name = processor1, amount = 1 },
      },
      energy_required = 2.5,
      enabled = false,
    },
  })
  if mods["bobplates"] and mods["angelsbioprocessing"] then
    bobmods.lib.recipe.add_ingredient(processor1, { type = "item", name = gems[v], amount = 1 })
  end
  bobmods.lib.tech.add_recipe_unlock(module1, processor1)
end

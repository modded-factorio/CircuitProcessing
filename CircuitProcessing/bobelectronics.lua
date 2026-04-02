local lib = require "lib"

data:extend({
  {
    type = "item-subgroup",
    name = "sb-circuit-board",
    group = "intermediate-products",
    order = "e-a3-b",
  },
})

-- GREEN

data:extend({
  {
    type = "item",
    name = "cp-electronic-circuit-board",
    icon = "__CircuitProcessing__/graphics/icons/circuits/basic-electronic-board.png",
    icon_size = 64,
    subgroup = "sb-circuit-board",
    order = "e[electronic-circuit]",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "cp-electronic-circuit-board",
    category = "advanced-crafting",
    ingredients = {},
    results = {{ type = "item", name = "cp-electronic-circuit-board", amount = 1 }},
    enabled = false,
    energy_required = 1,
    allow_productivity = true,
  },
})
bobmods.lib.recipe.add_additional_category("cp-electronic-circuit-board", "electronics")

-- RED

data:extend({
  {
    type = "item",
    name = "cp-advanced-circuit-board",
    icon = "__bobelectronics__/graphics/icons/circuit-board.png",
    icon_size = 64,
    subgroup = "sb-circuit-board",
    order = "f[advanced-circuit]",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "cp-advanced-circuit-board",
    category = "advanced-crafting",
    ingredients = {},
    results = {{ type = "item", name = "cp-advanced-circuit-board", amount = 1 }},
    enabled = false,
    energy_required = 5,
    allow_productivity = true,
  },
})
bobmods.lib.recipe.add_additional_category("cp-advanced-circuit-board", "electronics")

-- BLUE

data:extend({
  {
    type = "item",
    name = "cp-processing-board",
    icon = "__bobelectronics__/graphics/icons/superior-circuit-board.png",
    icon_size = 64,
    subgroup = "sb-circuit-board",
    order = "g[processing-unit]",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "cp-processing-board",
    category = "advanced-crafting",
    ingredients = {},
    results = {{ type = "item", name = "cp-processing-board", amount = 1 }},
    enabled = false,
    energy_required = 5,
    allow_productivity = true,
  },
})
bobmods.lib.recipe.add_additional_category("cp-processing-board", "electronics")

-- BLACK

data:extend({
  {
    type = "item",
    name = "cp-advanced-processing-board",
    icon = "__bobelectronics__/graphics/icons/multi-layer-circuit-board.png",
    icon_size = 64,
    subgroup = "sb-circuit-board",
    order = "h[advanced-processing-unit]",
    stack_size = 200,
  },
  {
    type = "recipe",
    name = "cp-advanced-processing-board",
    category = "advanced-crafting",
    ingredients = {},
    results = {{ type = "item", name = "cp-advanced-processing-board", amount = 1 }},
    enabled = false,
    energy_required = 5,
    allow_productivity = true,
  },
})
bobmods.lib.recipe.add_additional_category("cp-advanced-processing-board", "electronics")

if angelsmods and angelsmods.trigger and angelsmods.trigger.smelting_products and
  angelsmods.trigger.smelting_products["chrome"] then
  angelsmods.trigger.smelting_products["chrome"].plate = true
end

-- replaces existing ingredient with new ingredient (only items)
function replace_recipe_ingredient(recipe_name, old_ingredient, new_ingredient, new_amount)
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
function add_recipe_ingredient(recipe_name, ingr_name, ingr_amount)
    local recipes = data.raw.recipe
    if (not recipes[recipe_name]) then error("Recipe "..recipe_name.." not found while trying to add ingredient") end

    recipes[recipe_name].ingredients = recipes[recipe_name].ingredients or {}

    table.insert(recipes[recipe_name].ingredients, { type = "item", name = ingr_name, amount = ingr_amount or 1 })
end
require "bobelectronics"
require "bobmodules"

data.raw.recipe['rocket-control-unit'].normal = nil
data.raw.recipe['rocket-control-unit'].expensive = nil
local module = 'speed-module'
if data.raw.module['speed-module-8'] then
  module = 'speed-module-2'
end
data.raw.recipe['rocket-control-unit'].ingredients = {
  {"advanced-processing-unit", 1},
  {module, 1}
}
data.raw.recipe['rocket-control-unit'].result = 'rocket-control-unit'
data.raw.recipe['rocket-control-unit'].energy_required = 30

-- Hide Agriculture Modules. Revisit later, once Angel's devs have finished their changes
local function disable(name)
  if data.raw.technology[name] then
    data.raw.technology[name].enabled = false
    data.raw.technology[name].hidden = true
  end
  if data.raw.recipe[name] then
    data.raw.recipe[name].hidden = true
  end
  if data.raw.module[name] then
    data.raw.module[name].flags = {'hidden'}
  end
end
for _,v in pairs({
  'angels-bio-yield-module',
  'angels-bio-yield-module-2',
  'angels-bio-yield-module-3'}) do
  disable(v)
end

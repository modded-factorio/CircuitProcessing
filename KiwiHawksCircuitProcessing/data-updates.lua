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

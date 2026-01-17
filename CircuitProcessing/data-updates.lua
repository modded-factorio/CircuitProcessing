require "bobelectronics"
require "bobmodules"

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
  'angels-bio-yield-module-3',
  'angels-bio-yield-module-4',
  'angels-bio-yield-module-5',
  'angels-bio-yield-module-6',
  'angels-bio-yield-module-7',
  'angels-bio-yield-module-8'
  }) do
  disable(v)
end

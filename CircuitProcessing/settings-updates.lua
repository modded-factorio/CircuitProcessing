local function hide_setting(setting_type, setting_name)
  -- setting_type: [bool-setting | int-setting | double-setting | string-setting]
  if data.raw[setting_type] then
    local s = data.raw[setting_type][setting_name]
    if s then
      s.hidden = true
    else
      log('Error: missing setting ' .. setting_name)
    end
  else
    log('Error: missing setting type ' .. setting_type)
  end
end

-- Bob's Modules
if mods['bobmodules'] then
  hide_setting('double-setting', 'bobmods-modules-perlevel-bonus-speed')
  hide_setting('double-setting', 'bobmods-modules-perlevel-bonus-pollution')
  hide_setting('double-setting', 'bobmods-modules-perlevel-bonus-consumption')
  hide_setting('double-setting', 'bobmods-modules-perlevel-bonus-productivity')
  hide_setting('double-setting', 'bobmods-modules-perlevel-bonus-pollutioncreate')
  hide_setting('double-setting', 'bobmods-modules-perlevel-penalty-speed')
  hide_setting('double-setting', 'bobmods-modules-perlevel-penalty-pollution')
  hide_setting('double-setting', 'bobmods-modules-perlevel-penalty-consumption')
  hide_setting('double-setting', 'bobmods-modules-start-bonus-speed')
  hide_setting('double-setting', 'bobmods-modules-start-bonus-pollution')
  hide_setting('double-setting', 'bobmods-modules-start-bonus-consumption')
  hide_setting('double-setting', 'bobmods-modules-start-bonus-productivity')
  hide_setting('double-setting', 'bobmods-modules-start-bonus-pollutioncreate')
  hide_setting('double-setting', 'bobmods-modules-start-penalty-speed')
  hide_setting('double-setting', 'bobmods-modules-start-penalty-pollution')
  hide_setting('double-setting', 'bobmods-modules-start-penalty-consumption')

  if mods["quality"] then
    hide_setting('double-setting', 'bobmods-modules-start-bonus-quality')
    hide_setting('double-setting', 'bobmods-modules-perlevel-bonus-quality')
  end
end

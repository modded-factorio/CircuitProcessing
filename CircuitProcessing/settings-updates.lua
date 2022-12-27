local function overwrite_setting(setting_type, setting_name, value)
  -- setting_type: [bool-setting | int-setting | double-setting | string-setting]
  if data.raw[setting_type] then
    local s = data.raw[setting_type][setting_name]
    if s then
      if setting_type == 'bool-setting' then
        s.forced_value = value
      else
        s.default_value = value
        s.allowed_values = {value}
      end
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
  overwrite_setting('bool-setting', 'bobmods-modules-enablegreenmodules', false)
  overwrite_setting('bool-setting', 'bobmods-modules-enablerawspeedmodules', false)
  overwrite_setting('bool-setting', 'bobmods-modules-enablerawproductivitymodules', false)
  overwrite_setting('bool-setting', 'bobmods-modules-enablegodmodules', false)
  overwrite_setting('bool-setting', 'bobmods-modules-enableproductivitylimitation', true)
  overwrite_setting('bool-setting', 'bobmods-modules-productivityhasspeed', true)
  overwrite_setting('bool-setting', 'bobmods-modules-transmitproductivity', false)
  overwrite_setting('double-setting', 'bobmods-modules-perlevel-bonus-speed', 0.05)
  overwrite_setting('double-setting', 'bobmods-modules-perlevel-bonus-pollution', 0.025)
  overwrite_setting('double-setting', 'bobmods-modules-perlevel-bonus-consumption', 0.05)
  overwrite_setting('double-setting', 'bobmods-modules-perlevel-bonus-productivity', 0.015)
  overwrite_setting('double-setting', 'bobmods-modules-perlevel-bonus-pollutioncreate', 0.2)
  overwrite_setting('double-setting', 'bobmods-modules-perlevel-penalty-speed', 0)
  overwrite_setting('double-setting', 'bobmods-modules-perlevel-penalty-pollution', 0.01)
  overwrite_setting('double-setting', 'bobmods-modules-perlevel-penalty-consumption', 0.05)
  overwrite_setting('double-setting', 'bobmods-modules-start-bonus-speed', 0.2)
  overwrite_setting('double-setting', 'bobmods-modules-start-bonus-pollution', 0)
  overwrite_setting('double-setting', 'bobmods-modules-start-bonus-consumption', 0.2)
  overwrite_setting('double-setting', 'bobmods-modules-start-bonus-productivity', 0)
  overwrite_setting('double-setting', 'bobmods-modules-start-bonus-pollutioncreate', 0)
  overwrite_setting('double-setting', 'bobmods-modules-start-penalty-speed', 0.15)
  overwrite_setting('double-setting', 'bobmods-modules-start-penalty-pollution', 0.02)
  overwrite_setting('double-setting', 'bobmods-modules-start-penalty-consumption', 0.4)
  overwrite_setting('bool-setting', 'bobmods-modules-enable-modules-lab', false)
end

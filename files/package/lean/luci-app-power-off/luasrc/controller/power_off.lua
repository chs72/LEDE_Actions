-- Copyright 2020 Tansony72 <tansony72@gmail.com>
-- Licensed to the public under the Apache License 2.0.

module("luci.controller.power_off", package.seeall)

function index()
  entry({"admin", "system", "power_off"}, template("power_off/power_off"), _("Power Off"), 90)
  entry({"admin", "system", "power_off", "confirm"}, post("action_poweroff"))
end

function action_poweroff()
  local uci = require "luci.model.uci".cursor()
  local step = tonumber(luci.http.formvalue("step") or 1)
  -- if step == 1 then
    -- if nixio.fs.access("/sbin/poweroff") then
      -- luci.template.render("advanced_reboot/power_off",{})
    -- else
      -- luci.template.render("advanced_reboot/advanced_reboot",{})
    -- end
  -- elseif step == 2 then
  if step == 2 then
    luci.template.render("admin_system/applyreboot", {
          title = luci.i18n.translate("Shutting down..."),
          msg   = luci.i18n.translate("The system is shutting down now.<br /> DO NOT POWER OFF THE DEVICE!<br /> It might be necessary to renew the address of your computer to reach the device again, depending on your settings."),
          addr  = luci.ip.new(uci:get("network", "lan", "ipaddr")) or "192.168.1.1"
        })
    luci.sys.call("/sbin/poweroff")
  end
end

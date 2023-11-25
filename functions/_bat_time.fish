function _bat_time
  echo (upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -Eo "[0-9]+\.[0-9]+ hours")
end


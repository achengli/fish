function battery-notify
    if test -z "$battery_info_timelapse"
        set -g battery_info_timelapse 3000
    end
    hyprctl notify -1 $battery_info_timelapse "rgb(ff1ea3)" "battery left: "(_battery)"%"
end

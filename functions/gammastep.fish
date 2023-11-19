function gammastep
    set --local gammastep_level 4100

    if test -n "$(ps u | grep -E gammastep | grep -v fish | grep -v grep)"
        pkill gammastep
    end
    exec gammastep -O $gammastep_level
end


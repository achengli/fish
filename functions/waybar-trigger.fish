function waybar-trigger 
  if test -n "$(ps u | grep waybar | grep -v grep)"
    pkill waybar
  else
    /usr/bin/waybar
  end
end

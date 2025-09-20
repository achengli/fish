# Auto password script
# ---
# Copyright (c) 2025 BY-NC Yassin Achengli 

function fish_auto_fish
  function __find_hash -a line
    if test -n "$(echo $line | grep -E "set [-a-z ]?auto_password \"[a-zA-Z0-9#!\$&_ ]*\"")"
      echo $line | cut -d'"' -f2 | cut -d'"' -f1
    end
    echo ''
  end

  if test -z "$auto_hash"
    return
  end

  if test -f $PWD/auto.fish
    while read line
      set lpass "$(__find_hash $line)"
      if test -n "$lpass"
        if test "$(echo $lpass | sha256sum | cut -d' ' -f1)" = "$auto_hash"
          source $PWD/auto.fish
          break
        end
      end
    end < $PWD/auto.fish
  end
end

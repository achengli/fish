#!/usr/bin/env fish

function _env-append-to-path
    for arg in $argv
        set -xg PATH $PATH:$arg
    end
end

_env-append-to-path $HOME/scripts $HOME/.pokemonsay /usr/local/bin $HOME/.local/bin $HOME/.roswell/bin
set -xg SDL_VIDEODRIVER wayland
set -xg PYTHONSTARTUP /home/tao/.config/pythonrc
set -xg QT_QPA_PLATFORM wayland
set -xg LUA_INIT "@$HOME/.config/rc.lua"

eval (luarocks path | sed 's/export/set -xg/' | sed 's/=/ /')


#!/usr/bin/env fish

function _env-append-to-path
    for arg in $argv
        set PATH "$PATH:$arg"
    end
end

_env-append-to-path $HOME/scripts $HOME/.pokemonsay /usr/local/bin $HOME/.local/bin $HOME/.roswell/bin
set -xg SDL_VIDEODRIVER wayland
set -xg PYTHONSTARTUP /home/tao/.config/pythonrc
set -xg QT_QPA_PLATFORM wayland
set -xg LUA_INIT "@$HOME/.config/rc.lua"
set -xg TERM xterm-256color

_env-append-to-path $HOME/.luarocks/bin/

set --global GTK_THEME "Adwaita:dark"

eval "$(luarocks --lua-version=5.4 path)"

alias _lua54='eval "$(luarocks --lua-version=5.4 path)"'
alias _lua=_lua54
alias _lua53='eval "$(luarocks --lua-version=5.3 path)"'
alias _lua51='eval "$(luarocks --lua-version=5.1 path)"'

_env-append-to-path $HOME/.local/share/lua-language-server/bin
_env-append-to-path $HOME/.local/share/julia-1.9.3/bin
_env-append-to-path $HOME/.yarn/bin
_env-append-to-path $HOME/.cargo/bin

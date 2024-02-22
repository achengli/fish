#!/usr/bin/env fish

function _env-append-to-path
    for arg in $argv
        set PATH "$PATH:$arg"
    end
end

function _env-append-to-ldpath
    for arg in $argv
        set LD_LIBRARY_PATH "$LD_LIBRARY_PATH:$arg"
    end
end

_env-append-to-path $HOME/scripts $HOME/.pokemonsay /usr/local/bin $HOME/.local/bin $HOME/.roswell/bin
set -xg SDL_VIDEODRIVER wayland
set -xg PYTHONSTARTUP /home/tao/.config/pythonrc
set -xg QT_QPA_PLATFORM wayland
set -xg LUA_INIT "@$HOME/.config/rc.lua"
set -xg TERM xterm-256color
export QT_QPA_PLATFORM=wayland

_env-append-to-path $HOME/.luarocks/bin/

set --global GTK_THEME "Adwaita:dark"

if false
  alias _lua51='eval "$(luarocks --lua-version=5.1 path)"'
  alias _lua54='eval "$(luarocks --lua-version=5.4 path)"'
  alias _lua53='eval "$(luarocks --lua-version=5.3 path)"'
  alias _lua=_lua53

  alias lua='_lua; and /usr/bin/lua5.3'
  alias lua53='_lua53; and /usr/bin/lua5.3'
  alias lua54='_lua54; and /usr/bin/lua5.4'
  alias lua51='_lua51; and /usr/bin/lua5.1'
end

_env-append-to-path $HOME/.local/share/lua-language-server/bin
_env-append-to-path $HOME/.local/share/julia/bin
_env-append-to-path $HOME/.yarn/bin
_env-append-to-path $HOME/.cargo/bin
_env-append-to-path /home/linuxbrew/.linuxbrew/bin
_env-append-to-path /opt/riscv:/opt/riscv/bin

_env-append-to-ldpath /usr/lib
_env-append-to-ldpath /usr/lib/octave/8.4.0
set -xg KALEIDOSCOPE_DIR $HOME/git/Kaleidoscope

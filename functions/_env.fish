#!/usr/bin/env fish

set -xg SDL_VIDEODRIVER wayland
set -xg PYTHONSTARTUP /home/tao/.config/pythonrc

if test $XDG_SESSION_TYPE = "x11"
  set -xg QT_QPA_PLATFORM xcb
else
  set -xg QT_QPA_PLATFORM wayland
end

set -xg LUA_INIT "@$HOME/.config/rc.lua"
set -xg TERM xterm-256color

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

fish_add_path $HOME/.local/bin
fish_add_path $HOME/.luarocks/bin/
fish_add_path $HOME/.yarn/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.local/share/nvim/mason/bin
fish_add_path $HOME/.local/host-tools/gcc/riscv64-elf-x86_64/bin
fish_add_path /var/lib/flatpak/exports/bin

export LUA_PATH='/usr/share/lua/5.4/?.lua;/usr/share/lua/5.4/?/init.lua;/usr/lib64/lua/5.4/?.lua;/usr/lib64/lua/5.4/?/init.lua;./?.lua;./?/init.lua;/home/tao/.luarocks/share/lua/5.4/?.lua;/home/tao/.luarocks/share/lua/5.4/?/init.lua'

export LUA_CPATH='/usr/lib64/lua/5.4/?.so;/usr/lib64/lua/5.4/loadall.so;./?.so;/home/tao/.luarocks/lib64/lua/5.4/?.so'

if test -d $HOME/node_modules
  fish_add_path $HOME/node_modules/**/bin/
end

if test -d $HOME/.juliaup
  fish_add_path $HOME/.juliaup/bin
end

if test -d $HOME/go
  fish_add_path $HOME/go/bin
end

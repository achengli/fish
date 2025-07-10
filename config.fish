
# Fish configuration file
# Copyright BY-NC (C) 2023-2024 Yassin Achengli <yassin_achengli@hotmail.com> 

# Ctrl+backspace (kill word)
bind \b backward-kill-word

set -g SSH_ENV $HOME/.ssh
source $HOME/.config/fish/functions/_env.fish

# clc: console clear shortcut <<GNU Octave syntax>>
function clc
  clear
end

# list battery capacity and status (charging or uncharching)
function battery
  set -l bat_cap (acpi -i | grep -Eo '([0-9]+%),' | grep -Eo '[0-9]+')
  set -l bat_status (acpi -i | grep -Eo ': (\\w+), ' | grep -Eo '\\w+')
  echo "$bat_cap% - $bat_status"
end

# Show unicode expression in console.
function u
  if test $argv[1] = "--help"; or test $argv[1] = '-h'
    echo -e "\e[1musage:\e[m u <hex code>"  
  else
    if test (string length $argv[1]) -lt 5
      printf 'unicode: \u'$argv[1]'\n'
    else
      printf 'unicode: \U'$argv[1]'\n'
    end
  end
end

# Get help message of an Octave function out of Octave session.
# octave-help <your function>
function octave-help
  octave --eval "help $argv"
end

# Get decimal number expression from raw string.
function nums
  grep -Eo '([-+]?[0-9]*[\.[0-9]*]?)\.?' | xargs
end

# run alias fish function 
# > see HOME/.config/fish/functions/__alias_fish.fish
__alias_fish

if test -n "/usr/bin/vim"
  function vim
    nvim $argv
  end
end

_binds

# starship settings
# starship init fish | source

# hide default fish shell greeting popup
set -g fish_greeting ''
set -l __show_fish_logo false
if test $__show_fish_logo = true
  _fish_logo
end

function ll

  if test -e /usr/bin/exa; or test -e /usr/local/bin/exa
    exa -la $argv
  else
    ls -la $argv
  end

end

# default tmux call when fish is running on Blackbox terminal (for my Gnome env)
if test -n "$TERM_PROGRAM"; and test "$TERM_PROGRAM" = 'BlackBox'; or test -n "$PTYXIS_VERSION"
  if not set -q TMUX
    for k in $(tmux ls | grep -v attached | grep -Eo "^[0-9]+" )
      tmux kill-session -t $k
    end
    tmux new-session
  end
end

if test -n "/usr/bin/rlwrap" 
  function maxima
    rmaxima $argv
  end
  function sbcl
    rlwrap /usr/bin/sbcl
  end
end

# Py-venv activation
# --
# Will be activated (executing bin/activate.fish) only if authorize file matches the 
# password.
if test -f "$PWD/pyvenv.cfg"
  if test -d $PWD/bin
    if test "$(cat authorize | sha256sum | cut -d' ' -f1)" = "620f52288f6f37c3bbc8e2321e66e8c39c35c562d07180ebd278d6a6d1807f5b"
      source bin/activate.fish
    end
  end
end

set -q GHCUP_INSTALL_BASE_PREFIX[1]
set GHCUP_INSTALL_BASE_PREFIX $HOME
set -gx PATH $HOME/.cabal/bin /home/tao/.ghcup/bin $PATH # ghcup-env

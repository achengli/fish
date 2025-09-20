#!/usr/bin/env fish
# Fish configuration file
# Copyright BY-NC (C) 2023-2024 Yassin Achengli <yassin_achengli@hotmail.com> 
#
# ***********************************
#         FISH SHELL CONFIG
# ***********************************
# Copyright BY-NC (C) 2023-2024 Yassin Achengli 
#     <yassin_achengli@hotmail.com> 
# +++++++++++++++++++++++++++++++++++
#                O  o
#           _\_   o
# >('>   \\/  o\ .
#        //\___=
#           ''
# +++++++++++++++++++++++++++++++++++

# Ctrl+backspace (kill word)
bind \b backward-kill-word

set -g SSH_ENV $HOME/.ssh
source $HOME/.config/fish/functions/_env.fish

# snipped used to be a unicode previewer
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

# Get decimal number expression from raw string.
function nums
  grep -Eo '([-+]?[0-9]*[\.[0-9]*]?)\.?' | xargs
end

# for 256 colors terminal (avoid to run tmux with tty == locked console)
if test $TERM != 'xterm-256color'
  if test -z "$TMUX"
    for k in $(tmux ls | grep -v attached | grep -Eo "^[0-9]+" )
      tmux kill-session -t $k
    end
    if test $TERM = "xterm-kitty"
      set -g TMUX open
      tmux new-session
    end
  end
end

_binds

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
    /usr/bin/rmaxima $argv
  end
  function sbcl
    rlwrap /usr/bin/sbcl $argv
  end
end

set -g auto_hash "620f52288f6f37c3bbc8e2321e66e8c39c35c562d07180ebd278d6a6d1807f5b"

function clsetup
  $HOME/.vim/scripts/clangd_gen.sh $argv
end

set -q GHCUP_INSTALL_BASE_PREFIX[1]
set GHCUP_INSTALL_BASE_PREFIX $HOME
set -gx PATH $HOME/.cabal/bin /home/tao/.ghcup/bin $PATH # ghcup-env

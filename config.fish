#!/usr/bin/env fish
# Fish configuration file
# Copyright (C) 2023 Yassin Achengli <yassin_achengli@hotmail.com> 

# status is-interactive; and return
bind \b backward-kill-word

if test (uname -s) = 'Linux'; and test -f '/usr/bin/exa'
    alias ls 'exa --icons --color=auto'
    alias ll 'exa -lah --icons'
    alias grep 'grep --color=auto'
end

alias clc=clear
if test -f /usr/bin/rlwrap
    alias maxima rmaxima
end

if test -d ~/esp
    alias get_idf ". $HOME/esp/esp-idf/export.fish"
end

function rms
    if test (read -p 'are you sure to remove it? [y/N]') = 'y'
        rm -rf $argv
    end
end
        
function battery
    set -l bat_cap (acpi -i | grep -Eo '([0-9]+%),' | grep -Eo '[0-9]+')
    set -l bat_status (acpi -i | grep -Eo ': (\\w+), ' | grep -Eo '\\w+')
    echo "$bat_cap% - $bat_status"
end

#if test -z "$_TMUX_SESSION_ENABLED"
#if test -z "$TMUX"; and not test "$TERM" = "linux"; or not test "$TERM" = "linux"
#for session in (tmux ls | grep -Ev attached | cut -d: -f1 | xargs
#tmux kill-session -t "$session"
#end
#tmux
#end
#end

function rmx
    if test "$argv[1]" = "--help"; or test $argv[1] = "-h"
        printf "Remove executable files\n"
    else
        for file in * .*
            if test -f "$file"; and test -n (ls -l $file | grep -E rwx)
                rm $file
            end
        end
    end 
end

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

function octave-help
    octave --eval "help $argv"
end

function nums
    grep -Eo '([-+]?[0-9]*[\.[0-9]*]?)\.?' | xargs
end

if test -z $TMUX
    for k in $(tmux ls | grep -v attached | grep -Eo "^[0-9]+" )
        tmux kill-session -t $k
    end
    if test $TERM = "xterm-kitty"
        set -g TMUX open
        tmux new-session
    end
end


alias reload="source ~/.config/fish/config.fish"
alias emacs="/usr/bin/emacs -nw"
alias elisp="/usr/bin/emacs --script"
alias lisp=ros
alias cl=cl-repl
alias js=node
alias r=R
alias rscript=Rscript
alias vim=/usr/bin/nvim
alias vi=/usr/bin/vim
alias octave="octave -q"

## pure-fish configuration
set --universal pure_symbol_prefix_root_prompt '󱈸󱈸'
set --universal pure_symbol_git_dirty '   '

source ~/.config/fish/functions/_env.fish
_binds

starship init fish | source
set -g fish_greeting ''
alias s="kitty +kitten icat"

set -l __show_fish_logo false
if test $__show_fish_logo = true
    _fish_logo
end

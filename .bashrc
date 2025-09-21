# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc
. "$HOME/.cargo/env"

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

case ":$PATH:" in
    *:/home/tao/.juliaup/bin:*)
        ;;

    *)
        export PATH=/home/tao/.juliaup/bin${PATH:+:${PATH}}
        ;;
esac

alias vim=nvim

short_pwd(){
  echo $PWD | sed "s/\/home\/$USER/\~/g"
}

export auto_hash="620f52288f6f37c3bbc8e2321e66e8c39c35c562d07180ebd278d6a6d1807f5b"

__find_hash(){
  line=$1
  if [ -n "$(echo $line | grep -E "auto_password=\"[a-zA-Z0-9#!\$&_ ]*\"")" ]; then
    echo $line | cut -d'"' -f2 | cut -d'"' -f1
  fi
  echo ''
}

auto_shell(){

  if [ -z "$auto_hash" ]; then
    return
  fi

  if [ -f "$PWD/auto.sh" ]; then
    while read line; do
      lpass="$(__find_hash $line)"
      if [ -n "$lpass" ]; then
        if [[ "$(echo $lpass | sha256sum | cut -d' ' -f1)" == "$auto_hash" ]]; then
          source $PWD/auto.sh
          break
        fi
      fi
    done < $PWD/auto.sh
  fi
}

# Wrap auto_shell inside cd command.
cd(){
  builtin cd "$@"
  auto_shell
}

PS1='\033[1m$USER@$(hostname):\033[1;31m$(short_pwd)\033[0m $ '

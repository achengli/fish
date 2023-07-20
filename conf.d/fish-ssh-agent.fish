if test -z "$SSH_ENV"
    set -xg SSH_ENV $HOME/.ssh/environment
end

if not __ssh_agent_is_started
    __ssh_agent_start
    ssh-add ~/.ssh/windy_clouds ~/.ssh/github_freeHomeless_ed25519
end

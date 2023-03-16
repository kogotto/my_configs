
# This neaded by many apps
export EDITOR='nvim'

# Pretty cd with auto ls
function cd_ls {
    cd $@; ls;
}
alias cd='cd_ls'

# Tmuxinator is too long for typing
alias mux='tmuxinator'

# This will automatically start ssh-agent and ssh-add
# Do not forget install keychain package
eval $(keychain -q --eval id_rsa)

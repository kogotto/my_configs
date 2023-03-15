
# This neaded by many apps
export EDITOR='nvim'

# Pretty cd with auto ls
function cd_ls {
    cd $@; ls;
}
alias cd='cd_ls'

# Tmuxinator is too long for typing
alias mux='tmuxinator'

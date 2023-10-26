
# This neaded by many apps
export EDITOR='nvim'

# Pretty cd with auto ls
function cd_ls {
    cd $@; ls;
}
alias cd='cd_ls'

# I always type vim
alias vim='nvim'

# Tmuxinator is too long for typing
alias mux='tmuxinator'

# This will automatically start ssh-agent and ssh-add
# Do not forget install keychain package
alias prepare-ssh-keys='eval $(keychain -q --eval id_rsa)'

alias cd-cmake-modules='cd /usr/share/cmake-3.22/Modules'

alias cbt='grep BUILD_TYPE CMakeCache.txt'

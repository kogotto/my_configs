
# Pretty cd with auto ls
function cd_ls {
    cd $@; ls;
}
alias cd='cd_ls'

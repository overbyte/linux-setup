#!/usr/bin/env bash

set -u
set -e
set -o pipefail

USAGE="Usage: $(basename "$0")

DEPENDANCIES
git
vim

EXAMPLES
./setup-vim.sh
"

while getopts 'vh' OPTION; do
case $OPTION in
    v)  set -x;                     ;;
    [h?]) echo "$USAGE"; exit 0     ;;
esac
done
shift "$((OPTIND - 1))"

mkdir -p ~/.vim/pack/plugins/start
cd ~/.vim/pack/plugins/start

function clone_or_pull () {
    echo "cloning $1"
    git clone "$1" "$2" 2> /dev/null || (cd "$2"; git pull)
}

clone_or_pull "git@github.com:KeitaNakamura/neodark.vim.git" "neodark-vim"
clone_or_pull "git@github.com:rking/ag.vim.git" "ag-vim"
clone_or_pull "git@github.com:tpope/vim-surround.git" "vim-surround"
clone_or_pull "git@github.com:pangloss/vim-javascript.git" "vim-javascript"
clone_or_pull "git@github.com:mattn/emmet-vim.git" "emmet-vim"


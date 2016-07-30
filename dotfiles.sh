#!/bin/bash

# Syncronize system dotfiles with this repo.

FILES=(
    '.tmux.conf'
    '.vimrc'
    '.bashrc'
    '.gitignore'
)
SCRIPT_DIR="$( cd "$( dirname $( readlink -f "${BASH_SOURCE[0]}" ) )" && pwd )"
SCRIPT_NAME="$( basename $0 )"
FILES_DIR="$SCRIPT_DIR/files"
HOME_DIR="$(realpath ~)"

exit_usage() {
    echo 'Usage:'
    echo "$SCRIPT_NAME collect      Collect dotfiles from your home into directory "files/"."
    echo "$SCRIPT_NAME install      Get dotfiles from directory "files/" ans install into your home."
    echo "$SCRIPT_NAME push         Send collected dotfiles to git repo."
    exit 1
}

exit_on_file() {
    echo "Error while processing file $1"
    exit 1
}

collect() {
    cd "$SCRIPT_DIR"
    for F in ${FILES[*]}
    do
        F1="$HOME_DIR/$F"
        F2="$FILES_DIR/$F"
        cmp --silent "$F1" "$F2"
        echo "$? $F1 $F2"
        if [ "0" != "$?" ]
        then
            echo "Collect ~/$F"
            cp "$F1" "$F2" || exit_on_file "$F"
        fi
    done
}

install() {
    cd "$SCRIPT_DIR"
    for F in ${FILES[*]}
    do
        F1="$HOME_DIR/$F"
        F2="$FILES_DIR/$F"
        cmp --silent "$F1" "$F2"
        if [ "0" != "$?" ]
        then
            echo "Install ~/$F"
            cp "$F2" "$F1" || exit_on_file "$F"
        fi
    done
}

push() {
    cd "$SCRIPT_DIR"
    git add --all
    git commit -m "Commit by 'dotfiles push'"
    git push
}

main() {
    case "$1" in
        'collect')
            collect
            ;;
        'install')
            install
            ;;
        'push')
            push
            ;;
        *)
            exit_usage
            ;;
    esac
}

main $@

#!/bin/bash

# Syncronize system dotfiles with this repo.

FILES=(
    '.tmux.conf'
    '.vimrc'
    '.bashrc'
    '.gitignore'
)
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SCRIPT_NAME="$0"
FILES_DIR="$SCRIPT_DIR/files"
HOME_DIR="$(realpath ~)"

exit_usage() {
    echo 'Usage:'
    echo "$SCRIPT_NAME collect      Collect dotfiles from your home into directory "files/"."
    echo "$SCRIPT_NAME install      Get dotfiles from directory "files/" ans install into your home."
    exit 1
}

exit_on_file() {
    echo "Error while processing file $1"
    exit 1
}

collect() {
    for F in ${FILES[*]}
    do
        CMD="cp $HOME_DIR/$F $FILES_DIR/$F"
        echo "$CMD"
        $CMD || exit_on_file "$F"
    done
}

install() {
    for F in ${FILES[*]}
    do
        CMD="cp $FILES_DIR/$F $HOME_DIR/$F"
        echo "$CMD"
        $CMD || exit_on_file "$F"
    done
}

main() {
    case "$1" in
        'collect')
            collect
            ;;
        'install')
            install
            ;;
        *)
            exit_usage
            ;;
    esac
}

main $@

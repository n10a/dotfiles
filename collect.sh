#!/bin/bash

# Collect all my dotfiles into place.

FILES=(
    '.tmux.conf'
    '.vimrc'
    '.bashrc'
    '.gitignore'
)

exit_no_file() {
    echo "Error: can't find file $1"
    exit 1
}

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
FILES_DIR="$SCRIPT_DIR/files"
HOME_DIR="$(realpath ~)"
for F in ${FILES[*]}
do
    cp "$HOME_DIR/$F" "$FILES_DIR" || exit_no_file "$F"
done

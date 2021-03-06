#!/usr/local/bin/bash

# Example check for existance of a func in bash
has() {
  type "$1" &> /dev/null
}
DIR='deps'

# ----------- Homebrew
# https://stackoverflow.com/questions/41029842/easy-way-to-have-homebrew-list-all-package-dependencies/41029864
if has brew; then
  echo 'has brew'
  #brew leaves | xargs brew deps --installed --for-each | sed "s/^.*:/$(tput setaf 4)&$(tput sgr0)/" > brewlist.txt
  brew leaves | xargs brew deps --installed --for-each > $DIR/brewlist-"$HOSTNAME".txt
  brew cask list > $DIR/brewcasklist-"$HOSTNAME".txt
fi

# ----------- VSCode extensions
if has code; then
  echo 'has code'
  code --list-extensions > $DIR/vscode_extensions-"$HOSTNAME".txt
fi

# ----------- npm global
if has npm; then
  echo 'has npm'
  npm list -g --depth 0 > $DIR/npmlist-"$HOSTNAME".txt
fi

# ----------- cargo crates
if has cargo; then
  echo 'has cargo'
  cargo install --list > $DIR/cargolist-"$HOSTNAME".txt
fi

# ----------- python pip
if has python3; then
  echo 'has pip3'
  if has pipdeptree; then
    pipdeptree -fl > $DIR/piplist-"$HOSTNAME".txt
  else
    echo "run: pip3 install pipdeptree"
  fi
fi

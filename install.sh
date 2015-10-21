#!/bin/bash

files=( "tmux.conf" "vimrc" "gitconfig" "aliases")

for file in "${files[@]}"
do
  if [ -e "$HOME/.${file}" ]; then
    echo "$file: Creating backup file $HOME/.${file}.backup"
    mv "$HOME/.${file}" "$HOME/.${file}.backup"
  fi

  echo "$file: Copying to $HOME/.${file}"
  cp "$file" "$HOME/.${file}"

  echo -e "$file: \033[32mDone.\033[0m\n"
done

echo "Creating bin directory"
mkdir -p "$HOME/bin"

echo ""
echo "Done."

# -----------------------
echo "Downloading 'gh-pr'"

curl -L "https://raw.githubusercontent.com/rastasheep/dotfiles/master/bin/gh-pr" -o ~/bin/gh-pr
chmod +x ~/bin/gh-pr

echo "Done."

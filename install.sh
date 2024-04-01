#!/bin/bash
set -eux

mkdir -m 700 -p ~/.ssh
cp ssh/authorized_keys ~/.ssh/
chmod 600 ~/.ssh/authorized_keys

git config --global user.email vljosa@vivodyne.com
git config --global user.name "Vebjorn Ljosa"
git config --global pull.rebase true

# Find the first expansion of the wildcard
PYRIGHT=$(ls -d /workspaces/hive-*/services/*/.venv/bin/pyright-langserver | head -n 1)
if [ -z "$PYRIGHT" ]; then
	echo "No pyright-langserver found"
	exit 1
fi
sudo mkdir -p /Users/vljosa/.emacs.d/.cache/lsp/npm/pyright/bin/
sudo ln -sf "$PYRIGHT" /Users/vljosa/.emacs.d/.cache/lsp/npm/pyright/bin/

mkdir -p ~/bin
cp git-with-environment ~/bin/git
chmod 755 ~/bin/git

sudo mkdir -p /Users/vljosa
sudo ln -sf /workspaces /Users/vljosa/src

echo 'PS1=$(echo "$PS1" | sed "s/➜/->/g")' >> ~/.bashrc

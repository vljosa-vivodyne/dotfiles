#!/bin/bash
set -eux

mkdir -m 700 -p ~/.ssh
cp ssh/authorized_keys ~/.ssh/
chmod 600 ~/.ssh/authorized_keys

git config --global user.email vljosa@vivodyne.com
git config --global user.name "Vebjorn Ljosa"

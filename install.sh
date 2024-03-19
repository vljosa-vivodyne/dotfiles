#!/bin/bash
set -eux
mkdir -m 700 -p ~/.ssh
cp ssh/authorized_keys ~/.ssh/
chmod 600 ~/.ssh/authorized_keys

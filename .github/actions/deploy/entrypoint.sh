#!/bin/sh -l

echo "$SSH_KEY" > "$HOME/.ssh/deploy_key"

chmod 700 "$HOME/.ssh"
chmod 600 "$HOME/.ssh/known_hosts"
chmod 600 "$HOME/.ssh/deploy_key"

eval $(ssh-agent)
ssh-add "$HOME/.ssh/deploy_key"

ssh-keyscan -t rsa 68.183.76.87 >> "$HOME/.ssh/known_hosts"

ssh -o StrictHostKeyChecking=no -A -tt -p ${PORT:-22} root@68.183.76.87 "$*"

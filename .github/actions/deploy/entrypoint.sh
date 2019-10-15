#!/bin/sh -l

mkdir "$HOME/.ssh"
touch "$HOME/.ssh/known_hosts"

echo "$SSH_KEY" > "$HOME/.ssh/deploy_key"

chmod 700 "$HOME/.ssh"
chmod 600 "$HOME/.ssh/known_hosts"
chmod 600 "$HOME/.ssh/deploy_key"

eval "$(ssh-agent -s)"
ssh-add "$HOME/.ssh/deploy_key"

ssh-keyscan -t rsa 68.183.76.87 >> "$HOME/.ssh/known_hosts"

rsync --progress --verbose --recursive --delete-after --quiet -e 'ssh -o StrictHostKeyChecking=no' /github/workspace/build/ root@68.183.76.87:/var/www/

#!/bin/bash

# Copy bash history to repository
#cp /home/h0rcrux/.zsh_history ./.zsh_history

# Commit message
COMMIT_MESSAGE="Auto-update and commit"

# Ensure the main repository is updated
git pull

# Initialize and update submodules
git submodule update --init --recursive

# Update submodules to the latest version of the master branch via SSH
git submodule foreach 'git pull origin master'

# Add changes in the main repository
git add .

# Commit the changes
git commit -m "$COMMIT_MESSAGE"

# Push the changes to the remote repository via SSH
git push

echo "Submodules updated and changes committed."

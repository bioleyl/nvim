#!/bin/bash

# Install ubuntu deps
sudo apt install fzf ripgrep luarocks tmux dotnet-sdk-8.0

# Configure TMUX
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln .tmux.conf ~/.tmux.conf

# Reload tmux config
tmux source ~/.tmux.conf

# Maybe inside tmux run <leader> + I to install plugins

# Install typescript-language-server and typescript
npm i -g typescript-language-server typescript

echo "Installation completed successfully."

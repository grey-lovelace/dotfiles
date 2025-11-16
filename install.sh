# Symlink .bash_aliases to home directory
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

ln -s "$DOTFILES_DIR/.bash_aliases" "$HOME/.bash_aliases"

# Install Oh My Posh
curl -s https://ohmyposh.dev/install.sh | bash -s
echo 'eval "$(oh-my-posh init bash)"' >> $HOME/.bashrc
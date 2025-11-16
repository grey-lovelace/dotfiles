# Symlink .bash_aliases to home directory
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

ln -s "$DOTFILES_DIR/.bash_aliases" "$HOME/.bash_aliases"
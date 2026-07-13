# Symlink .bash_aliases to home directory
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

ln -s "$DOTFILES_DIR/.bash_aliases" "$HOME/.bash_aliases"

# Install Oh My Posh
curl -s https://ohmyposh.dev/install.sh | bash -s
echo 'eval "$(oh-my-posh init bash --config 'https://raw.githubusercontent.com/grey-lovelace/oh-my-posh-themes/refs/heads/master/grey-default-theme.omp.json')"' >> $HOME/.bashrc

# docker-in-docker devcontainers on an nftables-only host: the dind entrypoint
# starts dockerd under iptables-legacy, which has no nat table here and dies.
# Repoint iptables at the nft backend and (re)start the daemon it failed to bring up.
if [ -e /usr/local/share/docker-init.sh ]; then
  sudo update-alternatives --set iptables  /usr/sbin/iptables-nft
  sudo update-alternatives --set ip6tables /usr/sbin/ip6tables-nft
  docker info >/dev/null 2>&1 || sudo /usr/local/share/docker-init.sh
fi
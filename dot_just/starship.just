# Install Starship shell prompt
install-starship:
  mkdir -p $HOME/.local/bin
  curl -sS https://starship.rs/install.sh | sh -s -- --bin-dir $HOME/.local/bin


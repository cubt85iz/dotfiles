# Install Fire Code Nerd Fonts
install-fonts:
  #!/usr/bin/env bash

  set -euo pipefail

  # Create directory for fonts.
  mkdir -p $HOME/.fonts

  # Download and install fonts
  curl -sSL https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/FiraCode.tar.xz | tar xJv -C $HOME/.fonts

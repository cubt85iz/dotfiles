[group('Development')]
[group('Setup')]
install-toolboxes:
  #!/usr/bin/env bash

  set -euox pipefail

  # Enable toolbox-install.service
  systemctl --user daemon-reload
  systemctl --user enable toolbox-install.service

  # Read .toolboxes file into an array
  TOOLBOXES=()
  if [ -f $HOME/.toolboxes ]; then
    readarray -t TOOLBOXES < <(cat $HOME/.toolboxes)
  else
    echo "Unable to locate $HOME/.toolboxes file."
    exit 1
  fi

  if [ -n "${TOOLBOXES[*]}" ]; then
    for TOOLBOX in ${TOOLBOXES[@]}; do
      # Destroy existing toolbox
      if podman container exists ${TOOLBOX##*/}; then
        toolbox rm --force ${TOOLBOX##*/}
      fi

      # Pull latest images
      podman pull -q $TOOLBOX

      # Create toolboxes
      toolbox create -y -i $TOOLBOX
    done
  fi

# Sets up PC with desired settings
[group('Setup')]
[linux]
setup:
  #!/usr/bin/env bash

  set -euxo pipefail

  shopt -s expand_aliases
  if [ -f "$HOME/.bash_aliases" ]; then
    . $HOME/.bash_aliases
  fi

  just install-gnome-extensions
  just configure-desktop-background
  just configure-desktop-interface
  just configure-desktop-notifications
  just configure-keybindings
  just configure-multitasking
  just configure-nautilus
  just configure-power-settings
  just configure-privacy-settings
  just configure-touchpad
  just configure-windowmanager
  just configure-gnome-shell
  just install-fonts
  just install-starship
  just install-toolboxes

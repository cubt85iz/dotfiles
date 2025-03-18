# Compiles all GSettings XML schema files to gschemas.compiled
[group('Setup')]
[group('Gnome')]
compile-gsettings-schemas:
  #!/usr/bin/env bash
  set -euxo pipefail

  # Change directory to schemas
  pushd "$HOME/.local/share/glib-2.0/schemas" || exit 1 &> /dev/null

  # Compile schemas.
  glib-compile-schemas .

  # Restore original directory
  popd || exit &> /dev/null

# Configures settings for desktop background
[group('Setup')]
[group('Gnome')]
configure-desktop-background:
  gsettings set org.gnome.desktop.background color-shading-type 'solid'
  gsettings set org.gnome.desktop.background picture-options 'zoom'
  gsettings set org.gnome.desktop.background primary-color '#3071AE'
  gsettings set org.gnome.desktop.background secondary-color '#000000'

# Configures settings for desktop interface
[group('Setup')]
[group('Gnome')]
configure-desktop-interface:
  gsettings set org.gnome.desktop.interface clock-show-weekday 'true'
  gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
  gsettings set org.gnome.desktop.interface show-battery-percentage 'true'
  gsettings set org.gnome.desktop.interface toolkit-accessibility 'false'
  gsettings set org.gnome.desktop.a11y.applications screen-keyboard-enabled false

# Configures settings for desktop notifications
[group('Setup')]
[group('Gnome')]
configure-desktop-notifications:
  gsettings set org.gnome.desktop.notifications application-children "['org-gnome-software', 'org-gnome-terminal', 'org-gnome-extensions-desktop', 'org-gnome-evolution-alarm-notify', 'org-gnome-nautilus', 'code', 'gnome-power-panel', 'gnome-network-panel', 'firefox', 'gnome-printers-panel', 'com-spotify-client']"
  gsettings set org.gnome.desktop.notifications show-in-lock-screen 'false'

# Configure settings for GNOME extensions
[group('Setup')]
[group('Gnome')]
configure-gnome-extensions:
  gsettings set com.ftpix.transparentbar transparency '0'
  gsettings set org.gnome.shell.extensions.alphabetical-app-grid show-favourite-apps 'true'
  gsettings set org.gnome.shell.extensions.blur-my-shell.panel blur 'false'
  gsettings set org.gnome.shell.extensions.dash-to-dock apply-custom-theme 'true'
  gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'previews'
  gsettings set org.gnome.shell.extensions.dash-to-dock disable-overview-on-startup 'true'
  gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top 'true'
  gsettings set org.gnome.shell.extensions.quick-settings-tweaks output-show-selected 'true'
  gsettings set org.gnome.shell enabled-extensions "['quick-settings-tweaks@qwreey', 'add-username-toppanel@brendaw.com', 'AlphabeticalAppGrid@stuarthayhurst', 'appindicatorsupport@rgcjonas.gmail.com', 'blur-my-shell@aunetx', 'dash-to-dock@micxgx.gmail.com', 'Move_Clock@rmy.pobox.com', 'transparent-top-bar@ftpix.com', 'weatheroclock@CleoMenezesJr.github.io']"

# Configure settings for GNOME shell
[group('Setup')]
[group('Gnome')]
configure-gnome-shell:
  gsettings set org.gnome.shell favorite-apps "['org.mozilla.firefox.desktop', 'com.brave.Browser.desktop', 'org.gnome.Ptyxis.desktop', 'org.gnome.Nautilus.desktop', 'code.desktop', 'com.spotify.Client.desktop', 'com.valvesoftware.Steam.desktop', 'com.discordapp.Discord.desktop', 'tutanota-desktop.desktop', 'bitwarden.desktop']"
  gsettings set org.gnome.shell.app-switcher current-workspace-only 'true'
  gsettings set org.gnome.shell.weather automatic-location 'false'

# Configures keyboard bindings
[group('Setup')]
[group('Gnome')]
configure-keybindings:
  gsettings set org.gnome.desktop.wm.keybindings show-desktop "['<Super>d']"
  gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/']"
  gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "<Primary><Alt>t"
  gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "ptyxis --new-window"
  gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name "Open Terminal"
  gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding "<Super>e"
  gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command "nautilus --new-window"
  gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name "Open File Explorer"
  gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ binding "<Shift><Control>Escape"
  gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ command "gnome-system-monitor"
  gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/ name "Open System Monitor"

# Configure settings for multitasking
[group('Setup')]
[group('Gnome')]
configure-multitasking:
  gsettings set org.gnome.mutter dynamic-workspaces 'false'
  gsettings set org.gnome.desktop.wm.preferences num-workspaces '4'
  gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "[]"
  gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "[]"
  gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "[]"
  gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "[]"
  gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['<Control><Alt>Left']"
  gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 "['<Control><Alt>Up']"
  gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 "['<Control><Alt>Right']"
  gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 "['<Control><Alt>Down']"
  gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 "['<Shift><Control><Alt>Left']"
  gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2 "['<Shift><Control><Alt>Up']"
  gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3 "['<Shift><Control><Alt>Right']"
  gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4 "['<Shift><Control><Alt>Down']"

# Configures settings for Nautilus
[group('Setup')]
[group('Gnome')]
configure-nautilus:
  gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'
  gsettings set org.gnome.nautilus.preferences migrated-gtk-settings 'true'
  gsettings set org.gtk.Settings.FileChooser sort-directories-first 'true'

# Configures settings for power
[group('Setup')]
[group('Gnome')]
configure-power-settings:
  gsettings set org.gnome.settings-daemon.plugins.power power-button-action 'interactive'
  gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout '7200'
  gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'suspend'
  gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-timeout '900'

# Configures settings for privacy
[group('Setup')]
[group('Gnome')]
configure-privacy-settings:
  gsettings set org.gnome.desktop.privacy disable-camera 'true'
  gsettings set org.gnome.desktop.privacy old-files-age 'uint32 30'
  gsettings set org.gnome.desktop.privacy recent-files-max-age '-1'
  gsettings set org.gnome.desktop.privacy remember-recent-files 'false'
  gsettings set org.gnome.system.location enabled 'false'

# Configures settings for touchpad
[group('Setup')]
[group('Gnome')]
configure-touchpad:
  gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click 'true'
  gsettings set org.gnome.desktop.peripherals.touchpad two-finger-scrolling-enabled 'true'

# Configures settings for window manager
[group('Setup')]
[group('Gnome')]
configure-windowmanager:
  gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'

# Installs a specified GNOME extension
[group('Setup')]
[group('Gnome')]
[private]
install-gnome-extension uuid:
  #!/usr/bin/env bash
  
  set -euxo pipefail

  EXTENSION_DIR="$HOME/.local/share/gnome-shell/extensions"
  GNOME_SHELL_VERSION=$(gnome-shell --version | cut --delimiter=' ' --fields=3 | \
    cut --delimiter='.' --fields=1)

  # Install extension
  extension_version=$(curl -Lfs "https://extensions.gnome.org/extension-query/?search={{ uuid }}" | \
    jq --arg jq_build "{{ uuid }}" '.extensions[] | select(.uuid == $jq_build) | .shell_version_map."'"$GNOME_SHELL_VERSION"'".pk')
  if [ -n "$extension_version" ]; then
    if [ ! -d ".gnome-extensions" ]; then
      mkdir .gnome-extensions
    fi

    curl -SsL "https://extensions.gnome.org/download-extension/{{ uuid }}.shell-extension.zip?version_tag=$extension_version" -o ".gnome-extensions/{{ uuid }}.zip"
    if [ ! -d "$EXTENSION_DIR" ]; then
      mkdir -p "$EXTENSION_DIR/{{ uuid }}"
    fi
    unzip -o ".gnome-extensions/{{ uuid }}.zip" -d "$EXTENSION_DIR/{{ uuid }}"

    # Compile GSettings schemas 
    if [ -f $EXTENSION_DIR/{{ uuid }}/schemas/*.xml ]; then
      extension_xml_file=$EXTENSION_DIR/{{ uuid }}/schemas/*.xml

      # Get schema for extension from metadata.json
      settings_schema=$(jq -r '."settings-schema"' "$EXTENSION_DIR/{{ uuid }}/metadata.json")

      # If necessary, create schemas directory for glib-2.0.
      glib_schemas_dir="$HOME/.local/share/glib-2.0/schemas"
      if [ ! -d "$glib_schemas_dir" ]; then
        mkdir -p "$glib_schemas_dir"
      fi

      # Copy extension_xml_file to glib_schemas_dir
      cp $extension_xml_file "$glib_schemas_dir"

    fi
  fi

# Installs all GNOME extensions
[group('Setup')]
[group('Gnome')]
install-gnome-extensions:
  #!/usr/bin/env bash

  set -euxo pipefail

  shopt -s expand_aliases
  if [ -f "$HOME/.bash_aliases" ]; then
    . $HOME/.bash_aliases
  fi

  just install-gnome-extension add-username-toppanel@brendaw.com
  just install-gnome-extension AlphabeticalAppGrid@stuarthayhurst
  just install-gnome-extension appindicatorsupport@rgcjonas.gmail.com
  just install-gnome-extension blur-my-shell@aunetx
  just install-gnome-extension dash-to-dock@micxgx.gmail.com
  just install-gnome-extension Move_Clock@rmy.pobox.com
  just install-gnome-extension no-overview@fthx
  just install-gnome-extension quick-settings-tweaks@qwreey
  just install-gnome-extension transparent-top-bar@ftpix.com
  just install-gnome-extension weatheroclock@CleoMenezesJr.github.io
  just compile-gsettings-schemas
  just configure-gnome-extensions

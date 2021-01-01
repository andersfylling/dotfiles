#!/bin/bash

export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

# make sure git is correctly configured(!)
git config --global gpg.program gpg
git config --global push.gpgSign if-asked
git config --global log.showSignature true
git config --global commit.gpgsign true
git config --global user.name "Anders Øen Fylling"
git config --global user.email "anders@nordic.email"
git config --global user.signingkey "0x0BB7FDB614ACA78A"
git config --global url.ssh://git@github.com/.insteadOf https://github.com/

setxkbmap no

export RANGER_LOAD_DEFAULT_RC=FALSE
export SHELL=zsh
export PATH="$PATH:/home/anders/.cargo/bin"
export PATH="$PATH:/home/anders/go/bin"

# wayland rendering
export KITTY_ENABLE_WAYLAND=1
export QT_WAYLAND_FORCE_DPI=physical
export QT_QPA_PLATFORM=wayland-egl
export CLUTTER_BACKEND=wayland
export SDL_VIDEODRIVER=wayland
export BEMENU_BACKEND=wayland
export MOZ_ENABLE_WAYLAND=1
export XKB_DEFAULT_LAYOUT=no
#export XDG_CURRENT_DESKTOP=Unity
export XDG_SESSION_TYPE=wayland

# jetbrain products - TODO: remove once wayland is supported
export _JAVA_AWT_WM_NONREPARENTING=1

# start with logging
export WAYLAND_DEBUG=1
LOG_FILE_PATH="/var/log/sway/$(date +'%Y-%m-%d').log"
export SWAY_LOG_FILE_PATH=${LOG_FILE_PATH}
echo "" >> ${LOG_FILE_PATH}
echo "################################" >> ${LOG_FILE_PATH}
echo "## Started Sway $(date +'%Y-%m-%d %H:%M')" >> ${LOG_FILE_PATH}
sway -d -V >> ${LOG_FILE_PATH} 2>&1
LOG_FILE_PATH=""

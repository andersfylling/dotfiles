#
# ~/.bash_profile
#

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
git config --global user.signingkey "234EC8AAED566BA5"

[[ -f ~/.bashrc ]] && . ~/.bashrc
if [[ -z $WAYLAND_DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	sh ~/.config/sway/start.sh
fi

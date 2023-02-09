if status is-interactive
	source $HOME/.aliases

	set PATH $HOME/.local/bin $HOME/.local/share/ /usr/local/bin /usr/bin /usr/sbin $PATH

	set -e SSH_AGENT_PID
  	set SSH_AUTH_SOCK "$(gpgconf --list-dirs agent-ssh-socket)"
	set GPG_TTY $(tty)
	gpg-connect-agent updatestartuptty /bye >/dev/null

	set VISUAL nvim
	set EDITOR nvim
	set PAGER less

	set GTK_IM_MODULE fcitx5
	set QT_IM_MODULE fcitx5
	set XMODIFIERS @im=fcitx5
    set SDL_IM_MODULE fcitx5
    set GLFW_IM_MODULE ibus

    set PAGER 'nvim +Man!'
    set MANPAGER 'nvim +Man!'
	set MANDWIDTH 999
end

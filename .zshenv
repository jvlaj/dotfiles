export VISUAL=nvim
export EDITOR=$VISUAL
export PAGER='less'

path+=("$HOME/.bin")
path+=("$HOME/.emacs.d/bin")
path+=("$HOME/.local/bin")

export GOPATH=/$HOME/go/
path+=("$GOPATH/bin")

export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS=@im=fcitx5

# python virtaulenvwrapper
if [ -e $HOME/.virtualenvs ]; then
	export WORKON_HOME=~/.virtaulenvs
fi

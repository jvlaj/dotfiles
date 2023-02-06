export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

set -o vi

if [ -d "$HOME/.oh-my-zsh" ]; then
	export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="lambda" # set by `omz`
	HYPHEN_INSENSITIVE="true"
	COMPLETION_WAITING_DOTS="true"

	plugins=(
	git
	gh
	history-substring-search
	dnf
	vi-mode 
	ag
	alias-finder
	aliases
	docker
	colored-man-pages
	command-not-found
	common-aliases
	dotnet
	emoji
	fd
	fzf
	npm
	pyenv
	python
	ripgrep
	ruby
	tmux
	gnu-utils
	golang
	jsontools
	nmap
	rsync
	virtualenv
	web-search
	zsh-autosuggestions
	zsh-completions
	zsh-navigation-tools
	zsh-syntax-highlighting
	)


	source $ZSH/oh-my-zsh.sh

	# zsh-users/zsh-completions
	fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

fi

if [ $(uname) = "Darwin" ]; then 
	plugins +=(
	brew 
	macos
	iterm2
	)
fi


[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'

if [ -e "$HOME/.local/bin/virtualenvwrapper.sh" ]; then
	emulate sh -c 'source $HOME/.local/bin/virtualenvwrapper.sh'
fi

export MANPATH="/usr/local/man:$MANPATH"
if [ -x nvim ]; then
	export MANPAGER='nvim +Man!'
	export MANDWIDTH=999
fi

if [[ -x nvim && -n $SSH_CONNECTION ]]; then
	export EDITOR='nvim'
	else
	export EDITOR='nvim'
fi

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null

[ -f $HOME/.aliases ] && source $HOME/.aliases

setopt MULTIOS
setopt NOTIFY
setopt auto_list
setopt auto_menu
setopt complete_in_word
setopt always_to_end
setopt null_glob
setopt numeric_glob_sort
setopt no_case_glob
unsetopt BEEP



zstyle ':completion:*' verbose yes # show descriptions for command options
# zstyle ':completion:*' extra-verbose yes # show descriptions for commands

zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'  # Case-Insensitive Completion

zstyle ':completion:*' squeeze-slashes true # consecutive slashes will be treated as a single slash
zstyle ':completion:*' accept-exact '*(N)' # forces prefix matching
zstyle ':completion:*' select-prompt '%Sat %p%s' # Add position hint to prompt when there are a lot of choices
zstyle ':completion:*' force-list always # always show comletion also if not ambiguous
zstyle ':completion:*' list-separator '--' # seperator between completion and description
zstyle ':completion:*' group-name '' # group matches by tag
zstyle ':completion:*:functions' ignored-patterns '_*' # Ignore private functions
zstyle ':completion:*:parameters' ignored-patterns '_*' # Ignore private parameters

zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description 'specify: %d'
zstyle ':completion:*:descriptions' format '%F{yellow}< %d >%f' # enable and format completion groups
zstyle ':completion:*:warnings' format '%F{red}no matches found%f' # enable and format no match
zstyle ':completion:*:messages' format '%F{purple}%d%f'
#zstyle ':completion:*:corrections' format '%U%F{green}%d (errors: %e)%f%u'

zstyle ':completion:*' special-dirs true
zstyle ':completion:*' ignore-parents parent pwd # cd will never select the parent directory (e.g.: cd ../<TAB>)
zstyle ':completion:*' list-dirs-first yes # list folders first on completion
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS} # colorize file system completion

### Menu behaviour
# zstyle ':completion:*' menu select # interactive # always show completions
# zstyle ':completion:*:default' menu yes=0 select=0
zstyle ':completion:*:default' menu select
zstyle ':completion:*:manuals' separate-sections true
# zstyle ':completion:*' auto-description true
# zstyle ':completion:*:auto-describe' format 'specify: %d'

### Listing behaviour
# zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s' # Make the list prompt friendly
zstyle ':completion:*' last-prompt yes
zstyle ':completion:*' list-grouped yes
# zstyle ':completion:*' list-packed yes
zstyle ':completion:*' file-list always
zstyle ':completion:*' strip-comments false

zstyle ':completion:*:*:*:*:processes' command 'ps -u ${USER} -o pid,user,command'
zstyle ':completion:*:*:*:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-_]#)*=0=01;34=02=0'
zstyle ':completion:*:*:*:*:processes-names' command  'ps -c -u ${USER} -o command | uniq'

zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:killall:*' command 'ps -u $USER -o command'



function __completion-widget {
  if [[ $BUFFER == '' || $BUFFER == '.' ]]
  then
    BUFFER="./"
    CURSOR=${#BUFFER}
  fi

  # adds '...' during completion to cli
  echo -n "${fg_bold[magenta]}…$reset_color"
  zle expand-or-complete # default binding
  zle reset-prompt
}
zle -N __completion-widget
bindkey '^I' __completion-widget # '^I' is <Tab>

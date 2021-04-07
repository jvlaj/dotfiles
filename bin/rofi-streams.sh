#!/usr/bin/env bash
# author: unknown
#
#  ▓▓▓▓▓▓▓▓▓▓
# ░▓ author ▓ cirrus <cirrus@archlinux.info>
# ░▓ code   ▓ https://gist.github.com/cirrusUK
# ░▓ mirror ▓ http://cirrus.turtil.net
# ░▓▓▓▓▓▓▓▓▓▓
# ░░░░░░░░░░
#
declare -A LABELS
declare -A COMMANDS

###
# List of defined 'bangs'

# launch programs
#COMMANDS["apps"]="rofi -combi-modi window,drun -show combi"
#LABELS["apps"]=""

# open bookmarks
#COMMANDS["bookmarks"]="~/scripts/rofi-surfraw-bookmarks.sh"
#LABELS["bookmarks"]=""

# search local files
#COMMANDS["locate"]="~/scripts/rofi-locate.sh"
#LABELS["locate"]=""

# open custom web searches
#COMMANDS["websearch"]="~/scripts/rofi-surfraw-websearch.sh"
#LABELS["websearch"]=""

# playlist
#COMMANDS["playlist"]="/home/cirrus/.config/rofi/playlist"
#LABELS["playlist"]=""

# Twitch
COMMANDS["Twitch"]='alacritty -t Twitch -e reflex-curses'
LABELS["Twitch"]=""

# YouTube
COMMANDS["YouTube"]='alacritty -t YouTube -e ytfzf -D -t'
LABELS["YouTube"]=""

# show clipboard history
# source: https://bitbucket.org/pandozer/rofi-clipboard-manager/overview
# COMMANDS["clipboard"]='rofi -modi "clipboard:~/scripts/mclip.py menu" -show clipboard && ~/scripts/mclip.py paste'
# LABELS["clipboard"]=""

# references --------------------------
# COMMANDS["sr2"]="firefox wikipedia.org/search-redirect.php?search=\" \${input}\""
# LABELS["sr2"]=""

# COMMANDS["piratebay"]="firefox --disk-cache-dir=/tmp/cache https://thepiratebay-proxy.com/search/\" \${input}\""
# LABELS["piratebay"]=""

# COMMANDS[".bin"]="spacefm -r '/home/dkm/bin'"
# LABELS[".bin"]=".bin"

# COMMANDS["Screenshot"]='/usr/local/bin/rofiscrot'
# LABELS["Screenshot"]="screenshot"

################################################################################
# do not edit below
################################################################################
##
# Generate menu
##
function print_menu()
{
    for key in ${!LABELS[@]}
    do
  echo "$key    ${LABELS}"
     #   echo "$key    ${LABELS[$key]}"
     # my top version just shows the first field in labels row, not two words side by side
    done
}
##
# Show rofi.
##
function start()
{
    # print_menu | rofi -dmenu -p "?=>" 
    print_menu | rofi -dmenu -msg ">>>" -i -p "                                                   Video Streams"

}


# Run it
value="$(start)"

# Split input.
# grab upto first space.
choice=${value%%\ *}
# graph remainder, minus space.
input=${value:$((${#choice}+1))}

##
# Cancelled? bail out
##
if test -z ${choice}
then
    exit
fi

# check if choice exists
if test ${COMMANDS[$choice]+isset}
then
    # Execute the choice
    eval echo "Executing: ${COMMANDS[$choice]}"
    eval ${COMMANDS[$choice]}
else
 eval  $choice | rofi
 # prefer my above so I can use this same script to also launch apps like geany or leafpad etc (DK) 
 #   echo "Unknown command: ${choice}" | rofi -dmenu -p "error"
fi

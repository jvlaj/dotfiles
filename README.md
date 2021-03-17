<h1 align="center">Dotfiles</h1> 

## Info
- <b>Distro:</b> Arch Linux 
- <b>WM:</b> spectrwm | i3-gaps
- <b>Theme:</b> [sayo](https://github.com/rayes0/sayo/)
- <b>Bar:</b> spectrwm bar | i3-bar
- <b>Browser:</b> qutebrowser
- <b>Editor:</b> neovim
- <b>Terminal:</b> alacritty
- <b>Launcher:</b> rofi
- <b>Music Player:</b> cmus | spotify w/ spicetify
- <b>Notifications:</b> dunst
- <b>Calendar:</b> calcurse
- <b>Font:</b> SF Mono | Iosevka

### tried and true *i3-gaps*
![i3](Pictures/previews/i3-workspace-preview.png "i3-gaps")

### the new and bold *spectrwm*
![spectrwm](Pictures/previews/spectrwm-workspace-preview.png "spectrwm")


In its current state these dots are well functional, but still a *work-in-progress* in adjusting/enhancing it. 

Many of these dotfiles (*sayo theme, scripts, configurations*) are largely taken from and inspired by
[Rayes0' dotfiles](http://github.com/rayes0/dotfiles).

### Packages
 
Here are some of the packages that the configuration uses (unsorted from community/AUR):

```
xorg-xset spectrwm i3-gaps neovim zsh alacritty keepmenu feh fcitx fcitx-configtool fcitx-mozo greenclip weechat calcurse discord ranger reflex-curses youtube-dl mpv dunst qutebrowser rofi rofi-greenclip pulseaudio pulseaudio-utils pavucontrol spotify spicetify ytfzf-git zathura ttf-icomoon-feather ttf-material-design-icons ttf-typicons powerline-fonts powerline-common picom-ibhagwan-git npm nerd-fonts-Iosevka nerd-fonts-sf-mono deluge-gtk 
```

### Setup


The neovim configuration doesn't check for [vim-plug](https://github.com/junegunn/vim-plug) on launch, so we can install it:
```
$ sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' 
```

Now install our plugins:
```
$ nvim +PlugInstall
```

Everything else you can put in its place with whatever *dotfiles approach* you use. I use [this](https://rayes0.github.io/blog/dotfiles/).

>This configuration is built from and for my systems, so it may require some tweaking to get it working nicely on yours.



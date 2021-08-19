# -*- coding: utf-8 -*-
import os
import re
import socket
import subprocess
from pathlib import Path
from time import time
from libqtile import qtile
from libqtile.config import Click, Drag, Group, KeyChord, Key, Match, Screen
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook
from libqtile.layout.xmonad import MonadWide
from libqtile.lazy import lazy
from typing import List  # noqa: F401

mod = "mod4"  # Sets mod key to SUPER/WINDOWS
myTerm = "uxterm"  # My terminal of choice

keys = [
    ### QTile Management
    Key([mod, "shift"], "r", lazy.restart()),
    Key([mod, "shift"], "q", lazy.shutdown()),

    ### Screen Management
    Key([mod], "period", lazy.next_screen()),
    Key([mod], "comma", lazy.prev_screen()),

    Key([mod], "w", lazy.to_screen(0)),
    Key([mod], "e", lazy.to_screen(1)),
    Key([mod], "r", lazy.to_screen(2)),

    ### Window Management
    Key([mod, "shift"], "x", lazy.window.kill()),
    Key([mod], "space", lazy.window.toggle_floating()),
    Key([mod], "e", lazy.window.toggle_fullscreen()),
    Key([mod, "shift"], "h", lazy.layout.move_left()),
    Key([mod, "shift"], "l", lazy.layout.move_right()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "k", lazy.layout.up()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), lazy.layout.section_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), lazy.layout.section_up()),
    Key([mod], "l", lazy.layout.shrink(), lazy.layout.decrease_nmaster()),
    Key([mod], "h", lazy.layout.grow(), lazy.layout.increase_nmaster()),

    ### Layout Management
    Key([mod], "Tab", lazy.next_layout()),
    Key([mod, "shift"], "n", lazy.layout.normalize()),
    Key([mod, "shift"], "m", lazy.layout.maximize()),
    Key([mod, "shift"], "space", lazy.layout.rotate(), lazy.layout.flip()),
    Key([mod], "n", lazy.layout.next()),
    Key([mod, "shift"], "Tab", lazy.layout.toggle_split()),

    ### Menus
    Key([mod], "m", lazy.spawn("rofi -no-lazy-grab -show drun -theme launcher.rasi -m -4 -font 'SF Mono 12'")),
    ##Key([mod, "shift"], "Return", lazy.spawn("dmenu_run -p 'Run: '")),

    ### Applications
    Key([mod], "Return", lazy.spawn(myTerm+" -e fish")),
    Key([mod], "f", lazy.spawn(myTerm+" -e ranger")),
    Key([mod], "n", lazy.spawn("nautilus")),
    Key([mod], "p", lazy.spawn(myTerm+" -e passmenu")),
        # Screenshots
    Key([], 'Print', lazy.spawn("gnome-screenshot -i")),

    ### MediaKeys
    Key([], 'XF86AudioPlay', lazy.spawn('playerctl play-pause')),
    Key([], 'XF86AudioNext', lazy.spawn('playerctl next')),
    Key([], 'XF86AudioPrev', lazy.spawn('playerctl previous')),
]

### Workspaces
group_names = [("WWW", {'layout': 'monadtall', 'matches':[Match(wm_class=["firefox", "Chromium", "qutebrowser"])]}),
               ("DEV", {'layout': 'monadtall', 'matches':[Match(wm_class=["emacs", "Emacs"])]}),
               ("RANG", {'layout': 'monadtall'}),
               ("SYS", {'layout': 'monadtall', 'matches':[Match(title=["deluge"])]}),
               ("CHAT", {'layout': 'monadtall', 'matches':[Match(wm_class=["discord"])]}),
               ("CAL", {'layout': 'monadtall', 'matches':[Match(title=["calcurse /home/json"])]}),
               ("MUS", {'layout': 'monadtall', 'matches':[Match(wm_class=["spotify"])]}),
               ("GAME", {'layout': 'monadtall', 'matches':[Match(wm_class=["Steam"])]}),
               ("STAT", {'layout': 'verticaltile', 'matches':[Match(wm_instance_class=["Navigator"])]})
               ] 

groups = [Group(name, **kwargs) for name, kwargs in group_names]

for i, (name, kwargs) in enumerate(group_names, 1):
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))  # Switch to another group
    keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name)))  # Send current window to another group

layout_theme = {"border_width": 2,
                "margin": 8,
                "border_focus": "937f74",
                "border_normal": "3a3a3a"
                }

layouts = [
    # layout.MonadWide(**layout_theme),
    # layout.Bsp(**layout_theme),
    # layout.Stack(stacks=2, **layout_theme),
    # layout.Columns(**layout_theme),
    # layout.RatioTile(**layout_theme),
    # layout.Tile(shift_windows=True, **layout_theme),
    layout.VerticalTile(**layout_theme),
    # layout.Matrix(**layout_theme),
    # layout.Zoomy(**layout_theme),
    layout.MonadTall(**layout_theme),
    layout.MonadWide(**layout_theme),
    layout.Max(**layout_theme),
    #layout.Stack(num_stacks=2),
    layout.RatioTile(**layout_theme),
    layout.TreeTab(
        font=" SF Mono",
        fontsize=14,
        sections=["FIRST", "SECOND", "THIRD", "FOURTH"],
        section_fontsize=14,
        border_width=2,
        bg_color="#3a3a3a",
        active_bg="#937f74",
        active_fg="000000",
        inactive_bg="#2a2a2a",
        inactive_fg="#3a3a3a",
        padding_left=0,
        padding_x=0,
        padding_y=5,
        section_top=5,
        section_bottom=5,
        level_shift=5,
        vspace=3,
        panel_width=100
        ),
    layout.Floating(**layout_theme)
]

colors = [["#2a2a2a", "#2a2a2a"],  # panel background
          ["#3a3a3a", "#3a3a3a"],  # background for current screen tab
          ["#bebebe", "#bebebe"],  # font color for group names
          ["#aa8f7c", "#aa8f7c"],  # border line color for current tab
          ["#8b8f7e", "#8b8f7e"],  # border line color for 'other tabs' and color for 'odd widgets'
          ["#987a6b", "#987a6b"],  # color for the 'even widgets'
          ["#877979", "#877979"],  # window name
          ["#937f74", "#937f74"]]  # backbround for inactive screens

prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())

##### DEFAULT WIDGET SETTINGS #####
widget_defaults = dict(
    font="SF Mono Regular",
    fontsize=14,
    padding=4,
    background = colors[0]
)
extension_defaults = widget_defaults.copy()

def init_widgets_list():
    widgets_list = [
            widget.Sep(
                linewidth=0,
                padding=6,
                foreground=colors[2],
                ),
            widget.Image(
                filename="/home/json/Pictures/anidb.png",
                scale="true",
                mouse_callbacks={'Button1': lambda: qtile.cmd_spawn(myTerm)}
                ),
            widget.Sep(
                linewidth=0,
                padding=6,
                foreground=colors[2],
            ),
            widget.GroupBox(
                font="SF Mono",
                fontsize=14,
                margin_y=3,
                margin_x=0,
                padding_y=5,
                padding_x=3,
                borderwidth=3,
                active=colors[2],
                inactive=colors[7],
                rounded=False,
                highlight_color=colors[1],
                highlight_method="line",
                this_current_screen_border=colors[6],
                this_screen_border=colors[4],
                other_current_screen_border=colors[6],
                other_screen_border=colors[4],
                foreground=colors[2],
            ),
            widget.Prompt(
                prompt=prompt,
                font=" SF Mono",
                padding=12,
                foreground=colors[3],
            ),
            widget.Sep(
                linewidth=0,
                padding=40,
                foreground=colors[2],
            ),
            widget.WindowName(
                foreground=colors[6],
                padding=0
            ),
            widget.Clock(
                foreground=colors[2],
                format="%A, %B %d - %H:%M ",
            ),
            widget.Sep(
                linewidth=0,
                padding=40,
                foreground=colors[2],
            ),
            widget.Cmus(
                foreground=colors[2],
                font="SF Mono",
                fontsize=14,
                play_color=colors[2],
                noplay_color=colors[3],
            ),
           widget.Mpris2(
                name='spotify',
                fmt='♫ {}',
                objname='org.mpris.MediaPlayer2.spotify',
                display_metadata=['xesam:artist', 'xesam:title'],
                font="SF Mono",
                foreground=colors[2],
                scroll_chars=30,
                scroll_wait_intervals=0,
                scroll_interval=0,
                stop_pause_text='',
            ),
           widget.Sep(
                linewidth=0,
                padding=20,
                foreground=colors[2],
            ),
                widget.Net(
                interface="enp0s31f6",
                format='{down} ↓↑ {up}',
                foreground=colors[2],
                padding=5
            ),
            widget.CheckUpdates(
                update_interval=1800,
                distro="Arch_checkupdates",
                display_format="{updates} Updates",
                foreground=colors[2],
                mouse_callbacks={'Button1': lambda: qtile.cmd_spawn(myTerm + ' -e sudo pacman -Syu')},
            ),
            widget.TextBox(
                text=" 🖬",
                foreground=colors[2],
                padding=0,
                fontsize=14
            ),
            widget.Memory(
                foreground=colors[2],
                mouse_callbacks={'Button1': lambda: qtile.cmd_spawn(myTerm + ' -e htop')},
                padding=5
            ),
           widget.TextBox(
                text=" Vol:",
                foreground=colors[2],
                padding=0
            ),
            widget.Volume(
                foreground=colors[2],
                padding=5
            ),
            widget.CurrentLayoutIcon(
                custom_icon_paths=[os.path.expanduser("~/.config/qtile/icons")],
                foreground=colors[0],
                padding=0,
                scale=0.7
            ),
            widget.CurrentLayout(
                foreground=colors[2],
                padding=5
            ),
            widget.Systray(
                padding=5
            ),
        ]

    return widgets_list

def init_widgets_screen1():
    widgets_screen1 = init_widgets_list()
    return widgets_screen1

def init_widgets_screen2():
    widgets_screen2 = init_widgets_list()
    del widgets_screen2[12:18]               # Slicing removes unwanted widgets (systray) 
    del widgets_screen2[18:26]
    return widgets_screen2                 # Monitor 2 will display all widgets in widgets_list

def init_screens():
    return [Screen(top=bar.Bar(widgets=init_widgets_screen1(), opacity=1.0, size=20)),
            Screen(top=bar.Bar(widgets=init_widgets_screen2(), opacity=1.0, size=20))]

if __name__ in ["config", "__main__"]:
    screens = init_screens()
    widgets_list = init_widgets_list()
    widgets_screen1 = init_widgets_screen1()
    widgets_screen2 = init_widgets_screen2()



def window_to_prev_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i - 1].name)


def window_to_next_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i + 1].name)


def window_to_previous_screen(qtile):
    i = qtile.screens.index(qtile.current_screen)
    if i != 0:
        group = qtile.screens[i - 1].group.name
        qtile.current_window.togroup(group)


def window_to_next_screen(qtile):
    i = qtile.screens.index(qtile.current_screen)
    if i + 1 != len(qtile.screens):
        group = qtile.screens[i + 1].group.name
        qtile.current_window.togroup(group)


def switch_screens(qtile):
    i = qtile.screens.index(qtile.current_screen)
    group = qtile.screens[i - 1].group
    qtile.current_screen.set_group(group)

mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]


dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False

floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    # default_float_rules include: utility, notification, toolbar, splash, dialog,
    # file_progress, confirm, download and error.
    *layout.Floating.default_float_rules,
    Match(title='Confirmation'),  # tastyworks exit box
    Match(title='Qalculate!'),  # qalculate-gtk
    Match(wm_class='kdenlive'),  # kdenlive
    Match(wm_class='pinentry-gtk-2'),  # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = "smart"

#groups.extend([
#    Group ('www', spawn='chromium', layout='max', persist=False,
#        matches=[Match=(wm_class=['Firefox', 'chromium', 'qutebrowser'])])])

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

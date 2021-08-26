config.load_autoconfig(False)

# Custom Keybindings

config.bind('<Ctrl-p>',       'completion-item-focus prev', mode='command')
config.bind('<Ctrl-k>',       'completion-item-focus prev', mode='command')
config.bind('<Ctrl-n>',       'completion-item-focus next', mode='command')
config.bind('<Ctrl-j>',       'completion-item-focus next', mode='command')

config.bind('<Ctrl-g>',       'leave-mode',             mode='prompt')

#mpv
config.bind('<Ctrl-v>', 'spawn mpv {url}')
config.bind('<Ctrl-Shift-v>', 'hint links spawn mpv {hint-url}')

#pocket
config.bind("sp", "spawn --userscript qutepocket")

# General settings

c.aliases = {'q': 'close', 'qa': 'quit', 'w': 'session-save', 'wq': 'quit --save', 'wqa': 'quit --save'}

c.auto_save.session = True

c.content.autoplay = True

config.set('content.cookies.accept', 'all', 'chrome-devtools://*')

config.set('content.cookies.accept', 'all', 'devtools://*')

config.set('content.geolocation', False, 'https://www.hotdoc.com.au')

config.set('content.headers.accept_language', '', 'https://matchmaker.krunker.io/*')

config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}', 'https://web.whatsapp.com/')

config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:90.0) Gecko/20100101 Firefox/90.0', 'https://accounts.google.com/*')

config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36', 'https://*.slack.com/*')

c.content.blocking.hosts.lists = ['https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts']

c.content.blocking.method = 'both'

c.content.blocking.adblock.lists = ['https://easylist.to/easylist/easylist.txt', 'https://easylist.to/easylist/easyprivacy.txt']

config.set('content.images', True, 'chrome-devtools://*')

config.set('content.images', True, 'devtools://*')

config.set('content.javascript.enabled', True, 'chrome-devtools://*')

config.set('content.javascript.enabled', True, 'devtools://*')

config.set('content.javascript.enabled', True, 'chrome://*/*')

config.set('content.javascript.enabled', True, 'qute://*/*')

config.set('content.notifications.enabled', False, 'https://www.youtube.com')

config.set('content.notifications.enabled', False, 'https://www.reddit.com')

config.set('content.notifications.enabled', False, 'https://www.chess.com')

config.set('content.register_protocol_handler', True, 'https://mail.google.com?extsrc=mailto&url=%25s')

c.url.default_page = '/home/json/.config/qutebrowser/tea-green/index.html'

c.url.searchengines = {'DEFAULT': 'https://google.com/search?q={}', 'ddg': 'https://duckduckgo.com/?q={}'}

c.url.start_pages = '/home/json/.config/qutebrowser/tea-green/index.html'

c.downloads.remove_finished = 1

c.scrolling.smooth = False

c.spellcheck.languages = ['en-AU']

# Appearance

c.completion.height = '30%'

c.statusbar.show = 'in-mode'

c.tabs.show = 'multiple'

c.tabs.tabs_are_windows = False

c.zoom.default = '110%'

c.colors.completion.fg = ['#bebebe', '#bebebe', '#bebebe']

c.colors.completion.category.fg = '#bebebe'

c.colors.completion.scrollbar.fg = '#bebebe'

c.colors.downloads.bar.bg = '#2a2a2a'

c.colors.downloads.start.fg = '#bebebe'

c.colors.downloads.stop.fg = '#bebebe'

c.colors.downloads.error.fg = '#bebebe'

c.colors.downloads.error.bg = '#8b8f7e'

c.colors.hints.fg = '#2a2a2a'

c.colors.messages.error.fg = '#bebebe'

c.colors.messages.error.bg = '#8b8f7e'

c.colors.messages.warning.fg = '#2a2a2a'

c.colors.messages.info.fg = '#bebebe'

c.colors.messages.info.bg = '#2a2a2a'

c.colors.prompts.fg = '#bebebe'

c.colors.prompts.selected.fg = '#bebebe'

c.colors.statusbar.normal.fg = '#bebebe'

c.colors.statusbar.normal.bg = '#2a2a2a'

c.colors.statusbar.insert.fg = '#bebebe'

c.colors.statusbar.insert.bg = '#aa8f7c'

c.colors.statusbar.passthrough.fg = '#bebebe'

c.colors.statusbar.passthrough.bg = '#937f74'

c.colors.statusbar.private.fg = '#bebebe'

c.colors.statusbar.command.fg = '#bebebe'

c.colors.statusbar.command.bg = '#2a2a2a'

c.colors.statusbar.command.private.fg = '#bebebe'

c.colors.statusbar.caret.fg = '#bebebe'

c.colors.statusbar.caret.bg = '#987a6b'

c.colors.statusbar.caret.selection.fg = '#bebebe'

c.colors.statusbar.progress.bg = '#bebebe'

c.colors.statusbar.url.fg = '#bebebe'

c.colors.statusbar.url.error.fg = '#627a8a'

c.colors.statusbar.url.hover.fg = '#987a6b'

c.colors.statusbar.url.success.http.fg = '#bebebe'

c.colors.statusbar.url.success.https.fg = '#aa8f7c'

c.colors.statusbar.url.warn.fg = '#8b8f7e'

c.colors.tabs.bar.bg = '#3a3a3a'

c.colors.tabs.odd.fg = '#877979'

c.colors.tabs.odd.bg = '#3a3a3a'

c.colors.tabs.even.fg = '#877979'

c.colors.tabs.even.bg = '#3a3a3a'

c.colors.tabs.selected.odd.fg = '#bebebe'

c.colors.tabs.selected.odd.bg = '#3a3a3a'

c.colors.tabs.selected.even.fg = '#bebebe'

c.colors.tabs.selected.even.bg = '#3a3a3a'

c.colors.tabs.pinned.odd.fg = '#bebebe'

c.colors.tabs.pinned.odd.bg = '#987a6b'

c.colors.tabs.pinned.even.fg = '#bebebe'

c.colors.tabs.pinned.even.bg = '#987a6b'

c.colors.tabs.pinned.selected.odd.fg = '#bebebe'

c.colors.tabs.pinned.selected.odd.bg = '#987a6b'

c.colors.tabs.pinned.selected.even.fg = '#bebebe'

c.colors.tabs.pinned.selected.even.bg = '#987a6b'

c.colors.webpage.bg = 'white'

c.colors.webpage.darkmode.enabled = False

c.colors.webpage.darkmode.contrast = 0.0

c.fonts.default_family = '"SF Mono"'

c.fonts.default_size = '12pt'

c.fonts.downloads = 'default_size default_family'

c.fonts.tabs.selected = '12pt Iosevka'

c.fonts.tabs.unselected = '12pt Iosevka'

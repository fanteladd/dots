import subprocess

from qutebrowser.config.configfiles import ConfigAPI
from qutebrowser.config.config import ConfigContainer
config: ConfigAPI = config
c: ConfigContainer = c

def read_xresources(prefix):
    props = {}
    x = subprocess.run(['xrdb', '-query'], stdout=subprocess.PIPE)
    lines = x.stdout.decode().split('\n')
    for line in filter(lambda l: l.startswith(prefix), lines):
        prop, _, value = line.partition(':\t')
        props[prop] = value
    return props

xresources = read_xresources('*')
background = xresources['*.background']
foreground = xresources['*.foreground']
black = xresources['*.color0']
grey = xresources['*.color8']
xresources_xft = read_xresources("Xft")
xft_dpi = int(xresources_xft.get("Xft.dpi"))
c.zoom.default = '{}%'.format(xft_dpi * 6 / 5)
c.scrolling.smooth = True

c.colors.webpage.preferred_color_scheme = 'dark'
#c.colors.webpage.darkmode.enabled = True
#c.colors.webpage.darkmode.algorithm = 'lightness-cielab'

c.colors.tabs.selected.even.bg = grey
c.colors.tabs.selected.odd.bg = grey
c.colors.tabs.bar.bg = background
c.colors.tabs.even.bg = background
c.colors.tabs.odd.bg = background
c.colors.statusbar.normal.bg = background
c.statusbar.widgets = ['url', 'history', 'scroll', 'progress']

config.load_autoconfig(False)

c.qt.args = ['use-gl=desktop', 'ignore-gpu-blocklist', 'enable-gpu-rasterization', 'enable-zero-copy', 'enable-accelerated-video-decode', 'enable-features=VaapiVideoDecoder']

c.auto_save.session = True

c.content.blocking.enabled = True
c.content.blocking.method = 'both'
c.content.blocking.adblock.lists = [
    "https://easylist.to/easylist/easylist.txt",
    "https://easylist.to/easylist/easyprivacy.txt",
    "https://easylist-downloads.adblockplus.org/easylistchina.txt"
]
c.content.cookies.accept = 'no-3rdparty'
c.content.headers.user_agent = 'Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101 Firefox/68.0'
c.content.default_encoding = 'utf-8'
c.content.pdfjs = False
c.content.autoplay = False
c.content.notifications.enabled = False

c.tabs.background = True
c.tabs.padding = {'bottom': 3, 'left': 3, 'right': 3, 'top': 3}
c.tabs.indicator.padding = {'bottom': 2, 'left': 0, 'right': 4, 'top': 4}
c.tabs.show = 'multiple'
c.tabs.favicons.scale = 1.3
c.tabs.title.format_pinned = '{index} {audio}'
c.statusbar.show = 'in-mode'

c.fonts.default_size = '11pt'

c.editor.command = ['alacritty', '-e',
                    'nvim', '{file}', '-c', 'normal {line}G{column0}l']

c.url.open_base_url = True

c.window.title_format = '{perc}{current_title}{title_sep}qutebrowser'

c.content.autoplay = False

c.fonts.web.size.default = 15

config.bind('<Alt-Left>', 'back')
config.bind('<Alt-Right>', 'forward')
config.bind('<Ctrl-Tab>', 'tab-next')
config.bind('<Ctrl-Shift-Tab>', 'tab-prev')
config.bind('<Ctrl-r>', 'reload')
config.bind('W', 'hint links spawn --detach mpv {hint-url}')
c.aliases = {'q': 'quit', 'w': 'session-save', 'wq': 'quit --save'}

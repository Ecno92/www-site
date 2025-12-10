
#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals

import site
from distutils.sysconfig import get_python_lib

AUTHOR = 'Therry van Neerven'
SITENAME = 'Therry'
SITEURL = ''

PATH = 'content'

TIMEZONE = 'Europe/Amsterdam'

DEFAULT_LANG = 'en'
LOCALE = 'en_US.utf8'

# Feed generation is usually not desired when developing
FEED_ALL_ATOM = None
CATEGORY_FEED_ATOM = None
TRANSLATION_FEED_ATOM = None
AUTHOR_FEED_ATOM = None
AUTHOR_FEED_RSS = None

DEFAULT_PAGINATION = False

STATIC_PATHS = ['images', 'static', 'files']
EXTRA_PATH_METADATA = {'static/favicon.ico': {'path': 'favicon.ico'},}
ARTICLE_PATHS = ['articles']
PLUGIN_PATHS = [get_python_lib()]

PLUGINS = []

THEME = './theme/'
PROFILE_IMAGE = 'avatar.png'
BIO = ("My personal space on the www.")

SOCIAL = (
    ('envelope', 'mailto:therry.van.neerven@curiousbits.nl'),
    ('linkedin', 'https://www.linkedin.com/in/therryvanneerven/'),
    ('github', 'http://github.com/Ecno92'),
    ('mastodon', 'https://mastodon.social/@Therry92')
)

MENUITEMS = (
    ("Therry's Documentation", "https://docs.therryvanneerven.nl/"),
)


DISPLAY_PAGES_ON_MENU = True

INCLUDE_GOATCOUNTER = False

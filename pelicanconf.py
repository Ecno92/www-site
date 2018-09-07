#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals

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
EXTRA_PATH_METADATA = {'static/favicon.ico': {'path': 'favicon.ico'},
                       'static/.htaccess': {'path': '.htaccess'}}
ARTICLE_PATHS = ['blog']

PLUGIN_PATHS = ['pelican-plugins']
PLUGINS = ['image_process']
IMAGE_PROCESS = {
    'article-image': ["scale_in 720 720 False"],
    }
IMAGE_PROCESS_DIR = 'derivative'

THEME = './theme/pelican-hyde/'
PROFILE_IMAGE = 'avatar.png'
BIO = ("My personal space on the www.")

SOCIAL = (
    ('envelope', 'mailto:mail@therryvanneerven.nl'),
    ('linkedin', 'https://nl.linkedin.com/in/therry-van-neerven-4130a267'),
    ('github', 'http://github.com/Ecno92'),
    ('users', 'http://www.meetup.com/members/145841212/'),)

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

# Uncomment following line if you want document-relative URLs when developing
# RELATIVE_URLS = True
STATIC_PATHS = ['images', 'static']
EXTRA_PATH_METADATA = {'static/favicon.ico': {'path': 'favicon.ico'}, }

THEME = './theme/pelican-hyde/'
PROFILE_IMAGE = 'avatar.png'
BIO = ("My name is Therry van Neerven. "
       "I'm located in the Netherlands and I use this site to share my "
       "knowledge and experiences. "
       "I have a background in Industrial Design and "
       "I'm currently working as a CTO of a fast growing start-up.")

SOCIAL = (
    ('envelope', 'mailto:mail@therryvanneerven.nl'),
    ('linkedin', 'https://nl.linkedin.com/in/therry-van-neerven-4130a267'),
    ('github', 'http://github.com/Ecno92'),
    ('users', 'http://www.meetup.com/members/145841212/'),)

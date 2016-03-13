#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals

# This file is only used if you use `make publish` or
# explicitly specify it as your config file.

import os
import sys
sys.path.append(os.curdir)
from pelicanconf import *

SITEURL = 'http://www.therryvanneerven.nl'
RELATIVE_URLS = False

FEED_ALL_ATOM = 'feeds/all.atom.xml'
CATEGORY_FEED_ATOM = 'feeds/%s.atom.xml'

DELETE_OUTPUT_DIRECTORY = True

# Plugins
# Unfortunately the yuicompressor module is not included in the plugin
# root folder. That's why another plugin path is added.
PLUGIN_PATHS = PLUGIN_PATHS + ['pelican-plugins/pelican-yuicompressor']
PLUGINS = PLUGINS + ['yuicompressor']

# Following items are often useful when publishing

DISQUS_SITENAME = "therryvanneerven"
# GOOGLE_ANALYTICS = ""

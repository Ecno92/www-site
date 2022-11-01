#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals

# This file is only used if you use `make publish` or
# explicitly specify it as your config file.

import os
import sys
sys.path.append(os.curdir)
from pelicanconf import *

SITEURL = 'https://www.therryvanneerven.nl'
RELATIVE_URLS = True

FEED_DOMAIN = SITEURL
FEED_ALL_RSS = 'feeds/all.rss.xml'

DELETE_OUTPUT_DIRECTORY = True

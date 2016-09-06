Hello World! An introduction to this website.
#############################################

:date: 2016-03-13 22:04
:modified: 2016-09-06 14:24
:tags: introduction
:category: misc
:slug: hello-world-introduction-to-website
:authors: Therry van Neerven
:description: A small introduction about why I made a new website and how I did it.

A few years ago I registered this domain because I needed a place to host
my portfolio site for my university course.
Having a portfolio site was required by the University so they evaluate me on my progress
during the course.

After finishing my bachelor course at university I ended up working for a start-up as the CTO.
Because of the amazing challenge during my daily job this website and my old blog
at Blogspot_ did not get any attention anymore.

For over a half year I had the idea to revive this website since I see that I often
end up in some situation which is meaningful enough to share on the web.
The things I will write about may cover some web-development related topics,
but don't feel surprised if you see a post about my favorite coffee.

Since all this personal talking may not be interesting to you I will explain now
what I've used to set up this blog.


Ingredients to create this blog
===============================

Static site generator
---------------------

To create this site I've used a static site generator called Pelican_.
It's a simple and stable solution which meets my requirements.
Pelican is written in Python and allows me to write the articles in the RST format straight from
my editor.

.. image:: /images/editing_static_blog_in_emacs.png
   :alt: Editing site from Emacs 
   :class: image-process-article-image

It's also very easy to extend using a limited set of plugins.
Currently I'm using plugins for minification and processing images.

Theme
-----

While I have a background in design and I'm quite capable of turning an idea into some
HTML and CSS making a theme is not my favorite kind of activity.
That's why I've used the excellent pelican-hyde_ theme.

You may want to check out the source code. It's fairly small.
I'm considering to adjust the theme later on so it looks a little bit more unique.

Hosting
-------

This site is hosted at TransIP_ and I'm just using a so-called shared hosting solution.
For this website that's just enough. In this way I also do not have to maintain a
server which allows me to focus on other activities.

A while ago I started to work more with TransIP. According to me they are one of the few
parties in the Netherlands which are innovating by offering decent performing VPS systems
for a low price, options for hooking up a large file system to the VPS and their own cloud storage
platform called Stack.

Since I like to use services from local providers I've chosen for this solution instead of
a static website hosting solution like Amazon S3.

Comments
--------

This website is entirely static. So there is no application running which allows people
to leave a comment at the page of the article.

For those kind situations Disqus is useful. It's also supported by Pelican by just a single
setting in the configuration.

Aside from that Disqus is also a nice Python/Django powered company which is nice to monitor
since they are one of the few companies which are dealing with real scalability issues and
most of their engineers are quite open in `sharing some of their knowledge <http://highscalability.com/blog/2014/5/7/update-on-disqus-its-still-about-realtime-but-go-demolishes.html>`_.

Statistics
----------

I do not have found a solution for the statistics about my website yet.
So I'm limited to the statistics of the hosting provider.
In the past I've used Google Analytics for most of my sites, but that was before I became aware
of the potential privacy concerns of the visitors.

I often read that people are moving to the self-hosted solution Piwik_. However I did not investigate
this solution further than just going to the main page of the product.
In case you have hands-on experience with this solution feel free to leave a comment with your
experiences.

Version Control
---------------

All the content on this website is online available. So there is no need to keep stuff secret.
That's why all the code to generate this website is `available on GitHub <https://github.com/Ecno92/www-site>`_ so you can use it as an inspirational source to get your own Pelican powered website running.

Conclusion
==========

By investing just a few hours I was able to set up a fairly decent blog system.
Having something running which allows me to put some stories on the internet is satisfying.
If you are also planning to set up a simple website then I can recommend this configuration.
Even if you are a beginner in web development it should be fairly easy to set up something similar.

If you have any questions or remarks feel free to leave a comment!

.. _Blogspot: http://ecno92.blogspot.nl/
.. _Pelican: http://docs.getpelican.com/
.. _pelican-hyde: https://github.com/jvanz/pelican-hyde
.. _TransIP: https://www.transip.nl/
.. _Piwik: http://piwik.org/

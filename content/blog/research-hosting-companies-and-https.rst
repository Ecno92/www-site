Some questions to hosting companies about supporting HTTPS (through Let's Encrypt) by default.
##############################################################################################

:date: 2016-09-06 13:53
:modified: 2016-09-06 13:53
:tags: letsencrypt, ssl, hosting, research
:category: tech
:slug: short-research-about-letsencrypt-and-ssl-as-a-default
:authors: Therry van Neerven
:description: A short research about whether hosting companies are interested to enable HTTPS by default and if Let's Encrypt is supported on their platforms.

Last year a colleague sent me a interesting link to the website of `Let's Encrypt <https://letsencrypt.org/>`_.
Let's Encrypt is a project which provides tooling to easily enable HTTPS on your servers in a easy and "free" way.
A few months later I used the project to enable HTTPS on a domain of a family member successfully. 

I support the idea that HTTPS should be the default of the web. Unfortunately reality does not match this idea yet.
Most hosting packages have optional (paid) HTTPS support. The fact that it is a paid option results in the fact that I see many insecure websites on a daily basis.
Some people don't know what HTTPS is. Others don't see the additional value and for some people or projects it is just too expensive.

I believe that hosting companies should set a safe default for users. HTTPS is in general preferred over HTTP. So why not enable it by default?
Also Let's Encrypt is out of Beta, so why not allow people to use it on the web hosting packages?

I asked those questions to a few hosting companies which are active in the Netherlands and I hereby  share the results.
Notice that this research was just out of interest and was not done in a proper "scientific" way.
Also I do not want to judge if a hosting company is good or bad. The answers on my questions may not reflect the actual quality of the hosting parties.

The questions
=============

I asked the hosting companies two questions:

* Are you going to enable me to use Let's Encrypt in combination with your hosting packages?
* Are you going to include SSL support by default on your hosting offers?

I've asked those questions through email and chat since not every hosting company prefers the same communication channel.
In total I've asked 5 hosting companies which are active in the Netherlands:

* `Strato <https://www.strato.nl/>`_
* `Hostnet <https://www.hostnet.nl/>`_
* `TransIP <https://www.transip.nl/>`_
* `Antagonist <https://www.antagonist.nl>`_
* `Flexwebhosting <https://www.flexwebhosting.nl/>`_

I asked those specific hosting companies because I see them being used other people for hosting small websites and webshops.
This are typically the applications which require safe defaults because the people who run them are not very familiar to software development. 


The results
===========

Below you can find a summarized version of the results.

+--------------+----------+-----------+------------+
|**Hosting     |**Support |**Enable   |**Note**    |
|Company**     |Let's     |HTTPS by   |            |
|              |Encrypt?**|default?** |            |
|              |          |           |            |
+--------------+----------+-----------+------------+
|Strato        |No        |No, not    |They are    |
|              |          |in the     |sorry that  |
|              |          |near       |they do     |
|              |          |future.    |not have a  |
|              |          |           |more        |
|              |          |           |positive    |
|              |          |           |answer.     |
+--------------+----------+-----------+------------+
|Hostnet       |No        |No         |            |
|              |          |           |            |
|              |          |           |            |
|              |          |           |            |
+--------------+----------+-----------+------------+
|TransIP       |Maybe, no |May become |            |
|              |ETA       |part of the|            |
|              |available.|new hosting|            |
|              |          |offer. This|            |
|              |          |is not     |            |
|              |          |defined    |            |
|              |          |yet.       |            |
|              |          |           |            |
|              |          |           |            |
+--------------+----------+-----------+------------+
|Antagonist    |No, unsure|No for now,|Unofficial  |
|              |if it will|but they   |instructions|
|              |be        |are        |on how to   |
|              |possible  |monitoring |get Let's   |
|              |in the    |the market |Encrypt     |
|              |future.   |and        |working on  |
|              |          |initiatives|the platform|
|              |          |like Let's |are included|
|              |          |Encrypt.   |in the mail.|
|              |          |           |            |
+--------------+----------+-----------+------------+
|Flexwebhosting|No        |No         |Directadmin |
|              |          |           |Interface   |
|              |          |           |accepts any |
|              |          |           |certificate.|
+--------------+----------+-----------+------------+

My impression of the results
============================

Overall I can say that I received a general "No" on both answers.
However some answers are promising. Antagonist did a really good job at explaining how you can SSH into a web container(!) to enable Let's Encrypt.
Other companies are monitoring the situation and are considering to add easy to use HTTPS support in their hosting offers (through Let's Encrypt).
So maybe things will slowly start to move and more people will have a affordable and easy way to have SSL enabled on their domain in the future.

If you are considering a hosting party. Do not forget to check their support for SSL.
For now it is your own responsibility to apply the right default for your domain to ensure a secure connection.
There are big differences in how easy it is to install a certificate. Also the pricing for applying a certificate on the domain may be different.
So do your research and share the results. It may help people to make the right choice. Your feedback will also enable hosting companies to improve the situation.

A final note
============

Many of the hosting companies are using (a modified version) of Directadmin.
While Directadmin has support for Let's Encrypt it is mostly not enabled by default.
In that case you can easily spin up my `letsencrypt-directadmin-docker <https://github.com/Ecno92/letsencrypt-directadmin-docker>`_ project to enable SSL on your domain.

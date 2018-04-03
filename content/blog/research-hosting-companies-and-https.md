Title: Some questions to hosting companies about supporting HTTPS (through Let's Encrypt) by default.
Date: 2016-09-06 13:53
Modified: 2016-09-06 13:53
Tags: letsencrypt, ssl, hosting, research
category: tech
slug: short-research-about-letsencrypt-and-ssl-as-a-default
authors: Therry van Neerven
description: A short research about whether hosting companies are interested to enable HTTPS by default and if Let's Encrypt is supported on their platforms.

Last year a colleague sent me a interesting link to the website of
[Let's Encrypt](https://letsencrypt.org/). Let's Encrypt is a project
which provides tooling to easily enable HTTPS on your servers in a easy
and "free" way. A few months later I used the project to enable HTTPS on
a domain of a family member successfully.

I support the idea that HTTPS should be the default of the web.
Unfortunately reality does not match this idea yet. Most hosting
packages have optional (paid) HTTPS support. The fact that it is a paid
option results in the fact that I see many insecure websites on a daily
basis. Some people don't know what HTTPS is. Others don't see the
additional value and for some people or projects it is just too
expensive.

I believe that hosting companies should set a safe default for users.
HTTPS is in general preferred over HTTP. So why not enable it by
default? Also Let's Encrypt is out of Beta, so why not allow people to
use it on the web hosting packages?

I asked those questions to a few hosting companies which are active in
the Netherlands and I hereby share the results. Notice that this
research was just out of interest and was not done in a proper
"scientific" way. Also I do not want to judge if a hosting company is
good or bad. The answers on my questions may not reflect the actual
quality of the hosting parties.

## The questions

I asked the hosting companies two questions:

-   Are you going to enable me to use Let's Encrypt in combination with
    your hosting packages?
-   Are you going to include SSL support by default on your hosting
    offers?

I've asked those questions through email and chat since not every
hosting company prefers the same communication channel. In total I've
asked 5 hosting companies which are active in the Netherlands:

-   [Strato](https://www.strato.nl/)
-   [Hostnet](https://www.hostnet.nl/)
-   [TransIP](https://www.transip.nl/)
-   [Antagonist](https://www.antagonist.nl)
-   [Flexwebhosting](https://www.flexwebhosting.nl/)

I asked those specific hosting companies because I see them being used
other people for hosting small websites and webshops. This are typically
the applications which require safe defaults because the people who run
them are not very familiar to software development.

## The results

Below you can find a summarized version of the results.

| Hosting Company | Support Let's Encrypt? | Enable HTTPS by default? | Note |
| --- | --- | ---| ---|
| Strato | No | No, not in the near future. | They are sorry that they do not have a more positive answer. |
| Hostnet | No | No |  |
| TransIP | Maybe, no ETA available. | May become part of the new hosting offer. This is not defined yet. |  |
| Antagonist | No, unsure if it will be possible in the future. | No for now, but they are monitoring the market and initiatives like Let's Encrypt. | Unofficial instructions on how to get Let's Encrypt working on the platform are included in the mail. |
| Flexwebhosting | No | No | Directadmin Interface accepts any certificate. |

## My impression of the results

Overall I can say that I received a general "No" on both answers.
However some answers are promising. Antagonist did a really good job at
explaining how you can SSH into a web container(!) to enable Let's
Encrypt. Other companies are monitoring the situation and are
considering to add easy to use HTTPS support in their hosting offers
(through Let's Encrypt). So maybe things will slowly start to move and
more people will have a affordable and easy way to have SSL enabled on
their domain in the future.

If you are considering a hosting party. Do not forget to check their
support for SSL. For now it is your own responsibility to apply the
right default for your domain to ensure a secure connection. There are
big differences in how easy it is to install a certificate. Also the
pricing for applying a certificate on the domain may be different. So do
your research and share the results. It may help people to make the
right choice. Your feedback will also enable hosting companies to
improve the situation.

## A final note

Many of the hosting companies are using (a modified version) of
Directadmin. While Directadmin has support for Let's Encrypt it is
mostly not enabled by default. In that case you can easily spin up my
[letsencrypt-directadmin-docker](https://github.com/Ecno92/letsencrypt-directadmin-docker)
project to enable SSL on your domain.

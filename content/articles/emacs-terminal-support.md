Title: Emacs terminal support
Slug: emacs-terminal-support
Date: 2020-12-08 11:57:46
Description: "How to enable terminal support in Emacs"

I've been using Emacs already for a long time.
However I found the terminal integration based on `term` always a little bit flawed.
Recently I switched to [vterm](https://github.com/akermu/emacs-libvterm)
and since that moment I'm peforming almost all my development work from Emacs.

I always forget how to install it on my pc. So I'm hereby sharing the notes.

## How to enable Emacs vterm support on Ubuntu

In your emacs config file:
```lang-el
(use-package vterm
  :ensure t)
```

In your terminal:
```shell
apt remove emacs
apt autoremove
apt install libvterm-dev
add-apt-repository ppa:kelleyk/emacs
apt update
apt install emacs26
apt install cmake
emacs
```

![Emacs vterm support](./images/emacs-vterm.png)

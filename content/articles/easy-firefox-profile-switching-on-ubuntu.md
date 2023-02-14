Title: Easy Firefox profile switching on Ubuntu
Slug: easy-firefox-profile-switching-on-ubuntu
Date: 2023-02-14 09:55:15
Description: Get more productive with easy profile switching on Ubuntu.

As a freelance software engineer, I work for multiple clients.
Often clients provide a notebook. The separation of physical devices makes it easy to separate the work for different clients.
However, in some cases, I bring my own device. This brings challenges to separate the work properly.

I have already figured out a solution by using separate [Git and SSH configurations](/different-git-configuration-per-directory.html#different-git-configuration-per-directory).
However for browsing with Firefox I did not find a good solution yet.

Competitive browsers like Google Chrome support separate profiles, and switching between them is nicely integrated in the user interface.
Firefox does not provide a similar experience. However, with some tweaks, you can get pretty close.

## Firefox profiles

Mozilla provides the [Firefox Multi-Account Containers extension](https://addons.mozilla.org/en-US/firefox/addon/multi-account-containers/).
This allows you to isolate browser activity using different colored tabs.

I did not like the interaction. I often made mistakes. I often picked the wrong container.
Luckily Firefox already provides a feature called [profiles](https://support.mozilla.org/en-US/kb/profile-manager-create-remove-switch-firefox-profiles).

So I have created a Firefox profile for my work and private stuff (CuriousBits) and a profile for one of my clients.
Every time when I launch Firefox from scratch, it asks me which profile I want to use.

![Choose User Profile - Firefox](/images/firefox-profile-choose.png)

A profile is an entirely new environment. So you can pick a theme to recognize which profile is active, and you can add extensions.
Browser history is adequately isolated from the other profiles.

For me, this works very well. Even despite it is an older and less promoted functionality of Firefox.


## Quick access to a profile

The downside is that once a profile is active. A new tab will open within that activated profile.
However, sometimes I want to have both profiles open.

Initially, I achieved this by launching a second instance from the terminal which asked me to choose the profile again.

```shell
$ firefox -p
```

This was not very elegant. So I decided that it would be nice to update the pinned Firefox menu to provide some quick access to the different profiles.

![Ubuntu pick firefox profile](/images/ubuntu-pick-firefox-profile.png)

To achieve the situation above, I first copied over the shortcut from the snap package to my own configuration.
This will allow us to override the shortcut that is used in Ubuntu.


``` shell
$ cp /var/lib/snapd/desktop/applications/firefox_firefox.desktop ~/.local/share/applications/firefox_firefox.desktop
```

Then I opened the copied file and made a few adjustments.
Content that has not been changed is indicated with dots to save some space in this article.

```
[Desktop Entry]
.
.
.
Actions=NewWindow;NewPrivateWindow;NewWindowClient;NewWindowCuriousBits;

[Desktop Action NewWindowClient]
Name=Open a New Window - Client
Exec=env BAMF_DESKTOP_FILE_HINT=/var/lib/snapd/desktop/applications/firefox_firefox.desktop /snap/bin/firefox -new-window -p Client

[Desktop Action NewWindowCuriousBits]
Name=Open a New Window - Curiousbits
Exec=env BAMF_DESKTOP_FILE_HINT=/var/lib/snapd/desktop/applications/firefox_firefox.desktop /snap/bin/firefox -new-window -p CuriousBits
```

As you can see, I have added two entries for a new `[Desktop Action ...]`.
You should not forget to add them to the `Actions=` in the `[Desktop Entry]`.

Once you save the file, the changes should reflect within about 10 seconds.

The above technique can also be used for other snap applications within a Gnome-based desktop environment.

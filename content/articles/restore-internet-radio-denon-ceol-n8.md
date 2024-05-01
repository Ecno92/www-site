Title: Restore internet radio Denon CEOL N8
Slug: restore-internet-radio-denon-ceol-n8
Date: 2023-12-03 12:00:00

**WARNING:** At 10/04/2024 the trick mentioned in this article stopped working. I have undone the trick, and now internet radio seems to work with the original settings.

10 year ago Denon released the Denon (CEOL) RCD-N8.
A small network audio system which uses [vTuner](https://www.vtuner.com/) services for providing internet radio.
I bought this device second hand.

A while ago the internet radio stopped working.
This is my story how I worked around that limitation.

# How I restored the service

At first the display of the device prompted me that I needed to check out `radiodenon.com`.
According to online documentation you need a [subscription in order to restore the service](https://support-nl.denon.com/app/answers/detail/a_id/7101/~/internet-radiodienst-door-vtuner).

Unfortunately the website was down at that time. So I started to look around.

The device tried to connect to `denon.vtuner.com`.
I figured out that there was also another service hosted at `denon2.vtuner.com`, which was still up and running.

I was able to figure out the IP address of the service.

```shell
therry@...:~$ ping denon2.vtuner.com
PING denon2.vtuner.com (154.27.73.59) 56(84) bytes of data.
```

In my router there is a option to return a different IP address when a DNS record is requested.
This is called `static-host-mapping`.
So this allowed me to return the IP address of `denon2.vtuner.com` when the device is looking for `denon.vtuner.com`.

I turned on the device again. Music started to play and I could continue my day! 🙂

# What about the future?

So from what it seems stopping the service was a business decision.
I kind of understand it. Maintaining the service can not be done for free.
So for now it is advicable to get a subscription.
As long as the fees are reasonable, this is the best way to keep the service up and to support the maintainers of vTuner.

When it all stops working, the workaround above can be applied to to connect to a [YCast server](https://github.com/milaq/YCast).
This emulates the vTuner services and will allow us to keep listening to our favorite internet radio channels.

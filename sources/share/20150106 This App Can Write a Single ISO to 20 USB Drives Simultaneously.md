(translating by runningwater )
This App Can Write a Single ISO to 20 USB Drives Simultaneously
================================================================================
**If I were to ask you to burn a single Linux ISO to 17 USB thumb drives how would you go about doing it?**

Code savvy folks would write a little bash script to automate the process, and a large number would use a GUI tool like the USB Startup Disk Creator to burn the ISO to each drive in turn, one by one. But the rest of us would fast conclude that neither method is ideal.

### Problem > Solution ###

![GNOME MultiWriter in action](http://www.omgubuntu.co.uk/wp-content/uploads/2015/01/gnome-multi-writer.jpg)

GNOME MultiWriter in action

Richard Hughes, a GNOME developer, faced a similar dilemma. He wanted to create a number of USB drives pre-loaded with an OS, but wanted a tool simple enough for someone like his dad to use.

His response was to create a **brand new app** that combines both approaches into one easy to use tool.

It’s called “[GNOME MultiWriter][1]” and lets you write a single ISO or IMG  to multiple USB drives at the same time.

It nixes the need to customize or create a command line script and relinquishes the need to waste an afternoon performing an identical set of actions on repeat.

All you need is this app, an ISO, some thumb-drives and lots of empty USB ports.

### Use Cases and Installing ###

![The app can be installed on Ubuntu](http://www.omgubuntu.co.uk/wp-content/uploads/2015/01/mutli-writer-on-ubuntu.jpg)

The app can be installed on Ubuntu

The app has a pretty defined usage scenario, that being situations where USB sticks pre-loaded with an OS or live image are being distributed.

That being said, it should work just as well for anyone wanting to create a solitary bootable USB stick, too — and since I’ve never once successfully created a bootable image from Ubuntu’s built-in disk creator utility, working alternatives are welcome news to me!

Hughes, the developer, says it **supports up to 20 USB drives**, each being between 1GB and 32GB in size.

The drawback (for now) is that GNOME MultiWriter is not a finished, stable product. It works, but at this early blush there are no pre-built binaries to install or a PPA to add to your overstocked software sources.

If you know your way around the usual configure/make process you can get it up and running in no time. On Ubuntu 14.10 you may also need to install the following packages first:

    sudo apt-get install gnome-common yelp-tools libcanberra-gtk3-dev libudisks2-dev gobject-introspection

If you get it up and running, give it a whirl and let us know what you think!

Bugs and pull requests can be longed on the GitHub page for the project, which is where you’ll also found tarball downloads for manual installation.

- [GNOME MultiWriter on Github][2]

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2015/01/gnome-multiwriter-iso-usb-utility

作者：[Joey-Elijah Sneddon][a]
译者：[runningwater](https://github.com/runningwater)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117485690627814051450/?rel=author
[1]:https://github.com/hughsie/gnome-multi-writer/
[2]:https://github.com/hughsie/gnome-multi-writer/

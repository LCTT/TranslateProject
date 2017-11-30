# LibreOffice Is Now Available on Flathub, the Flatpak App Store

![LibreOffice on Flathub](http://www.omgubuntu.co.uk/wp-content/uploads/2017/11/libroffice-on-flathub-750x250.jpeg)

LibreOffice is now available to install from [Flathub][3], the centralised Flatpak app store.

Its arrival allows anyone running a modern Linux distribution to install the latest stable release of LibreOffice in a click or two, without having to hunt down a PPA, tussle with tarballs or wait for a distro provider to package it up.

A [LibreOffice Flatpak][5] has been available for users to download and install since August of last year and the [LibreOffice 5.2][6] release.

What’s “new” here is the distribution method. Rather than release updates through their own dedicated server The Document Foundation has opted to use Flathub.

This is  _great_  news for end users as it means there’s one less repo to worry about adding on a fresh install, but it’s also good news for Flatpak advocates too: LibreOffice is open-source software’s most popular productivity suite. Its support for both format and app store is sure to be warmly welcomed.

At the time of writing you can install LibreOffice 5.4.2 from Flathub. New stable releases will be added as and when they’re released.

### Enable Flathub on Ubuntu

![](http://www.omgubuntu.co.uk/wp-content/uploads/2017/11/flathub-750x495.png)

Fedora, Arch, and Linux Mint 18.3 users have Flatpak installed, ready to go, out of the box. Mint even comes with the Flathub remote pre-enabled.

[Install LibreOffice from Flathub][7]

To get Flatpak up and running on Ubuntu you first have to install it:

```
sudo apt install flatpak gnome-software-plugin-flatpak
```

To be able to install apps from Flathub you need to add the Flathub remote server:

```
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

That’s pretty much it. Just log out and back in (so that Ubuntu Software refreshes its cache) and you  _should_  be able to find any Flatpak apps available on Flathub through the Ubuntu Software app.

In this instance, search for “LibreOffice” and locate the result that has a line of text underneath mentioning Flathub. (Do bear in mind that Ubuntu has tweaked the Software client to shows Snap app results above everything else, so you may need scroll down the list of results to see it).

There is a [bug with installing Flatpak apps][8] from a flatpakref file, so if the above method doesn’t work you can also install Flatpak apps form Flathub using the command line.

The Flathub website lists the command needed to install each app. Switch to the “Command Line” tab to see them.

#### More apps on Flathub

If you read this site regularly enough you’ll know that I  _love_  Flathub. It’s home to some of my favourite apps (Corebird, Parlatype, GNOME MPV, Peek, Audacity, GIMP… etc). I get the latest, stable versions of these apps (plus any dependencies they need) without compromise.

And, as I tweeted a week or so back, most Flatpak apps now look great with GTK themes — no more [workarounds][9]required!

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2017/11/libreoffice-now-available-flathub-flatpak-app-store

作者：[ JOEY SNEDDON ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117485690627814051450/?rel=author
[1]:https://plus.google.com/117485690627814051450/?rel=author
[2]:http://www.omgubuntu.co.uk/category/news
[3]:http://www.flathub.org/
[4]:http://www.omgubuntu.co.uk/2017/11/libreoffice-now-available-flathub-flatpak-app-store
[5]:http://www.omgubuntu.co.uk/2016/08/libreoffice-5-2-released-whats-new
[6]:http://www.omgubuntu.co.uk/2016/08/libreoffice-5-2-released-whats-new
[7]:https://flathub.org/repo/appstream/org.libreoffice.LibreOffice.flatpakref
[8]:https://bugs.launchpad.net/ubuntu/+source/gnome-software/+bug/1716409
[9]:http://www.omgubuntu.co.uk/2017/05/flatpak-theme-issue-fix

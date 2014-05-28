Translating by GOLinux ...
Ubuntu Users Will No Longer Have a Cinnamon PPA
================================================================================
![](http://i1-news.softpedia-static.com/images/news2/Ubuntu-Users-Will-No-Longer-Have-a-Cinnamon-PPA-443933-2.jpg)

**Many Ubuntu users have been employing a third-party repository to test Cinnamon without installing Linux Mint to do it, but it seems that that will no longer be possible in the future.**

If you have an Ubuntu operating system, you are now able to test the Cinnamon desktop environment just by adding a PPA and installing the appropriate packages. This is as close as you can get to Linux Mint without actually installing another OS.

Unfortunately, this functionality is about to disappear, but not because the main maintainer doesn't want to continue offering it. Apparently, the Ubuntu repositories will no longer keep older versions of GNOME packages, which Cinnamon requires, making it difficult, if not impossible, to install it through this method.

“The stable PPA is indeed no longer being maintained. The nightly PPA is being kept for development purposes and should not be used on any sort of production machine (it can and will break at any time).”

“To be honest, I don't have an alternative to offer Ubuntu users at the moment, apart from switching to a distribution that does support Cinnamon. There are many such distributions out there, and I'm only hoping for someone to (finally) step up on Ubuntu's side to provide proper packages to its users,” [said][1] Gwendal Le Bihan, the maintainer of the Cinnamon packages.

This means that, for now, only an unstable PPA will be available, but it's only for testing. Users shouldn't employ it on their production machines, and soon the only way to see what Cinnamon looks like will be by installing Linux Mint (or Arch for that matter) or compile it for yourself.

If you still want to install Cinnamon, the unstable PPA is available for Ubuntu 14.04 LTS (Trusty Tahr). All you have to do is to enter a few commands in a terminal (you will need to be root in order for it to work):

    sudo add-apt-repository ppa:gwendal-lebihan-dev/cinnamon-nightly
    sudo apt-get update
    sudo apt-get install cinnamon

After the installation has been completed, all you have to do is to log out of the system and choose Cinnamon from the greeter.

The Cinnamon desktop environment was developed as a GNOME shell fork with the aim to provide a simple and conservative alternative to everything that is offered right now. Many users are not happy with the direction taken by GNOME, Unity, and KDE and are looking for desktops that haven't strayed too much from the norm.

It's possible that someone else will set up another PPA with all the required packages to make Cinnamon work with the upcoming Ubuntu 14.10, but that is unlikely.

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/Ubuntu-Users-Will-No-Longer-Have-a-Cinnamon-PPA-443933.shtml

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://askubuntu.com/questions/94201/how-do-i-install-the-cinnamon-desktop

How to Beautify Your Linux Desktop with Pacifica Icons
================================================================================
The following tutorial will teach all Linux users how to beautify their current desktop environment with the gorgeous, flat and modern Pacifica icon theme.

Being inspired by the most beautiful Linux operating system in the world, elementary OS, and by wonderful icon themes like Nitrux, Faenza, Moka and Plastico, the Pacifica icon theme brings something new to the Linux world, something that we've all been expecting for a long time.

Francisco Villarroel is the main developer and designer behind the Pacifica icon theme. He goes by the name bokehlicia on the DeviantArt website, [the place of birth for his superb icon theme][1].

And now for the technical details, we can tell you that we've tested the Pacifica icon theme on a pure GNOME 3 desktop environment, under the Arch Linux operating system. However, Ubuntu 12.04 LTS (Precise Pangolin) users can also install it via the elementary OS PPA, thanks to Carlos Gomes.

The Pacifica icon theme requires the elementary icon theme, as well as the default gnome and hicolor icon themes found in any GNOME-based Linux distribution. So, if you have these requirements, the Pacifica icon theme should also work on your desktop environment or Linux distro.

![](http://i1-news.softpedia-static.com/images/extra/LINUX/large/pacificaicontheme-large_001.jpg)

Let's get down and dirty with the installation of this wonderful icon theme on Arch Linux and Ubuntu. First, here are the installation instructions for Ubuntu 12.04 LTS users:

Open a Terminal by hitting the **CTRL+ALT+T** key combination, and paste the following commands, one by one, hitting Enter after each one...

    sudo apt-add-repository ppa:elementary-br/projects
    sudo apt-get update
    sudo apt-get install -y pacifica-icon-theme


That's it! You can now use GNOME Tweak Tool, or any other application that can help you change icon themes on your system, to activate the Pacifica icon theme. If you prefer the command-line, use the following command:

    gsettings set org.gnome.desktop.interface icon-theme "Pacifica"

And now for Arch Linux users, use your favorite AUR helper to [install the pacifica-icon-theme package][2]. The same instructions from above apply to Arch Linux users too, in order to set the new Pacifica icon theme.

And for the rest of the world, do not hesitate to manually download and install the Pacifica icon theme on your Linux operating system, or use the icons for whatever you want.

Do not hesitate to comment below if you run into problems during this tutorial.


via: http://news.softpedia.com/news/How-to-Beautify-You-Linux-Desktop-with-Pacifica-Icons-385877.shtml

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[译者ID][] 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[译者ID]:http://linux.cn/space/译者ID
[校对者ID]:http://linux.cn/space/校对者ID

[1]:http://bokehlicia.deviantart.com/art/Pacifica-Icons-402508559
[2]:https://aur.archlinux.org/packages/pacifica-icon-theme/
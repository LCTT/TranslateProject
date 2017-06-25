Chromebook Dual Boot How-to: Ubuntu 17.04 GNOME and Chrome OS
============================================================


### This tutorial uses the famous Crouton installer


Last year when I got my Acer Chromebook 11 (C740), I wrote a tutorial to teach you guys how to [remove Google Chrome OS and install a GNU/Linux distribution][1] of your choice, but things got boring.

So after a few months, I reinstalled Chrome OS using a recovery image that Google provides on their website for this sort of things, which I wrote on a USB flash drive and booted from my Chromebook. Recently, I got bored again, and so I decided to install Ubuntu on my Acer Chromebook 11 (C740) using Crouton.

Why? Because of a friend who came one day at a meeting we had with his laptop, a Dell Chromebook 13, on which he ran Ubuntu Linux alongside Chrome OS. It was really cool to see him switch so easily between the two operating systems with a simple keyboard shortcut that it made me wanna do the same.

There are a lot of tutorials out there explaining how to install various releases of Ubuntu, Debian or  Kali Linux (these are the GNU/Linux distros currently supported by the Crouton installer), but I wanted to run the latest Ubuntu release, Ubuntu 17.04 (Zesty Zapus) in this case, with the GNOME 3.24 desktop environment.

How to enable Developer Mode and download Crouton

When I asked my friend which Ubuntu version is he running on his Chromebook, the answer was Ubuntu 14.04 LTS (Trusty Tahr), which I have to admit that it disappointed me. Immediately when I got home, I got my Chromebook and tried to see if I could run Ubuntu 17.04, with the GNOME desktop environment.

The first thing I did was to put my Chromebook in Developer Mode. To do that, you'll have to shut down your Chromebook without closing the lid, then hold the ESC, Refresh and Power buttons at the same time for a few seconds until you enter recovery mode, which will wipe all the data on your Chromebook.

It will take a few minutes to enter Developer Mode so be patient. When it's ready, you'll have to log in with your Google account and set various things like wallpaper or your avatar the way it was before. Now that you are in Developer Mode, access this tutorial on your Chromebook and [download Crouton][2], which will be saved in the Downloads folder.

How to install Ubuntu 17.04 with GNOME 3.24 using Crouton

Now, open Google Chrome and press CTRL+ALT+T to open the Chrome OS' terminal emulator, which is called crosh. At the command-line prompt, type the "shell" command (without quotes) and press Enter to access the Linux shell. Let's see what Crouton can do for us now.

There are two commands (listed below) that you can run to see which GNU/Linux distributions and desktop environments Crouton supports, and we can tell you that it's possible to install Debian 7 "Wheezy", Debian 8 "Jessie", Debian 9 "Stretch" and Debian Sid, Kali Linux Rolling, as well as Ubuntu 12.04 LTS, Ubuntu 14.04 LTS, and Ubuntu 16.04 LTS.

`sh -e /Downloads/crouton -r list -  _will list supported distros_ 
sh -e /Downloads/crouton -t list -  _will list supported desktops_` 

Crouton will also list a bunch of older releases of Debian, Kali and Ubuntu, which are upstream end-of-life (all of them being marked with an exclamation mark after their name) and which you should not install because of security risks, as well as two unsupported versions of Ubuntu, namely Ubuntu 16.10 and Ubuntu 17.04.

The developers of Crouton say that these "unsupported" Ubuntu release may work with some effort, but I took my chance and installed Ubuntu 17.04 (Zesty Zapus) with the GNOME 3.24 desktop environment (without any extra apps) using the following command. I put the "-e" parameter to encrypt the installation.

`sh -e /Downloads/crouton -e -r zesty -t gnome`

It will take a few minutes for everything to be downloaded and installed in the chrooted environment that Crouton will create inside your Chromebook so, again, be patient. When it's done, you'll know it, and you'll be able to start Ubuntu 17.04 with GNOME by running the following command at the shell prompt.

`sudo startgnome`

And voila! I'm running Ubuntu 17.04 (Zesty Zapus) with the GNOME 3.24 desktop environment on my old Acer Chromebook 11 (C740), which Google is yet to support with Android apps. The best part is that I can easily switch between Chrome OS and Ubuntu 17.04 using the CTRL+ALT+Shift+Back/Forward keyboard shortcuts.

As an ending note, I would like to bring to your attention that because your Chromebook is now always in Developer Mode, you will always see a warning screen saying "OS verification is OFF - Press SPACE to re-enable" when the battery dies or you shut down and turn on the device, so press CTRL+D when you see that screen to boot. Have fun!

[Ubuntu 17.04][9]
[GNOME 3.24][10]
[Chromebook][11]
[Acer Chrombook 11][12]
[Linux][13]

### Ubuntu 17.04 on Acer Chrombook 11 (4 Images)

 [![Ubuntu 17.04 with GNOME 3.24 running on Acer Chromebook 11 (C740)](http://i1-news.softpedia-static.com/images/fitted/620x/how-to-install-ubuntu-17-04-with-gnome-on-your-chromebook-alongside-chrome-os-516624-2.jpg)][18]  [![GNOME 3.24 desktop - System menu](http://i1-news.softpedia-static.com/images/newsrsz/how-to-install-ubuntu-17-04-with-gnome-on-your-chromebook-alongside-chrome-os-516624-3.jpg)][14]  [![GNOME 3.24 desktop - Calendar applet](http://i1-news.softpedia-static.com/images/newsrsz/how-to-install-ubuntu-17-04-with-gnome-on-your-chromebook-alongside-chrome-os-516624-4.jpg)][15]  [![GNOME 3.24 desktop - Overview mode](http://i1-news.softpedia-static.com/images/newsrsz/how-to-install-ubuntu-17-04-with-gnome-on-your-chromebook-alongside-chrome-os-516624-5.jpg)][16]

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/how-to-install-ubuntu-17-04-with-gnome-on-your-chromebook-alongside-chrome-os-516624.shtml

作者：[ Marius Nestor ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://news.softpedia.com/editors/browse/marius-nestor
[1]:http://news.softpedia.com/news/here-s-how-to-install-any-linux-operating-system-on-your-chromebook-506212.shtml
[2]:https://goo.gl/fd3zc
[3]:http://news.softpedia.com/editors/browse/marius-nestor
[4]:http://news.softpedia.com/news/how-to-install-ubuntu-17-04-with-gnome-on-your-chromebook-alongside-chrome-os-516624.shtml#
[5]:https://share.flipboard.com/bookmarklet/popout?v=2&title=Chromebook+Dual+Boot+How-to%3A+Ubuntu+17.04+GNOME+and+Chrome+OS&url=http%3A%2F%2Fnews.softpedia.com%2Fnews%2Fhow-to-install-ubuntu-17-04-with-gnome-on-your-chromebook-alongside-chrome-os-516624.shtml&t=1498358928&utm_campaign=widgets&utm_medium=web&utm_source=flipit&utm_content=news.softpedia.com
[6]:http://news.softpedia.com/news/how-to-install-ubuntu-17-04-with-gnome-on-your-chromebook-alongside-chrome-os-516624.shtml#
[7]:http://twitter.com/intent/tweet?related=softpedia&via=mariusnestor&text=Chromebook+Dual+Boot+How-to%3A+Ubuntu+17.04+GNOME+and+Chrome+OS&url=http%3A%2F%2Fnews.softpedia.com%2Fnews%2Fhow-to-install-ubuntu-17-04-with-gnome-on-your-chromebook-alongside-chrome-os-516624.shtml
[8]:https://plus.google.com/share?url=http://news.softpedia.com/news/how-to-install-ubuntu-17-04-with-gnome-on-your-chromebook-alongside-chrome-os-516624.shtml
[9]:http://news.softpedia.com/newsTag/Ubuntu%2017.04
[10]:http://news.softpedia.com/newsTag/GNOME%203.24
[11]:http://news.softpedia.com/newsTag/Chromebook
[12]:http://news.softpedia.com/newsTag/Acer%20Chrombook%2011
[13]:http://news.softpedia.com/newsTag/Linux
[14]:http://i1-news.softpedia-static.com/images/news2/how-to-install-ubuntu-17-04-with-gnome-on-your-chromebook-alongside-chrome-os-516624-3.jpg
[15]:http://i1-news.softpedia-static.com/images/news2/how-to-install-ubuntu-17-04-with-gnome-on-your-chromebook-alongside-chrome-os-516624-4.jpg
[16]:http://i1-news.softpedia-static.com/images/news2/how-to-install-ubuntu-17-04-with-gnome-on-your-chromebook-alongside-chrome-os-516624-5.jpg
[17]:https://twitter.com/intent/follow?screen_name=mariusnestor
[18]:http://i1-news.softpedia-static.com/images/news2/how-to-install-ubuntu-17-04-with-gnome-on-your-chromebook-alongside-chrome-os-516624-2.jpg

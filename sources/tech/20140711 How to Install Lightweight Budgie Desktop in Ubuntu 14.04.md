How to Install Lightweight Budgie Desktop in Ubuntu 14.04
================================================================================
**If you follow us over on Twitter you may have caught a glimpse of a screenshot we shared recently, along with the invitation to name the desktop environment pictured. **

Did you guess correctly? The answer is [Budgie][1] — a simple desktop designed for, but not exclusive to, an openSUSE-based Linux distribution called Evolve OS.

![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/07/BsCvTxJIcAAPjUR.png-large.png)

We first wrote about Budgie back in March and were suitably bowled over by both the clean, minimal aesthetic and nimble framework, but also by the decision to reuse common components and the standard stack of GNOME 3.10 technologies readily available in most modern distributions.

I’m a huge admirer of the development choices taken by the project lead, Ikey Doherty. There’s no denying that forking has its merits, but by deciding to favour upstream projects whole project is able to move faster, both development-wise (less technical debt) and in being available for users (easier to run on other distributions).

Politics of choice aside, the desktop is clean and minimal with a nod to the Ash desktop of Google’s Chrome OS. If you don’t mind a few rough edges, its well worth a play with. But how do you install Budgie on Ubuntu?

### Unofficial PPA is Unofficial ###

Open source being what it is means if you have a bit of terminal know-how you can grab the source and get it up and running with a bit of wily compiling.

But if you’re too lazy for that and happen to be running Ubuntu 14.04 LTS (or a distro based on it) you can get it the easy way.

Just add one **unofficial PPA**, refresh your Software Sources and then install. A few minutes later and you’ll have both a new uncle in the family by the [name of Bob][2] and a new desktop shell to play with.

### Add the Budgie PPA ###

With a terminal window open copy and paste the following commands carefully, entering your password when/if prompted:

    sudo add-apt-repository ppa:sukso96100/budgie-desktop
    sudo apt-get update && sudo apt-get install budgie-desktop

### Log into the Budgie Session ###

After installation you’ll be able to select ‘Budgie’ from the session selector of the Unity Greeter. (Don’t forget to change this back to a stable DE at a later date.)

### Notes ###

**Budgie is not stable, finished nor is it officially supported on Ubuntu**. It is in active development and features remain missing, including, but not limited to: no network management support, no volume control applet (keyboard keys will work fine), no notification system and no way to ‘pin’ apps to the task bar.

It also doesn’t play too nicely with Ubuntu’s overlay scrollbars, some GTK themes, and session management (e.g., logout, restart, etc.) on distributions using Upstart (like Ubuntu, [though that’s changing][3]) does not work.

As a workaround you can disable overlay scrollbars, set a different default theme and quit a session from the terminal using the following command:

    gnome-session-quit

With all of those caveats in mind, I’d suggest those whose sanity hinges on a stable, dependable system avoid using it for now.

But for the rest of you crazy folks? Well, let us know what you think of it in the comments below. I’m off to let Bob in.

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2014/07/install-budgie-evolve-os-desktop-ubuntu-14-04

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.omgubuntu.co.uk/2014/03/budgie-desktop-chrome-os-like
[2]:http://en.wikipedia.org/wiki/Bob
[3]:http://www.omgubuntu.co.uk/2014/02/ubuntu-debian-switching-systemd
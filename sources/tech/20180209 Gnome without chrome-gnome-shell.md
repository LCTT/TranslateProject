Gnome without chrome-gnome-shell
======

New laptop, has a touchscreen, can be folded into a tablet, I heard gnome-shell would be a good choice of desktop environment, and I managed to tweak it enough that I can reuse existing habits.

I have a big problem, however, with how it encourages one to download random extensions off the internet and run them as part of the whole desktop environment. I have an even bigger problem with [gnome-core][1] having a hard dependency on [chrome-gnome-shell][2], a plugin which cannot be disabled without root editing files in `/etc`, which exposes parts of my destktop environment to websites.

Visit [this site][3] and it will know which extensions you have installed, and it will be able to install more. I do not trust that, I do not need that, I do not want that. I am horrified by the idea of that.

[I made a workaround.][4]

How can one do the same for firefox?

### Description

chrome-gnome-shell is a hard dependency of gnome-core, and it installs a browser plugin that one may not want, and mandates its use by system-wide chrome policies.

I consider having chrome-gnome-shell an unneeded increase of the attack surface of my system, in exchange for the dubious privilege of being able to download and execute, as my main user, random unreviewed code.

This package satifies the chrome-gnome-shell dependency, but installs nothing.

Note that after installing this package you need to purge chrome-gnome-shell if it was previously installed, to have it remove its chromium policy files in /etc/chromium

### Instructions
```
apt install equivs
equivs-build contain-gnome-shell
sudo dpkg -i contain-gnome-shell_1.0_all.deb
sudo dpkg --purge chrome-gnome-shell

```


--------------------------------------------------------------------------------

via: http://www.enricozini.org/blog/2018/debian/gnome-without-chrome-gnome-shell/

作者：[Enrico Zini][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.enricozini.org/
[1]:https://packages.debian.org/gnome-core
[2]:https://packages.debian.org/chrome-gnome-shell
[3]:https://extensions.gnome.org/
[4]:https://salsa.debian.org/enrico/contain-gnome-shell

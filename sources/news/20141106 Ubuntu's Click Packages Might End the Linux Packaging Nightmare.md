Ubuntu's Click Packages Might End the Linux Packaging Nightmare
================================================================================
> It's time to have one type of package for all distros

**The new Click packages that are already used on the Ubunu Touch platform by Canonical are also coming to the desktop and they might be able to change the Linux packaging paradigm.**

![](http://i1-news.softpedia-static.com/images/news2/Ubuntu-s-Click-Packages-Might-End-the-Linux-Packaging-Nightmare-464271-3.jpg)

Ubuntu is the most used Linux operating system, so it's very likely that, if something really catches on with users of this distribution, it will probably shake things up in the Linux ecosystem as well. For now, the app packaging for Linux operating systems is a mess. It has improved over the years, but it still poses many problems.

There isn't any kind of unification and different distros use different packages. Debian-based distros use .deb and Fedora-based ones use .rpm, but you can also find packages with .sh or .run. The main problem is that they depend very much on the libraries that are already installed or available in the repos. Even if you have a .deb file for your Ubuntu system, it's not a guarantee that it will work. It might very well depend on a library that's not available for that particular version.

### One package to rule them all ###

For now, only the Ubuntu SDK can make Click packages, but they present some advantages over regular ones. For example, they are much safer than regular packages, mostly because there are no maintainer scripts that can run as root. In conjunction with the Ubuntu Software Center and Apparmor, the Click packages are pretty safe.

One of the best features of Click packages is that they have no external dependencies, which means that you can basically run them on any system, regardless of the available libraries installed or in the repositories. Martin Albisetti from Canonical explains this feature in more detail on his [blog][1].

"Clicks, by design, can't express any external dependencies other than a base system (called a 'framework'). That means that if your app depends on a fancy library that isn't shipped by default, you just bundle it into the Click package and you're set. You get to update it whenever it suits you as a developer, and have predictability over how it will run on a user's computer (or device!). That opens up the possibility of shipping newer versions of a library, or just sticking with one that works for you."

Another cool feature is that Click packages for different versions of the same app can be run on the same system. There are numerous applications out there that need to be alone on the system, otherwise they create problems for users, but the confinement provided by Click packages solves this issue.

These are just a few of the features that are already implemented. It will take a while until they reach the desktop, however. They will land along with Unity 8, but they are coming nonetheless. We can only hope that other distros will adopt this kind of format and not do their own similar thing, which would preserve the current packaging problems. 

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/Ubuntu-s-Click-Packages-Might-End-the-Linux-Packaging-Nightmare-464271.shtml

作者：[Silviu Stahie][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://news.softpedia.com/editors/browse/silviu-stahie
[1]:http://beuno.com.ar/archives/334
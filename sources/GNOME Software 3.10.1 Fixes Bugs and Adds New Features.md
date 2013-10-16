GNOME Software 3.10.1 Fixes Bugs and Adds New Features
================================================================================
**The GNOME Project has announced last evening, October 14, that the first maintenance release for the recently introduced GNOME Software application for the GNOME 3.10 desktop environment is available for download/upgrade.**

![](http://i1-news.softpedia-static.com/images/news2/GNOME-Software-3-10-1-Fixes-Bugs-and-Adds-New-Features-391284-2.jpg)

GNOME Software 3.10.1 is a maintenance release that mostly fixes bugs reported by users who had the chance to test this new application, which was originally introduced with the release of the GNOME 3.10 desktop environment.

However, the new release of GNOME Software also introduces some new features, among which we can mention a loading icon for empty tiles, support for the new 16:9 screenshots format, support for per-repo icon directories, support the 'X-AppInstall-Package' extension in desktop files, and the IBus frameworks installed by default are marked as system apps.

The hardcoded ratings and screenshot plugins were removed from this version of GNOME Software, with the mention that they will not be available until the release of the GNOME 3.12 desktop environment, next year.

Among the bugs fixed in GNOME Software 3.10.1, we can mention re-implementation of the hover state to feature tile, strings in the AppData file are now translatable, memory corruption is now prevented when doing dedupe() more than once, notify::state is no longer transmitted from a thread, and the "Remove" option is now displayed for installed apps that are updatable.

Moreover, a critical error has been fixed in gs_string_replace(), some small memory leaks were fixed, a refcounting error, which could cause a crash, has been fixed, the application widget will no longer be removed twice when it changes state, and local applications have names, icons and comments.

Last but not least, the following translations have been updated in this release: Indonesian, Latvian, Brazilian Portuguese, Czech, Hungarian, Italian, Polish, Slovenian, Spanish, and Traditional Chinese. More details can be found in the official raw [changelog][1].

- [GNOME 3.10.1 tar.xz][2][sources] [1.40 MB]


--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/GNOME-Software-3-10-1-Fixes-Bugs-and-Adds-New-Features-391284.shtml

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

[1]:http://ftp.acc.umu.se/pub/GNOME/sources/gnome-software/3.10/gnome-software-3.10.1.news
[2]:http://ftp.acc.umu.se/pub/GNOME/sources/gnome-software/3.10/gnome-software-3.10.1.tar.xz
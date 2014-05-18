Translating by GoLinux!

Git 1.9.3 Version Control System Officially Released
================================================================================
![](http://i1-news.softpedia-static.com/images/news2/Git-1-9-3-Version-Control-System-Officially-Released-441600-2.jpg)

**Git 1.9.3, a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency, is now available for download.**

The new Git 1.9.x branch continues the trend of large releases, integrating a big number of changes and fixes. This latest build in the branch is a little bit smaller than what we were expecting, but it does feature some interesting changes. If you are using Git, you might consider to update to the new version.

According to the developers, "git p4" dealing with changes in binary files was broken by a change in 1.9 release, but it has been fixed. The shell prompt script (in contrib/), when using the PROMPT_COMMAND interface, no longer uses an unsafe construct when showing the branch name in $PS, and "git rebase" no longer uses a POSIX shell construct.

Also, some more Unicode codepoints defined in Unicode 6.3 as having zero width have been fixed, and some tests used shell constructs that did not work well on FreeBSD, but they have been fixed.

For a complete list of changes, check out the [changelog][1].

### download Git 1.9.3 ###

- [tar.gz][2][sources] [4.60 MB]
- [Debian/Ubuntu DEB ALL][3][ubuntu_deb] [0 KB]
- [Red Hat/Fedora/Mandriva/openSUSE RPM noarch][4][rh_rpm] [0 KB]

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/Git-1-9-3-Version-Control-System-Officially-Released-441600.shtml

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://github.com/git/git/blob/master/Documentation/RelNotes/1.9.3.txt
[2]:https://github.com/git/git/archive/v1.9.3.tar.gz
[3]:http://git-scm.com/download/linux
[4]:http://git-scm.com/download/linux

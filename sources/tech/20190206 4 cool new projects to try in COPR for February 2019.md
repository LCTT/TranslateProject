[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (4 cool new projects to try in COPR for February 2019)
[#]: via: (https://fedoramagazine.org/4-cool-new-projects-to-try-in-copr-for-february-2019/)
[#]: author: (Dominik Turecek https://fedoramagazine.org)

4 cool new projects to try in COPR for February 2019
======

![](https://fedoramagazine.org/wp-content/uploads/2017/08/4-copr-945x400.jpg)

COPR is a [collection][1] of personal repositories for software that isn’t carried in Fedora. Some software doesn’t conform to standards that allow easy packaging. Or it may not meet other Fedora standards, despite being free and open source. COPR can offer these projects outside the Fedora set of packages. Software in COPR isn’t supported by Fedora infrastructure or signed by the project. However, it can be a neat way to try new or experimental software.

Here’s a set of new and interesting projects in COPR.

### CryFS

[CryFS][2] is a cryptographic filesystem. It is designed for use with cloud storage, mainly Dropbox, although it works with other storage providers as well. CryFS encrypts not only the files in the filesystem, but also metadata, file sizes and directory structure.

#### Installation instructions

The repo currently provides CryFS for Fedora 28 and 29, and for EPEL 7. To install CryFS, use these commands:

```
sudo dnf copr enable fcsm/cryfs
sudo dnf install cryfs
```

### Cheat

[Cheat][3] is a utility for viewing various cheatsheets in command-line, aiming to help remind usage of programs that are used only occasionally. For many Linux utilities, cheat provides cheatsheets containing condensed information from man pages, focusing mainly on the most used examples. In addition to the built-in cheatsheets, cheat allows you to edit the existing ones or creating new ones from scratch.

![][4]

#### Installation instructions

The repo currently provides cheat for Fedora 28, 29 and Rawhide, and for EPEL 7. To install cheat, use these commands:

```
sudo dnf copr enable tkorbar/cheat
sudo dnf install cheat
```

### Setconf

[Setconf][5] is a simple program for making changes in configuration files, serving as an alternative for sed. The only thing setconf does is that it finds the key in the specified file and changes its value. Setconf provides only a few options to change its behavior — for example, uncommenting the line that is being changed.

#### Installation instructions

The repo currently provides setconf for Fedora 27, 28 and 29. To install setconf, use these commands:

```
sudo dnf copr enable jamacku/setconf
sudo dnf install setconf
```

### Reddit Terminal Viewer

[Reddit Terminal Viewer][6], or rtv, is an interface for browsing Reddit from terminal. It provides the basic functionality of Reddit, so you can log in to your account, view subreddits, comment, upvote and discover new topics. Rtv currently doesn’t, however, support Reddit tags.

![][7]

#### Installation instructions

The repo currently provides Reddit Terminal Viewer for Fedora 29 and Rawhide. To install Reddit Terminal Viewer, use these commands:

```
sudo dnf copr enable tc01/rtv
sudo dnf install rtv
```


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/4-cool-new-projects-to-try-in-copr-for-february-2019/

作者：[Dominik Turecek][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org
[b]: https://github.com/lujun9972
[1]: https://copr.fedorainfracloud.org/
[2]: https://www.cryfs.org/
[3]: https://github.com/chrisallenlane/cheat
[4]: https://fedoramagazine.org/wp-content/uploads/2019/01/cheat.png
[5]: https://setconf.roboticoverlords.org/
[6]: https://github.com/michael-lazar/rtv
[7]: https://fedoramagazine.org/wp-content/uploads/2019/01/rtv.png

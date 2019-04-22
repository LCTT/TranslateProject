[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (4 cool new projects to try in COPR for April 2019)
[#]: via: (https://fedoramagazine.org/4-cool-new-projects-to-try-in-copr-for-april-2019/)
[#]: author: (Dominik Turecek https://fedoramagazine.org/author/dturecek/)

4 cool new projects to try in COPR for April 2019
======

![][1]

COPR is a [collection][2] of personal repositories for software that isn’t carried in Fedora. Some software doesn’t conform to standards that allow easy packaging. Or it may not meet other Fedora standards, despite being free and open source. COPR can offer these projects outside the Fedora set of packages. Software in COPR isn’t supported by Fedora infrastructure or signed by the project. However, it can be a neat way to try new or experimental software.

Here’s a set of new and interesting projects in COPR.

### Joplin

[Joplin][3] is a note-taking and to-do app. Notes are written in the Markdown format, and organized by sorting them into various notebooks and using tags.
Joplin can import notes from any Markdown source or exported from Evernote. In addition to the desktop app, there’s an Android version with the ability to synchronize notes between them — using Nextcloud, Dropbox or other cloud services. Finally, there’s a browser extension for Chrome and Firefox to save web pages and screenshots.

![][4]

#### Installation instructions

The [repo][5] currently provides Joplin for Fedora 29 and 30, and for EPEL 7. To install Joplin, use these commands [with sudo][6]:

```
sudo dnf copr enable taw/joplin
sudo dnf install joplin
```

### Fzy

[Fzy][7] is a command-line utility for fuzzy string searching. It reads from a standard input and sorts the lines based on what is most likely the sought after text, and then prints the selected line. In addition to command-line, fzy can be also used within vim. You can try fzy in this online [demo][8].

#### Installation instructions

The [repo][9] currently provides fzy for Fedora 29, 30, and Rawhide, and other distributions. To install fzy, use these commands:

```
sudo dnf copr enable lehrenfried/fzy
sudo dnf install fzy
```

### Fondo

Fondo is a program for browsing many photographs from the [unsplash.com][10] website. It has a simple interface that allows you to look for pictures of one of several themes, or all of them at once. You can then set a found picture as a wallpaper with a single click, or share it.

  * ![][11]



#### Installation instructions

The [repo][12] currently provides Fondo for Fedora 29, 30, and Rawhide. To install Fondo, use these commands:

```
sudo dnf copr enable atim/fondo
sudo dnf install fondo
```

### YACReader

[YACReader][13] is a digital comic book reader that supports many comics and image formats, such as _cbz_ , _cbr_ , _pdf_ and others. YACReader keeps track of reading progress, and can download comics’ information from [Comic Vine.][14] It also comes with a YACReader Library for organizing and browsing your comic book collection.

  * ![][15]



#### Installation instructions

The [repo][16] currently provides YACReader for Fedora 29, 30, and Rawhide. To install YACReader, use these commands:

```
sudo dnf copr enable atim/yacreader
sudo dnf install yacreader
```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/4-cool-new-projects-to-try-in-copr-for-april-2019/

作者：[Dominik Turecek][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/dturecek/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2017/08/4-copr-945x400.jpg
[2]: https://copr.fedorainfracloud.org/
[3]: https://joplin.cozic.net/
[4]: https://fedoramagazine.org/wp-content/uploads/2019/04/joplin.png
[5]: https://copr.fedorainfracloud.org/coprs/taw/joplin/
[6]: https://fedoramagazine.org/howto-use-sudo/
[7]: https://github.com/jhawthorn/fzy
[8]: https://jhawthorn.github.io/fzy-demo/
[9]: https://copr.fedorainfracloud.org/coprs/lehrenfried/fzy/
[10]: https://unsplash.com/
[11]: https://fedoramagazine.org/wp-content/uploads/2019/04/fondo.png
[12]: https://copr.fedorainfracloud.org/coprs/atim/fondo/
[13]: https://www.yacreader.com/
[14]: https://comicvine.gamespot.com/
[15]: https://fedoramagazine.org/wp-content/uploads/2019/04/yacreader.png
[16]: https://copr.fedorainfracloud.org/coprs/atim/yacreader/

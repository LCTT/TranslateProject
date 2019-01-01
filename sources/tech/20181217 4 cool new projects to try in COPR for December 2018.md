[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (4 cool new projects to try in COPR for December 2018)
[#]: via: (https://fedoramagazine.org/4-try-copr-december-2018/)
[#]: author: (Dominik Turecek https://fedoramagazine.org)

4 cool new projects to try in COPR for December 2018
======
![](https://fedoramagazine.org/wp-content/uploads/2017/08/4-copr-945x400.jpg)

COPR is a [collection][1] of personal repositories for software that isn’t carried in Fedora. Some software doesn’t conform to standards that allow easy packaging. Or it may not meet other Fedora standards, despite being free and open source. COPR can offer these projects outside the Fedora set of packages. Software in COPR isn’t supported by Fedora infrastructure or signed by the project. However, it can be a neat way to try new or experimental software.

Here’s a set of new and interesting projects in COPR.

### MindForger

[MindForger][2] is a Markdown editor and a notebook. In addition to features you’d expect from a Markdown editor, MindForger lets you split a single file into multiple notes. It’s easy to organize the notes and move them around between files, as well as search through them. I’ve been using MindForger for some time for my study notes, so it’s nice that it’s available through COPR now.![][3]

#### Installation instructions

The repo currently provides MindForger for Fedora 29 and Rawhide. To install MindForger, use these commands:

```
sudo dnf copr enable deadmozay/mindforger
sudo dnf install mindforger
```

### Clingo

[Clingo][4] is a program for solving logical problems using [answer set programming][5] (ASP) modeling language. With ASP, you can declaratively describe a problem as a logical program that Clingo then solves. As a result, Clingo produces solutions to the problem in the form of logical models, called answer sets.

#### Installation instructions

The repo currently provides Clingo for Fedora 28 and 29. To install Clingo, use these commands:

```
sudo dnf copr enable timn/clingo
sudo dnf install clingo
```

### SGVrecord

[SGVrecord][6] is a simple tool for recording your screen. It allows you to either capture the whole screen or select just a part of it. Furthermore, it is possible to make the record with or without sound. Sgvrecord produces files in WebM format.![][7]

#### Installation instructions

The repo currently provides SGVrecord for Fedora 28, 29, and Rawhide. To install SGVrecord, use these commands:

```
sudo dnf copr enable youssefmsourani/sgvrecord
sudo dnf install sgvrecord
```

### Watchman

[Watchman][8] is a service for monitoring and recording when changes are done to files.
You can specify directory trees for Watchman to monitor, as well as define actions
that are triggered when specified files are changed.

#### Installation instructions

The repo currently provides Watchman for Fedora 29 and Rawhide. To install Watchman, use these commands:

```
sudo dnf copr enable eklitzke/watchman
sudo dnf install watchman
```


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/4-try-copr-december-2018/

作者：[Dominik Turecek][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org
[b]: https://github.com/lujun9972
[1]: https://copr.fedorainfracloud.org/
[2]: https://www.mindforger.com/
[3]: https://fedoramagazine.org/wp-content/uploads/2018/12/mindforger.png
[4]: https://potassco.org/clingo/
[5]: https://en.wikipedia.org/wiki/Answer_set_programming
[6]: https://github.com/yucefsourani/sgvrecord
[7]: https://fedoramagazine.org/wp-content/uploads/2018/12/SGVrecord.png
[8]: https://facebook.github.io/watchman/

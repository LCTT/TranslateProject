[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (4 cool new projects to try in COPR for May 2020)
[#]: via: (https://fedoramagazine.org/4-cool-new-projects-to-try-in-copr-for-april-2020/)
[#]: author: (Dominik Turecek https://fedoramagazine.org/author/dturecek/)

4 cool new projects to try in COPR for May 2020
======

![][1]

COPR is a [collection][2] of personal repositories for software that isn’t carried in Fedora. Some software doesn’t conform to standards that allow easy packaging. Or it may not meet other Fedora standards, despite being free and open source. COPR can offer these projects outside the Fedora set of packages. Software in COPR isn’t supported by Fedora infrastructure or signed by the project. However, it can be a neat way to try new or experimental software.

This article presents a few new and interesting projects in COPR. If you’re new to using COPR, see the [COPR User Documentation][3] for how to get started.

### Ytop

[Ytop][4] is a command-line system monitor similar to _htop_. The main difference between them is that _ytop_, on top of showing processes and their CPU and memory usage, shows graphs of system CPU, memory, and network usage over time. Additionally, _ytop_ shows disk usage and temperatures of the machine. Finally, _ytop_ supports multiple color schemes as well as an option to create new ones.

![][5]

#### Installation instructions

The [repo][6] currently provides _ytop_ for Fedora 30, 31, 32, and Rawhide, as well as EPEL 7. To install _ytop_, use these commands [with _sudo_][7]:

```
sudo dnf copr enable atim/ytop
sudo dnf install ytop
```

### Ctop

[Ctop][8] is yet another command-line system monitor. However, unlike _htop_ and _ytop_, _ctop_ focuses on showing resource usage of containers. _Ctop_ shows both an overview of CPU, memory, network and disk usage of all containers running on your machine, and more comprehensive information about a single container, including graphs of resource usage over time. Currently, _ctop_ has support for Docker and runc containers.

![][9]

#### Installation instructions

The [repo][10] currently provides _ctop_ for Fedora 31, 32 and Rawhide, EPEL 7, as well as for other distributions. To install _ctop_, use these commands:

```
sudo dnf copr enable fuhrmann/ctop
sudo dnf install ctop
```

### Shortwave

[Shortwave][11] is a program for listening to radio stations. Shortwave uses a community database of radio stations [www.radio-browser.info][12]. In this database, you can discover or search for radio stations, add them to your library, and listen to them. Additionally, Shortwave provides information about currently playing song and can record the songs as well.

![][13]

#### Installation instructions

The [repo][14] currently provides Shortwave for Fedora 31, 32, and Rawhide. To install Shortwave, use these commands:

```
sudo dnf copr enable atim/shortwave
sudo dnf install shortwave
```

### Setzer

[Setzer][15] is a LaTeX editor that can build pdf documents and view them as well. It provides templates for various types of documents, such as articles or presentation slides. Additionally, Setzer has buttons for a lot of special symbols, math symbols and greek letters.

![][16]

#### Installation instructions

The [repo][17] currently provides Setzer for Fedora 30, 31, 32, and Rawhide. To install Setzer, use these commands:

```
sudo dnf copr enable lyessaadi/setzer
sudo dnf install setzer
```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/4-cool-new-projects-to-try-in-copr-for-april-2020/

作者：[Dominik Turecek][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/dturecek/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2017/08/4-copr-945x400.jpg
[2]: https://copr.fedorainfracloud.org/
[3]: https://docs.pagure.org/copr.copr/user_documentation.html#
[4]: https://github.com/cjbassi/ytop
[5]: https://fedoramagazine.org/wp-content/uploads/2020/04/ytop.png
[6]: https://copr.fedorainfracloud.org/coprs/atim/ytop/
[7]: https://fedoramagazine.org/howto-use-sudo/
[8]: https://github.com/bcicen/ctop
[9]: https://fedoramagazine.org/wp-content/uploads/2020/04/ctop.png
[10]: https://copr.fedorainfracloud.org/coprs/fuhrmann/ctop/
[11]: https://github.com/ranfdev/shortwave
[12]: http://www.radio-browser.info/gui/#!/
[13]: https://fedoramagazine.org/wp-content/uploads/2020/04/shortwave.png
[14]: https://copr.fedorainfracloud.org/coprs/atim/shortwave/
[15]: https://www.cvfosammmm.org/setzer/
[16]: https://fedoramagazine.org/wp-content/uploads/2020/04/setzer.png
[17]: https://copr.fedorainfracloud.org/coprs/lyessaadi/setzer/

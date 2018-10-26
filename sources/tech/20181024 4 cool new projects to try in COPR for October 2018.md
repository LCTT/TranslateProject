4 cool new projects to try in COPR for October 2018
======

![](https://fedoramagazine.org/wp-content/uploads/2017/08/4-copr-945x400.jpg)

COPR is a [collection][1] of personal repositories for software that isn’t carried in the standard Fedora repositories. Some software doesn’t conform to standards that allow easy packaging. Or it may not meet other Fedora standards, despite being free and open source. COPR can offer these projects outside the standard set of Fedora Fedora packages. Software in COPR isn’t supported by Fedora infrastructure or signed by the project. However, it can be a neat way to try new or experimental software.

Here’s a set of new and interesting projects in COPR.

### GitKraken

[GitKraken][2] is a useful git client for people who prefer a graphical interface over command-line, providing all the features you expect. Additionally, GitKraken can create repositories and files, and has a built-in editor. A useful feature of GitKraken is the ability to stage lines or hunks of files, and to switch between branches fast. However, in some cases, you may experience performance issues with larger projects.
![][3]

#### Installation instructions

The repo currently provides GitKraken for Fedora 27, 28, 29 and Rawhide, and for OpenSUSE Tumbleweed. To install GitKraken, use these commands:

```
sudo dnf copr enable elken/gitkraken
sudo dnf install gitkraken
```

### Music On Console

[Music On Console][4] player, or mocp, is a simple console audio player. It has an interface similar to the Midnight Commander and is easy use. You simply navigate to a directory with music files and select a file or directory to play. In addition, mocp provides a set of commands, allowing it to be controlled directly from command line.

![][5]

#### Installation instructions

The repo currently provides Music On Console player for Fedora 28 and 29. To install mocp, use these commands:

```
sudo dnf copr enable Krzystof/Moc
sudo dnf install moc
```

### cnping

[Cnping][6] is a small graphical ping tool for IPv4, useful for visualization of changes in round-trip time. It offers an option to control the time period between each packet as well as the size of data sent. In addition to the graph shown, cnping provides basic statistics on round-trip times and packet loss.![][7]

#### Installation instructions

The repo currently provides cnping for Fedora 27, 28, 29 and Rawhide. To install cnping, use these commands:

```
sudo dnf copr enable dreua/cnping
sudo dnf install cnping
```

### Pdfsandwich

[Pdfsandwich][8] is a tool for adding text to PDF files which contain text in an image form — such as scanned books. It uses optical character recognition (OCR) to create an additional layer with the recognized text behind the original page. This can be useful for copying and working with the text.

#### Installation instructions

The repo currently provides pdfsandwich for Fedora 27, 28, 29 and Rawhide, and for EPEL 7. To install pdfsandwich, use these commands:

```
sudo dnf copr enable merlinm/pdfsandwich
sudo dnf install pdfsandwich
```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/4-cool-new-projects-try-copr-october-2018/

作者：[Dominik Turecek][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org
[b]: https://github.com/lujun9972
[1]: https://copr.fedorainfracloud.org/
[2]: https://www.gitkraken.com/git-client
[3]: https://fedoramagazine.org/wp-content/uploads/2018/10/copr-gitkraken.png
[4]: http://moc.daper.net/
[5]: https://fedoramagazine.org/wp-content/uploads/2018/10/copr-mocp.png
[6]: https://github.com/cnlohr/cnping
[7]: https://fedoramagazine.org/wp-content/uploads/2018/10/copr-cnping.png
[8]: http://www.tobias-elze.de/pdfsandwich/

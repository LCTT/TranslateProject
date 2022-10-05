[#]: subject: "5 Great GUI Apps for Visual Disk Usage in Linux, Ubuntu [With Bonus]"
[#]: via: "https://www.debugpoint.com/apps-visual-disk-usage-linux-ubuntu-mint/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

5 Great GUI Apps for Visual Disk Usage in Linux, Ubuntu [With Bonus]
======
Review of five great apps to visually analyze disk space in Linux and Ubuntu systems.

### Five GUI Apps for Visual Disk Usage in Ubuntu and Other Linux

#### 1. Filelight

[Filelight][1], a GUI-based KDE app, provides a sunburst representation of disk usage. Instead of showing a tree view & list view of directories/files, it shows the usage in a concentric pie chart view representing each directory.

You can mouse over to a specific colour/pie to get the information about that specific segment. It also provides a way to dive deep into a particular segment to a single file level to analyze! This feature is pretty neat.

##### Features

• Scan local, remote or removable disks• Configurable colour schemes• File system navigation by mouse clicks• Information about files and directories on hovering• Files and directories can be copied or removed directly from the context menu

![Filelight Running in Ubuntu - one of the best and easy to use disk usage app for Linux][2]

##### How to Install Filelight

Filelight is available in Ubuntu software. Open the software and search for Filelight.ORYou can run the below commands from the terminal to install Filelight in all Ubuntu versions and [Linux Mint][3].

```
sudo apt install filelight
```

Also, you can install it via Flatpak. [Set up your application for Flatpak & Flathub repo][4], and then run the following to install it for all the supported Linux distributions.

```
flatpak install flathub org.kde.filelight
```

#### 2. DUC

*“Dude! Where are my bytes!”* – That’s the tagline of [DUC][5] – another disk usage visualization tool. Like Filelight, DUC also shows the visualization in a *sunburst* presentation.

DUC has some unique features, such as it comes with specific tools that enable you to query its internal database of disk data which it collected after analysis. Also, it has the flexibility to run via a command line and can be plugged into the web using CGI.

As per the documentation, DUC can also handle file systems with millions of files on petabytes of storage.

![DUC][6]

##### How to Install

To install DUC in Ubuntu, Linux Mint, run the below command from the terminal:

```
sudo apt install duc
```

After installation, DUC needs a setup. You have to build its own database by running the below command (for example: if you want to index the `/usr` directory):

```
duc index /usr
```

Once the index is completed, you can either use the below commands for the terminal view or the graphical view of the disk space analysis.

```
duc gui /usr
```

Or

```
duc ui /usr
```

#### 3. Xdiskusage

[xdiskusage][7] is user-friendly, a lightweight program that analyses disk and represents the results in a box-representation where the size of boxes represents the size of directories. It uses “du” and represents its output graphically.

When launched, you can either choose to analyze directories or files. Once loaded, you can start browsing by double-clicking the boxes to further analyse – deep down.

Here’s a screenshot of this visual disk usage app and how it works:

![xdiskusage Running in Ubuntu][8]

##### How to Install

You can run the below commands from the terminal to install xdiskusage in Ubuntu, Linux Mint and other derivatives.

```
sudo apt install xdiskusage
```

#### 4. QDirStat

[QDirStat][9] is a Qt-based directory/file system analyzer (the KDE version of this is KDirStat) which comes with a view of your file system in a heat-map style representation, including a tree view of the file system. This utility has an advantage over other utilities. It comes with a list of features to clean up your system, such as deletion and cleaning files from inside the utility.

It has a comprehensive list of options that helps you configure how you want to scan the system. For example, you can configure to scan music files with *.mp3 extensions.

![QDirStat Running][10]

##### How to Install

To install QDirStat in Ubuntu, Linux Mint, and other Ubuntu derivatives, run the below commands from the terminal:

```
sudo apt install qdirstat
```

#### 5. JdiskReport

[JdiskReport][11] is a Java-based disk analyzer that has a different way of representing your disk usage. It has a nice and user-friendly UI with the file system hierarchy at the left and the corresponding selection’s graphical representation of disk usage at the right.

It can display both circular ways of showing the disk space and rectangular bars. It also gives you some quick analysis such as –

* Top 50 large files
* Top 50 files which were changed recently
* Top 50 files which are old
* Size distribution in size ranges (e.g. 1 GB to 4 GB).
* Size distribution using modification days.
* The size distribution of file types.
* And obviously some cool colourful themes.

![JDiskReport Running in Ubuntu][12]

##### How to Install

Download JDiskReport from the below link and extract.

[Download JDiskReport][13]

Once extracted, run the .jar file. No installation is required.

JDiskReport requires Java run-time to work. If your Ubuntu Linux Mint system does not have Java run-time, install using the below command, or check out our guide on [how to install Java in Ubuntu Linux][14].

```
sudo apt install default-jre
```

#### Bonus App: NCDU

If you are comfortable in the Terminal, then you should always try [NCDU][15]. It’s an acronym for NCurses Disk Usage, which scans your system and provides you with an excellent terminal re-presentation of disk space status.

I think it’s perfect for those use cases where you need to log in via SSH or remotely to a server. And find out about disk usage where no desktop environment is available.

NCDU is simple, fast and can run in any POSIX-like environment.

It’s available for all major distros. These are the command you can use to install it.

```
sudo apt install ncdu
```

```
sudo dnf install ncdu
```

![ncdu][16]

### Wrapping Up

In this article, I have explained five apps that provide visual disk usage in Ubuntu and other major distros. Also, I have included a terminal-based app where you don’t have the option to use a graphical user interface.

I hope this helps you to find out which files/folders are consuming disk space and reclaim some lost disk space.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/apps-visual-disk-usage-linux-ubuntu-mint/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://utils.kde.org/projects/filelight
[2]: https://www.debugpoint.com/wp-content/uploads/2018/07/Filelight-Running-in-Ubuntu.png
[3]: https://www.debugpoint.com/linux-mint/
[4]: https://www.debugpoint.com/how-to-install-flatpak-apps-ubuntu-linux/
[5]: http://duc.zevv.nl/
[6]: https://www.debugpoint.com/wp-content/uploads/2018/07/DUC-Running.png
[7]: http://xdiskusage.sourceforge.net/
[8]: https://www.debugpoint.com/wp-content/uploads/2018/07/xdiskusage-Running-in-Ubuntu.png
[9]: https://github.com/shundhammer/qdirstat
[10]: https://www.debugpoint.com/wp-content/uploads/2018/07/QDirStat-Running-.png
[11]: http://www.jgoodies.com/freeware/jdiskreport/
[12]: https://www.debugpoint.com/wp-content/uploads/2018/07/JDiskReport-Running-in-Ubuntu.png
[13]: http://www.jgoodies.com/download/jdiskreport/jdiskreport-1_4_1.zip
[14]: https://www.debugpoint.com/install-java-17-ubuntu-mint/
[15]: https://dev.yorhel.nl/ncdu
[16]: https://www.debugpoint.com/wp-content/uploads/2022/06/ncdu.jpg
[17]: https://www.debugpoint.com/string-processing-in-libreoffice-calc-macro-with-examples/
[18]: https://news.google.com/publications/CAAqBwgKMOCfmgsw-qmyAw
[19]: https://t.me/debugpoint

[#]: subject: "3 open source GUI disk usage analyzers for Linux"
[#]: via: "https://opensource.com/article/22/7/gui-disk-usage-analyzers-linux"
[#]: author: "Don Watkins https://opensource.com/users/don-watkins"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

3 open source GUI disk usage analyzers for Linux
======
For people who prefer visual representations, these GUI-based tools help you understand how your storage capacity is used.

![metrics and data shown on a computer screen][1]

Image by: Opensource.com

Several great options for checking disk usage on your Linux system have a graphical interface. Sometimes the visual representation of disk utilization is easier or newer users may not be as familiar with the various Linux commands that display storage information. I am a person who comprehends visual representations more easily than the printout on the command line.

Here are several excellent GUI-based tools to help you understand how your storage capacity is used.

### GNOME Disk Usage Analyzer

My Pop!_OS system relies on the [GNOME Disk Usage Analyzer][2], and they call it "Disk Usage Analyzer."

The GNOME Disk Usage Analyzer is also known as [Baobab][3]. It scans folders and devices, then reports the disk space used by each item. The graphical representation below is a report on my home directory. I can drill down into each directory by clicking on that item to learn more about the details of the files it contains.

![GNOME Disk Usage Analyzer on my home directory][4]

I clicked on my `Downloads` directory to display how much space files in that directory are consuming on my system.

![GNOME Disk Usage Analyzer on my Downloads directory][5]

GNOME Disk Usage Analyzer is licensed with GPL 2.0. It is under continuous development; the latest release was in September 2021.

### Filelight

There is another graphical option for the KDE desktop. It is called [Filelight][6], and it provides an interesting graphic of your Linux system. Initially released in 2004, the project has been under continual development. Its latest release was in December 2021, and the source code is available on [GitHub][7] under the [GNU Free Document License][8].

Here is a snapshot of my Linux laptop using Filelight.

![Filelight disk usage][9]

### QDirStat

A third graphical option to consider is [QDirStat][10]. It is licensed with GPL v. 2.0 and can be installed on all Linux systems.

According to its developers, "QDirStat is a graphical application to show where your disk space has gone and to help you to clean it up." QDirStat is available in [packages][11] for Debian, Ubuntu, Fedora, Arch, Manjaro, and SUSE.

![QDirState disk usage][12]

I easily installed QDirStat from the command line. It has an intuitive interface and provides a percentage of utilization of your file system.

### The terminal

Of course, if you don't enjoy graphical applications or need text output for a script, there are commands that analyze disk usage, too. The [du][13] and [ncdu][14] commands are easy to use and provide a different view (but the same information) of your file system.

### Wrap up

Today's storage devices are immense, but it is still necessary to be aware of how that capacity is used on your system. Whether you prefer command-line utilities or GUI tools, there are plenty of options available for Linux. Don't let storage space issues get you down—start using these tools today!

Image by: (Don Watkins, CC BY-SA 4.0)

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/7/gui-disk-usage-analyzers-linux

作者：[Don Watkins][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/metrics_data_dashboard_system_computer_analytics.png
[2]: https://wiki.gnome.org/Apps/DiskUsageAnalyzer
[3]: https://gitlab.gnome.org/GNOME/baobab
[4]: https://opensource.com/sites/default/files/2022-07/GNOME_dua.png
[5]: https://opensource.com/sites/default/files/2022-07/2GDUA-downloads.png
[6]: https://en.wikipedia.org/wiki/Filelight
[7]: https://github.com/KDE/filelight
[8]: https://github.com/KDE/filelight/commit/8f68599cd26515dfaaeef53a5809bae19c502863
[9]: https://opensource.com/sites/default/files/2022-07/filelight.png
[10]: https://github.com/shundhammer/qdirstat
[11]: https://github.com/shundhammer/qdirstat/blob/master/doc/Pkg-View.md
[12]: https://opensource.com/sites/default/files/2022-07/qdirstat.png
[13]: https://opensource.com/article/21/7/check-disk-space-linux-du
[14]: https://opensource.com/article/21/8/ncdu-check-free-disk-space-linux

[#]: collector: (lujun9972)
[#]: translator: (lnrCoder)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11503-1.html)
[#]: subject: (How to Get the Size of a Directory in Linux)
[#]: via: (https://www.2daygeek.com/find-get-size-of-directory-folder-linux-disk-usage-du-command/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

如何获取 Linux 中的目录大小
======

你应该已经注意到，在 Linux 中使用 [ls 命令][1] 列出的目录内容中，目录的大小仅显示 4KB。这个大小正确吗？如果不正确，那它代表什么，又该如何获取 Linux 中的目录或文件夹大小？这是一个默认的大小，是用来存储磁盘上存储目录的元数据的大小。

Linux 上有一些应用程序可以 [获取目录的实际大小][2]。其中，磁盘使用率（`du`）命令已被 Linux 管理员广泛使用。

我将向您展示如何使用各种选项获取文件夹大小。

### 什么是 du 命令?

[du 命令][3] 表示 <ruby>磁盘使用率<rt>Disk Usage</rt></ruby>。这是一个标准的 Unix 程序，用于估计当前工作目录中的文件空间使用情况。

它使用递归方式总结磁盘使用情况，以获取目录及其子目录的大小。

如同我说的那样, 使用 `ls` 命令时，目录大小仅显示 4KB。参见下面的输出。

```
$ ls -lh | grep ^d

drwxr-xr-x  3 daygeek daygeek 4.0K Aug  2 13:57 Bank_Details
drwxr-xr-x  2 daygeek daygeek 4.0K Mar 15  2019 daygeek
drwxr-xr-x  6 daygeek daygeek 4.0K Feb 16  2019 drive-2daygeek
drwxr-xr-x 13 daygeek daygeek 4.0K Jan  6  2019 drive-mageshm
drwxr-xr-x 15 daygeek daygeek 4.0K Sep 29 21:32 Thanu_Photos
```

### 1) 在 Linux 上如何只获取父目录的大小

使用以下 `du` 命令格式获取给定目录的总大小。在该示例中，我们将得到 `/home/daygeek/Documents` 目录的总大小。

```
$ du -hs /home/daygeek/Documents
或
$ du -h --max-depth=0 /home/daygeek/Documents/
20G    /home/daygeek/Documents
```

详细说明：

  * `du` – 这是一个命令
  * `-h` – 以易读的格式显示大小 (例如 1K 234M 2G)
  * `-s` – 仅显示每个参数的总数
  * `--max-depth=N` – 目录的打印深度

### 2) 在 Linux 上如何获取每个目录的大小

使用以下 `du` 命令格式获取每个目录（包括子目录）的总大小。

在该示例中，我们将获得每个 `/home/daygeek/Documents` 目录及其子目录的总大小。

```
$ du -h /home/daygeek/Documents/ | sort -rh | head -20

20G    /home/daygeek/Documents/
9.6G    /home/daygeek/Documents/drive-2daygeek
6.3G    /home/daygeek/Documents/Thanu_Photos
5.3G    /home/daygeek/Documents/Thanu_Photos/Camera
5.3G    /home/daygeek/Documents/drive-2daygeek/Thanu-videos
3.2G    /home/daygeek/Documents/drive-mageshm
2.3G    /home/daygeek/Documents/drive-2daygeek/Thanu-Photos
2.2G    /home/daygeek/Documents/drive-2daygeek/Thanu-photos-by-month
916M    /home/daygeek/Documents/drive-mageshm/Tanisha
454M    /home/daygeek/Documents/drive-mageshm/2g-backup
415M    /home/daygeek/Documents/Thanu_Photos/WhatsApp Video
300M    /home/daygeek/Documents/drive-2daygeek/Thanu-photos-by-month/Jan-2017
288M    /home/daygeek/Documents/drive-2daygeek/Thanu-photos-by-month/Oct-2017
226M    /home/daygeek/Documents/drive-2daygeek/Thanu-photos-by-month/Sep-2017
219M    /home/daygeek/Documents/Thanu_Photos/WhatsApp Documents
213M    /home/daygeek/Documents/drive-mageshm/photos
163M    /home/daygeek/Documents/Thanu_Photos/WhatsApp Video/Sent
161M    /home/daygeek/Documents/Thanu_Photos/WhatsApp Images
154M    /home/daygeek/Documents/drive-2daygeek/Thanu-photos-by-month/June-2017
150M    /home/daygeek/Documents/drive-2daygeek/Thanu-photos-by-month/Nov-2016
```

### 3) 在 Linux 上如何获取每个目录的摘要

使用如下 `du` 命令格式仅获取每个目录的摘要。

```
$ du -hs /home/daygeek/Documents/* | sort -rh | head -10

9.6G    /home/daygeek/Documents/drive-2daygeek
6.3G    /home/daygeek/Documents/Thanu_Photos
3.2G    /home/daygeek/Documents/drive-mageshm
756K    /home/daygeek/Documents/Bank_Details
272K    /home/daygeek/Documents/user-friendly-zorin-os-15-has-been-released-TouchInterface1.png
172K    /home/daygeek/Documents/user-friendly-zorin-os-15-has-been-released-NightLight.png
164K    /home/daygeek/Documents/ConfigServer Security and Firewall (csf) Cheat Sheet.pdf
132K    /home/daygeek/Documents/user-friendly-zorin-os-15-has-been-released-Todo.png
112K    /home/daygeek/Documents/user-friendly-zorin-os-15-has-been-released-ZorinAutoTheme.png
96K    /home/daygeek/Documents/distro-info.xlsx
```

### 4) 在 Linux 上如何获取每个目录的不含子目录的大小

使用如下 `du` 命令格式来展示每个目录的总大小，不包括子目录。

```
$ du -hS /home/daygeek/Documents/ | sort -rh | head -20

5.3G    /home/daygeek/Documents/Thanu_Photos/Camera
5.3G    /home/daygeek/Documents/drive-2daygeek/Thanu-videos
2.3G    /home/daygeek/Documents/drive-2daygeek/Thanu-Photos
1.5G    /home/daygeek/Documents/drive-mageshm
831M    /home/daygeek/Documents/drive-mageshm/Tanisha
454M    /home/daygeek/Documents/drive-mageshm/2g-backup
300M    /home/daygeek/Documents/drive-2daygeek/Thanu-photos-by-month/Jan-2017
288M    /home/daygeek/Documents/drive-2daygeek/Thanu-photos-by-month/Oct-2017
253M    /home/daygeek/Documents/Thanu_Photos/WhatsApp Video
226M    /home/daygeek/Documents/drive-2daygeek/Thanu-photos-by-month/Sep-2017
219M    /home/daygeek/Documents/Thanu_Photos/WhatsApp Documents
213M    /home/daygeek/Documents/drive-mageshm/photos
163M    /home/daygeek/Documents/Thanu_Photos/WhatsApp Video/Sent
154M    /home/daygeek/Documents/drive-2daygeek/Thanu-photos-by-month/June-2017
150M    /home/daygeek/Documents/drive-2daygeek/Thanu-photos-by-month/Nov-2016
127M    /home/daygeek/Documents/drive-2daygeek/Thanu-photos-by-month/Dec-2016
100M    /home/daygeek/Documents/drive-2daygeek/Thanu-photos-by-month/Oct-2016
94M    /home/daygeek/Documents/drive-2daygeek/Thanu-photos-by-month/Nov-2017
92M    /home/daygeek/Documents/Thanu_Photos/WhatsApp Images
90M    /home/daygeek/Documents/drive-2daygeek/Thanu-photos-by-month/Dec-2017
```

### 5) 在 Linux 上如何仅获取一级子目录的大小

如果要获取 Linux 上给定目录的一级子目录（包括其子目录）的大小，请使用以下命令格式。

```
$ du -h --max-depth=1 /home/daygeek/Documents/

3.2G    /home/daygeek/Documents/drive-mageshm
4.0K    /home/daygeek/Documents/daygeek
756K    /home/daygeek/Documents/Bank_Details
9.6G    /home/daygeek/Documents/drive-2daygeek
6.3G    /home/daygeek/Documents/Thanu_Photos
20G    /home/daygeek/Documents/
```

### 6) 如何在 du 命令输出中获得总计

如果要在 `du` 命令输出中获得总计，请使用以下 `du` 命令格式。

```
$ du -hsc /home/daygeek/Documents/* | sort -rh | head -10

20G    total
9.6G    /home/daygeek/Documents/drive-2daygeek
6.3G    /home/daygeek/Documents/Thanu_Photos
3.2G    /home/daygeek/Documents/drive-mageshm
756K    /home/daygeek/Documents/Bank_Details
272K    /home/daygeek/Documents/user-friendly-zorin-os-15-has-been-released-TouchInterface1.png
172K    /home/daygeek/Documents/user-friendly-zorin-os-15-has-been-released-NightLight.png
164K    /home/daygeek/Documents/ConfigServer Security and Firewall (csf) Cheat Sheet.pdf
132K    /home/daygeek/Documents/user-friendly-zorin-os-15-has-been-released-Todo.png
112K    /home/daygeek/Documents/user-friendly-zorin-os-15-has-been-released-ZorinAutoTheme.png
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/find-get-size-of-directory-folder-linux-disk-usage-du-command/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[lnrCoder](https://github.com/lnrCoder)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/linux-unix-ls-command-display-directory-contents/
[2]: https://www.2daygeek.com/how-to-get-find-size-of-directory-folder-linux/
[3]: https://www.2daygeek.com/linux-check-disk-usage-files-directories-size-du-command/

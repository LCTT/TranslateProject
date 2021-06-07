怎样解决 Ubuntu 中的 “sub process usr bin dpkg returned an error code 1” 错误
======

> 如果你在 Ubuntu Linux 上安装软件时遇到 “sub process usr bin dpkg returned an error code 1”，请按照以下步骤进行修复。

Ubuntu 和其他基于 Debian 的发行版中的一个常见问题是已经损坏的包。你尝试更新系统或安装新软件包时会遇到类似 “Sub-process /usr/bin/dpkg returned an error code” 的错误。

这就是前几天发生在我身上的事。我试图在 Ubuntu 中安装一个电台程序时，它给我了这个错误：

```
Unpacking python-gst-1.0 (1.6.2-1build1) ...
Selecting previously unselected package radiotray.
Preparing to unpack .../radiotray_0.7.3-5ubuntu1_all.deb ...
Unpacking radiotray (0.7.3-5ubuntu1) ...
Processing triggers for man-db (2.7.5-1) ...
Processing triggers for desktop-file-utils (0.22-1ubuntu5.2) ...
Processing triggers for bamfdaemon (0.5.3~bzr0+16.04.20180209-0ubuntu1) ...
Rebuilding /usr/share/applications/bamf-2.index...
Processing triggers for gnome-menus (3.13.3-6ubuntu3.1) ...
Processing triggers for mime-support (3.59ubuntu1) ...
Setting up polar-bookshelf (1.0.0-beta56) ...
ln: failed to create symbolic link '/usr/local/bin/polar-bookshelf': No such file or directory
dpkg: error processing package polar-bookshelf (--configure):
subprocess installed post-installation script returned error exit status 1
Setting up python-appindicator (12.10.1+16.04.20170215-0ubuntu1) ...
Setting up python-gst-1.0 (1.6.2-1build1) ...
Setting up radiotray (0.7.3-5ubuntu1) ...
Errors were encountered while processing:
polar-bookshelf
E: Sub-process /usr/bin/dpkg returned an error code (1)

```

这里最后三行非常重要。

```
Errors were encountered while processing:
polar-bookshelf
E: Sub-process /usr/bin/dpkg returned an error code (1)
```

它告诉我 polar-bookshelf 包引发了问题。这可能对你如何修复这个错误至关重要。

### 修复 Sub-process /usr/bin/dpkg returned an error code (1)

![Fix update errors in Ubuntu Linux][1]

让我们尝试修复这个损坏的错误包。我将展示几种你可以逐一尝试的方法。最初的那些易于使用，几乎不用动脑子。

在试了这里讨论的每一种方法之后，你应该尝试运行 `sudo apt update`，接着尝试安装新的包或升级。

#### 方法 1：重新配包数据库

你可以尝试的第一种方法是重新配置包数据库。数据库可能在安装包时损坏了。重新配置通常可以解决问题。

```
sudo dpkg --configure -a
```

#### 方法 2：强制安装

如果是之前包安装过程被中断，你可以尝试强制安装。

```
sudo apt-get install -f
```

#### 方法3：尝试删除有问题的包

如果这不是你的问题，你可以尝试手动删除包。但不要对 Linux 内核包（以 linux- 开头）执行此操作。

```
sudo apt remove
```

#### 方法 4：删除有问题的包中的信息文件

这应该是你最后的选择。你可以尝试从 `/var/lib/dpkg/info` 中删除与相关软件包关联的文件。

**你需要了解一些基本的 Linux 命令来了解发生了什么以及如何对应你的问题**

就我而言，我在 polar-bookshelf 中遇到问题。所以我查找了与之关联的文件：

```
ls -l /var/lib/dpkg/info | grep -i polar-bookshelf
-rw-r--r-- 1 root root 2324811 Aug 14 19:29 polar-bookshelf.list
-rw-r--r-- 1 root root 2822824 Aug 10 04:28 polar-bookshelf.md5sums
-rwxr-xr-x 1 root root 113 Aug 10 04:28 polar-bookshelf.postinst
-rwxr-xr-x 1 root root 84 Aug 10 04:28 polar-bookshelf.postrm
```

现在我需要做的就是删除这些文件：

```
sudo mv /var/lib/dpkg/info/polar-bookshelf.* /tmp
```

使用 `sudo apt update`，接着你应该就能像往常一样安装软件了。

#### 哪种方法适合你（如果有效）？

我希望这篇快速文章可以帮助你修复 “E: Sub-process /usr/bin/dpkg returned an error code (1)” 的错误。

如果它对你有用，是那种方法？你是否设法使用其他方法修复此错误？如果是，请分享一下以帮助其他人解决此问题。

--------------------------------------------------------------------------------

via: https://itsfoss.com/dpkg-returned-an-error-code-1/

作者：[Abhishek Prakash][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[1]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/08/fix-common-update-errors-ubuntu.jpeg

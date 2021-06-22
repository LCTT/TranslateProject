[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12216-1.html)
[#]: subject: (Fixing “Unable to parse package file /var/lib/apt/lists” Error in Ubuntu and Other Linux Distributions)
[#]: via: (https://itsfoss.com/unable-to-parse-package-file/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

修复 Ubuntu 中的 “Unable to parse package file” 错误
======

过去，我已经讨论了许多 [Ubuntu 更新错误][1]。如果你[使用命令行更新 Ubuntu][2]，那可能会遇到一些“错误”。

其中一些“错误”基本上是内置功能，可防止对系统进行不必要的更改。在本教程中，我不会涉及那些细节。

在本文中，我将向你展示如何解决在更新系统或安装新软件时可能遇到的以下错误：

```
Reading package lists… Error!
E: Unable to parse package file /var/lib/apt/lists/archive.ubuntu.com_ubuntu_dists_bionic_InRelease
E: The package lists or status file could not be parsed or opened.
```

在 Debian 中可能会遇到类似的错误：

```
E: Unable to parse package file /var/lib/apt/extended_states (1)
```

即使遇到 `The package cache file is corrupted` 也完全不必惊慌。这真的很容易“修复”。

### 在基于 Ubuntu 和 Debian 的 Linux 发行版中处理 “Unable to parse package file” 错误

![][3]

以下是你需要做的。仔细查看 [Ubuntu][4] 报错文件的名称和路径。

```
Reading package lists… Error!
E: Unable to parse package file /var/lib/apt/lists/archive.ubuntu.com_ubuntu_dists_bionic_InRelease
E: The package lists or status file could not be parsed or opened.
```

例如，上面的错误是在报 `/var/lib/apt/lists/archive.ubuntu.com_ubuntu_dists_bionic_InRelease` 文件错误。

这让你想到这个文件不正确。现在，你需要做的就是删除该文件并重新生成缓存。

```
sudo rm <file_that_is_not_parsed>
```

因此，这里我可以使用以下命令：`sudo rm /var/lib/apt/lists/archive.ubuntu.com_ubuntu_dists_bionic_InRelease`，然后使用 `sudo apt update` 命令重建缓存。

#### 给初学者的分步指导

如果你熟悉 Linux 命令，那么可能知道如何使用绝对路径删除文件。对于新手用户，让我指导你安全删除文件。

首先，你应该进入文件目录：

```
cd /var/lib/apt/lists/
```

现在删除无法解析的文件：

```
sudo rm archive.ubuntu.com_ubuntu_dists_bionic_InRelease
```

现在，如果你再次运行更新，将重新生成 apt 缓存。

```
sudo apt update
```

#### 有很多文件无法解析？

如果你在更新系统时有一个或两个文件无法解析，那么问题不大。但是，如果系统报错有十个或二十个此类文件，那么一一删除它们就太累了。

在这种情况下，你可以执行以下操作来删除整个缓存，然后再次生成它：

```
sudo rm -r /var/lib/apt/lists/*
sudo apt update
```

#### 解释这为何能解决问题

`/var/lib/apt` 是与 apt 软件包管理器相关的文件和数据的存储目录。`/var/lib/apt/lists` 是用于保存系统 `source.list` 中指定的每个软件包资源信息的目录。

简单点来说，`/var/lib/apt/lists` 保存软件包信息缓存。当你要安装或更新程序时，系统会在此目录中检查该软件包中的信息。如果找到了该包的详细信息，那么它将进入远程仓库并实际下载程序或其更新。

当你运行 `sudo apt update` 时，它将构建缓存。这就是为什么即使删除 `/var/lib/apt/lists` 目录中的所有内容，运行更新也会建立新的缓存的原因。

这就是处理文件无法解析问题的方式。你的系统报某个软件包或仓库信息以某种方式损坏（下载失败或手动更改 `sources.list`）。删除该文件（或所有文件）并重建缓存即可解决此问题。

#### 仍然有错误？

这应该能解决你的问题。但是，如果问题仍然存在，或者你还有其他相关问题，请在评论栏告诉我，我将尽力帮助你。

--------------------------------------------------------------------------------

via: https://itsfoss.com/unable-to-parse-package-file/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/ubuntu-update-error/
[2]: https://itsfoss.com/update-ubuntu/
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/05/Unable-to-parse-package-file.png?ssl=1
[4]: https://ubuntu.com/

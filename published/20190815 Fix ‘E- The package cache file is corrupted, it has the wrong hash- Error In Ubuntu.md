[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11254-1.html)
[#]: subject: (Fix ‘E: The package cache file is corrupted, it has the wrong hash’ Error In Ubuntu)
[#]: via: (https://www.ostechnix.com/fix-e-the-package-cache-file-is-corrupted-it-has-the-wrong-hash-error-in-ubuntu/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

修复 Ubuntu 中 “E: The package cache file is corrupted, it has the wrong hash” 错误
======

今天，我尝试更新我的 Ubuntu 18.04 LTS 的仓库列表，但收到了一条错误消息：“**E: The package cache file is corrupted, it has the wrong hash**”。这是我在终端运行的命令以及输出：

```
$ sudo apt update
```

示例输出：

```
Hit:1 http://it-mirrors.evowise.com/ubuntu bionic InRelease
Hit:2 http://it-mirrors.evowise.com/ubuntu bionic-updates InRelease
Hit:3 http://it-mirrors.evowise.com/ubuntu bionic-backports InRelease
Hit:4 http://it-mirrors.evowise.com/ubuntu bionic-security InRelease
Hit:5 http://ppa.launchpad.net/alessandro-strada/ppa/ubuntu bionic InRelease
Hit:7 http://ppa.launchpad.net/leaeasy/dde/ubuntu bionic InRelease
Hit:8 http://ppa.launchpad.net/rvm/smplayer/ubuntu bionic InRelease
Ign:6 https://dl.bintray.com/etcher/debian stable InRelease
Get:9 https://dl.bintray.com/etcher/debian stable Release [3,674 B]
Fetched 3,674 B in 3s (1,196 B/s)
Reading package lists... Done
E: The package cache file is corrupted, it has the wrong hash
```

![][2]

*Ubuntu 中的 “The package cache file is corrupted, it has the wrong hash” 错误*

经过一番谷歌搜索，我找到了解决此错误的方法。

如果你遇到过这个错误，不要惊慌。只需运行下面的命令修复。

在运行命令之前，**请再次确认你在最后加入了 `*`**。在命令最后加上 `*` 很重要。如果你没有添加，它会删除 `/var/lib/apt/lists/`*目录，而且无法恢复。我提醒过你了！

```
$ sudo rm -rf /var/lib/apt/lists/*
```

现在我再次使用下面的命令更新系统：

```
$ sudo apt update
```

![][3]

现在好了！希望它有帮助。

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/fix-e-the-package-cache-file-is-corrupted-it-has-the-wrong-hash-error-in-ubuntu/

作者：[sk][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[2]: https://www.ostechnix.com/wp-content/uploads/2019/08/The-package-cache-file-is-corrupted.png
[3]: https://www.ostechnix.com/wp-content/uploads/2019/08/apt-update-command-output-in-Ubuntu.png

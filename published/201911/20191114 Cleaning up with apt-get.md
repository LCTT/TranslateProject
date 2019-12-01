[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11601-1.html)
[#]: subject: (Cleaning up with apt-get)
[#]: via: (https://www.networkworld.com/article/3453032/cleaning-up-with-apt-get.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

使用 apt-get 清理
======

> 大多数使用基于 Debian 的系统的人通常会使用 apt-get 来安装软件包和升级，但是我们多久才清理一次？让我们看下该工具本身的一些清理选项。

![](https://img.linux.net.cn/data/attachment/album/201911/22/082025p39oeuufdote517e.jpg)

在基于 Debian 的系统上运行 `apt-get` 命令是很常规的。软件包的更新相当频繁，诸如 `apt-get update` 和 `apt-get upgrade` 之类的命令使此过程非常容易。另一方面，你多久使用一次 `apt-get clean`、`apt-get autoclean` 或 `apt-get autoremove`？

这些命令会在 `apt-get` 的安装操作后清理并删除仍在系统上但不再需要的文件，这通常是因为需要它们的程序已经卸载。

### apt-get clean

`apt-get clean` 命令清除遗留在 `/var/cache` 中的已取回的包文件的本地仓库。它清除的目录是 `/var/cache/apt/archives/` 和 `/var/cache/apt/archives/partial/`。它留在 `/var/cache/apt/archives` 中的唯一文件是 `lock` 文件和 `partial` 子目录。

在运行清理操作之前，目录中可能包含许多文件：

```
/var/cache/apt/archives/db5.3-util_5.3.28+dfsg1-0.6ubuntu1_amd64.deb
/var/cache/apt/archives/db-util_1%3a5.3.21~exp1ubuntu2_all.deb
/var/cache/apt/archives/lock
/var/cache/apt/archives/postfix_3.4.5-1ubuntu1_amd64.deb
/var/cache/apt/archives/sasl2-bin_2.1.27+dfsg-1build3_amd64.deb
```

之后，只会存在这些：

```
$ sudo ls -lR /var/cache/apt/archives
/var/cache/apt/archives:
total 4
-rw-r----- 1 root root    0 Jan  5  2018 lock
drwx------ 2 _apt root 4096 Nov 12 07:24 partial

/var/cache/apt/archives/partial:
total 0                 <== 空
```

`apt-get clean` 命令通常用于根据需要清除磁盘空间，一般作为定期计划维护的一部分。

### apt-get autoclean

`apt-get autoclean` 类似于 `apt-get clean`，它会清除已检索包文件的本地仓库，但它只会删除不会再下载且几乎无用的文件。它有助于防止缓存过大。

### apt-get autoremove

`apt-get autoremove` 将删除自动安装的软件包，因为某些其他软件包需要它们，但是在删除了其他软件包之后，而不再需要它们。有时会在升级时建议运行此命令。

```
The following packages were automatically installed and are no longer required:
  g++-8 gir1.2-mutter-4 libapache2-mod-php7.2 libcrystalhd3
  libdouble-conversion1 libgnome-desktop-3-17 libigdgmm5 libisl19 libllvm8
  liblouisutdml8 libmutter-4-0 libmysqlclient20 libpoppler85 libstdc++-8-dev
  libtagc0 libvpx5 libx265-165 php7.2 php7.2-cli php7.2-common php7.2-json
  php7.2-opcache php7.2-readline
Use 'sudo apt autoremove' to remove them.                       <==
```

要删除的软件包通常称为“未使用的依赖项”。实际上，一个好的做法是在卸载软件包后使用 `autoremove`，以确保不会留下不需要的文件。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3453032/cleaning-up-with-apt-get.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://unsplash.com/photos/nbKaLT4cmRM
[2]: https://creativecommons.org/publicdomain/zero/1.0/
[3]: https://www.networkworld.com/newsletters/signup.html
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world

如何在 Linux 中列出通过 RPM 或者 DEB 包安装的文件
============================================================

你是否想要了解安装包中各个文件在 Linux 系统中安装（位于）的位置？我们将在本文介绍如何列出文件的来源，或存在于某个特定包或者一组软件包中的文件。

这篇文章可以帮你轻松地找到重要的软件包文件，如配置文件、帮助文档等。我们来看看找出文件在哪个包中或者从哪个包中安装的几个方法：

### 如何列出 Linux 中全部已安装软件包的文件

你可以使用 [repoquery 命令][6]，它是 [yum-utils][7] 的一部分，用来列出给定的软件包在 CentOS/RHEL 系统上安装的文件。

要安装并使用 yum-utils，运行下面的命令：

```
# yum update 
# yum install yum-utils
```

现在你可以列出一个已安装包的文件了，比如 httpd 服务器 （注意包名是大小写敏感的）。`--installed` 表示已经安装的包，`-l` 列出所有的文件：

```
# repoquery --installed -l httpd
# dnf repoquery --installed -l httpd  [On Fedora 22+ versions]
```

[
 ![Repoquery List Installed Files of Httpd](http://www.tecmint.com/wp-content/uploads/2017/03/Repoquery-List-Installed-Files-of-Httpd.png) 
][8]

*repoquery 列出 httpd 安装的文件*

重要：在 Fedora 22 以上的版本中，`repoquery` 命令在基于 RPM 的发行版中已经与 [dnf 包管理器][9]整合，可以用上面的方法列出安装的文件。

除此之外，你也可以使用下面的 [rpm 命令][10]列出 .rpm 包中或已经安装的 .rpm 包的文件，下面的 `-q` 和 `-l` 表示列出其后跟着的包中的文件：

```
# rpm -ql httpd
```

[
 ![RPM Query Package for Installed Files](http://www.tecmint.com/wp-content/uploads/2017/03/rpm-ql-httpd.png) 
][11]

*rpm 查询已安装程序的安装包*

另外一个有用的建议是使用 `-p` 在安装之前列出 `.rpm` 中的文件。

```
# rpm -qlp telnet-server-1.2-137.1.i586.rpm
```

在 Debian/Ubuntu 发行版中，你可以使用 [dpkg 命令][12]带上 `-L` 标志在 Debian 系统或其衍生版本中列出给定 .deb 包的安装的文件。

在这个例子中，我们会列出 apache2 Web 服务器安装的文件：

```
$ dpkg -L apache2
```

[
 ![dpkg List Installed Packages](http://www.tecmint.com/wp-content/uploads/2017/03/dpkg-List-Installed-Packages.png) 
][13]

*dpkg 列出安装的包*

不要忘记查看其它有关在 Linux 中软件包管理的文章。

1.  [20 个有用的 yum 包管理命令][1]
2.  [20 个有用的 rpm 包管理命令] [2]
3.  [15 个 Ubuntu 中有用的 apt 包管理命令] [3]
4.  [15 个 Ubuntu 中有用的 dpkg命令][4]
5.  [5 个最佳的对 Linux 新手的包管理器][5]

就是这样了！在本文中，我们向你展示了如何在 Linux 中列出/找到给定的软件包或软件包组安装的所有文件。在下面的评论栏中分享你的想法。

--------------------------------------------------------------------------------

作者简介：

Aaron Kili 是 Linux 和 F.O.S.S 的爱好者，目前任 TecMint 的作者，志向是一名 Linux 系统管理员、web 开发者。他喜欢用电脑工作，并热衷于分享知识。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/list-files-installed-from-rpm-deb-package-in-linux/

作者：[Aaron Kili][a]
译者：[geekpi](https://github.com/geekpi)
校对：[ezio](https://github.com/oska874)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/20-linux-yum-yellowdog-updater-modified-commands-for-package-mangement/
[2]:http://www.tecmint.com/20-practical-examples-of-rpm-commands-in-linux/
[3]:http://www.tecmint.com/apt-advanced-package-command-examples-in-ubuntu/
[4]:http://www.tecmint.com/dpkg-command-examples/
[5]:http://www.tecmint.com/linux-package-managers/
[6]:http://www.tecmint.com/list-installed-packages-in-rhel-centos-fedora/
[7]:http://www.tecmint.com/linux-yum-package-management-with-yum-utils/
[8]:http://www.tecmint.com/wp-content/uploads/2017/03/Repoquery-List-Installed-Files-of-Httpd.png
[9]:http://www.tecmint.com/dnf-commands-for-fedora-rpm-package-management/
[10]:http://www.tecmint.com/20-practical-examples-of-rpm-commands-in-linux/
[11]:http://www.tecmint.com/wp-content/uploads/2017/03/rpm-ql-httpd.png
[12]:http://www.tecmint.com/dpkg-command-examples/
[13]:http://www.tecmint.com/wp-content/uploads/2017/03/dpkg-List-Installed-Packages.png
[14]:http://www.tecmint.com/author/aaronkili/
[15]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[16]:http://www.tecmint.com/free-linux-shell-scripting-books/

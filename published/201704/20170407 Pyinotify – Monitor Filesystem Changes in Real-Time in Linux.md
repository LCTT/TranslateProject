pyinotify：在 Linux 中实时监控文件系统更改
============================================================

`Pyinotify` 是一个简单而有用的 Python 模块，它可用于在 Linux 中实时[监控文件系统更改][1]。

作为一名系统管理员，你可以用它来监视你感兴趣的目录的更改，如 Web 目录或程序数据存储目录及其他目录。

**建议阅读：** [fswatch - 监控 Linux 中的文件和目录更改或修改][2]

它依赖于 `inotify`（在内核 2.6.13 中纳入的 Linux 内核功能），它是一个事件驱动的通知程序，其通知通过三个系统调用从内核空间导出到用户空间。

`pyinotiy` 的目的是绑定这三个系统调用，并在其上提供了一个通用和抽象的方法来操作这些功能。

在本文中，我们将向你展示如何在 Linux 中安装并使用 `pyinotify` 来实时监控文件系统更改或修改。

#### 依赖

要使用 `pyinotify`，你的系统必须运行：

1.  Linux kernel 2.6.13 或更高
2.  Python 2.4 或更高

### 如何在 Linux 中安装 Pyinotify

首先在系统中检查内核和 Python 的版本：

```
# uname -r 
# python -V
```

一旦依赖满足，我们会使用 `pip` 安装 `pynotify`。在大多数 Linux 发行版中，如果你使用的是从 python.org 下载的 **Python 2 （>= 2.7.9）** 或者 **Python 3（ >=3.4）** 的二进制，那么 `pip` 就已经安装了，否则，就按如下安装：

```
# yum install python-pip      [On CentOS based Distros]
# apt-get install python-pip  [On Debian based Distros]
# dnf install python-pip      [On Fedora 22+]
```

现在安装 `pyinotify`：

```
# pip install pyinotify
```

它会从默认仓库安装可用的版本，如果你想要最新的稳定版，可以按如下从 git 仓库 clone 下来：

```
# git clone https://github.com/seb-m/pyinotify.git
# cd pyinotify/
# ls
# python setup.py install
```

### 如何在 Linux 中使用 pyinotify

在下面的例子中，我以 root 用户（通过 ssh 登录）监视了用户 tecmint 的家目录（`/home/tecmint`）下的改变，如截图所示：

```
# python -m pyinotify -v /home/tecmint
```
[
 ![Monitor Directory Changes](http://www.tecmint.com/wp-content/uploads/2017/03/Monitor-Directory-File-Changes.png) 
][3]

*监视目录更改*

接下来，我会观察到任何 web 目录 （`/var/www/html/tecmint.com`） 的更改：

```
# python -m pyinotify -v /var/www/html/tecmint.com
```

要退出程序，只要按下 `Ctrl+C`。

**注意**：当你在运行 `pyinotify` 时如果没有指定要监视的目录，`/tmp` 将作为默认目录。

可以在 Github 上了解更多 Pyinotify 信息：[https://github.com/seb-m/pyinotify][4]。

就是这样了！在本文中，我们向你展示了如何安装及使用 `pyinotify`，一个在 Linux 中监控文件系统更改的有用的 Python 模块。

你有遇到类似的 Python 模块或者相关的 [Linux 工具/小程序][5]么？请在评论中让我们了解，或许你也可以询问与这篇文章相关的问题。

--------------------------------------------------------------------------------

作者简介：

Aaron Kili 是 Linux 和 F.O.S.S 爱好者，将来的 Linux 系统管理员和网络开发人员，目前是 TecMint 的内容创作者，他喜欢用电脑工作，并坚信分享知识。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/pyinotify-monitor-filesystem-directory-changes-in-linux/

作者：[Aaron Kili][a]
译者：[geekpi](https://github.com/geekpi)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/

[1]:http://www.tecmint.com/fswatch-monitors-files-and-directory-changes-modifications-in-linux/
[2]:http://www.tecmint.com/fswatch-monitors-files-and-directory-changes-modifications-in-linux/
[3]:http://www.tecmint.com/wp-content/uploads/2017/03/Monitor-Directory-File-Changes.png
[4]:https://github.com/seb-m/pyinotify
[5]:http://tecmint.com/tag/commandline-tools
[6]:http://www.tecmint.com/author/aaronkili/
[7]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[8]:http://www.tecmint.com/free-linux-shell-scripting-books/

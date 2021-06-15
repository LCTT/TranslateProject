[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12132-1.html)
[#]: subject: (How to install Python on Linux)
[#]: via: (https://opensource.com/article/20/4/install-python-linux)
[#]: author: (Vijay Singh Khatri https://opensource.com/users/vijaytechnicalauthor)

如何在 Linux 上安装 Python
======

> 在 Linux 上安装最新 Python，替代或与老版本并存的分步说明。

![](https://img.linux.net.cn/data/attachment/album/202004/21/094500u63lnlgukgnjb0t0.jpg)

[Python][2] 现在是[最流行][3]、最常用的编程语言。Python 的简单语法和较低的学习曲线使其成为初学者和专业开发人员的终极选择。Python 还是一种非常通用的编程语言。从 Web 开发到人工智能，它几乎在除了移动开发的所有地方都有使用。

如果你使用的是 Python，那么你很有可能是一名开发人员（或想成为一名开发人员），而 Linux 是创建软件的绝佳平台。但是，当你每天使用 Python 时，有时你希望使用最新版本。你可能不想仅仅为了测试最新版本的系统而替换了默认的 Python 安装，因此本文说明了如何在 Linux 上安装最新版本的 Python 3，而不替换发行版提供的版本。

使用 `python --version` 终端命令检查是否已安装 Python，如果已安装，那么检查是哪个版本。如果你的 Linux 系统上未安装 Python，或者你想安装更新的版本，请按照以下步骤操作。

### 分步安装说明

#### 步骤 1：首先，安装构建 Python 所需的开发包

在 Debian 上

```
$ sudo apt update
$ sudo apt install build-essential zlib1g-dev \
libncurses5-dev libgdbm-dev libnss3-dev \
libssl-dev libreadline-dev libffi-dev curl
```

在 Fedora 上：

```
$ sudo dnf groupinstall development
```

#### 步骤 2：下载最新的稳定版本的 Python 3

访问[官方 Python 网站][4]并下载最新版本的 Python 3。下载完成后，你会有一个 `.tar.xz` 归档文件（“tarball”），其中包含 Python 的源代码。

#### 步骤 3：解压 tarball

下载完成后，使用解压程序或 [Linux 的 tar 命令][5]解压压缩包，例如：

```
$ tar -xf Python-3.?.?.tar.xz
```

#### 步骤 4：配置脚本

解压 Python 压缩包后，进入 `configure` 脚本所在目录并在 Linux 终端中使用以下命令执行该脚本：

```
$ cd Python-3.*
./configure
```

配置可能需要一些时间。等待直到成功完成，然后再继续。

#### 步骤 5：开始构建过程

如果你的系统上已经安装了某个版本的 Python，并且希望同时安装新版本的 Python，请使用以下命令：

```
$ sudo make altinstall
```

构建过程可能需要一些时间。

如果要使用此版本替换当前版本的 Python，那么应使用包管理器（例如 `apt` 或 `dnf`）卸载当前的 Python 包，然后安装：

```
$ sudo make install
```

但是，通常最好以软件包的形式（例如 `.deb` 或 `.rpm` 文件）来安装软件，以便系统可以为你跟踪和更新它。因为本文假设尚未打包最新的 Python，所以你可能没有这个选择。在这种情况下，你可以按照建议使用 `altinstall` 来安装 Python，或者使用最新的源代码重构现有的 Python 包。这是一个高级主题，并且特定于你的发行版，因此不在本文讨论范围之内。

#### 步骤 6：验证安装

如果你没有遇到任何错误，那么现在你的 Linux 系统上已安装了最新的 Python。要进行验证，请在终端中输入以下命令之一：

```
python3 --version
```

或者

```
python --version
```

如果输出显示 `Python 3.x`，那么说明 Python 3 已成功安装。

### 创建虚拟环境（可选）

Python 提供了名为 `venv`（虚拟环境）的软件包，可帮助你将程序目录或软件包与其他目录或软件包隔离。

要创建虚拟环境，请在 Python 终端中输入以下内容（在此示例中，假定你安装的 Python 版本为 `3.8` 系列）：

```
python3.8 -m venv example
```

该命令创建一个带有一些子目录的新目录（我将其命名为 `example`）。

要激活虚拟环境，请输入：

```
$ source example/bin/activate
(example) $
```

请注意，你的终端提示符（`$`）现在以环境名称开头。

要停用虚拟环境，请使用 `deactivate` 命令：

```
(example) $ deactivate
```

### 总结

Python 是一种有趣的语言，它的开发和改进非常频繁。一旦了解了如何安装最新版本而又不干扰发行版提供的稳定版本，熟悉新功能将很容易。

如果你有任何反馈或问题，请在评论中提出。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/install-python-linux

作者：[Vijay Singh Khatri][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/vijaytechnicalauthor
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/openstack_python_vim_1.jpg?itok=lHQK5zpm (OpenStack source code (Python) in VIM)
[2]: https://www.python.org/
[3]: http://pypl.github.io/PYPL.html
[4]: http://python.org
[5]: https://opensource.com/article/17/7/how-unzip-targz-file

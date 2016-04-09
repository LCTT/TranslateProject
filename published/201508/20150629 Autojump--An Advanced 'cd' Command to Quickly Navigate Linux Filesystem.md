Autojump：一个可以在 Linux 文件系统快速导航的高级 cd 命令
================================================================================

对于那些主要通过控制台或终端使用 Linux 命令行来工作的 Linux 用户来说，他们真切地感受到了 Linux 的强大。 然而在 Linux 的分层文件系统中进行导航有时或许是一件头疼的事，尤其是对于那些新手来说。

现在，有一个用 Python 写的名为 `autojump` 的 Linux 命令行实用程序，它是 Linux ‘[cd][1]’命令的高级版本。

![Autojump 命令](http://www.tecmint.com/wp-content/uploads/2015/06/Autojump-Command.jpg)

*Autojump – Linux 文件系统导航的最快方式*

这个应用原本由 Joël Schaerer 编写，现在由 +William Ting 维护。

Autojump 应用可以从用户那里学习并帮助用户在 Linux 命令行中进行更轻松的目录导航。与传统的 `cd` 命令相比，autojump 能够更加快速地导航至目的目录。 

#### autojump 的特色 ####

- 自由开源的应用，在 GPL V3 协议下发布。
- 自主学习的应用，从用户的导航习惯中学习。
- 更快速地导航。不必包含子目录的名称。
- 对于大多数的标准 Linux 发行版本，能够在软件仓库中下载得到，它们包括 Debian (testing/unstable), Ubuntu, Mint, Arch, Gentoo, Slackware, CentOS, RedHat 和 Fedora。
- 也能在其他平台中使用，例如 OS X(使用 Homebrew) 和 Windows (通过 Clink 来实现)
- 使用 autojump 你可以跳至任何特定的目录或一个子目录。你还可以用文件管理器打开某个目录，并查看你在某个目录中所待时间的统计数据。

#### 前提 ####

- 版本号不低于 2.6 的 Python

### 第 1 步: 做一次完整的系统升级 ###

1、 以 **root** 用户的身份，做一次系统更新或升级，以此保证你安装有最新版本的 Python。

    # apt-get update && apt-get upgrade && apt-get dist-upgrade [基于 APT 的系统]
    # yum update && yum upgrade [基于 YUM 的系统]
    # dnf update && dnf upgrade [基于 DNF 的系统]

**注** : 这里特别提醒，在基于 YUM 或 DNF 的系统中，更新和升级执行相同的行动，大多数时间里它们是通用的，这点与基于 APT 的系统不同。

### 第 2 步: 下载和安装 Autojump ###

2、 正如前面所言，在大多数的 Linux 发行版本的软件仓库中， autojump 都可获取到。通过包管理器你就可以安装它。但若你想从源代码开始来安装它，你需要克隆源代码并执行 python 脚本，如下面所示： 

#### 从源代码安装 ####

若没有安装 git，请安装它。我们需要使用它来克隆 git 仓库。

    # apt-get install git   [基于 APT 的系统]
    # yum install git       [基于 YUM 的系统]
    # dnf install git       [基于 DNF 的系统]

一旦安装完 git，以普通用户身份登录，然后像下面那样来克隆 autojump：

    $ git clone git://github.com/joelthelion/autojump.git

接着，使用 `cd` 命令切换到下载目录。

    $ cd autojump

下载，赋予安装脚本文件可执行权限，并以 root 用户身份来运行安装脚本。

    # chmod 755 install.py
    # ./install.py

#### 从软件仓库中安装 ####

3、 假如你不想麻烦，你可以以 **root** 用户身份从软件仓库中直接安装它:

在 Debian, Ubuntu, Mint 及类似系统中安装 autojump :

    # apt-get install autojump

为了在 Fedora, CentOS, RedHat 及类似系统中安装 autojump, 你需要启用 [EPEL 软件仓库][2]。

    # yum install epel-release
    # yum install autojump
    或
    # dnf install autojump

### 第 3 步: 安装后的配置 ###

4、 在 Debian 及其衍生系统 (Ubuntu, Mint,…) 中, 激活 autojump 应用是非常重要的。

为了暂时激活 autojump 应用，即直到你关闭当前会话或打开一个新的会话之前让 autojump 均有效，你需要以常规用户身份运行下面的命令:

    $ source /usr/share/autojump/autojump.sh on startup

为了使得 autojump 在 BASH shell 中永久有效，你需要运行下面的命令。

    $ echo '. /usr/share/autojump/autojump.sh' >> ~/.bashrc

### 第 4 步: Autojump 的预测试和使用 ###

5、 如先前所言， autojump 将只跳到先前 `cd` 命令到过的目录。所以在我们开始测试之前，我们要使用 `cd` 切换到一些目录中去，并创建一些目录。下面是我所执行的命令。

    $ cd
    $ cd
    $ cd Desktop/
    $ cd
    $ cd Documents/
    $ cd
    $ cd Downloads/
    $ cd
    $ cd Music/
    $ cd
    $ cd Pictures/
    $ cd
    $ cd Public/
    $ cd
    $ cd Templates
    $ cd
    $ cd /var/www/
    $ cd
    $ mkdir autojump-test/
    $ cd
    $ mkdir autojump-test/a/ && cd autojump-test/a/
    $ cd
    $ mkdir autojump-test/b/ && cd autojump-test/b/
    $ cd
    $ mkdir autojump-test/c/ && cd autojump-test/c/
    $ cd

现在，我们已经切换到过上面所列的目录，并为了测试创建了一些目录，一切准备就绪，让我们开始吧。

**需要记住的一点** : `j` 是 autojump 的一个封装，你可以使用 j 来代替 autojump， 相反亦可。

6、 使用 -v 选项查看安装的 autojump 的版本。

    $ j -v
    或
    $ autojump -v

![查看 Autojump 的版本](http://www.tecmint.com/wp-content/uploads/2015/06/Check-Autojump-Version.png)

*查看 Autojump 的版本*

7、 跳到先前到过的目录 ‘/var/www‘。

    $ j www

![跳到目录](http://www.tecmint.com/wp-content/uploads/2015/06/Jump-To-Directory.png)

*跳到目录*

8、 跳到先前到过的子目录‘/home/avi/autojump-test/b‘ 而不键入子目录的全名。

    $ jc b

![跳到子目录](http://www.tecmint.com/wp-content/uploads/2015/06/Jump-to-Child-Directory.png)

*跳到子目录*

9、 使用下面的命令，你就可以从命令行打开一个文件管理器，例如 GNOME Nautilus ，而不是跳到一个目录。

    $ jo www

![打开目录](http://www.tecmint.com/wp-content/uploads/2015/06/Jump-to-Direcotory.png)

*打开目录*

![在文件管理器中打开目录](http://www.tecmint.com/wp-content/uploads/2015/06/Open-Directory-in-File-Browser.png)

*在文件管理器中打开目录*

你也可以在一个文件管理器中打开一个子目录。

    $ jco c

![打开子目录](http://www.tecmint.com/wp-content/uploads/2015/06/Open-Child-Directory1.png)

*打开子目录*

![在文件管理器中打开子目录](http://www.tecmint.com/wp-content/uploads/2015/06/Open-Child-Directory-in-File-Browser1.png)

*在文件管理器中打开子目录*

10、 查看每个文件夹的权重和全部文件夹计算得出的总权重的统计数据。文件夹的权重代表在这个文件夹中所花的总时间。 文件夹权重是该列表中目录的数字。(LCTT 译注: 在这一句中，我觉得原文中的 if 应该为 is)

    $ j --stat

![查看文件夹统计数据](http://www.tecmint.com/wp-content/uploads/2015/06/Check-Statistics.png)

*查看文件夹统计数据*

**提醒** : autojump 存储其运行日志和错误日志的地方是文件夹 `~/.local/share/autojump/`。千万不要重写这些文件，否则你将失去你所有的统计状态结果。

    $ ls -l ~/.local/share/autojump/

![Autojump 的日志](http://www.tecmint.com/wp-content/uploads/2015/06/Autojump-Logs.png)

*Autojump 的日志*

11、 假如需要，你只需运行下面的命令就可以查看帮助 :

    $ j --help

![Autojump 的帮助和选项](http://www.tecmint.com/wp-content/uploads/2015/06/Autojump-help-options.png)

*Autojump 的帮助和选项*

### 功能需求和已知的冲突 ###

- autojump 只能让你跳到那些你已经用 `cd` 到过的目录。一旦你用 `cd` 切换到一个特定的目录，这个行为就会被记录到 autojump 的数据库中，这样 autojump 才能工作。不管怎样，在你设定了 autojump 后，你不能跳到那些你没有用 `cd` 到过的目录。
- 你不能跳到名称以破折号 (-) 开头的目录。或许你可以考虑阅读我的有关[操作文件或目录][3] 的文章，尤其是有关操作那些以‘-‘ 或其他特殊字符开头的文件和目录的内容。 
- 在 BASH shell 中，autojump 通过修改 `$PROMPT_COMMAND` 环境变量来跟踪目录的行为，所以强烈建议不要去重写 `$PROMPT_COMMAND` 这个环境变量。若你需要添加其他的命令到现存的 `$PROMPT_COMMAND` 环境变量中，请添加到`$PROMPT_COMMAND` 环境变量的最后。

### 结论: ###

假如你是一个命令行用户， autojump 是你必备的实用程序。它可以简化许多事情。它是一个在命令行中导航 Linux 目录的绝佳的程序。请自行尝试它，并在下面的评论框中让我知晓你宝贵的反馈。保持联系，保持分享。喜爱并分享，帮助我们更好地传播。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/autojump-a-quickest-way-to-navigate-linux-filesystem/

作者：[Avishek Kumar][a]
译者：[FSSlc](https://github.com/FSSlc)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://www.tecmint.com/cd-command-in-linux/
[2]:https://linux.cn/article-2324-1.html
[3]:http://www.tecmint.com/manage-linux-filenames-with-special-characters/
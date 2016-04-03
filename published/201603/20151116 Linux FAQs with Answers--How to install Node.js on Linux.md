Linux 有问必答：如何在 Linux 上安装 Node.js
================================================================================
> **问题**: 如何在你的 Linux 发行版上安装 Node.js？

[Node.js][1] 是建立在谷歌的 V8 JavaScript 引擎服务器端的软件平台上。在构建高性能的服务器端应用程序上，Node.js 在 JavaScript 中已是首选方案。是什么让使用 Node.js 库和应用程序的[庞大生态系统][2]来开发服务器后台变得如此流行。Node.js 自带一个被称为 npm 的命令行工具可以让你轻松地安装它，进行版本控制并使用 npm 的在线仓库来管理 Node.js 库和应用程序的依赖关系。

在本教程中，我将介绍 **如何在主流 Linux 发行版上安装 Node.js，包括 Debian，Ubuntu，Fedora 和 CentOS** 。

Node.js 在一些发行版上有预构建的程序包（如，Fedora 或 Ubuntu），而在其他发行版上你需要通过源码安装。由于 Node.js 发展比较快，建议从源码安装最新版而不是安装一个过时的预构建的程序包。最新的 Node.js 自带 npm（Node.js 的包管理器），让你可以轻松的安装 Node.js 的外部模块。

### 在 Debian 上安装 Node.js on  ###

从 Debian 8 (Jessie)开始，Node.js 已被纳入官方软​​件仓库。因此，你可以使用如下方式安装它：

    $ sudo apt-get install npm

在 Debian 7 (Wheezy) 以前的版本中,你需要使用下面的方式来源码安装： 

    $ sudo apt-get install python g++ make
    $ wget http://nodejs.org/dist/node-latest.tar.gz
    $ tar xvfvz node-latest.tar.gz
    $ cd node-v0.10.21 (replace a version with your own)
    $ ./configure
    $ make
    $ sudo make install

### 在 Ubuntu 或 Linux Mint 中安装 Node.js ###

Node.js 被包含在 Ubuntu（13.04 及更高版本）。因此，安装非常简单。以下方式将安装 Node.js 和 npm。

    $ sudo apt-get install npm
    $ sudo ln -s /usr/bin/nodejs /usr/bin/node

而 Ubuntu 中的 Node.js 可能版本比较老，你可以从 [其 PPA][3] 中安装最新的版本。

    $ sudo apt-get install python-software-properties python g++ make
    $ sudo add-apt-repository -y ppa:chris-lea/node.js
    $ sudo apt-get update
    $ sudo apt-get install npm

### 在 Fedora 中安装 Node.js ###

Node.js 被包含在 Fedora 的 base 仓库中。因此，你可以在 Fedora 中用 yum 安装 Node.js。

    $ sudo yum install npm

如果你想安装 Node.js 的最新版本，可以按照以下步骤使用源码来安装。

    $ sudo yum groupinstall 'Development Tools'
    $ wget http://nodejs.org/dist/node-latest.tar.gz
    $ tar xvfvz node-latest.tar.gz
    $ cd node-v0.10.21 (replace a version with your own)
    $ ./configure
    $ make
    $ sudo make install

### 在 CentOS 或 RHEL 中安装 Node.js ###

在 CentOS 使用 yum 包管理器来安装 Node.js，首先启用 EPEL 软件库，然后运行：

    $ sudo yum install npm

如果你想在 CentOS 中安装最新版的 Node.js，其安装步骤和在 Fedora 中的相同。

### 在 Arch Linux 上安装 Node.js ###


Node.js 在 Arch Linux 的社区库中可以找到。所以安装很简单，只要运行：

    $ sudo pacman -S nodejs npm

### 检查 Node.js 的版本 ###

一旦你已经安装了 Node.js，你可以使用如下所示的方法检查 Node.js 的版本。

    $ node --version 

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/install-node-js-linux.html

作者：[Dan Nanni][a]
译者：[strugglingyou](https://github.com/strugglingyou)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
[1]:http://nodejs.org/
[2]:https://www.npmjs.com/
[3]:https://launchpad.net/~chris-lea/+archive/node.js

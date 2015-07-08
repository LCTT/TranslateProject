在Ubuntu下安装Node.JS的不同方式
================================================================================

如果你要在Ubuntu 15.04上安装Node.js的话，这篇教程对你来说肯定很重要。Node.js从本质上来说就是一个运行在服务端上的封装好了输入输出流的javascript程序。Node.js巧妙的使用单线程的事件循环来处理高吞吐量和非阻塞IO。同时它也是一个提供了通过操作系统读写文件和网络操作功能的平台层。所以这篇文章将展示在Ubuntu 15.04 server上不同的安装Node.Js的方式。

### 安装Node.JS 的方法###

有许多安装Node.JS的不同的方法，我们可以选择其一。通过本篇文章我们将手把手带着你在Ubuntu 15.04上安装Node.Js，在此之前请卸载旧版本的包以免发生包冲突。

- 从源代码安装Node.JS
- 用包管理器安装Node.JS
- 从Github远程库安装Node.JS
- 用NVM安装Node.JS

### 1) 从源代码安装Node.JS ###

让我们开始从源代码安装Node.JS之前，请确认系统上的所有的依赖包都已经更新到最新版本。然后跟着以下步骤来开始安装：

#### 步骤1: 升级系统 ####

用以下命令来升级系统，并且安装一些Node.JS必要的包。

    root@ubuntu-15:~# apt-get update

    root@ubuntu-15:~# apt-get install python gcc make g++

#### 步骤2: 获取Node.JS的源代码 ####

安装好依赖包之后我们可以从官方网站上下载Node.JS的源代码。下载以及解压的命令如下：

    root@ubuntu-15:~# wget http://nodejs.org/dist/v0.12.4/node-v0.12.4.tar.gz
    root@ubuntu-15:~# tar zxvf node-v0.12.4.tar.gz

#### 步骤3: 开始安装 ####

现在我们进入源代码的目录，然后运行.configure文件

![NodeJS Configure](http://blog.linoxide.com/wp-content/uploads/2015/06/13.png)

    root@ubuntu-15:~# ls
    node-v0.12.4 node-v0.12.4.tar.gz
    root@ubuntu-15:~# cd node-v0.12.4/
    root@ubuntu-15:~/node-v0.12.4# ./configure
    root@ubuntu-15:~/node-v0.12.4# make install

#### 安装后测试 ####

只要运行一下上面的命令就顺利安装好了Node.JS，现在我们来确认一下版本信息和测试以下Node.JS是否可以运行输出。

    root@ubuntu-15:~/node-v0.12.4# node -v
    v0.12.4

![Node.Js Test](http://blog.linoxide.com/wp-content/uploads/2015/06/21.png)

创建一个以.js为扩展名的文件然后用Node的命令运行

    root@ubuntu-15:~/node-v0.12.4# touch helo_test.js
    root@ubuntu-15:~/node-v0.12.4# vim helo_test.js
    console.log('Hello World');

现在我们用Node的命令运行文件

    root@ubuntu-15:~/node-v0.12.4# node helo_test.js
    Hello World

输出的结果证明我们已经成功的在Ubuntu 15.04安装好了Node.JS，同时我们也能运行JavaScript文件。

### 2) 利用包管理器安装Node.JS ###

在Ubuntu下用包管理器安装Node.JS是非常简单的，只要增加NodeSource的个人软件包档案（PPA）即可。

我们将下面通过PPA安装Node.JS

#### 步骤1: 用curl获取源代码 ####

在我们用curl获取源代码之前，我们必须先升级操作系统，然后用curl命令获取NodeSource添加到本地仓库。

    root@ubuntu-15:~#apt-get update
    root@ubuntu-15:~# curl -sL https://deb.nodesource.com/setup | sudo bash -

curl将运行以下任务

    ## Installing the NodeSource Node.js 0.10 repo...
    ## Populating apt-get cache...
    ## Confirming "vivid" is supported...
    ## Adding the NodeSource signing key to your keyring...
    ## Creating apt sources list file for the NodeSource Node.js 0.10 repo...
    ## Running `apt-get update` for you...
    Fetched 6,411 B in 5s (1,077 B/s)
    Reading package lists... Done
    ## Run `apt-get install nodejs` (as root) to install Node.js 0.10 and npm

#### 步骤2: 安装NodeJS和NPM ####

运行以上命令之后如果输出如上所示，我们可以用apt-get命令来安装NodeJS和NPM包。

    root@ubuntu-15:~# apt-get install nodejs

![NodeJS Install](http://blog.linoxide.com/wp-content/uploads/2015/06/31.png)

#### 步骤3: 安装一些必备的工具 ####

通过以下命令来安装编译安装一些我们必需的本地插件。

    root@ubuntu-15:~# apt-get install -y build-essential

#### 通过Node.JS Shell来测试 ####

测试Node.JS的步骤与之前使用源代码安装相似，通过以下node命令来确认Node.JS是否完全安装好:

    root@ubuntu-15:~# node
    > console.log('Node.js Installed Using Package Manager');
    Node.js Installed Using Package Manager

----------

    root@ubuntu-15:~# node
    > a = [1,2,3,4,5]
    [ 1, 2, 3, 4, 5 ]
    > typeof a
    'object'
    > 5 + 2
    7
    >
    (^C again to quit)
    >
    root@ubuntu-15:~#

#### 使用NodeJS应用进行简单的测试 ####

REPL是一个Node.js的shell，任何有效的JavaScript代码都能在REPL下运行通过。所以让我们看看在Node.JS下的REPL是什么样子吧。

    root@ubuntu-15:~# node
    > var repl = require("repl");
    undefined
    > repl.start("> ");

    Press Enter and it will show out put like this:
    > { domain: null,
    _events: {},
    _maxListeners: 10,
    useGlobal: false,
    ignoreUndefined: false,
    eval: [Function],
    inputStream:
    { _connecting: false,
    _handle:
    { fd: 0,
    writeQueueSize: 0,
    owner: [Circular],
    onread: [Function: onread],
    reading: true },
    _readableState:
    { highWaterMark: 0,
    buffer: [],
    length: 0,
    pipes: null,
    ...
    ...

以下是可以在REPL下使用的命令列表

![REPL Manual](http://blog.linoxide.com/wp-content/uploads/2015/06/4.png)

#### 使用NodeJS的包管理器 ####

NPM是一个提供给node脚本持续生命力的命令行工具，它能通过package.json来安装和管理依赖包。最开始从初始化命令init开始

    root@ubuntu-15:~# npm init

![NPM starting](http://blog.linoxide.com/wp-content/uploads/2015/06/51.png)

### 3) 从Github远程库安装Node.JS ###

在这个方法中我们需要一些步骤来把Node.JS从Github的远程的仓库克隆到本地仓库目录

在开始克隆（clone）包到本地并且配制之前，我们要先安装以下依赖包

    root@ubuntu-15:~# apt-get install g++ curl make libssl-dev apache2-utils git-core

现在我们开始用git命令克隆到本地并且转到配制目录

    root@ubuntu-15:~# git clone git://github.com/ry/node.git
    root@ubuntu-15:~# cd node/

![Git Clone NodeJS](http://blog.linoxide.com/wp-content/uploads/2015/06/61.png)

clone仓库之后，通过运行.config命令来编译生成完整的安装包。

    root@ubuntu-15:~# ./configure

![Configure Node](http://blog.linoxide.com/wp-content/uploads/2015/06/7.png)

运行make install命令之后耐心等待几分钟，程序将会安装好Node.JS。

    root@ubuntu-15:~/node# make install

    root@ubuntu-15:~/node# node -v
    v0.13.0-pre

#### 测试Node.JS ####

    root@ubuntu-15:~/node# node
    > a = [1,2,3,4,5,6,7]
    [ 1, 2, 3, 4, 5, 6, 7 ]
    > typeof a
    'object'
    > 6 + 5
    11
    >
    (^C again to quit)
    >
    root@ubuntu-15:~/node#

### 4) 通过NVM安装Node.JS ###

在最后一种方法中我们我们将用NVM来比较容易安装Node.JS。安装和配制Node.JS，这是最好的方法之一，它可以供我们选择要安装的版本。

在安装之前，请确认本机以前的安装包已经被卸载。

#### 步骤1: 安装依赖包 ####

首先升级Ubuntu Server系统，然后安装以下安装Node.JS和使用NVM所要依赖的包。用curl命令从git上下载NVM到本地仓库：

    root@ubuntu-15:~# apt-get install build-essential libssl-dev
    root@ubuntu-15:~# curl https://raw.githubusercontent.com/creationix/nvm/v0.16.1/install.sh | sh

![NVM Curl](http://blog.linoxide.com/wp-content/uploads/2015/06/81.png)

#### 步骤2: 修改Home环境 ####

用curl从NVM下载必需的包到用户的home目录之后，我们需要修改bash的配置文件添加NVM，之后只要重新登录中断或者用如下命令更新即可。

    root@ubuntu-15:~# source ~/.profile

现在我们可以用NVM来设置默认的NVM的版本，或者用如下命令来指定之前版本：

    root@ubuntu-15:~# nvm ls
    root@ubuntu-15:~# nvm alias default 0.12.4

![NVM Default](http://blog.linoxide.com/wp-content/uploads/2015/06/91.png)

#### 步骤3: 使用NVM ####

我们已经通过NVM成功的安装了Node.JS，所以我们现在可以使用各种有用的命令。

![NVM Manual](http://blog.linoxide.com/wp-content/uploads/2015/06/101.png)

### 总结 ###

现在我们已经准备好了在服务端安装Node.JS，你可以从我们说的四种方式中选择最合适你的方式在最新的Ubuntu 15.04上来安装Node.JS，安装好之后你就可以利用Node.JS来编写你的代码。

--------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/setup-node-js-ubuntu-15-04-different-methods/

作者：[Kashif Siddique][a]
译者：[NearTan](https://github.com/NearTan)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/kashifs/
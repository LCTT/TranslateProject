
在ubunt 14.04/15.04 上配置Node JS v4.0.0 
================================================================================
大家好，Node.JS 4.0 发布了，主流的服务器端JS 平台已经将Node.js 和io.js 结合到一起。4.0 版就是两者结合的产物——共用一个代码库。这次最主要的变化是Node.js 封装了Google V8 4.5 JS 引擎，而这一版与当前的Chrome 一致。所以，紧跟V8 的版本号可以让Node.js 运行的更快、更安全，同时更好的利用ES6 的很多语言特性。

![Node JS](http://blog.linoxide.com/wp-content/uploads/2015/09/nodejs.png)

Node.js 4.0 的目标是为io.js 当前用户提供一个简单的升级途径，所以这次并没有太多重要的API 变更。剩下的内容会让我们看到如何轻松的在ubuntu server 上安装、配置Node.js。

### 基础系统安装 ###

Node 在Linux，Macintosh，Solaris 这几个系统上都可以完美的运行，同时linux 的发行版本当中Ubuntu 是最合适的。这也是我们为什么要尝试在ubuntu 15.04 上安装Node，当然了在14.04 上也可以使用相同的步骤安装。
#### 1) 系统资源 ####

The basic system resources for Node depend upon the size of your infrastructure requirements. So, here in this tutorial we will setup Node with 1 GB RAM, 1 GHz Processor and 10 GB of available disk space with minimal installation packages installed on the server that is no web or database server packages are installed.

#### 2) 系统更新 ####

It always been recommended to keep your system upto date with latest patches and updates, so before we move to the installation on Node, let's login to your server with super user privileges and run update command.

    # apt-get update

#### 3) 安装依赖 ####

Node JS only requires some basic system and software utilities to be present on your server, for its successful installation like 'make' 'gcc' and 'wget'. Let's run the below command to get them installed if they are not already present.

    # apt-get install python gcc make g++ wget

### 下载最新版的Node JS v4.0.0 ###

使用链接 [Node JS Download Page][1] 下载源代码.

![nodejs download](http://blog.linoxide.com/wp-content/uploads/2015/09/download.png)

我们会复制最新源代码的链接，然后用`wget` 下载，命令如下：

    # wget https://nodejs.org/download/rc/v4.0.0-rc.1/node-v4.0.0-rc.1.tar.gz

下载完成后使用命令`tar` 解压缩：

    # tar -zxvf node-v4.0.0-rc.1.tar.gz

![wget nodejs](http://blog.linoxide.com/wp-content/uploads/2015/09/wget.png)

### 安装 Node JS v4.0.0 ###

现在可以开始使用下载好的源代码编译Nod JS。你需要在ubuntu serve 上开始编译前运行配置脚本来修改你要使用目录和配置参数。

    root@ubuntu-15:~/node-v4.0.0-rc.1# ./configure

![Installing NodeJS](http://blog.linoxide.com/wp-content/uploads/2015/09/configure.png)

现在运行命令'make install' 编译安装Node JS：

    root@ubuntu-15:~/node-v4.0.0-rc.1# make install

make 命令会花费几分钟完成编译，冷静的等待一会。

### 验证Node 安装 ###

一旦编译任务完成，我们就可以开始验证安装工作是否OK。我们运行下列命令来确认Node JS 的版本。

    root@ubuntu-15:~# node -v
    v4.0.0-pre

在命令行下不带参数的运行`node` 就会进入REPL(Read-Eval-Print-Loop,读-执行-输出-循环)模式，它有一个简化版的emacs 行编辑器，通过它你可以交互式的运行JS和查看运行结果。
![node version](http://blog.linoxide.com/wp-content/uploads/2015/09/node.png)

### 写测试程序 ###

我们也可以写一个很简单的终端程序来测试安装是否成功，并且工作正常。要完成这一点，我们将会创建一个“tes.js” 文件，包含一下代码，操作如下：

    root@ubuntu-15:~# vim test.js
    var util = require("util");
    console.log("Hello! This is a Node Test Program");
    :wq!

现在为了运行上面的程序，在命令行运行下面的命令。

    root@ubuntu-15:~# node test.js

![Node Program](http://blog.linoxide.com/wp-content/uploads/2015/09/node-test.png)

在一个成功安装了Node JS 的环境下运行上面的程序就会在屏幕上得到上图所示的输出，这个程序加载类 “util” 到变量“util” 中，接着用对象“util” 运行终端任务，console.log 这个命令作用类似C++ 里的cout

### 结论 ###

That’s it. Hope this gives you a good idea of Node.js going with Node.js on Ubuntu. If you are new to developing applications with Node.js. After all we can say that we can expect significant performance gains with Node JS Version 4.0.0.
希望本文能够通过在ubuntu 上安装、运行Node.JS让你了解一下Node JS 的大概，如果你是刚刚开始使用Node.JS 开发应用程序。最后我们可以说我们能够通过Node JS v4.0.0 获取显著的性能。

--------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/setup-node-js-4-0-ubuntu-14-04-15-04/

作者：[Kashif Siddique][a]
译者：[译者ID](https://github.com/osk874)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/kashifs/
[1]:https://nodejs.org/download/rc/v4.0.0-rc.1/

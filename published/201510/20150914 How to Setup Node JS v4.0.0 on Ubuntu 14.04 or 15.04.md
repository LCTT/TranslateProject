在 Ubuntu 14.04/15.04 上配置 Node JS v4.0.0 
================================================================================
大家好，Node.JS 4.0 发布了，这个流行的服务器端 JS 平台合并了 Node.js 和 io.js 的代码，4.0 版就是这两个项目结合的产物——现在合并为一个代码库。这次最主要的变化是 Node.js 封装了4.5 版本的 Google V8 JS 引擎，与当前的 Chrome 所带的一致。所以，紧跟 V8 的发布可以让 Node.js 运行的更快、更安全，同时更好的利用 ES6 的很多语言特性。

![Node JS](http://blog.linoxide.com/wp-content/uploads/2015/09/nodejs.png)

Node.js 4.0 发布的主要目标是为 io.js 用户提供一个简单的升级途径，所以这次并没有太多重要的 API 变更。下面的内容让我们来看看如何轻松的在 ubuntu server 上安装、配置 Node.js。

### 基础系统安装 ###

Node 在 Linux，Macintosh，Solaris 这几个系统上都可以完美的运行，linux 的发行版本当中使用 Ubuntu 相当适合。这也是我们为什么要尝试在 ubuntu 15.04 上安装 Node.js，当然了在 14.04 上也可以使用相同的步骤安装。

#### 1) 系统资源 ####

Node.js 所需的基本的系统资源取决于你的架构需要。本教程我们会在一台 1GB 内存、 1GHz 处理器和 10GB 磁盘空间的服务器上进行，最小安装即可，不需要安装 Web 服务器或数据库服务器。

#### 2) 系统更新 ####

在我们安装 Node.js 之前，推荐你将系统更新到最新的补丁和升级包，所以请登录到系统中使用超级用户运行如下命令：

    # apt-get update

#### 3) 安装依赖 ####

Node.js 仅需要你的服务器上有一些基本系统和软件功能，比如 'make'、'gcc'和'wget' 之类的。如果你还没有安装它们，运行如下命令安装：

    # apt-get install python gcc make g++ wget

### 下载最新版的Node JS v4.0.0 ###

访问链接 [Node JS Download Page][1] 下载源代码.

![nodejs download](http://blog.linoxide.com/wp-content/uploads/2015/09/download.png)

复制其中的最新的源代码的链接，然后用`wget` 下载，命令如下：

    # wget https://nodejs.org/download/rc/v4.0.0-rc.1/node-v4.0.0-rc.1.tar.gz

下载完成后使用命令`tar` 解压缩：

    # tar -zxvf node-v4.0.0-rc.1.tar.gz

![wget nodejs](http://blog.linoxide.com/wp-content/uploads/2015/09/wget.png)

### 安装 Node JS v4.0.0 ###

现在可以开始使用下载好的源代码编译 Node.js。在开始编译前，你需要在 ubuntu server 上切换到源代码解压缩后的目录，运行 configure 脚本来配置源代码。

    root@ubuntu-15:~/node-v4.0.0-rc.1# ./configure

![Installing NodeJS](http://blog.linoxide.com/wp-content/uploads/2015/09/configure.png)

现在运行命令 'make install' 编译安装 Node.js：

    root@ubuntu-15:~/node-v4.0.0-rc.1# make install

make 命令会花费几分钟完成编译，安静的等待一会。

### 验证 Node.js 安装 ###

一旦编译任务完成，我们就可以开始验证安装工作是否 OK。我们运行下列命令来确认 Node.js 的版本。

    root@ubuntu-15:~# node -v
    v4.0.0-pre

在命令行下不带参数的运行`node` 就会进入 REPL(Read-Eval-Print-Loop,读-执行-输出-循环)模式，它有一个简化版的emacs 行编辑器，通过它你可以交互式的运行JS和查看运行结果。

![node version](http://blog.linoxide.com/wp-content/uploads/2015/09/node.png)

### 编写测试程序 ###

我们也可以写一个很简单的终端程序来测试安装是否成功，并且工作正常。要做这个，我们将会创建一个“test.js” 文件，包含以下代码，操作如下：

    root@ubuntu-15:~# vim test.js
    var util = require("util");
    console.log("Hello! This is a Node Test Program");
    :wq!

现在为了运行上面的程序，在命令行运行下面的命令。

    root@ubuntu-15:~# node test.js

![Node Program](http://blog.linoxide.com/wp-content/uploads/2015/09/node-test.png)

在一个成功安装了 Node JS 的环境下运行上面的程序就会在屏幕上得到上图所示的输出，这个程序加载类 “util” 到变量 “util” 中，接着用对象 “util” 运行终端任务，console.log 这个命令作用类似 C++ 里的cout

### 结论 ###

就是这些了。如果你刚刚开始使用 Node.js 开发应用程序，希望本文能够通过在 ubuntu 上安装、运行 Node.js 让你了解一下Node.js 的大概。最后，我们可以认为我们可以期待 Node JS v4.0.0 能够取得显著性能提升。

--------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/setup-node-js-4-0-ubuntu-14-04-15-04/

作者：[Kashif Siddique][a]
译者：[osk874](https://github.com/osk874)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/kashifs/
[1]:https://nodejs.org/download/rc/v4.0.0-rc.1/

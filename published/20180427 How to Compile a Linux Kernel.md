如何编译 Linux 内核
======

> Jack 将带你在 Ubuntu 16.04 服务器上走过内核编译之旅。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/chester-alvarez-644-unsplash.jpg?itok=aFxG9kUZ)

曾经有一段时间，升级 Linux 内核让很多用户打心里有所畏惧。在那个时候，升级内核包含了很多步骤，也需要很多时间。现在，内核的安装可以轻易地通过像 `apt` 这样的包管理器来处理。通过添加特定的仓库，你能很轻易地安装实验版本的或者指定版本的内核（比如针对音频产品的实时内核）。

考虑一下，既然升级内核如此容易，为什么你不愿意自行编译一个呢？这里列举一些可能的原因：

  * 你想要简单了解编译内核的过程
  * 你需要启用或者禁用内核中特定的选项，因为它们没有出现在标准选项里
  * 你想要启用标准内核中可能没有添加的硬件支持
  * 你使用的发行版需要你编译内核
  * 你是一个学生，而编译内核是你的任务

不管出于什么原因，懂得如何编译内核是非常有用的，而且可以被视作一个通行权。当我第一次编译一个新的 Linux 内核（那是很久以前了），然后尝试从它启动，我从中（系统马上就崩溃了，然后不断地尝试和失败）感受到一种特定的兴奋。

既然这样，让我们来实验一下编译内核的过程。我将使用 Ubuntu 16.04 Server 来进行演示。在运行了一次常规的 `sudo apt upgrade` 之后，当前安装的内核版本是 `4.4.0-121`。我想要升级内核版本到 `4.17`， 让我们小心地开始吧。

有一个警告：强烈建议你在虚拟机里实验这个过程。基于虚拟机，你总能创建一个快照，然后轻松地从任何问题中回退出来。不要在产品机器上使用这种方式升级内核，除非你知道你在做什么。

### 下载内核

我们要做的第一件事是下载内核源码。在 [Kernel.org][1] 找到你要下载的所需内核的 URL。找到 URL 之后，使用如下命令（我以 `4.17 RC2` 内核为例） 来下载源码文件:

```
wget https://git.kernel.org/torvalds/t/linux-4.17-rc2.tar.gz
```

在下载期间，有一些事需要去考虑。

### 安装需要的环境

为了编译内核，我们首先得安装一些需要的环境。这可以通过一个命令来完成：

```
sudo apt-get install git fakeroot build-essential ncurses-dev xz-utils libssl-dev bc flex libelf-dev bison
```

务必注意：你将需要至少 128GB 的本地可用磁盘空间来完成内核的编译过程。因此你必须确保有足够的空间。

### 解压源码

在新下载的内核所在的文件夹下，使用该命令来解压内核：

```
tar xvzf linux-4.17-rc2.tar.gz
```

使用命令 `cd linux-4.17-rc2` 进入新生成的文件夹。

### 配置内核

在正式编译内核之前，我们首先必须配置需要包含哪些模块。实际上，有一些非常简单的方式来配置。使用一个命令，你能拷贝当前内核的配置文件，然后使用可靠的 `menuconfig` 命令来做任何必要的更改。使用如下命令来完成：

```
cp /boot/config-$(uname -r) .config
```

现在你有一个配置文件了，输入命令 `make menuconfig`。该命令将打开一个配置工具（图 1），它可以让你遍历每个可用模块，然后启用或者禁用你需要或者不需要的模块。

![menuconfig][3]

*图 1: 运行中的 `make menuconfig`*

很有可能你会禁用掉内核中的一个重要部分，所以在 `menuconfig` 期间小心地一步步进行。如果你对某个选项不确定，不要去管它。或者更好的方法是使用我们拷贝的当前运行的内核的配置文件（因为我们知道它可以工作）。一旦你已经遍历了整个配置列表（它非常长），你就准备好开始编译了。

### 编译和安装

现在是时候去实际地编译内核了。第一步是使用 `make` 命令去编译。调用 `make` 命令然后回答必要的问题（图 2）。这些问题取决于你将升级的现有内核以及升级后的内核。相信我，将会有非常多的问题要回答，因此你得预留大量的时间。

![make][6]

*图 2: 回答 `make` 命令的问题*

回答了长篇累牍的问题之后，你就可以用如下的命令安装那些之前启用的模块：

```
make modules_install
```

又来了，这个命令将耗费一些时间，所以要么坐下来看着编译输出，或者去做些其他事（因为编译期间不需要你的输入）。可能的情况是，你想要去进行别的任务（除非你真的喜欢看着终端界面上飞舞而过的输出）。

现在我们使用这个命令来安装内核：

```
sudo make install
```

又一次，另一个将要耗费大量可观时间的命令。事实上，`make install` 命令将比 `make modules_install` 命令花费更多的时间。去享用午餐，配置一个路由器，将 Linux 安装在一些服务器上，或者小睡一会吧。

### 启用内核作为引导

一旦 `make install` 命令完成了，就是时候将内核启用来作为引导。使用这个命令来实现：

```
sudo update-initramfs -c -k 4.17-rc2
```

当然，你需要将上述内核版本号替换成你编译完的。当命令执行完毕后，使用如下命令来更新 grub：

```
sudo update-grub
```

现在你可以重启系统并且选择新安装的内核了。

### 恭喜!

你已经编译了一个 Linux 内核！它是一项耗费时间的活动；但是，最终你的 Linux 发行版将拥有一个定制的内核，同时你也将拥有一项被许多 Linux 管理员所倾向忽视的重要技能。

从 Linux 基金会和 edX 提供的免费 [“Introduction to Linux”][7] 课程来学习更多的 Linux 知识。

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2018/4/how-compile-linux-kernel-0

作者：[Jack Wallen][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[icecoobe](https://github.com/icecoobe)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/jlwallen
[1]:https://www.kernel.org/
[2]:/files/images/kernelcompile1jpg
[3]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/kernel_compile_1.jpg?itok=ZNybYgEt (menuconfig)
[4]:/licenses/category/used-permission
[5]:/files/images/kernelcompile2jpg
[6]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/kernel_compile_2.jpg?itok=TYfV02wC (make)
[7]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux



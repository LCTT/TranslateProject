LFS中文版手册发布：如何打造自己的 Linux 发行版
================================================================================
您是否想过打造您自己的 Linux 发行版？每个 Linux 用户在他们使用 Linux 的过程中都想过做一个他们自己的发行版，至少一次。我也不例外，作为一个 Linux 菜鸟，我也考虑过开发一个自己的 Linux 发行版。从头开发一个 Linux 发行版这件事情被称作 Linux From Scratch （LFS）。

在开始之前，我总结了一些有关 LFS 的内容，如下：

**1. 那些想要打造他们自己的 Linux 发行版的人应该了解打造一个 Linux 发行版（打造意味着从头开始）与配置一个已有的 Linux 发行版的不同**

如果您只是想调整下启动屏幕、定制登录页面以及拥有更好的外观和使用体验。您可以选择任何一个 Linux 发行版并且按照您的喜好进行个性化配置。此外，有许多配置工具可以帮助您。

如果您想打包所有必须的文件、引导加载器和内核，并选择什么该被包括进来，然后依靠自己编译这一切东西。那么您需要的就是 Linux From Scratch （LFS）。

**注意**：如果您只想要定制 Linux 系统的外表和体验，这个指南并不适合您。但如果您真的想打造一个 Linux 发行版，并且向了解怎么开始以及一些其他的信息，那么这个指南正是为您而写。

**2. 打造一个 Linux 发行版（LFS）的好处**

- 您将了解 Linux 系统的内部工作机制
- 您将开发一个灵活的适应您需求的系统
- 您开发的系统（LFS）将会非常紧凑，因为您对该包含/不该包含什么拥有绝对的掌控
- 您开发的系统（LFS）在安全性上会更好

**3. 打造一个Linux发行版（LFS）的坏处**

打造一个 Linux 系统意味着将所有需要的东西放在一起并且编译之。这需要许多查阅、耐心和时间。而且您需要一个可用的 Linux 系统和足够的磁盘空间来打造 LFS。

**4. 有趣的是，Gentoo/GNU Linux 在某种意义上最接近于 LFS。Gentoo 和 LFS 都是完全从源码编译的定制的 Linux 系统**

**5. 您应该是一个有经验的Linux用户，对编译包、解决依赖有相当的了解，并且是个 shell 脚本的专家。**

了解一门编程语言（最好是 C 语言）将会使事情变得容易些。但哪怕您是一个新手，只要您是一个优秀的学习者，可以很快的掌握知识，您也可以开始。最重要的是不要在 LFS 过程中丢失您的热情。

如果您不够坚定，恐怕会在 LFS 进行到一半时放弃。

**6. 现在您需要一步一步的指导来打造一个 Linux 。LFS 手册是打造 LFS 的官方指南。我们的合作站点 tradepub 也为我们的读者制作了 LFS 的指南，这同样是免费的。 ###

您可以从下面的链接下载 Linux From Scratch 的电子书：

[![](http://www.tecmint.com/wp-content/uploads/2015/05/Linux-From-Scratch.gif)][1]

下载: [Linux From Scratch][1]

**7. 当前 LFS 的版本是 7.7，分为 systemd 版本和非 systemd 版本**

LFS 的官方网站是： http://www.linuxfromscratch.org/

您可以在官网在线浏览 LFS 以及类似 BLFS 这样的相关项目的手册，也可以下载不同格式的版本。

- LFS （非 systemd 版本）：
	- PDF 版本： http://www.linuxfromscratch.org/lfs/downloads/stable/LFS-BOOK-7.7.pdf
	- 单一 HTML 版本：  http://www.linuxfromscratch.org/lfs/downloads/stable/LFS-BOOK-7.7-NOCHUNKS.html
	- 打包的多页 HTML 版本： http://www.linuxfromscratch.org/lfs/downloads/stable/LFS-BOOK-7.7.tar.bz2
- LFS （systemd 版本）：
	- PDF 版本： http://www.linuxfromscratch.org/lfs/downloads/7.7-systemd/LFS-BOOK-7.7-systemd.pdf
	- 单一 HTML 版本：  http://www.linuxfromscratch.org/lfs/downloads/7.7-systemd/LFS-BOOK-7.7-systemd-NOCHUNKS.html
	- 打包的多页 HTML 版本： http://www.linuxfromscratch.org/lfs/downloads/7.7-systemd/LFS-BOOK-7.7-systemd.tar.bz2
	
**8. Linux 中国/LCTT 翻译了一份 LFS 手册（7.7，systemd 版本）**

经过 LCTT 成员的努力，我们终于完成了对 LFS 7.7 systemd 版本手册的翻译。

手册在线访问地址：https://linux.cn/lfs/LFS-BOOK-7.7-systemd/index.html 。

其它格式的版本稍后推出。 

感谢参与翻译的成员： wxy, ictlyh, dongfengweixiao, zpl1025, H-mudcup, Yuking-net, kevinSJ 。


### 关于：Linux From Scratch ###

这本手册是由 LFS 的项目领头人 Gerard Beekmans 创作的， Matthew Burgess 和 Bruse Dubbs 参与编辑，两人都是LFS 项目的联合领导人。这本书内容很广泛，有 338 页之多。

手册中内容包括：介绍 LFS、准备构建、构建 LFS、建立启动脚本、使 LFS 可以引导，以及附录。其中涵盖了您想知道的 LFS 项目中的所有东西。

这本手册还给出了编译一个包的预估时间。预估的时间以编译第一个包的时间作为参考。所有的东西都以易于理解的方式呈现，甚至对于新手来说也是这样。

如果您有充裕的时间并且真正对构建自己的 Linux 发行版感兴趣，那么您绝对不会错过下载这个电子书（免费下载）的机会。您需要做的，便是照着这本手册在一个工作的 Linux 系统（任何 Linux 发行版，足够的磁盘空间即可）中开始构建您自己的 Linux 系统，付出时间和热情。

如果 Linux 使您着迷，如果您想自己动手构建一个自己的 Linux 发行版，这便是现阶段您应该知道的全部了，其他的信息您可以参考上面链接的手册中的内容。

请让我了解您阅读/使用这本手册的经历，这本详尽的 LFS 指南的使用是否足够简单？如果您已经构建了一个 LFS 并且想给我们的读者一些建议，欢迎留言和反馈。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/create-custom-linux-distribution-from-scratch/

作者：[Avishek Kumar][a]
译者：[wwy-hust](https://github.com/wwy-hust)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://tecmint.tradepub.com/free/w_linu01/prgm.cgi

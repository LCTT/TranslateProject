NODEOS: NODE爱好者的Linux发行版
================================================

![](http://itsfoss.com/wp-content/uploads/2016/05/node-os-linux.jpg)

[NodeOS][1]是一个基于[Node.js][2]的操作系统，自去年的首个[发布候选版][3]之后正朝着它的1.0版本进发。

如果你是第一次听到它，NodeOS是首个在[Linux][5]内核之上由Node.js和[npm][4]驱动的操作系统。[Jacob Groundwater][6]仔2013年中介绍了这个项目。操作系统中用到的主要技术是：

- **Linux 内核**: 这个系统内置了Linux内核
- **Node.js 运行时**: Node作为主要的运行时
- **npm 包管理**: npm作为包管理

NodeOS源码托管在[Github][7]上，因此，任何感兴趣的人都可以轻松贡献或者报告bug。用户可以从源码构建或者使用[预编译镜像][8]。构建过程及使用可以在项目仓库中找到。

NodeOS背后的思想是提供足够npm运行的环境，剩余的功能就可以来自npm包管理。因此，用户可以使用大量的大约250,000的包，并且这个数目每天都还在增长。并且所有的都是开源的，你可以根据你的需要很容易地打补丁或者增加更多的包。

NodeOS核心开发被分离成了不同的层，基本的结构包含：

- **barebones** –  带有可以启动到Node.js REPL的initramfs的自定义内核
- **initramfs** – =用于挂载用户分区以及启动系统的initram文件系统
- **rootfs** – 托管linux内核及initramfs文件的只读分区
- **usersfs** – 多用户文件系统(如传统系统一样)

NodeOS的目标是可以仔任何平台上运行，包括- **真实的硬件（用户计算机或者SoC）**、**云平台、虚拟机、PaaS提供商，容器**（Docker和Vagga）等等。如今看来，它做得似乎不错。在3.3号，NodeOS的成员[Jesús Leganés Combarro][9]在Github上[宣布][10]：

>**NodeOS不再是一个玩具系统了**，它现在开始可以用在有实际需求的生产环境中了。

因此，如果你是Node.js的死忠或者乐于尝试新鲜事物，这或许值得你一试。在相关的文章中，你应该了解这些[Linux发行版的具体用法][11]


--------------------------------------------------------------------------------

via: http://itsfoss.com/nodeos-operating-system/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+ItsFoss+%28Its+FOSS%21+An+Open+Source+Blog%29

作者：[Munif Tanjim][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://itsfoss.com/author/munif/
[1]: http://node-os.com/
[2]: https://nodejs.org/en/
[3]: https://github.com/NodeOS/NodeOS/releases/tag/v1.0-RC1
[4]: https://www.npmjs.com/
[5]: http://itsfoss.com/tag/linux/
[6]: https://github.com/groundwater
[7]: https://github.com/nodeos/nodeos
[8]: https://github.com/NodeOS/NodeOS/releases
[9]: https://github.com/piranna
[10]: https://github.com/NodeOS/NodeOS/issues/216
[11]: http://itsfoss.com/weird-ubuntu-based-linux-distributions/

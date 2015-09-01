如何在树莓派 2 运行 ubuntu Snappy Core
================================================================================
物联网(Internet of Things， IoT) 时代即将来临。很快，过不了几年，我们就会问自己当初是怎么在没有物联网的情况下生存的，就像我们现在怀疑过去没有手机的年代。Canonical  就是一个物联网快速发展却还是开放市场下的竞争者。这家公司宣称自己把赌注压到了IoT 上，就像他们已经在“云”上做过的一样。在今年一月底，Canonical  启动了一个基于Ubuntu Core 的小型操作系统，名字叫做 [Ubuntu Snappy Core][1] 。

Snappy 代表了两种意思，它是一种用来替代 deb 的新的打包格式；也是一个用来更新系统的前端，从CoreOS、红帽子和其他系统借鉴了**原子更新**这个想法。自从树莓派 2 投入市场，Canonical 很快就发布了用于树莓派的Snappy Core 版本。而第一代树莓派因为是基于ARMv6 ，Ubuntu 的ARM 镜像是基于ARMv7 ，所以不能运行ubuntu 。不过这种状况现在改变了，Canonical 通过发布 Snappy Core 的RPI2 镜像，抓住机会证明了Snappy 就是一个用于云计算，特别是用于物联网的系统。

Snappy 同样可以运行在其它像Amazon EC2， Microsofts Azure， Google的 Compute Engine 这样的云端上，也可以虚拟化在 KVM、Virtuabox 和vagrant 上。Canonical  Ubuntu 已经拥抱了微软、谷歌、Docker、OpenStack 这些重量级选手，同时也与一些小项目达成合作关系。除了一些创业公司，比如 Ninja Sphere、Erle Robotics，还有一些开发板生产商，比如 Odroid、Banana Pro, Udoo, PCDuino  和 Parallella 、全志，Snappy 也提供了支持。Snappy Core 同时也希望尽快运行到路由器上来帮助改进路由器生产商目前很少更新固件的策略。

接下来，让我们看看怎么样在树莓派 2 上运行 Ubuntu Snappy Core。

用于树莓派2 的Snappy 镜像可以从 [Raspberry Pi 网站][2]  上下载。解压缩出来的镜像必须[写到一个至少8GB 大小的SD 卡][3]。尽管原始系统很小，但是原子升级和回滚功能会占用不小的空间。使用 Snappy 启动树莓派 2 后你就可以使用默认用户名和密码(都是ubuntu)登录系统。

![](https://farm8.staticflickr.com/7639/16428527263_f7bdd56a0d_c.jpg)

sudo 已经配置好了可以直接用，安全起见，你应该使用以下命令来修改你的用户名

    $ sudo usermod -l <new name> <old name> 

或者也可以使用`adduser` 为你添加一个新用户。

因为RPI缺少硬件时钟，而 Snappy Core 镜像并不知道这一点，所以系统会有一个小 bug：处理某些命令时会报很多错。不过这个很容易解决：

使用这个命令来确认这个bug 是否影响：

    $ date 

如果输出类似 "Thu Jan  1 01:56:44 UTC 1970"， 你可以这样做来改正：

    $ sudo date --set="Sun Apr 04 17:43:26 UTC 2015" 

改成你的实际时间。

![](https://farm9.staticflickr.com/8735/16426231744_c54d9b8877_b.jpg)

现在你可能打算检查一下，看看有没有可用的更新。注意通常使用的命令是不行的：

    $ sudo apt-get update && sudo apt-get distupgrade 

这时系统不会让你通过，因为 Snappy 使用它自己精简过的、基于dpkg 的包管理系统。这么做的原因是 Snappy 会运行很多嵌入式程序，而同时你也会试图所有事情尽可能的简化。

让我们来看看最关键的部分，理解一下程序是如何与 Snappy 工作的。运行 Snappy 的SD 卡上除了 boot 分区外还有3个分区。其中的两个构成了一个重复的文件系统。这两个平行文件系统被固定挂载为只读模式，并且任何时刻只有一个是激活的。第三个分区是一个部分可写的文件系统，用来让用户存储数据。通过更新系统，标记为'system-a' 的分区会保持一个完整的文件系统，被称作核心，而另一个平行的文件系统仍然会是空的。

![](https://farm9.staticflickr.com/8758/16841251947_21f42609ce_b.jpg)

如果我们运行以下命令：

    $ sudo snappy update

系统将会在'system-b' 上作为一个整体进行更新，这有点像是更新一个镜像文件。接下来你将会被告知要重启系统来激活新核心。

重启之后，运行下面的命令可以检查你的系统是否已经更新到最新版本，以及当前被激活的是哪个核心

    $ sudo snappy versions -a 

经过更新-重启两步操作，你应该可以看到被激活的核心已经被改变了。

因为到目前为止我们还没有安装任何软件，所以可以用下面的命令更新：

    $ sudo snappy update ubuntu-core

如果你打算仅仅更新特定的OS 版本这就够了。如果出了问题，你可以使用下面的命令回滚：

    $ sudo snappy rollback ubuntu-core

这将会把系统状态回滚到更新之前。

![](https://farm8.staticflickr.com/7666/17022676786_5fe6804ed8_c.jpg)

再来说说那些让 Snappy 变得有用的软件。这里不会讲的太多关于如何构建软件、向 Snappy 应用商店添加软件的基础知识，但是你可以通过 Freenode 上的IRC 频道 #snappy 了解更多信息，那个上面有很多人参与。你可以通过浏览器访问http://\<ip-address>:4200 来浏览应用商店，然后从商店安装软件，再在浏览器里访问 http://webdm.local 来启动程序。如何构建用于 Snappy 的软件并不难，而且也有了现成的[参考文档][4] 。你也可以很容易的把  DEB 安装包使用Snappy 格式移植到Snappy 上。

![](https://farm8.staticflickr.com/7656/17022676836_968a2a7254_c.jpg)

尽管 Ubuntu Snappy Core 吸引了我们去研究新型的 Snappy 安装包格式和 Canonical 式的原子更新操作，但是因为有限的可用应用，它现在在生产环境里还不是很有用。但是既然搭建一个 Snappy 环境如此简单，这看起来是一个学点新东西的好机会。

--------------------------------------------------------------------------------

via: http://xmodulo.com/ubuntu-snappy-core-raspberry-pi-2.html

作者：[Ferdinand Thommes][a]
译者：[Ezio](https://github.com/oska874)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/ferdinand
[1]:http://www.ubuntu.com/things
[2]:http://www.raspberrypi.org/downloads/
[3]:http://xmodulo.com/write-raspberry-pi-image-sd-card.html
[4]:https://developer.ubuntu.com/en/snappy/

如何在树莓派2 代运行ubuntu Snappy Core
================================================================================
物联网(Internet of Things, IoT) 时代即将来临。很快，过不了几年，我们就会问自己当初是怎么在没有物联网的情况下生存的，就像我们现在怀疑过去没有手机的年代。Canonical  就是一个物联网快速发展却还是开放市场下的竞争者。这家公司宣称自己把赌注压到了IoT 上，就像他们已经在“云”上做过的一样。。在今年一月底，Canonical  启动了一个基于Ubuntu Core 的小型操作系统，名字叫做 [Ubuntu Snappy Core][1] 。

Snappy 是一种用来替代deb 的新的打包格式，是一个用来更新系统的前端，从CoreOS、红帽子和其他地方借鉴了原子更新这个想法。很快树莓派2 代投入市场，Canonical 就发布了用于树莓派的Snappy Core 版本。第一代树莓派因为是基于ARMv6 ，而Ubuntu 的ARM 镜像是基于ARMv7 ，所以不能运行ubuntu 。不过这种状况现在改变了，Canonical 通过发布用于RPI2 的镜像，抓住机会澄清了Snappy 就是一个用于云计算，特别是IoT 的系统。

Snappy 同样可以运行在其它像Amazon EC2, Microsofts Azure, Google's Compute Engine 这样的云端上，也可以虚拟化在KVM、Virtuabox 和vagrant 上。Canonical  已经拥抱了微软、谷歌、Docker、OpenStack 这些重量级选手，同时也与一些小项目达成合作关系。除了一些创业公司，像Ninja Sphere、Erle Robotics，还有一些开发板生产商比如Odroid、Banana Pro, Udoo, PCDuino  和Parallella 、全志。Snappy Core 也希望很快能运行在路由器上，来帮助改进路由器生产商目前很少更新固件的策略。

接下来，让我们看看怎么样在树莓派2 上运行Snappy。

用于树莓派2 的Snappy 镜像可以从 [Raspberry Pi 网站][2]  上下载。解压缩出来的镜像必须[写到一个至少8GB 大小的SD 卡][3]。尽管原始系统很小，但是院子升级和回滚功能会蚕食不小的空间。使用Snappy 启动树莓派2 后你就可以使用默认用户名和密码(都是ubuntu)登录系统。

![](https://farm8.staticflickr.com/7639/16428527263_f7bdd56a0d_c.jpg)

sudo 已经配置好了可以直接用，安全起见，你应该使用以下命令来修改你的用户名

    $ sudo usermod -l <new name> <old name> 

或者也可以使用`adduser` 为你添加一个新用户。

因为RPI缺少硬件始终，而Snappy 不知道这一点，所以系统会有一个小bug：处理命令时会报很多错。不过这个很容易解决：

使用这个命令来确认这个bug 是否影响：

    $ date 

如果输出是 "Thu Jan  1 01:56:44 UTC 1970"， 你可以这样做来改正：

    $ sudo date --set="Sun Apr 04 17:43:26 UTC 2015" 

改成你的实际时间。

![](https://farm9.staticflickr.com/8735/16426231744_c54d9b8877_b.jpg)

现在你可能打算检查一下，看看有没有可用的更新。注意通常使用的命令：

    $ sudo apt-get update && sudo apt-get distupgrade 

现在将不会让你通过，因为Snappy 会使用它自己精简过的、基于dpkg 的包管理系统。这是做是应为Snappy 会运行很多嵌入式程序，而你也会想着所有事情尽可能的简化。

让我们来看看最关键的部分，理解一下程序是如何与Snappy 工作的。运行Snappy 的SD 卡上除了boot 分区外还有3个分区。其中的两个构成了一个重复的文件系统。这两个平行文件系统被固定挂载为只读模式，并且任何时刻只有一个是激活的。第三个分区是一个部分可写的文件系统，用来让用户存储数据。通过更新系统，标记为'system-a' 的分区会保持一个完整的文件系统，被称作核心，而另一个平行文件系统仍然会是空的。

![](https://farm9.staticflickr.com/8758/16841251947_21f42609ce_b.jpg)

如果我们运行以下命令：

    $ sudo snappy update

系统将会在'system-b' 上作为一个整体进行更新，这有点像是更新一个镜像文件。接下来你将会被告知要重启系统来激活新核心。

重启之后，运行下面的命令可以检查你的系统是否已经更新到最新版本，以及当前被激活的是那个核心

    $ sudo snappy versions -a 

经过更新-重启的操作，你应该可以看到被激活的核心已经被改变了。

因为到目前为止我们还没有安装任何软件，下面的命令：

    $ sudo snappy update ubuntu-core

将会生效，而且如果你打算仅仅更新特定的OS，这也是一个办法。如果出了问题，你可以使用下面的命令回滚：

    $ sudo snappy rollback ubuntu-core

这将会把系统状态回滚到更新之前。

![](https://farm8.staticflickr.com/7666/17022676786_5fe6804ed8_c.jpg)

再来说说那些让Snappy 有用的软件。这里不会讲的太多关于如何构建软件、向Snappy 应用商店添加软件的基础知识，但是你可以通过Freenode 上的IRC 频道#snappy 了解更多信息，那个上面有很多人参与。你可以通过浏览器访问http://<ip-address>:4200 来浏览应用商店，然后从商店安装软件，再在浏览器里访问http://webdm.local 来启动程序。如何构建用于Snappy 的软件并不难，而且也有了现成的[参考文档][4] 。你也可以很容易的把DEB 安装包使用Snappy 格式移植到Snappy 上。

![](https://farm8.staticflickr.com/7656/17022676836_968a2a7254_c.jpg)

尽管Ubuntu Snappy Core 吸引我们去研究新型的Snappy 安装包格式和Canonical 式的原子更新操作，但是因为有限的可用应用，它现在在生产环境里还不是很有用。但是既然搭建一个Snappy 环境如此简单，这看起来是一个学点新东西的好机会。

--------------------------------------------------------------------------------

via: http://xmodulo.com/ubuntu-snappy-core-raspberry-pi-2.html

作者：[Ferdinand Thommes][a]
译者：[译者ID](https://github.com/oska874)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/ferdinand
[1]:http://www.ubuntu.com/things
[2]:http://www.raspberrypi.org/downloads/
[3]:http://xmodulo.com/write-raspberry-pi-image-sd-card.html
[4]:https://developer.ubuntu.com/en/snappy/

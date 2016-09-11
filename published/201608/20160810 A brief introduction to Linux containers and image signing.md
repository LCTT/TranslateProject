浅谈 Linux 容器和镜像签名
====================

![](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/containers_2015-1-osdc-lead.png?itok=E1imOYe4)

从根本上说，几乎所有的主要软件，即使是开源软件，都是在基于镜像的容器技术出现之前设计的。这意味着把软件放到容器中相当于是一次平台移植。这也意味着一些程序可以很容易就迁移，[而一些就更困难][1]。

我大约在三年半前开展基于镜像的容器相关工作。到目前为止，我已经容器化了大量应用。我了解到什么是现实情况，什么是迷信。今天，我想简要介绍一下 Linux 容器是如何设计的，以及谈谈镜像签名。

### Linux 容器是如何设计的

对于基于镜像的 Linux 容器，让大多数人感到困惑的是，它把操作系统分割成两个部分：[内核空间与用户空间][2]。在传统操作系统中，内核运行在硬件上，你无法直接与其交互。用户空间才是你真正能交互的，这包括所有你可以通过文件浏览器或者运行`ls`命令能看到的文件、类库、程序。当你使用`ifconfig`命令调整 IP 地址时，你实际上正在借助用户空间的程序来使内核根据 TCP 协议栈改变。这点经常让没有研究过 [Linux/Unix 基础][3]的人大吃一惊。

过去，用户空间中的类库支持了与内核交互的程序（比如 ifconfig、sysctl、tuned-adm）以及如网络服务器和数据库之类的面向用户的程序。这些所有的东西都堆积在一个单一的文件系统结构中。用户可以在 /sbin 或者 /lib 文件夹中找到所有操作系统本身支持的程序和类库，或者可以在 /usr/sbin 或 /usr/lib 文件夹中找到所有面向用户的程序或类库（参阅[文件系统层次结构标准][4]）。这个模型的问题在于操作系统程序和业务支持程序没有绝对的隔离。/usr/bin 中的程序可能依赖 /lib 中的类库。如果一个应用所有者需要改变一些东西，就很有可能破坏操作系统。相反地，如果负责安全更新的团队需要改变一个类库，就（常常）有可能破坏面向业务的应用。这真是一团糟。

借助基于镜像的容器，比如 Docker、LXD、RKT，应用程序所有者可以打包和调整所有放在 /sbin、/lib、/usr/bin 和 /usr/lib 中的依赖部分，而不用担心破坏底层操作系统。本质上讲，容器技术再次干净地将操作系统隔离为两部分：内核空间与用户空间。现在开发人员和运维人员可以分别独立地更新各自的东西。

然而还是有些令人困扰的地方。通常，每个应用所有者（或开发者）并不想负责更新这些应用依赖：像 openssl、glibc，或很底层的基础组件，比如，XML 解析器、JVM，再或者处理与性能相关的设置。过去，这些问题都委托给运维团队来处理。由于我们在容器中打包了很多依赖，对于很多组织来讲，对容器内的所有东西负责仍是个严峻的问题。

### 迁移现有应用到 Linux 容器

把应用放到容器中算得上是平台移植，我准备突出介绍究竟是什么让移植某些应用到容器当中这么困难。

（通过容器，）开发者现在对 /sbin 、/lib、 /usr/bin、 /usr/lib 中的内容有完全的控制权。但是，他们面临的挑战是，他们仍需要将数据和配置放到 /etc 或者 /var/lib 文件夹中。对于基于镜像的容器来说，这是一个糟糕的想法。我们真正需要的是代码、配置以及数据的隔离。我们希望开发者把代码放在容器当中，而数据和配置通过不同的环境（比如，开发、测试或生产环境）来获得。

这意味着我们（或者说平台）在实例化容器时，需要挂载 /etc 或 /var/lib 中的一些文件或文件夹。这会允许我们到处移动容器并仍能从环境中获得数据和配置。听起来很酷吧？这里有个问题，我们需要能够干净地隔离配置和数据。很多现代开源软件比如 Apache、MySQL、MongoDB、Nginx 默认就这么做了。[但很多自产的、历史遗留的、或专有程序并未默认这么设计][5]。对于很多组织来讲，这是主要的痛点。对于开发者来讲的最佳实践是，开始架构新的应用，移植遗留代码，以完成配置和数据的完全隔离。

### 镜像签名简介

信任机制是容器的重要议题。容器镜像签名允许用户添加数字指纹到镜像中。这个指纹随后可被加密算法测试验证。这使得容器镜像的用户可以验证其来源并信任。

容器社区经常使用“容器镜像”这个词组，但这个命名方法会让人相当困惑。Docker、LXD 和 RKT 推行获取远程文件来当作容器运行这样的概念。这些技术各自通过不同的方式处理容器镜像。LXD 用单独的一层来获取单独一个容器，而 Docker 和 RKT 使用基于开放容器镜像（OCI）格式，可由多层组成。糟糕的是，会出现不同团队和组织对容器镜像中的不同层负责的情况。容器镜像概念下隐含的是容器镜像格式的概念。拥有标准的镜像格式比如 OCI 会让容器生态系统围绕着镜像扫描、签名，和在不同云服务提供商间转移而繁荣发展。

现在谈到签名了。

容器存在一个问题，我们把一堆代码、二进制文件和类库放入其中。一旦我们打包了代码，我们就要把它和必要的文件服务器（注册服务器）共享。代码只要被共享，它基本上就是不具名的，缺少某种密文签名。更糟糕的是，容器镜像经常由不同人或团队控制的各个镜像层组成。每个团队都需要能够检查上一个团队的工作，增加他们自己的工作内容，并在上面添加他们自己的批准印记。然后他们需要继续把工作交给下个团队。

（由很多镜像组成的）容器镜像的最终用户需要检查监管链。他们需要验证每个往其中添加文件的团队的可信度。对于最终用户而言，对容器镜像中的每一层都有信心是极其重要的。

*作者 Scott McCarty 于 8 月 24 日在 ContainerCon 会议上作了题为 [Containers for Grownups: Migrating Traditional & Existing Applications][6] 的报告，更多内容请参阅报告[幻灯片][7]。*

--------------------------------------------------------------------------------

via:  https://opensource.com/bus/16/8/introduction-linux-containers-and-image-signing

作者：[Scott McCarty][a]
译者：[Tanete](https://github.com/Tanete)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/fatherlinux
[1]: http://rhelblog.redhat.com/2016/04/21/architecting-containers-part-4-workload-characteristics-and-candidates-for-containerization/
[2]: http://rhelblog.redhat.com/2015/07/29/architecting-containers-part-1-user-space-vs-kernel-space/
[3]: http://rhelblog.redhat.com/tag/architecting-containers/
[4]: https://linux.cn/article-6132-1.html
[5]: http://rhelblog.redhat.com/2016/04/21/architecting-containers-part-4-workload-characteristics-and-candidates-for-containerization/
[6]: https://lcccna2016.sched.org/event/7JUc/containers-for-grownups-migrating-traditional-existing-applications-scott-mccarty-red-hat
[7]: http://schd.ws/hosted_files/lcccna2016/91/Containers%20for%20Grownups_%20Migrating%20Traditional%20%26%20Existing%20Applications.pdf

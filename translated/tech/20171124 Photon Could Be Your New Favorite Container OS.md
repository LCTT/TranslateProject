Photon也许能成为你最喜爱的容器操作系统
============================================================

![Photon OS](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/photon-linux.jpg?itok=jUFHPR_c "Photon OS")

Phonton OS专注于容器，是一个非常出色的平台。 —— Jack Wallen

容器在当下的火热，并不是没有原因的。正如[之前][13]讨论的，容器可以使您轻松快捷地将新的服务与应用部署到您的网络上，而且并不耗费太多的系统资源。比起专用硬件和虚拟机，容器都是更加划算的，除此之外，他们更容易更新与重用。

更重要的是，容器喜欢Linux（反之亦然）。不需要太多时间和麻烦，你就可以启动一台Linux服务器，运行[Docker][14]，再是部署容器。但是，哪种Linux发行版最适合部署容器呢？我们的选择很多。你可以使用标准的Ubuntu服务器平台（更容易安装Docker并部署容器）或者是更轻量级的发行版 —— 专门用于部署容器。

[Photon][15]就是这样的一个发行版。这个特殊的版本是由[VMware][16]于2005年创建的，它包含了Docker的守护进程，并与容器框架（如Mesos和Kubernetes）一起使用。Photon经过优化可与[VMware vSphere][17]协同工作，而且可用于裸机，[Microsoft Azure][18], [Google Compute Engine][19], [Amazon Elastic Compute Cloud][20], 或者 [VirtualBox][21]等。

Photon通过只安装Docker守护进程所必需的东西来保持它的轻量。而这样做的结果是，这个发行版的大小大约只有300MB。但这足以让Linux的运行一切正常。除此之外，Photon的主要特点还有：

*   内核调整为性能模式。

*   内核根据[内核自防护项目][6](KSPP)进行了加固。

*   所有安装的软件包都根据加固的安全标志(hardened security flags)来构建。

*   操作系统以信任验证(validated trust)启动。

*   Photon管理进程管理防火墙，网络，软件包，和远程登录在Photon机子上的用户。

*   支持持久卷。

*   [Project Lightwave][7] 整合。

*   及时的安全补丁与更新。

Photon可以通过[ISO][22]，[OVA][23]，[Amazon Machine Image][24]，[Google Compute Engine image][25]和[Azure VHD][26]安装使用。现在我将向您展示如何使用ISO镜像在VirtualBox上安装Photon。整个安装过程大概需要五分钟，在最后您将有一台随时可以部署容器的虚拟机。

### 创建虚拟机

在部署第一台容器之前，您必须先创建一台虚拟机并安装Photon。为此，打开VirtualBox并点击“新建”按钮。跟着创建虚拟机向导进行配置（根据您的容器将需要的用途，为Photon提供必要的资源）。在创建好虚拟机后，您所需要做的第一件事就是更改配置。选择新建的虚拟机（在VirtualBox主窗口的左侧面板中），然后单击“设置”。在弹出的窗口中，点击“网络”（在左侧的导航中）。

在“网络”窗口（图1）中，你需要在“连接”的下拉窗口中选择桥接。这可以确保您的Photon服务与您的网络相连。完成更改后，单击确定。

### [photon_0.jpg][8]

![change settings](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/photon_0.jpg?itok=Q0yhOhsZ "change setatings")
图 1: 更改Photon在VirtualBox中的网络设置。[经许可使用][1]

从左侧的导航选择您的Photon虚拟机，点击启动。系统会提示您去加载IOS镜像。当您完成之后，Photon安装程序将会启动并提示您按回车后开始安装。安装过程基于ncurses（没有GUI），但它非常简单。

接下来（图2），系统会询问您是要最小化安装，完整安装还是安装OSTree服务器。我选择了完整安装。选择您所需要的任意选项，然后按回车继续。

### [photon_1.jpg][9]

![installation type](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/photon_2.jpg?itok=QL1Rs-PH "Photon")
图 2: 选择您的安装类型.[经许可使用][2]

在下一个窗口，选择您要安装Photon的磁盘。由于我们将其安装在虚拟机，因此只有一块磁盘会被列出（图3）。选择“自动”按下回车。然后安装程序会让您输入（并验证）管理员密码。在这之后镜像开始安装在您的磁盘上并在不到5分钟的时间内结束。

### [photon_2.jpg][]

![Photon](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/photon_1.jpg?itok=OdnMVpaA "installation type")
图 3: 选择安装Photon的硬盘.[经许可使用][3]

安装完成后，重启虚拟机并使用安装时创建的用户root和它的密码登录。一切就绪，你准备好开始工作了。

在开始使用Docker之前，您需要更新一下Photon。Photon使用 _yum_ 软件包管理器，因此在以root用户登录后输入命令 _yum update_。如果有任何可用更新，则会询问您是否确认（图4）。

### [photon_3.jpg][11]

![Updating](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/photon_3.jpg?itok=vjqrspE2 "Updating")
图 4: 更新 Photon.[经许可使用][4]

用法

正如我所说的，Photon提供了部署容器甚至创建Kubernetes集群所需要的所有包。但是，在使用之前还要做一些事情。首先要启动Docker守护进程。为此，执行以下命令：

```
systemctl start docker

systemctl enable docker
```

现在我们需要创建一个标准用户(standard user)，因此我们没有以root去运行docker命令。为此，执行以下命令：

```
useradd -m USERNAME

passwd USERNAME
```

其中USERNAME是我们新增的用户的名称。

接下来，我们需要将这个新用户添加到 _docker_ 组，执行命令：

```
usermod -a -G docker USERNAME
```

其中USERNAME是刚刚创建的用户的名称。

注销root用户并切换为新增的用户。现在，您已经可以不必使用 _sudo_ 命令或者是切换到root用户来使用 _docker_命令了。从Docker Hub中取出一个镜像开始部署容器吧。

### 一个优秀的容器平台 

在专注于容器方面，Photon毫无疑问是一个出色的平台。请注意，Photon是一个开源项目，因此没有任何付费支持。如果您对Photon有任何的问题，请移步Photon项目的Github下的[Issues][27]，那里可以供您阅读相关问题，或者提交您的问题。如果您对Photon感兴趣，您也可以在项目的官方[Github][28]中找到源码。

尝试一下Photon吧，看看它是否能够使得Docker容器和Kubernetes集群的部署更加容易。

欲了解Linux的更多信息，可以通过学习Linux基金会和edX的免费课程，[“Linux 入门”][29]。

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2017/11/photon-could-be-your-new-favorite-container-os

作者：[JACK WALLEN][a]
译者：[KeyLD](https://github.com/KeyLd)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/jlwallen
[1]:https://www.linux.com/licenses/category/used-permission
[2]:https://www.linux.com/licenses/category/used-permission
[3]:https://www.linux.com/licenses/category/used-permission
[4]:https://www.linux.com/licenses/category/used-permission
[5]:https://www.linux.com/licenses/category/creative-commons-zero
[6]:https://kernsec.org/wiki/index.php/Kernel_Self_Protection_Project
[7]:http://vmware.github.io/lightwave/
[8]:https://www.linux.com/files/images/photon0jpg
[9]:https://www.linux.com/files/images/photon1jpg
[10]:https://www.linux.com/files/images/photon2jpg
[11]:https://www.linux.com/files/images/photon3jpg
[12]:https://www.linux.com/files/images/photon-linuxjpg
[13]:https://www.linux.com/learn/intro-to-linux/2017/11/how-install-and-use-docker-linux
[14]:https://www.docker.com/
[15]:https://vmware.github.io/photon/
[16]:https://www.vmware.com/
[17]:https://www.vmware.com/products/vsphere.html
[18]:https://azure.microsoft.com/
[19]:https://cloud.google.com/compute/
[20]:https://aws.amazon.com/ec2/
[21]:https://www.virtualbox.org/
[22]:https://github.com/vmware/photon/wiki/Downloading-Photon-OS
[23]:https://github.com/vmware/photon/wiki/Downloading-Photon-OS
[24]:https://github.com/vmware/photon/wiki/Downloading-Photon-OS
[25]:https://github.com/vmware/photon/wiki/Downloading-Photon-OS
[26]:https://github.com/vmware/photon/wiki/Downloading-Photon-OS
[27]:https://github.com/vmware/photon/issues
[28]:https://github.com/vmware/photon
[29]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux

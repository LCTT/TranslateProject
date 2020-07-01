[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12371-1.html)
[#]: subject: (How Cloud-init can be used for your Raspberry Pi homelab)
[#]: via: (https://opensource.com/article/20/5/cloud-init-raspberry-pi-homelab)
[#]: author: (Chris Collins https://opensource.com/users/clcollins)

在你的树莓派家庭实验室中使用 Cloud-init
======

> 了解了云行业的标准，该向你的家庭实验室自动添加新设备和用户了。

![](https://img.linux.net.cn/data/attachment/album/202007/01/203559wt8tnnnxnc6jcnn8.jpg)

[Cloud-init][2]（可以说）是一个标准，云提供商用它来为云实例提供初始化和配置数据。它最常用于新实例的首次启动，以自动完成网络设置、账户创建和 SSH 密钥安装等使新系统上线所需的任何事情，以便用户可以访问它。

在之前的一篇文章《[修改磁盘镜像来创建基于树莓派的家庭实验室][3]》中，我展示了如何为像树莓派这样的单板计算机定制操作系统镜像以实现类似的目标。有了 Cloud-init，就不需要向镜像中添加自定义数据。一旦在镜像中启用了它，你的虚拟机、物理服务器，甚至是小小的树莓派都可以表现得像你自己的 “家庭私有云” 中的云计算实例。新机器只需插入、打开，就可以自动成为你的[家庭实验室][4]的一部分。

说实话，Cloud-init 的设计并没有考虑到家庭实验室。正如我所提到的，你可以很容易地修改给定的一套系统磁盘镜像，以启用 SSH 访问并在第一次启动后对它们进行配置。Cloud-init 是为大规模的云提供商设计的，这些提供商需要容纳许多客户，维护一组小的镜像，并为这些客户提供访问实例的机制，而无需为每个客户定制一个镜像。拥有单个管理员的家庭实验室则不会面临同样的挑战。

不过，Cloud-init 在家庭实验室中也不是没有可取之处。教育是我的家庭私有云项目的目标之一，而为你的家庭实验室设置 Cloud-init 是一个很好的方式，可以获得大大小小的云提供商大量使用的技术的经验。Cloud-init 也是其他初始配置选项的替代方案之一。与其为家庭实验室中的每台设备定制每个镜像、ISO 等，并在你要进行更改时面临繁琐的更新，不如直接启用 Cloud-init。这减少了技术债务 —— 还有什么比*个人*技术债务更糟糕的吗？最后，在你的家庭实验室中使用 Cloud-init 可以让你的私有云实例与你拥有的或将来可能拥有的任何公有云实例表现相同 —— 这是真正的[混合云][5]。
 
### 关于 Cloud-init

当为 Cloud-init 配置的实例启动并且服务开始运行时（实际上是 systemd 中的四个服务，以处理启动过程中的依赖关系），它会检查其配置中的[数据源][6]，以确定其运行在什么类型的云中。每个主要的云提供商都有一个数据源配置，告诉实例在哪里以及如何检索配置信息。然后，实例使用数据源信息检索云提供商提供的配置信息（如网络信息和实例识别信息）和客户提供的配置数据（如要复制的授权密钥、要创建的用户账户以及许多其他可能的任务）。

检索数据后，Cloud-init 再对实例进行配置：设置网络、复制授权密钥等，最后完成启动过程。然后，远程用户就可以访问它，准备好使用 [Ansible][7] 或 [Puppet][8] 等工具进行进一步的配置，或者准备好接收工作负载并开始分配任务。

### 配置数据

如上所述，Cloud-init 使用的配置数据来自两个潜在来源：云提供商和实例用户。在家庭实验室中，你扮演着这两种角色：作为云提供商提供网络和实例信息，作为用户提供配置信息。

#### 云提供商元数据文件

在你的云提供商角色中，你的家庭实验室数据源将为你的私有云实例提供一个元数据文件。这个[元数据][9]文件包含实例 ID、云类型、Python 版本（Cloud-init 用 Python 编写并使用 Python）或要分配给主机的 SSH 公钥等信息。如果你不使用 DHCP（或 Cloud-init 支持的其他机制，如镜像中的配置文件或内核参数），元数据文件还可能包含网络信息。

#### 用户提供的用户数据文件

Cloud-init 的真正价值在于用户数据文件。[用户数据][10]文件由用户提供给云提供商，并包含在数据源中，它将实例从一台普通的机器变成了用户舰队的一员。用户数据文件可以以可执行脚本的形式出现，与正常情况下脚本的工作方式相同；也可以以云服务配置 YAML 文件的形式出现，利用 [Cloud-init 的模块][11] 来执行配置任务。

### 数据源

数据源是由云提供商提供的服务，它为实例提供了元数据和用户数据文件。实例镜像或 ISO 被配置为告知实例正在使用什么数据源。

例如，亚马逊 AWS 提供了一个 [link-local][12] 文件，它将用实例的自定义数据来响应实例的 HTTP 请求。其他云提供商也有自己的机制。幸运的是，对于家庭私有云项目来说，也有 NoCloud 数据源。

[NoCloud][13] 数据源允许通过内核命令以键值对的形式提供配置信息，或通过挂载的 ISO 文件系统以用户数据和元数据文件的形式提供。这些对于虚拟机来说很有用，尤其是与自动化搭配来创建虚拟机。

还有一个 NoCloudNet 数据源，它的行为类似于 AWS EC2 数据源，提供一个 IP 地址或 DNS 名称，通过 HTTP 从这里检索用户数据和元数据。这对于你的家庭实验室中的物理机器来说是最有帮助的，比如树莓派、[NUC][14] 或多余的服务器设备。虽然 NoCloud 可以工作，但它需要更多的人工关注 —— 这是云实例的反模式。

### 家庭实验室的 Cloud-init

我希望这能让你了解到 Cloud-init 是什么，以及它对你的家庭实验室有何帮助。它是一个令人难以置信的工具，被主要的云提供商所接受，在家里使用它可以是为了教育和乐趣，并帮助你自动向实验室添加新的物理或虚拟服务器。之后的文章将详细介绍如何创建简单的静态和更复杂的动态 Cloud-init 服务，并指导你将它们纳入你的家庭私有云。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/cloud-init-raspberry-pi-homelab

作者：[Chris Collins][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clcollins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/innovation_lightbulb_gears_devops_ansible.png?itok=TSbmp3_M (gears and lightbulb to represent innovation)
[2]: https://cloudinit.readthedocs.io/
[3]: https://linux.cn/article-12277-1.html
[4]: https://opensource.com/article/19/3/home-lab
[5]: https://www.redhat.com/en/topics/cloud-computing/what-is-hybrid-cloud
[6]: https://cloudinit.readthedocs.io/en/latest/topics/datasources.html
[7]: https://www.ansible.com/
[8]: https://puppet.com/
[9]: https://cloudinit.readthedocs.io/en/latest/topics/instancedata.html#
[10]: https://cloudinit.readthedocs.io/en/latest/topics/format.html
[11]: https://cloudinit.readthedocs.io/en/latest/topics/modules.html
[12]: https://en.wikipedia.org/wiki/Link-local_address
[13]: https://cloudinit.readthedocs.io/en/latest/topics/datasources/nocloud.html
[14]: https://en.wikipedia.org/wiki/Next_Unit_of_Computing

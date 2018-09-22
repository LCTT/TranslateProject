[translating by jamelouis]
Getting started with openmediavault: A home NAS solution

openmediavault入门：一个家庭NAS解决方案
======
This network-attached file server offers a solid array of features and is easy to install and configure.

这个网络附加文件服务提供了一序列功能，并且易于安装和配置。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bus-cloud.png?itok=vz0PIDDS)

With so many cloud storage options readily available, some folks might question the value of having a home NAS (network-attached storage) server. After all, with your files on the cloud, you don't have to worry about managing the maintenance, updates, and security of your own server.

面对许多可供选择的云存储方案，一些人可能会质疑一个家庭网络附加存储服务的价值。毕竟，当所有你的文件存储在云上，你不需要为你自己云服务的维护，更新，和安全担忧。

But that's not entirely true, is it? You have a home network, so you've got to pay at least some attention to that network's health and security. Assuming you're already keeping on top of that, then [a home NAS][1] really isn't adding that much additional hassle. And there are all kinds of benefits to gain from that minor amount of work.

但是，这不完全对，是不是？你由一个家庭网络，所以你不得不负责维护网络的健康和安全。假定你已经维护一个家庭网络，那么[一个家庭NAS][1]并不会增加额外负担。反而你能从少量的工作中得到许多的好处。

You can have a local backup of every computer in your house (you can also back up off-site). Have a media server that holds movies, music, and photos regardless of whether your internet connection flakes out. Work on large files on multiple computers in your home without waiting for them to traverse from some random computer somewhere else on the internet. Plus, you can have your NAS pull double duty with other services, like hosting local email or a household wiki. Perhaps most importantly, with a home NAS, your data is your data—under your control and always accessible.

你可以为你家里所有的计算机备份(你也可以备份离线网站).构架一个存储电影，音乐和照片的媒体服务器，不管网络连接是否连接。在家里的多台计算机处理大型文件，不需要等待从网络其他随机的计算机传输这些文件过来。另外，可以让NAS与其他服务一起进行双重任务，如托管本地邮件或者家庭Wiki。也许最重要的是，构架家庭NAS，数据完全是你的，始终在控制下和随时可访问的。

The follow-on question is which NAS solution to choose. Sure, you could buy a pre-built solution and call it a day, but what fun is that? And practically speaking, although it's great to have an appliance that handles everything for you, it's often better to have a rig that you can fix and upgrade yourself. This is the situation I found myself in recently. I chose to install and set up [openmediavault][2].

接下来的问题是如何选择NAS方案。当然，你可以购买预先建立的解决方案，并在某一天打电话购买，但是这会有什么乐趣呢？实际上，尽管拥有一个能处理一切的设备很棒，但最好还是有一个可以修复和升级的钻机。这是一个我近期发现的解决方案。我选择安装和配置[openmediavault][2]。

### 为什么选择openmediavault?

There are a few open source NAS solutions out there, some arguably more popular than openmediavault. When I asked around, for instance, [FreeNAS][3] was recommended the most. So why didn't I go with that? After all, it is more widely used, includes more features, and offers more support options, [according to a comparison on the FreeNAS website][4]. That's certainly all true. But openmediavault is no slouch. It's actually based on an earlier version of FreeNAS, and while its numbers are lower in terms of downloads and features, they're more than adequate for my needs.

市面上有不少开源的NAS解决方案，其中有点无可争议的比openmediavault好。当我询问周遭，例如，[freeNAS][3]最常被推荐给我。那么为什么我不采纳他们的建议呢？毕竟，它被大范围的使用，包含很多的功能，和提供许多支持选项，[基于FreeNAS官网的一份对比数据][4]。当然这些全部是对的。但是openmediavault还是不错的。它是基于FreeNAS早期版本，虽然它在下载和功能方面的数量较低，但是对于我的需求而言，它已经相当足够了。

Another factor was a simple matter of comfort. Openmediavault's underlying operating system is [Debian][5], whereas FreeNAS sits atop [FreeBSD][6]. I'm personally not as familiar with FreeBSD, so that would make it more difficult for me to fix things if my NAS starts misbehaving. It also makes it more difficult for me to tweak things or add my own services to the machine if I want. Sure, I could learn FreeBSD and get more familiar with it, but I'm already home-building this NAS; I've found that projects tend to be more successful if you limit the number of "learning opportunities" you give yourself to complete them.

另外一个因素是它很舒适。openmediavault的底层操作系统是[Debian][5],然而FreeNAS是[FreeBSD][6]。由于我个人对FressBSD不是很熟悉，因此如果我的NAS出现故障，必定会很难在FreeBSD上修复故障。同样的，也会是我很难微调配置或添加服务到机器上。当然，我可以学习FreeBSD和更熟悉它，但是我已经在家里构架了这个NAS；我发现，如果限制给定自己完成构建NAS的“学习机会”的数量，构建NAS往往会更成功。

Every situation is different, of course, so do your research and decide what seems to be the best fit for you. FreeNAS looks like the right solution for a lot of people. Openmediavault was the right one for me.

当然，每个情况都不同，所以你要自己调研，然后作出最适合自己方案的决定。FreeNAS对于许多人似乎都是不错的解决方案。Openmediavault正是适合我的解决方案。

### 安装与配置

The installation process is pretty well covered in the [openmediavault documentation][7], so I won't rehash that here. If you've ever installed a Linux distribution, most of the steps should look familiar to you (though with a somewhat uglier [Ncurses][8] interface than you might see on modern distributions). I installed it using the [dedicated drive][9] instructions. However, those instructions, while good, are rather spartan. When you're done, you have a base system installed, but there's more to do before you can actually use your NAS to store any files. For instance, the dedicated drive instructions install openmediavault on a hard drive, but that's the operating system drive, not the one with the shared space that's accessible to other computers on your network. You need to walk yourself through setting that up and configuring it.

在[openmediavault文档]里详细记录了安装步骤，所以我不在这里重述了。如果你曾经安装过任何一个linux版本，大部分安装步骤都是很类似的(虽然在相对丑陋的[Ucurses][9]界面，不像你可能在现代版本的相对美观的安装界面)。我通过使用[专用驱动器][9]指令来安装它。然而，这些指令不但很好，而且相当精炼的。当你搞定这些指令，你安装了一个基本的系统，但是你还需要做很多才能真正构建好NAS来存储任何文件。例如，专用驱动器指令在硬盘驱动上安装openmediavault，但那是操作系统的驱动，而不是和网络上其他计算机共享空间的那个驱动。你需要自己把这些建立起来并且配置好。

The first thing you should do is load up the administrative web interface and change the default password. This password is different from the root password you set during the installation process. It's the administrative account for the web interface, and the default username and password are `admin` and `openmediavault`, respectively—definitely something you'll want to change immediately after logging in.

你要做的第一件事是加载管理的网页界面和修改默认密码。这个密码和之前你安装过程设置的根密码是不同的。这是网页洁面的管理员账号，和默认的账户和密码分别是’admin‘和‘openmediavault’，当你登入后自然而然地会修改这些配置属性。

#### 设置你的驱动

Once you've installed openmediavault, you need it to actually do stuff for you. The first logical step is to set up the drives that you're going to use for storage. I'm assuming that you've already got them physically installed, so all you have to do at this point is get openmediavault to recognize them and configure them. The first step is making sure those disks are visible. The sidebar menu has a lot of options, but it's very sensibly organized. Go to **Storage - > Disks**. Once you click that, you should see all of the drives you've installed on your server, including the one where you actually installed openmediavault. If you don't see all of your drives there, click the Scan button to see if it picks them up. Usually, it's not a problem.

一旦你安装好openmediavault,你需要它为你做一些工作。逻辑上的第一个步骤是设置好你即将用来作为存储的驱动。在这里，我假定你已经物理上安装好它们了，所以接下来你要做的就是让openmediavault识别和配置它们。第一步是确保这些磁盘是可见的。侧边栏菜单有很多选项，而且被精心的归类了。选择**存储 - > 磁盘**。一旦你点击该菜单，你应该能够看到所有你已经安装到该服务器的驱动，包括那个你已经用来安装openmediavault的驱动。如果你没有在那里看到所有驱动，点击扫描按钮去看它能够接载它们。通常，这不会是一个问题。

You could mount these drives individually to set them up as your file share, but for a file server, you'll want some redundancy. You want to be able to treat multiple drives as a single volume and recover your data if a drive fails or add new drives when you start running out of space. That means you're going to want a [RAID][10]. The topic of what specific type of RAID configuration you want is a deep rabbit hole that deserves an article all of its own (and many have been written), but suffice it to say that you'll need more than one drive, and in the best case, all of your drives store the same amount of data.

当你的文件共享时，你可以独立的挂载和设置这些驱动，但是对于一个文件服务器，你将想要一些冗余驱动。你想要能够把很多驱动当作一个单一卷和能够在某一个驱动出现故障或者空间不足下安装新驱动的情况下恢复你的数据。这意味你将需要一个[RAID][10]。你想要的什么特定类型的RAID的主题是一个深深的兔子洞，是一个值得另写一片文章专门来讲述它(而且已经有很多关于该主题的文章了)，但是简而言之是你将需要不仅仅一个驱动和最好的情况下，你的所有驱动都存储一样数量的数据。

Openmediavault supports all standard RAID levels, so you're good to go there. Configure your RAID in **Storage - > RAID Management**. Configuration is absurdly simple: Click the Create button, choose the disks you want in your RAID array, the RAID level you want to use, and a name for the array. Openmediavault handles the rest for you. There's no messing around at the command line, trying to remember which flags to use with the `mdadm` command. In my specific case, I have six 2-TB drives that I've set up as RAID 10.

openmedia支持所有标准的RAID级别，所以多了解RAID对你很有好处的。可以在**存储 - > RAID管理**配置你的RAID。配置是相当简单:点击创建按钮，在你的RAID阵列里选择你想要的磁盘和你想要使用的RAID级别，和给这个阵列一个名字。openmediavault为你处理剩下的工作。没有混乱的命令行，试图记住‘mdadm'命令的一些标志参数。在我特别的例子，我有六个2TB驱动，并被设置为RAID 10.

With your RAID set up, you've almost got a place to store things. You just need to set up a file system. Just like your desktop computer, a hard drive doesn't do you any good until you format it. So the next place to go in openmediavault's control panel is **Storage - > File Systems**. Just like configuring your RAID, click the Create button and follow the prompts. In this case, you choose the device to format. If you have only the one RAID on your server, it should be something like `md0`. You'll also need to choose the filesystem type. If you're not sure, just use the standard ext4 type.

当你的RAID构建好了，基本上你已经有一个地方可以存储东西了。你仅仅需要设置一个文件系统。正如你的桌面系统，一个硬盘驱动在没有格式化情况下是没什么用处的。所以下一个你要去的地方的是位于openmediavault控制面板里的**存储 - > 文件系统**。和配置你的RAID一样，点击创建按钮，然后跟着提示操作。如果你只有一个RAID在你的服务器上，你应该可以看到一个像’md0‘的东西。你也需要选择文件系统的类别。如果你不能确定，选择标准的ext4类型即可。

#### Define your shares

Sweet! You've got a place to store files. Now you just need to make it visible on your home network. Configure this from the **Services** section of the openmediavault control panel. When it comes to setting up a file share on a network, there are really two main choices: NFS or SMB/CIFS. As a rule of thumb, if all of the computers on your network are running Linux distributions, then you're probably better off using NFS. However, if your home network is a mixed environment with a combination of Linux, Windows, Mac OS, and embedded devices, then SMB/CIFS is probably the right choice.

These options aren't mutually exclusive. You could actually run both services on your server and get the best of both worlds. Or you could mix it up if you have specific devices dedicated to particular tasks. Whatever your usage scenario, configuring these services is dirt simple. Click on the service you want, enable it from its Settings, and define the shared folders you want visible on the network. In the case of SMB/CIFS shares, there are a few more settings available than with NFS, but most of the defaults are fine to start with. The cool thing is that since it's so easy to configure, it's also pretty easy to change on the fly.

#### Configure users

You're almost done. You've configured your drives in a RAID. You've formatted that RAID with a file system. And you've defined shared folders on that formatted RAID. The only thing left is saying who can access those shares and how much. This is handled from the **Access Rights Management** section. Use the **User** and **Group** sections to define the users who connect to your shared folders and the permissions they have with the files in those folders.

Once you do that, you're pretty much good to go. You'll need to access your shares from your various client machines, but that's a topic for another article.

Have fun!

玩得开心！

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/9/openmediavault

作者：[Jason van Gumster][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mairin
[1]: https://opensource.com/article/18/8/automate-backups-raspberry-pi
[2]: https://openmediavault.org
[3]: https://freenas.org
[4]: http://www.freenas.org/freenas-vs-openmediavault/
[5]: https://www.debian.org/
[6]: https://www.freebsd.org/
[7]: https://openmediavault.readthedocs.io/en/latest/installation/index.html
[8]: https://invisible-island.net/ncurses/
[9]: https://openmediavault.readthedocs.io/en/latest/installation/via_iso.html
[10]: https://en.wikipedia.org/wiki/RAID

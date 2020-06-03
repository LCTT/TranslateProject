[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12277-1.html)
[#]: subject: (Modify a disk image to create a Raspberry Pi-based homelab)
[#]: via: (https://opensource.com/article/20/5/disk-image-raspberry-pi)
[#]: author: (Chris Collins https://opensource.com/users/clcollins)

修改磁盘镜像来创建基于树莓派的家庭实验室
======

> 使用树莓派或其它单板机创建一个“家庭私有云”。

![](https://img.linux.net.cn/data/attachment/album/202006/03/123435csm7ys7mkbw7ggjy.jpg)

构建一个[家庭实验室][2]可以是一个有趣的方式，可以让你学习的新概念和实验新技术时还能自娱自乐。得益于以 [树莓派][3] 为首的单板计算机（SBC）的流行，在舒适的家里就可以轻松构建一个多计算机实验室。比起试图在主流的云服务商建立的相同配置，创建一个“家庭私有云”以花更少的钱来体验到云原生技术，也是一个极好的方法。

这篇文章阐述如何修改树莓派或其它的单板机的磁盘镜像，预配置主机的 SSH，并禁用首次启动时强制竞选交互配置的服务。这是一个让你的设备“即启动，即运行”的极好方法，类似于云端实例。之后，你可以使用自动化的流程通过 SSH 连接来进行更专业和更深入的配置。

此外, 当向你的实验室添加更多的树莓派时，修改磁盘镜像可以来让你只需要将该镜像写到一个 SD 卡、放入树莓派中就可以了！

![Multiple Raspberry Pi computers, a switch, and a power bank][4]

### 解压缩和挂载镜像

对于这个项目，你需要修改一个服务器磁盘镜像。在测试期间，我使用 [Fedora Server 31 ARM][5]。在你下载该磁盘镜像并[验证其校验和][6]之后，你需要将其解压缩并挂载其到宿主机的文件系统的某个位置上，以便你可以根据需要修改它。

你可以使用 [xz][7] 命令通过 `--decompress` 参数来解压缩 Fedora 服务器镜像：


```
xz --decompress Fedora-Server-armhfp-X-y.z-sda.raw.xz
```

这会留下一个解压缩后的原始磁盘镜像（它会自动地替换 `.xz` 压缩文件）。这个原始磁盘镜像就像它听起来的那样：一个包含格式化后安装好的磁盘上的所有数据的文件。这包含分区信息、启动分区、root 分区以及其它分区。你需要挂载你打算在其中进行修改的分区，但是要做到这一点，你需要知道磁盘镜像中的分区起始位置和扇区大小，这样你才可以挂载该文件正确的扇区。

幸运的是，你可以在一个磁盘镜像上使用 [fdisk][8] 命令，就像在实际磁盘上使用一样容易。使用 `--list` 或 `-l` 参数来查看分区的列表和其信息：

```
# 使用 fdisk 来列出原始镜像文件的分区：
$ fdisk -l Fedora-Server-armhfp-31-1.9-sda.raw
Disk Fedora-Server-armhfp-X-y.z-sda.raw: 3.2 GiB, 3242196992 bytes, 6332416 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0xdaad9f57

Device                               Boot   Start     End Sectors  Size Id Type
Fedora-Server-armhfp-X-y.z-sda.raw1         8192  163839  155648   76M  c W95 F
Fedora-Server-armhfp-X-y.z-sda.raw2 *     163840 1163263  999424  488M 83 Linux
Fedora-Server-armhfp-X-y.z-sda.raw3      1163264 6047743 4884480  2.3G 83 Linux
```

你需要的所有信息都可在上面的输出中获得。第 3 行表示扇区大小（包括逻辑和物理的）：512 字节 / 512 字节。

设备列表显示的是原始磁盘镜像中的分区。第一个，`Fedora-Server-armhfp-X-y.z-sda.raw1` 毫无疑问是引导程序分区，因为它是第一个，很小（仅仅 76MB），而且类型被标识为 `c`，即 W95 FAT32（LBA），这是一个从 SD 卡启动的 FAT32 分区。

第二个分区也不是非常大，只有 488MB。这个分区是一个 Linux 原生类型分区（Id 83），它可能是包含内核和 [initramfs][9] 的 Linux 启动分区。

第三个分区可能是你需要的东西：它有 2.3GB 大小，所以在它其中应该有发行版的主要部分，并且它是一个 Linux 原生分区类型，这也是在预料之中的。这个分区应该包含了你需要修改的分区和数据。

第三个分区从扇区 1163264 开始（在 `fdisk` 的输出中被显示为 `Start` 列），所以你的挂载偏移量是 `595591168`，计算方法是将扇区大小（512）乘以起始扇区（1163264）（即 `512 * 1163264`）。这意味着你需要以偏移量 `595591168` 挂载该文件，才能挂载到正确位置。

装备了这些信息，现在你可以将第三个分区挂载到你的家目录中了：

```
$ mkdir ~/mnt
$ sudo mount -o loop,offset=595591168 Fedora-Server-armhfp-X-y.z-sda.raw ~/mnt
$ ls ~/mnt
```

### 直接在磁盘镜像中作业

在磁盘镜像被解压缩和被挂载到宿主机上的一个位置后，就可以修改镜像以符合你的需求。在我看来，对镜像进行更改的最简单的方法是使用 `chroot` 来将你会话的工作根目录更改为挂载镜像的工作根目录。不过，有点棘手。

在你改变了根目录后，你的会话将使用新的根目录下的二进制文件。除非你是在一个 ARM 系统做这些所有的操作，否则解压缩后的磁盘镜像的架构将与你正在使用的宿主机系统不同。即使在 chroot 环境中，宿主机系统也无法使用一个不同架构的二进制文件。至少，不能在本机使用。

幸运的是，这里有一个解决方案：qemu-user-static。来自 [Debian Wiki][10] 的说明:

> “[qemu-user-static] 提供了用户模式的仿真二进制文件，是静态构建的。在这个模式中，QEMU 可以在一个 CPU 上启动为另一个 CPU 编译的 Linux 进程 …… 如果安装了 binfmt-support 软件包，qemu-user-static 软件包会注册提供的仿真器可以处理的二进制文件格式，以便其能够直接运行其他架构的二进制文件。”

这正是你需要在 chroot 环境中非本地架构中工作所需的。如果宿主机系统是 Fedora，使用 DNF 来安装 `qemu-user-static` 软件包，并重新启动 `systemd-binfmt.service`：

```
# 使用 DNF 启用非本地的 arch chroot 环境，添加新的二进制文件格式信息
# 输出镜像了精简
$ dnf install qemu-user-static
$ systemctl restart systemd-binfmt.service
```

使用这种方法，你一个能够更改根目录到挂载的磁盘镜像，运行 `uname` 命令来验证一切都在正常：

```
sudo chroot ~/mnt/ /usr/bin/uname -a -r
Linux marvin 5.5.16-200.fc31.x86_64 #1 SMP Wed Apr 8 16:43:33 UTC 2020 armv7l armv7l armv7l GNU/Linux
```

在 chroot 环境中运行 `uname` 将在输出中显示 `armv7l`，这个原始磁盘镜像的架构， 而不是宿主机的架构。一切如预期，可以继续修改镜像了。

### 修改磁盘镜像

现在你可以直接切换到这个基于 ARM 的磁盘镜像中，并在该环境中工作了，你可以对镜像自身镜像修改了。你需要设置该镜像，以便它能够启动并可立即访问，而不需要在树莓派上做任何额外的设置。为此，你需要安装并启用 sshd（OpenSSH 守护进程），并为 SSH 访问添加授权密码。

为了使其表现得更像一个云环境，实现在家里建立私有云的梦想，添加一个本地用户，给予该用户 `sudo` 权限，并（为了像云端的重度用户一样）允许该用户无需密码就可以使用 `sudo`。

所以，你将做的事情是：

  * 安装并启用 SSHD（SSHD 已经在 Fedora ARM 镜像中安装并启用，但是你可能需要为你发行版手动执行这些工作）
  * 设置一个本地用户
  * 允许本地用户来使用 `sudo`（无需密码，可选）
  * 添加授权密钥
  * 允许 root 使用授权密码镜像 SSH（可选）

我使用 GitHub 功能，它允许你上传你的 SSH 公钥，并在 [https://github.com/<your_github_username>.keys][11] 处可访问。我发现这是一种很方便的分发公钥的方法，不过我生性多疑，我总是检查下载的密钥是否与我预期的匹配。如果你不想使用这种方法，你可以从你宿主机中复制你公钥到 chroot 环境中，或者你可以将公钥托管在你控制的 Web 服务器上以便使用相同的工作流。

要开始修改磁盘镜像，再次切换根目录到挂载的磁盘镜像中，这次启动一个 shell，以便可以运行多个命令：

```
# 为了简洁起见，省略了这些命令的输出(如果有的话) 
$ sudo chroot ~/mnt /bin/bash

# 安装 openssh-server ，并启用它 (在 Fedora 上已经完成)
$ dnf install -y openssh-server
$ systemctl enable sshd.service

# 允许 root 使用授权密码访问 SSH
$ mkdir /root/.ssh

# 下载或者另外添加授权密码文件，你的公共密码
# 将 URL 替换为你自己公共密码的路径
$ curl <https://github.com/clcollins.keys> -o /root/.ssh/authorized_keys
$ chmod 700 /root/.ssh
$ chmod 600 /root/.ssh/authorized_keys

# 添加一个本地用户，并放置他们到 wheel 组中
# 将组和用户更改为您想要的一切
useradd -g chris -G wheel -m -u 1000 chris

# 下载并添加你的授权密码
# 像你上面所做的那样更改 home 目录和URL
mkdir /home/chris/.ssh
curl <https://github.com/clcollins.keys> -o /home/chris/.ssh/authorized_keys
chmod 700 /home/chris/.ssh
chmod 600 /home/chris/.ssh/authorized_keys
chown -R chris.chris /home/chris/.ssh/

# 允许 wheel 组( 使用你的本地用户) 不需要使用密码来使用 suso
echo "%wheel ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/91-wheel-nopasswd
```

这就是树莓派或其它单板机在首次启动时需要完成设置 SSH 的全部工作。不过，每个发行版都有自己的特点。例如，Raspbian 已经包含一个本地用户：`pi`，并且不使用 `wheel` 组。因此对于 Raspbian 来说，最好使用现有用户，或者删除 `pi` 用户，并使用另一个用户来替换它。

在 Fedora ARM 的情况下，镜像会在首次引导启动时提示你完成设置。这会破坏你在上面所做的修改的目的，尤其是在设置完成之前，它会完全阻止启动。你的目标是使树莓派的功能类似于私有云的基础设施的一部分一样运行，而这个工作流程包括在主机启动时通过 SSH 远程设置主机。 禁用初始化设置，它由 `initial-setup.service` 控制：

```
# 对多用户和图形目标禁用 initial-setup.service
unlink /etc/systemd/system/multi-user.target.wants/initial-setup.service
unlink /etc/systemd/system/graphical.target.wants/initial-setup.service
```

当你在 chroot 环境时，你可以对你系统做任何你想做的其它更改，或者就放在那里，在第一次启动后，按照云原生的工作流通过 SSH 进行配置。

### 重新压缩并安装修改后的镜像

完成了这些更改后，剩下的就是重新压缩磁盘镜像，并将其安装其到你的树莓派的 SD 卡上。

确保退出 chroot 环境，然后卸载磁盘镜像：

```
$ sudo umount ~/mnt/
```

就像最初解压缩镜像一样，你可以再次使用 `xz` 命令来压缩镜像。通过使用 `--keep` 参数，`xz` 将保留原始的镜像，而不是清理掉它。虽然这会占用更多的磁盘空间，但保留下来的未压缩镜像将允许你对正在处理的镜像进行增量更改，而不需要每次都对其进行解压缩。这对于在测试和调整镜像时节省时间是非常好的。

```
# 压缩压缩磁盘镜像为一个 .xz 文件，但保留原始磁盘镜像
xz --compress Fedora-Server-armhfp-31-1.9-sda.raw --keep
```

压缩过程将花费一些时间，所以趁着这个时间站起来，舒展身体，让你的血液再次流动。

在压缩完成后，可以将新的、已修改过的磁盘镜像复制到 SD 卡上，以便与树莓派一起使用。标准的 `dd` 方法将镜像放置到 SD 卡上也很好用，但是我喜欢使用 Fedora 的 `arm-image-installer`，因为它因为它在处理未经编辑的镜像时提供了一些选项。它对编辑过的镜像也很好用，并且比 `dd` 命令更友好一些。

确保检查 SD 卡在哪个磁盘驱动器上，并用 `--media` 参数使用它：

```
# 使用 arm-image-installer 来复制已修改的磁盘镜像到 SD 卡上
arm-image-installer --image=Fedora-Server-armhfp-X-y.z-sda.raw.xz --target=rpi3 --media=/dev/sdc --norootpass --resizefs -y
```

现在，你已经为树莓派或其它单板机准备好了一个新的、已修改的 Fedora Server ARM 镜像，准备好启动并立即 SSH 到你的修改镜像中。这种方法也可以用来做其它的修改，并且你也可以使用其它发行版的原始磁盘镜像，如果你更喜欢它们，而不是 Fedora 的话。这是一个开始构建家庭实验室私有云的良好基础。在以后的文章中，我将指导你使用云技术和自动化建立一个家庭实验室。

### 延伸阅读

为了学习如何做这篇文章中的事情，我做了很多研究。以下是我找到的两个对学习如何定制磁盘映像和使用非原生架构最有帮助的资料。它们对我从“不知道自己在做什么”到“我能够完成它！”非常有帮助。

  * [如何修改你的自定义 Linux 发行版的原始磁盘镜像][12]
  * [使用 DNF 维基][13]

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/disk-image-raspberry-pi

作者：[Chris Collins][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clcollins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/science_experiment_beaker_lab.png?itok=plKWRhlU (Science lab with beakers)
[2]: https://opensource.com/article/19/3/home-lab
[3]: https://opensource.com/resources/raspberry-pi
[4]: https://opensource.com/sites/default/files/uploads/raspberrypi_homelab.jpg (Multiple Raspberry Pi computers, a switch, and a power bank)
[5]: https://arm.fedoraproject.org/
[6]: https://arm.fedoraproject.org/verify.html
[7]: https://tukaani.org/xz/
[8]: https://en.wikipedia.org/wiki/Fdisk
[9]: https://wiki.debian.org/initramfs
[10]: https://wiki.debian.org/RaspberryPi/qemu-user-static
[11]: https://github.com/%3Cyour_github_username%3E.keys
[12]: https://www.linux.com/news/how-modify-raw-disk-image-your-custom-linux-distro/
[13]: https://wiki.mageia.org/en/Using_DNF#Setting_up_a_container_for_a_non-native_architectur

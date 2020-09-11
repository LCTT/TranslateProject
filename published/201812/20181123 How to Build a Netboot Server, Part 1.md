[#]: collector: (lujun9972)
[#]: translator: (qhwdw)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: subject: (How to Build a Netboot Server, Part 1)
[#]: via: (https://fedoramagazine.org/how-to-build-a-netboot-server-part-1/)
[#]: author: (Gregory Bartholomew https://fedoramagazine.org/author/glb/)
[#]: url: (https://linux.cn/article-10379-1.html)

如何构建一台网络引导服务器（一）
======

![](https://fedoramagazine.org/wp-content/uploads/2018/11/build-netboot-816x345.jpg)

有些计算机网络需要在各个物理机器上维护相同的软件和配置。学校的计算机实验室就是这样的一个环境。 [网络引导][1] 服务器能够被配置为基于网络去提供一个完整的操作系统，以便于客户端计算机从一个中央位置获取配置。本教程将向你展示构建一台网络引导服务器的一种方法。

本教程的第一部分将包括创建一台网络引导服务器和镜像。第二部分将展示如何去添加 Kerberos 验证的家目录到网络引导配置中。

### 初始化配置

首先去下载 Fedora 服务器的 [netinst][2] 镜像，将它刻录到一张光盘上，然后用它引导服务器来重新格式化。我们只需要一个典型的 Fedora Server 的“最小化安装”来作为我们的开端，安装完成后，我们可以使用命令行去添加我们需要的任何额外的包。

![][3]

> 注意：本教程中我们将使用 Fedora 28。其它版本在“最小化安装”中包含的包可能略有不同。如果你使用的是不同的 Fedora 版本，如果一个预期的文件或命令不可用，你可能需要做一些调试。

最小化安装的 Fedora Server 运行起来之后，以 root 用户登入：

```
$ sudo -i
```

并设置主机名字：

```
$ MY_HOSTNAME=server-01.example.edu
$ hostnamectl set-hostname $MY_HOSTNAME
```

> 注意：Red Hat 建议静态和临时名字应都要与这个机器在 DNS 中的完全合格域名相匹配，比如 host.example.com（[了解主机名字][4]）。
>
> 注意：本指南为了方便“复制粘贴”。需要自定义的任何值都声明为一个 `MY_*` 变量，在你运行剩余命令之前，你可能需要调整它。如果你注销之后，变量的赋值将被清除。
>
> 注意：Fedora 28 Server 在默认情况下往往会转储大量的日志到控制台上。你可以通过运行命令：`sysctl -w kernel.printk=0` 去禁用控制台日志输出。

接下来，我们需要在我们的服务器上配置一个静态网络地址。运行下面的一系列命令将找到并重新配置你的默认网络连接：

```
$ MY_DNS1=192.0.2.91
$ MY_DNS2=192.0.2.92
$ MY_IP=192.0.2.158
$ MY_PREFIX=24
$ MY_GATEWAY=192.0.2.254
$ DEFAULT_DEV=$(ip route show default | awk '{print $5}')
$ DEFAULT_CON=$(nmcli d show $DEFAULT_DEV | sed -n '/^GENERAL.CONNECTION:/s!.*:\s*!! p')
$ nohup bash << END
nmcli con mod "$DEFAULT_CON" connection.id "$DEFAULT_DEV"
nmcli con mod "$DEFAULT_DEV" connection.interface-name "$DEFAULT_DEV"
nmcli con mod "$DEFAULT_DEV" ipv4.method disabled
nmcli con up "$DEFAULT_DEV"
nmcli con add con-name br0 ifname br0 type bridge
nmcli con mod br0 bridge.stp no
nmcli con mod br0 ipv4.dns $MY_DNS1,$MY_DNS2
nmcli con mod br0 ipv4.addresses $MY_IP/$MY_PREFIX
nmcli con mod br0 ipv4.gateway $MY_GATEWAY
nmcli con mod br0 ipv4.method manual
nmcli con up br0
nmcli con add con-name br0-slave0 ifname "$DEFAULT_DEV" type bridge-slave master br0
nmcli con up br0-slave0
END
```

> 注意：上面最后的一组命令被封装到一个 `nohup` 脚本中，因为它将临时禁用网络。这个 `nohup` 命令可以让 `nmcli` 命令运行完成，即使你的 SSH 连接断开。注意，连接恢复可能需要 10 秒左右的时间，如果你改变了服务器 IP 地址，你将需要重新启动一个新的 SSH 连接。
>
> 注意：上面的网络配置在默认的连接之上创建了一个 [网桥][5]，这样我们在后面的测试中就可以直接运行一个虚拟机实例。如果你不想在这台服务器上去直接测试网络引导镜像，你可以跳过创建网桥的命令，并直接在你的默认网络连接上配置静态 IP 地址。

### 安装和配置 NFS4

从安装 nfs-utils 包开始：

```
$ dnf install -y nfs-utils
```

为发布 NFS 去创建一个顶级的 [伪文件系统][6]，然后在你的网络上共享它：

```
$ MY_SUBNET=192.0.2.0
$ mkdir /export
$ echo "/export -fsid=0,ro,sec=sys,root_squash $MY_SUBNET/$MY_PREFIX" > /etc/exports
```

SELinux 会干扰网络引导服务器的运行。为它配置例外规则超出了本教程中，因此我们这里直接禁用它：

```
$ sed -i '/GRUB_CMDLINE_LINUX/s/"$/ audit=0 selinux=0"/' /etc/default/grub
$ grub2-mkconfig -o /boot/grub2/grub.cfg
$ sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/sysconfig/selinux
$ setenforce 0
```

> 注意：应该不需要编辑 grub 命令行，但我们在测试过程中发现，直接编辑 `/etc/sysconfig/selinux` 被证明重启后是无效的，因此这样做再次确保设置了 `selinux=0` 标志。

现在，在本地防火墙中为 NFS 服务添加一个例外规则，然后启动 NFS 服务：

```
$ firewall-cmd --add-service nfs
$ firewall-cmd --runtime-to-permanent
$ systemctl enable nfs-server.service
$ systemctl start nfs-server.service
```

### 创建网络引导镜像

现在我们的 NFS 服务器已经启动运行了，我们需要为它提供一个操作系统镜像，以便于它提供给客户端计算机。我们将从一个非常小的镜像开始，等一切顺利之后再添加。

首先，创建一个存放我们镜像的新目录：

```
$ mkdir /fc28
```

使用 `dnf` 命令在新目录下用几个基础包去构建镜像：

```
$ dnf -y --releasever=28 --installroot=/fc28 install fedora-release systemd passwd rootfiles sudo dracut dracut-network nfs-utils vim-minimal dnf
```

在上面的命令中省略了很重要的 `kernel` 包。在它们被安装完成之前，我们需要去调整一下 `initramfs` 镜像中包含的驱动程序集，`kernel` 首次安装时将自动构建这个镜像。尤其是，我们需要禁用 `hostonly` 模式，以便于 `initramfs` 镜像能够在各种硬件平台上正常工作，并且我们还需要添加对网络和 NFS 的支持：

```
$ echo 'hostonly=no' > /fc28/etc/dracut.conf.d/hostonly.conf
$ echo 'add_dracutmodules+=" network nfs "' > /fc28/etc/dracut.conf.d/netboot.conf
```

现在，安装 `kernel` 包：

```
$ dnf -y --installroot=/fc28 install kernel
```

设置一个阻止 `kernel` 包被更新的规则：

```
$ echo 'exclude=kernel-*' >> /fc28/etc/dnf/dnf.conf
```

设置 locale：

```
$ echo 'LANG="en_US.UTF-8"' > /fc28/etc/locale.conf
```

> 注意：如果 locale 没有正确配置，一些程序（如 GNOME Terminal）将无法正常工作。

设置客户端的主机名字：

```
$ MY_CLIENT_HOSTNAME=client-01.example.edu
$ echo $MY_CLIENT_HOSTNAME > /fc28/etc/hostname
```

禁用控制台日志输出：

```
$ echo 'kernel.printk = 0 4 1 7' > /fc28/etc/sysctl.d/00-printk.conf
```

定义网络引导镜像中的本地 `liveuser` 用户：

```
$ echo 'liveuser:x:1000:1000::/home/liveuser:/bin/bash' >> /fc28/etc/passwd
$ echo 'liveuser::::::::' >> /fc28/etc/shadow
$ echo 'liveuser:x:1000:' >> /fc28/etc/group
$ echo 'liveuser:!::' >> /fc28/etc/gshadow
```

允许 `liveuser` 使用 `sudo`：

```
$ echo 'liveuser ALL=(ALL) NOPASSWD: ALL' > /fc28/etc/sudoers.d/liveuser
```

启用自动创建家目录：

```
$ dnf install -y --installroot=/fc28 authselect oddjob-mkhomedir
$ echo 'dirs /home' > /fc28/etc/rwtab.d/home
$ chroot /fc28 authselect select sssd with-mkhomedir --force
$ chroot /fc28 systemctl enable oddjobd.service
```

由于多个客户端将会同时挂载我们的镜像，我们需要去配置镜像工作在只读模式中：

```
$ sed -i 's/^READONLY=no$/READONLY=yes/' /fc28/etc/sysconfig/readonly-root
```

配置日志输出到内存而不是持久存储中：

```
$ sed -i 's/^#Storage=auto$/Storage=volatile/' /fc28/etc/systemd/journald.conf
```

配置 DNS：

```
$ MY_DNS1=192.0.2.91
$ MY_DNS2=192.0.2.92
$ cat << END > /fc28/etc/resolv.conf
nameserver $MY_DNS1
nameserver $MY_DNS2
END
```

绕开编写本教程时存在的根目录只读挂载的 bug（[BZ1542567][7]）：

```
$ echo 'dirs /var/lib/gssproxy' > /fc28/etc/rwtab.d/gssproxy
$ cat << END > /fc28/etc/rwtab.d/systemd
dirs /var/lib/systemd/catalog
dirs /var/lib/systemd/coredump
END
```

最后，为我们镜像创建 NFS 文件系统，并将它共享到我们的子网中：

```
$ mkdir /export/fc28
$ echo '/fc28 /export/fc28 none bind 0 0' >> /etc/fstab
$ mount /export/fc28
$ echo "/export/fc28 -ro,sec=sys,no_root_squash $MY_SUBNET/$MY_PREFIX" > /etc/exports.d/fc28.exports
$ exportfs -vr
```

### 创建引导加载器

现在，我们已经有了可以进行网络引导的操作系统，我们需要一个引导加载器去从客户端系统上启动它。在本教程中我们使用的是 [iPXE][8]。

> 注意：本节和接下来的节使用 QEMU 测试，也能在另外一台单独的计算机上来完成；它们并不需要在网络引导服务器上来运行。

安装 `git` 并使用它去下载 iPXE：

```
$ dnf install -y git
$ git clone http://git.ipxe.org/ipxe.git $HOME/ipxe
```

现在我们需要去为我们的引导加载器创建一个指定的启动脚本：

```
$ cat << 'END' > $HOME/ipxe/init.ipxe
#!ipxe

prompt --key 0x02 --timeout 2000 Press Ctrl-B for the iPXE command line... && shell ||

dhcp || exit
set prefix file:///linux
chain ${prefix}/boot.cfg || exit
END
```

启动 “file” 下载协议：

```
$ echo '#define DOWNLOAD_PROTO_FILE' > $HOME/ipxe/src/config/local/general.h
```

安装 C 编译器以及相关的工具和库：

```
$ dnf groupinstall -y "C Development Tools and Libraries"
```

构建引导加载器：

```
$ cd $HOME/ipxe/src
$ make clean
$ make bin-x86_64-efi/ipxe.efi EMBED=../init.ipxe
```

记下新编译的引导加载器的存储位置。我们将在接下来的节中用到它：

```
$ IPXE_FILE="$HOME/ipxe/src/bin-x86_64-efi/ipxe.efi"
```

### 用 QEMU 测试

这一节是可选的，但是你需要去复制下面显示在物理机器上的 [EFI 系统分区][9] 的布局，在网络引导时需要去配置它们。

> 注意：如果你想实现一个完全的无盘系统，你也可以复制那个文件到一个 TFTP 服务器，然后从 DHCP 上指向那台服务器。

为了使用 QEMU 去测试我们的引导加载器，我们继续去创建一个仅包含一个 EFI 系统分区和我们的启动文件的、很小的磁盘镜像。

从创建 EFI 系统分区所需要的目录布局开始，然后把我们在前面节中创建的引导加载器复制进去：

```
$ mkdir -p $HOME/esp/efi/boot
$ mkdir $HOME/esp/linux
$ cp $IPXE_FILE $HOME/esp/efi/boot/bootx64.efi
```

下面的命令将识别我们的引导加载器镜像正在使用的内核版本，并将它保存到一个变量中，以备后续的配置命令去使用它：

```
$ DEFAULT_VER=$(ls -c /fc28/lib/modules | head -n 1)
```

定义我们的客户端计算机将使用的引导配置：

```
$ MY_DNS1=192.0.2.91
$ MY_DNS2=192.0.2.92
$ MY_NFS4=server-01.example.edu
$ cat << END > $HOME/esp/linux/boot.cfg
#!ipxe

kernel --name kernel.efi \${prefix}/vmlinuz-$DEFAULT_VER initrd=initrd.img ro ip=dhcp rd.peerdns=0 nameserver=$MY_DNS1 nameserver=$MY_DNS2 root=nfs4:$MY_NFS4:/fc28 console=tty0 console=ttyS0,115200n8 audit=0 selinux=0 quiet
initrd --name initrd.img \${prefix}/initramfs-$DEFAULT_VER.img
boot || exit
END
```

> 注意：上面的引导脚本展示了如何使用 iPXE 去网络引导 Linux 的最小示例。还可以做更多更复杂的配置。值得注意的是，iPXE 支持交互式引导菜单，它可以让你配置默认选项和超时时间。比如，一个更高级一点 iPXE 脚本可以默认从本地磁盘引导一个操作系统，如果在倒计时结束之前用户按下了一个键，才会去网络引导一个操作系统。

复制 Linux 内核并分配 initramfs 给 EFI 系统分区：

```
$ cp $(find /fc28/lib/modules -maxdepth 2 -name 'vmlinuz' | grep -m 1 $DEFAULT_VER) $HOME/esp/linux/vmlinuz-$DEFAULT_VER
$ cp $(find /fc28/boot -name 'init*' | grep -m 1 $DEFAULT_VER) $HOME/esp/linux/initramfs-$DEFAULT_VER.img
```

我们最终的目录布局应该看起来像下面的样子：

```
esp
├── efi
│   └── boot
│   └── bootx64.efi
└── linux
 ├── boot.cfg
 ├── initramfs-4.18.18-200.fc28.x86_64.img
 └── vmlinuz-4.18.18-200.fc28.x86_64
```

要让 QEMU 去使用我们的 EFI 系统分区，我们需要去创建一个小的 `uefi.img` 磁盘镜像来包含它，然后将它连接到 QEMU 作为主引导驱动器。

开始安装必需的工具：

```
$ dnf install -y parted dosfstools
```

现在创建 `uefi.img` 文件，并将 `esp` 目录中的文件复制进去：

```
$ ESP_SIZE=$(du -ks $HOME/esp | cut -f 1)
$ dd if=/dev/zero of=$HOME/uefi.img count=$((${ESP_SIZE}+5000)) bs=1KiB
$ UEFI_DEV=$(losetup --show -f $HOME/uefi.img)
$ parted ${UEFI_DEV} -s mklabel gpt mkpart EFI FAT16 1MiB 100% toggle 1 boot
$ mkfs -t msdos ${UEFI_DEV}p1
$ mkdir -p $HOME/mnt
$ mount ${UEFI_DEV}p1 $HOME/mnt
$ cp -r $HOME/esp/* $HOME/mnt
$ umount $HOME/mnt
$ losetup -d ${UEFI_DEV}
```

> 注意：在物理计算机上，你只需要从 `esp` 目录中复制文件到计算机上已存在的 EFI 系统分区中。你不需要使用 `uefi.img` 文件去引导物理计算机。
>
> 注意：在一个物理计算机上，如果文件名已存在，你可以重命名 `bootx64.efi` 文件，如果你重命名了它，就需要去编辑计算机的 BIOS 设置，并添加重命令后的 efi 文件到引导列表中。

接下来我们需要去安装 qemu 包：

```
$ dnf install -y qemu-system-x86
```

允许 QEMU 访问我们在本教程“初始化配置”一节中创建的网桥：

```
$ echo 'allow br0' > /etc/qemu/bridge.conf
```

创建一个 `OVMF_VARS.fd` 镜像的副本去保存我们虚拟机的持久 BIOS 配置：

```
$ cp /usr/share/edk2/ovmf/OVMF_VARS.fd $HOME
```

现在，启动虚拟机：

```
$ qemu-system-x86_64 -machine accel=kvm -nographic -m 1024 -drive if=pflash,format=raw,unit=0,file=/usr/share/edk2/ovmf/OVMF_CODE.fd,readonly=on -drive if=pflash,format=raw,unit=1,file=$HOME/OVMF_VARS.fd -drive if=ide,format=raw,file=$HOME/uefi.img -net bridge,br=br0 -net nic,model=virtio
```

如果一切顺利，你将看到类似下图所示的结果：

![][10]

你可以使用 `shutdown` 命令关闭虚拟机回到我们的服务器上：

```
$ sudo shutdown -h now
```

> 注意：如果出现了错误或虚拟机挂住了，你可能需要启动一个新的 SSH 会话去连接服务器，使用 `kill` 命令去终止 `qemu-system-x86_64` 进程。

### 镜像中添加包

镜像中添加包应该是一个很简单的问题，在服务器上 `chroot` 进镜像，然后运行 `dnf install <package_name>`。

在网络引导镜像中并不限制你能安装什么包。一个完整的图形化安装应该能够完美地工作。

下面是一个如何将最小化安装的网络引导镜像变成完整的图形化安装的示例：

```
$ for i in dev dev/pts dev/shm proc sys run; do mount -o bind /$i /fc28/$i; done
$ chroot /fc28 /usr/bin/bash --login
$ dnf -y groupinstall "Fedora Workstation"
$ dnf -y remove gnome-initial-setup
$ systemctl disable sshd.service
$ systemctl enable gdm.service
$ systemctl set-default graphical.target
$ sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/sysconfig/selinux
$ logout
$ for i in run sys proc dev/shm dev/pts dev; do umount /fc28/$i; done
```

可选地，你可能希望去启用 `liveuser` 用户的自动登录：

```
$ sed -i '/daemon/a AutomaticLoginEnable=true' /fc28/etc/gdm/custom.conf
$ sed -i '/daemon/a AutomaticLogin=liveuser' /fc28/etc/gdm/custom.conf
```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/how-to-build-a-netboot-server-part-1/

作者：[Gregory Bartholomew][a]
选题：[lujun9972][b]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/glb/
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Network_booting
[2]: https://dl.fedoraproject.org/pub/fedora/linux/releases/28/Server/x86_64/iso/
[3]: https://fedoramagazine.org/wp-content/uploads/2018/11/installation-summary-1024x768.png
[4]: https://docs.fedoraproject.org/en-US/Fedora/25/html/Networking_Guide/ch-Configure_Host_Names.html#sec_Understanding_Host_Names
[5]: https://en.wikipedia.org/wiki/Bridging_(networking)
[6]: https://www.centos.org/docs/5/html/5.1/Deployment_Guide/s3-nfs-server-config-exportfs-nfsv4.html
[7]: https://bugzilla.redhat.com/show_bug.cgi?id=1542567
[8]: https://ipxe.org/
[9]: https://en.wikipedia.org/wiki/EFI_system_partition
[10]: https://fedoramagazine.org/wp-content/uploads/2018/11/netboot-liveuser-1024x641.png

arm64 服务器中的 Debian armhf 虚拟机
=============

在 Collabora 公司，我们所做的许多工作之一就是为客户构建包括 32 位和 64 位 ARM 系统在内的各种架构的 [Debian][1] 衍生版。就像 Debian 做的那样，我们的 [OBS][2] 系统建立在原生系统而不是仿真器上。

幸运的是随着几年前 ARM 服务器系统的出现，为这些系统原生构建不再像以前那么痛苦了。对于 32 位的 ARM，我们一直依赖 [Calxeda][3] 刀片服务器，然而不幸的是 Calxeda 在不久前淘汰，硬件开始显露其年龄（尽管幸运的是 Debian Stretch 还支持它，因此至少软件还是新的）。

在 64 位 ARM 方面，我们运行在基于 Gigabyte MP30-AR1 的服务器上，该服务器可以运行 32 位的 ARM 代码（与之相反，比如基于 ThunderX 的服务器只能运行 64 位代码）。像这样在它们之上运行 armhf 虚拟机作为从构建服务器（build slaves）似乎是一个很好的选择，但是设置起来可能会需要更多东西的介入。

第一个陷阱是 Debian 中没有标准的 bootloader 或者 boot 固件来启动 qemu 仿真的 “virt” 设备（我不想使用真实机器的仿真）。这也意味着在启动时客户机内没有任何东西会加载内核，也不会从客户机网络引导，这意味着需要直接的内核引导。

第二个陷阱是当前的 Debian Stretch 的 armhf 内核并不支持 qemu 虚拟机所提供的通用 PCI 主机控制器，这意味着客户机中不会出现存储器和网络。希望这会被尽快解决（[Debian bug 864726][4]），并出现在 Stretch 更新中，那在之前需要使用 bug 报告中附带的补丁的自定义内核，但在这篇文章中我不想进一步说。

高兴的假设我们有一个可用的内核，剩下的挑战是很好地管理直接内核加载。或者更具体地说，如何确保主机启动客户机通过标准 apt 工具安装的内核，而不必在客户机/主机之间复制内核，这本质上归结于客户机将 `/boot` 暴露给主机。我们选择的方案是使用 qemu 的 9pfs 支持来从主机共享一个文件夹，并将其用作客户机的 `/boot`。对于 9p 文件夹，似乎需要 “mapped” 安全模式，因为 “none” 模式对 dpkg 有问题（[Debian bug 864718] [5]）。

由于我们使用 libvirt 作为我们的虚拟机管理器，剩下的事情就是如何将它们组合到一起。

第一步是安装系统，基本和平常一样。可以直接引导进入由普通的 Stretch armhf netboot 安装程序提供的 `vmlinuz` 和 `initrd.gz`（下载到如 `/tmp` 中）。 设置整体来说很直接，会有一些小的调整：

* `/srv/armhf-vm-boot` 设置为 9p 共享文件夹（这个应该存在，并且由 libvirt-qemu 拥有），这之后会被用于共享 `/boot`。
* 内核参数中在 `root=` 后面加上 VM 中的 root 分区，根据你的情况调整。
* 镜像文件使用 virtio 总线，这似乎不是默认的。

除了这些调整，最后的示例命令与 virt-install 手册页中的相似。

```
virt-install --name armhf-vm --arch armv7l --memory 512 \
  --disk /srv/armhf-vm.img,bus=virtio
  --filesystem /srv/armhf-vm-boot,virtio-boot,mode=mapped \
  --boot=kernel=/tmp/vmlinuz,initrd=/tmp/initrd.gz,kernel_args="console=ttyAMA0,root=/dev/vda1"
```

按照通常的方式运行安装。到最后安装程序可能会提示它不知道如何安装引导程序，这个没什么问题。只要在结束安装和重启之前，切换到 shell 并以某种方式将目标系统中的 `/boot/vmlinuz` 和 `/boot/initrd.img` 复制到主机中（比如 chroot 进入 `/target` 并在已安装的系统中使用 scp）。 这是必需的，因为安装程序不支持 9p，但是要启动系统，需要 initramfs 以及能够挂载根文件系统的模块，这由已安装的 initramfs 提供。这些完成后，安装就可以完成了。

接下来，引导已安装的系统。调整 libvirt 配置（比如使用 virsh 编辑并调整 xml）来使用从安装程序复制过来的内核以及 initramfs，而不只是使用它提供的。再次启动虚拟机，它应该就能愉快地进入安装的 Debian 系统中了。

要在客户机这一侧完成，`/boot` 应该移动到共享的 9pfs 中，`/boot` 的新 fstab 条目看上去应该这样：

```
virtio-boot /boot  9p trans=virtio,version=9p2000.L,x-systemd.automount 0 0
```

有了这一步，这只是将 `/boot` 中的文件混到新的文件系统里面，并且客户机完事了（确保 `vmlinuz`/`initrd.img` 保持符号链接）。内核可以如常升级，并对主机可见。

这时对于主机端，有另外一个问题需要跨过，由于客户机使用 9p 映射安全模式，客户机的符号链接对主机而言将是普通的包含链接目标的文件。为了解决这个问题，我们在客户机启动前使用 libvirt qemu 的 hook 支持来设置合适的符号链接。作为一个例子，下面是我们最终使用的脚本（`/etc/libvirt/hooks/qemu`）：

```
vm=$1
action=$2
bootdir=/srv/${vm}-boot

if [ ${action} != "prepare" ] ; then
  exit 0
fi

if [ ! -d ${bootdir} ] ; then
  exit 0
fi

ln -sf $(basename $(cat ${bootdir}/vmlinuz))  ${bootdir}/virtio-vmlinuz
ln -sf $(basename $(cat ${bootdir}/initrd.img))  ${bootdir}/virtio-initrd.img
```

有了这个，我们可以简单地定义 libvirt 使用  `/srv/${vm}-boot/virtio-{vmlinuz,initrd.img}` 作为机器的内核 / `initramfs`，并且当 VM 启动时，它会自动获取客户机安装的最新内核 / `initramfs`。

只有最后一个边缘情况了，当从 VM libvirt 重启会让 qemu 处理它而不是重启 qemu。如果这不幸发生的话，意味着重启不会加载新内核。所以现在我们通过配置 libvirt 来解决这个问题，从而在重启时停止虚拟机。由于我们通常只在升级内核（安装）时重启 VM，虽然这有点乏味，但这避免了重启加载的是旧内核 / `initramfs` 而不是预期的。

--------------------------------------------------------------------------------

via: https://www.collabora.com/news-and-blog/blog/2017/06/20/debian-armhf-vm-on-arm64-server/

作者：[Sjoerd Simons][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.collabora.com/news-and-blog/blog/2017/06/20/debian-armhf-vm-on-arm64-server/
[1]:https://debian.org/
[2]:http://openbuildservice.org/
[3]:https://en.wikipedia.org/wiki/Calxeda
[4]:https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=864726
[5]:https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=864718

[#]: collector: (lujun9972)
[#]: translator: (qhwdw)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10396-1.html)
[#]: subject: (How to Build a Netboot Server, Part 2)
[#]: via: (https://fedoramagazine.org/how-to-build-a-netboot-server-part-2/)
[#]: author: (Gregory Bartholomew https://fedoramagazine.org/author/glb/)

如何构建一台网络引导服务器（二）
======

![](https://fedoramagazine.org/wp-content/uploads/2018/12/netboot2-816x345.jpg)

在 [如何构建一台网络引导服务器（一）][1] 的文章中，我们展示了如何创建一个网络引导镜像，在那个镜像中使用了一个名为 `liveuser` 帐户，它的家目录位于内存中，重启后家目录中的内容将全部消失。然而很多用户都希望机器重启后保存他们的文件和设置。因此，在本系列的第二部分，我们将向你展示如何在第一部分的基础上，重新配置网络引导镜像，以便 [活动目录][2] 中的用户帐户可以进行登录，然后从一个 NFS 服务器上自动挂载他们的家目录。

本系列的第三部分，我们将向你展示网络引导客户端如何与中心化配置的 iPXE 引导菜单进行交互。

### 设置使用 KRB5 认证的 NFS4 Home 目录

按以前的文章 “[使用 Kerberos 强化共享的 NFS Home 目录安全性][3]” 的指导来做这个设置。

### 删除 Liveuser 帐户

删除本系列文章第一部分中创建的 `liveuser` 帐户：

```
$ sudo -i
# sed -i '/automaticlogin/Id' /fc28/etc/gdm/custom.conf
# rm -f /fc28/etc/sudoers.d/liveuser
# for i in passwd shadow group gshadow; do sed -i '/^liveuser:/d' /fc28/etc/$i; done
```

### 配置 NTP、KRB5 和 SSSD

接下来，我们需要将 NTP、KRB5 和 SSSD 的配置文件复制进客户端使用的镜像中，以便于它们能够使用同一个帐户：

```
# MY_HOSTNAME=$(</etc/hostname)
# MY_DOMAIN=${MY_HOSTNAME#*.}
# dnf -y --installroot=/fc28 install ntp krb5-workstation sssd
# cp /etc/ntp.conf /fc28/etc
# chroot /fc28 systemctl enable ntpd.service
# cp /etc/krb5.conf.d/${MY_DOMAIN%%.*} /fc28/etc/krb5.conf.d
# cp /etc/sssd/sssd.conf /fc28/etc/sssd
```

在已配置的识别服务的基础上，重新配置 sssd 提供认证服务：

```
# sed -i '/services =/s/$/, pam/' /fc28/etc/sssd/sssd.conf
```

另外，配置成确保客户端不能更改这个帐户密码：

```
# sed -i '/id_provider/a \ \ ad_maximum_machine_account_password_age = 0' /fc28/etc/sssd/sssd.conf
```

另外，复制 nfsnobody 的定义：

```
# for i in passwd shadow group gshadow; do grep "^nfsnobody:" /etc/$i >> /fc28/etc/$i; done
```

### 加入活动目录

接下来，你将执行一个 `chroot` 将客户端镜像加入到活动目录。从删除预置在网络引导镜像中同名的计算机帐户开始：

```
# MY_USERNAME=jsmith
# MY_CLIENT_HOSTNAME=$(</fc28/etc/hostname)
# adcli delete-computer "${MY_CLIENT_HOSTNAME%%.*}" -U "$MY_USERNAME"
```

在网络引导镜像中如果有 `krb5.keytab` 文件，也删除它：

```
# rm -f /fc28/etc/krb5.keytab
```

`chroot` 到网络引导镜像中：

```
# for i in dev dev/pts dev/shm proc sys run; do mount -o bind /$i /fc28/$i; done
# chroot /fc28 /usr/bin/bash --login
```

执行一个加入操作：

```
# MY_USERNAME=jsmith
# MY_HOSTNAME=$(</etc/hostname)
# MY_DOMAIN=${MY_HOSTNAME#*.}
# MY_REALM=${MY_DOMAIN^^}
# MY_OU="cn=computers,dc=${MY_DOMAIN//./,dc=}"
# adcli join $MY_DOMAIN --login-user="$MY_USERNAME" --computer-name="${MY_HOSTNAME%%.*}" --host-fqdn="$MY_HOSTNAME" --user-principal="host/$MY_HOSTNAME@$MY_REALM" --domain-ou="$MY_OU"
```

现在登出 chroot，并清除 root 用户的命令历史：

```
# logout
# for i in run sys proc dev/shm dev/pts dev; do umount /fc28/$i; done
# > /fc28/root/.bash_history
```

### 安装和配置 PAM 挂载

我们希望客户端登入后自动挂载用户家目录。为实现这个目的，我们将要使用 `pam_mount` 模块。安装和配置 `pam_mount`：

```
# dnf install -y --installroot=/fc28 pam_mount
# cat << END > /fc28/etc/security/pam_mount.conf.xml
<?xml version="1.0" encoding="utf-8" ?>
<!DOCTYPE pam_mount SYSTEM "pam_mount.conf.xml.dtd">
<pam_mount>
<debug enable="0" />
<volume uid="1400000000-1499999999" fstype="nfs4" server="$MY_HOSTNAME" path="/home/%(USER)" mountpoint="/home/%(USER)" options="sec=krb5" />
<mkmountpoint enable="1" remove="0" />
<msg-authpw>Password:</msg-authpw>
</pam_mount>
END
```

重新配置 PAM 去使用 `pam_mount`：

```
# dnf install -y patch
# cp -r /fc28/usr/share/authselect/default/sssd /fc28/etc/authselect/custom
# echo 'initgroups: files' >> /fc28/etc/authselect/custom/sssd/nsswitch.conf
# patch /fc28/etc/authselect/custom/sssd/system-auth << END
@@ -12 +12,2 @@
-auth        sufficient                                   pam_sss.so forward_pass
+auth        requisite                                    pam_mount.so {include if "with-pammount"}
+auth        sufficient                                   pam_sss.so {if "with-pammount":use_first_pass|forward_pass}
@@ -35,2 +36,3 @@
 session     required                                     pam_unix.so
+session     optional                                     pam_mount.so {include if "with-pammount"}
 session     optional                                     pam_sss.so
END
# patch /fc28/etc/authselect/custom/sssd/password-auth << END
@@ -9 +9,2 @@
-auth        sufficient                                   pam_sss.so forward_pass
+auth        requisite                                    pam_mount.so {include if "with-pammount"}
+auth        sufficient                                   pam_sss.so {if "with-pammount":use_first_pass|forward_pass}
@@ -32,2 +33,3 @@
 session     required                                     pam_unix.so
+session     optional                                     pam_mount.so {include if "with-pammount"}
 session     optional                                     pam_sss.so
END
# chroot /fc28 authselect select custom/sssd with-pammount --force
```

另外，要确保从客户端上总是可解析 NFS 服务器的主机名：

```
# MY_IP=$(host -t A $MY_HOSTNAME | awk '{print $4}')
# echo "$MY_IP $MY_HOSTNAME ${MY_HOSTNAME%%.*}" >> /fc28/etc/hosts
```

可选，允许所有用户可以使用 `sudo`：

```
# echo '%users ALL=(ALL) NOPASSWD: ALL' > /fc28/etc/sudoers.d/users
```

### 转换 NFS 根目录到一个 iSCSI 后备存储器

在一个 nfsroot 连接建立之后，目前版本的 nfs-utils 可能很难为家目录建立一个从客户端到 NFS 服务器的第二个连接。当尝试去访问家目录时，客户端将被挂起。因此，为了共享网络引导镜像，我们将使用一个不同的协议（iSCSI）来规避这个问题。

首先 `chroot` 到镜像中，重新配置它的 `initramfs`，让它从一个 iSCSI 根目录中去引导：

```
# for i in dev dev/pts dev/shm proc sys run; do mount -o bind /$i /fc28/$i; done
# chroot /fc28 /usr/bin/bash --login
# dnf install -y iscsi-initiator-utils
# sed -i 's/nfs/iscsi/' /etc/dracut.conf.d/netboot.conf
# echo 'omit_drivers+=" qedi "' > /etc/dracut.conf.d/omit-qedi.conf
# echo 'blacklist qedi' > /etc/modprobe.d/blacklist-qedi.conf
# KERNEL=$(ls -c /lib/modules | head -n 1)
# INITRD=$(find /boot -name 'init*' | grep -m 1 $KERNEL)
# dracut -f $INITRD $KERNEL
# logout
# for i in run sys proc dev/shm dev/pts dev; do umount /fc28/$i; done
# > /fc28/root/.bash_history
```

在测试时，qedi 驱动会破坏 iSCSI，因此我们将它禁用。

接着，创建一个 `fc28.img` [稀疏文件][4]。这个稀疏文件代表 iSCSI 目标的后备存储器：

```
# FC28_SIZE=$(du -ms /fc28 | cut -f 1)
# dd if=/dev/zero of=/fc28.img bs=1MiB count=0 seek=$(($FC28_SIZE*2))
```

（如果你有一个可使用的独立分区或磁盘驱动器，也可以用它，而不用再去创建这个稀疏文件了。）

接着，使用一个文件系统去格式化镜像、挂载它、然后将网络引导镜像复制进去：

```
# mkfs -t xfs -L NETROOT /fc28.img
# TEMP_MNT=$(mktemp -d)
# mount /fc28.img $TEMP_MNT
# cp -a /fc28/* $TEMP_MNT
# umount $TEMP_MNT
```

在使用 SquashFS 测试时，客户端偶尔会出现小状况。似乎是因为 SquashFS 在多处理器客户端上没法执行随机 I/O。（更多内容见 [squashfs 读取卡顿的奇怪案例][5]）。如果你希望使用文件系统压缩来提升吞吐性能，[ZFS][6] 或许是个很好的选择。

如果你对 iSCSI 服务器的吞吐性能要求非常高（比如，成百上千的客户端要连接它），可能需要使用带 [负载均衡][7] 的 [Ceph][8] 集群了。更多相关内容，请查看 [使用 HAProxy 和 Keepalived 负载均衡的 Ceph 对象网关][9]。

### 安装和配置 iSCSI

为了给我们的客户端提供网络引导镜像，安装 `scsi-target-utils` 包：

```
# dnf install -y scsi-target-utils
```

配置 iSCSI 守护程序去提供 `fc28.img` 文件：

```
# MY_REVERSE_HOSTNAME=$(echo $MY_HOSTNAME | tr '.' "\n" | tac | tr "\n" '.' | cut -b -${#MY_HOSTNAME})
# cat << END > /etc/tgt/conf.d/fc28.conf
<target iqn.$MY_REVERSE_HOSTNAME:fc28>
  backing-store /fc28.img
  readonly 1
</target>
END
```

开头的 `iqn.` 是 `/usr/lib/dracut/modules.d/40network/net-lib.sh` 所需要的。

添加一个防火墙例外，并启用和启动这个服务：

```
# firewall-cmd --add-service=iscsi-target
# firewall-cmd --runtime-to-permanent
# systemctl enable tgtd.service
# systemctl start tgtd.service
```

你现在应该能够使用 `tatadm` 命令看到这个镜像共享了：

```
# tgtadm --mode target --op show
```

上述命令的输出应该类似如下的内容：

```
Target 1: iqn.edu.example.server-01:fc28
    System information:
        Driver: iscsi
        State: ready
    I_T nexus information:
    LUN information:
        LUN: 0
            Type: controller
            SCSI ID: IET     00010000
            SCSI SN: beaf10
            Size: 0 MB, Block size: 1
            Online: Yes
            Removable media: No
            Prevent removal: No
            Readonly: No
            SWP: No
            Thin-provisioning: No
            Backing store type: null
            Backing store path: None
            Backing store flags: 
        LUN: 1
            Type: disk
            SCSI ID: IET     00010001
            SCSI SN: beaf11
            Size: 10488 MB, Block size: 512
            Online: Yes
            Removable media: No
            Prevent removal: No
            Readonly: Yes
            SWP: No 
            Thin-provisioning: No
            Backing store type: rdwr
            Backing store path: /fc28.img
            Backing store flags:
    Account information:
    ACL information:
        ALL
```

现在，我们可以去删除本系列文章的第一部分中创建的 NFS 共享了：

```
# rm -f /etc/exports.d/fc28.exports
# exportfs -rv
# umount /export/fc28
# rmdir /export/fc28
# sed -i '/^\/fc28 /d' /etc/fstab
```

你也可以删除 `/fc28` 文件系统，但为了以后进一步更新，你可能需要保留它。

### 更新 ESP 去使用 iSCSI 内核

更新 ESP 去包含启用了 iSCSI 的 `initramfs`：

```
$ rm -vf $HOME/esp/linux/*.fc28.*
$ MY_KRNL=$(ls -c /fc28/lib/modules | head -n 1)
$ cp $(find /fc28/lib/modules -maxdepth 2 -name 'vmlinuz' | grep -m 1 $MY_KRNL) $HOME/esp/linux/vmlinuz-$MY_KRNL
$ cp $(find /fc28/boot -name 'init*' | grep -m 1 $MY_KRNL) $HOME/esp/linux/initramfs-$MY_KRNL.img
```

更新 `boot.cfg` 文件去传递新的 `root` 和 `netroot` 参数：

```
$ MY_NAME=server-01.example.edu
$ MY_EMAN=$(echo $MY_NAME | tr '.' "\n" | tac | tr "\n" '.' | cut -b -${#MY_NAME})
$ MY_ADDR=$(host -t A $MY_NAME | awk '{print $4}')
$ sed -i "s! root=[^ ]*! root=/dev/disk/by-path/ip-$MY_ADDR:3260-iscsi-iqn.$MY_EMAN:fc28-lun-1 netroot=iscsi:$MY_ADDR::::iqn.$MY_EMAN:fc28!" $HOME/esp/linux/boot.cfg
```

现在，你只需要从 `$HOME/esp/linux` 目录中复制更新后的文件到所有客户端系统的 ESP 中。你应该会看到类似下面屏幕截图的结果：

![][10]

### 更新镜像

首先，复制出一个当前镜像的副本：

```
# cp -a /fc28 /fc29
```

`chroot` 进入到镜像的新副本：

```
# for i in dev dev/pts dev/shm proc sys run; do mount -o bind /$i /fc29/$i; done
# chroot /fc29 /usr/bin/bash --login
```

允许更新内核：

```
# sed -i 's/^exclude=kernel-\*$/#exclude=kernel-*/' /etc/dnf/dnf.conf
```

执行升级：

```
# dnf distro-sync -y --releasever=29
```

阻止更新过的内核被再次更新：

```
# sed -i 's/^#exclude=kernel-\*$/exclude=kernel-*/' /etc/dnf/dnf.conf
```

上述命令是可选的，但是在以后，如果在镜像中添加和更新了几个包，在你的客户端之外保存有一个最新内核的副本，会在关键时刻对你非常有帮助。

清理 dnf 的包缓存：

```
# dnf clean all
```

退出 chroot 并清理 root 的命令历史：

```
# logout
# for i in run sys proc dev/shm dev/pts dev; do umount /fc29/$i; done
# > /fc29/root/.bash_history
```

创建 iSCSI 镜像：

```
# FC29_SIZE=$(du -ms /fc29 | cut -f 1)
# dd if=/dev/zero of=/fc29.img bs=1MiB count=0 seek=$(($FC29_SIZE*2))
# mkfs -t xfs -L NETROOT /fc29.img
# TEMP_MNT=$(mktemp -d)
# mount /fc29.img $TEMP_MNT
# cp -a /fc29/* $TEMP_MNT
# umount $TEMP_MNT
```

定义一个新的 iSCSI 目标，指向到新的镜像并导出它：

```
# MY_HOSTNAME=$(</etc/hostname)
# MY_REVERSE_HOSTNAME=$(echo $MY_HOSTNAME | tr '.' "\n" | tac | tr "\n" '.' | cut -b -${#MY_HOSTNAME})
# cat << END > /etc/tgt/conf.d/fc29.conf
<target iqn.$MY_REVERSE_HOSTNAME:fc29>
 backing-store /fc29.img
 readonly 1
</target>
END
# tgt-admin --update ALL
```

添加新内核和 `initramfs` 到 ESP：

```
$ MY_KRNL=$(ls -c /fc29/lib/modules | head -n 1)
$ cp $(find /fc29/lib/modules -maxdepth 2 -name 'vmlinuz' | grep -m 1 $MY_KRNL) $HOME/esp/linux/vmlinuz-$MY_KRNL
$ cp $(find /fc29/boot -name 'init*' | grep -m 1 $MY_KRNL) $HOME/esp/linux/initramfs-$MY_KRNL.img
```

更新 ESP 的 `boot.cfg`：

```
$ MY_DNS1=192.0.2.91
$ MY_DNS2=192.0.2.92
$ MY_NAME=server-01.example.edu
$ MY_EMAN=$(echo $MY_NAME | tr '.' "\n" | tac | tr "\n" '.' | cut -b -${#MY_NAME})
$ MY_ADDR=$(host -t A $MY_NAME | awk '{print $4}')
$ cat << END > $HOME/esp/linux/boot.cfg
#!ipxe

kernel --name kernel.efi \${prefix}/vmlinuz-$MY_KRNL initrd=initrd.img ro ip=dhcp rd.peerdns=0 nameserver=$MY_DNS1 nameserver=$MY_DNS2 root=/dev/disk/by-path/ip-$MY_ADDR:3260-iscsi-iqn.$MY_EMAN:fc29-lun-1 netroot=iscsi:$MY_ADDR::::iqn.$MY_EMAN:fc29 console=tty0 console=ttyS0,115200n8 audit=0 selinux=0 quiet
initrd --name initrd.img \${prefix}/initramfs-$MY_KRNL.img
boot || exit
END
```

最后，从我的 `$HOME/esp/linux` 目录中复制文件到所有客户端系统的 ESP 中去使用它吧！

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/how-to-build-a-netboot-server-part-2/

作者：[Gregory Bartholomew][a]
选题：[lujun9972][b]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/glb/
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-10379-1.html
[2]: https://en.wikipedia.org/wiki/Active_Directory
[3]: https://fedoramagazine.org/secure-nfs-home-directories-kerberos
[4]: https://en.wikipedia.org/wiki/Sparse_file
[5]: https://chrisdown.name/2018/04/17/kernel-adventures-the-curious-case-of-squashfs-stalls.html
[6]: https://en.wikipedia.org/wiki/ZFS
[7]: https://en.wikipedia.org/wiki/Load_balancing_(computing)
[8]: http://docs.ceph.com/docs/mimic/rbd/iscsi-overview/
[9]: https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/load_balancer_administration/ceph_example
[10]: https://fedoramagazine.org/wp-content/uploads/2018/12/netboot-screenshot-1024x819.png

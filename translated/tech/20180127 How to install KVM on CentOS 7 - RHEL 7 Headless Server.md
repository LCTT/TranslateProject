如何在 CentOS 7 / RHEL 7 终端服务器上安装 KVM
======

如何在 CnetOS 7 或 RHEL 7( Red Hat 企业版 Linux) 服务器上安装和配置 KVM(基于内核的虚拟机)？如何在 CnetOS 7 上设置 KMV 并使用云镜像/ cloud-init 来安装客户虚拟机？

基于内核的虚拟机（KVM）是 CentOS 或 RHEL 7 的虚拟化软件。KVM 将你的服务器变成虚拟机管理程序。本文介绍如何在 CentOS 7 或 RHEL 7 中使用 KVM 设置和管理虚拟化环境。还介绍了如何使用 CLI 在物理服务器上安装和管理虚拟机（VM）。确保在服务器的 BIOS 中启用了**虚拟化技术(vt)**。你也可以运行以下命令[测试 CPU 是否支持 Intel VT 和 AMD_V 虚拟化技术][1]
```
$ lscpu | grep Virtualization
Virtualization: VT-x
```

### 按照 CentOS 7/RHEL 7 终端服务器上的 KVM 安装步骤进行操作

#### 步骤 1: 安装 kvm

输入以下 [yum 命令][2]:
`# yum install qemu-kvm libvirt libvirt-python libguestfs-tools virt-install`

[![How to install KVM on CentOS 7 RHEL 7 Headless Server][3]][3]

启动 libvirtd 服务：
```
# systemctl enable libvirtd
# systemctl start libvirtd
```

#### 步骤 2: 确认 kvm 安装

确保使用 lsmod 命令和 [grep命令][4] 加载 KVM 模块：
`# lsmod | grep -i kvm`

#### 步骤 3: 配置桥接网络

默认情况下，由 libvirtd 配置的基于 dhcpd 的网桥。你可以使用以下命令验证：
```
# brctl show
# virsh net-list
```
[![KVM default networking][5]][5]

所有虚拟机（客户机器）只能在同一台服务器上对其他虚拟机进行网络访问。为你创建的私有网络是 192.168.122.0/24。验证：
`# virsh net-dumpxml default`

如果你希望你的虚拟机可用于 LAN 上的其他服务器，请在连接到你的 LAN 的服务器上设置一个网桥。更新你的网卡配置文件，如 ifcfg-enp3s0 或 em1:
`# vi /etc/sysconfig/network-scripts/enp3s0 `
添加一行：
```
BRIDGE=br0
```

[使用 vi 保存并关闭文件][6]。编辑 /etc/sysconfig/network-scripts/ifcfg-br0 :
`# vi /etc/sysconfig/network-scripts/ifcfg-br0`
添加以下东西：
```
DEVICE="br0"
# I am getting ip from DHCP server #
BOOTPROTO="dhcp"
IPV6INIT="yes"
IPV6_AUTOCONF="yes"
ONBOOT="yes"
TYPE="Bridge"
DELAY="0"
```

重新启动网络服务（警告：ssh命令将断开连接，最好重新启动该设备）：
`# systemctl restart NetworkManager`

用 brctl 命令验证它：
`# brctl show`

#### 步骤 4: 创建你的第一个虚拟机

我将会创建一个 CentOS 7.x 虚拟机。首先，使用 wget 命令获取 CentOS 7.x 最新的 ISO 镜像：
```
# cd /var/lib/libvirt/boot/
# wget https://mirrors.kernel.org/centos/7.4.1708/isos/x86_64/CentOS-7-x86_64-Minimal-1708.iso
```

验证 ISO 镜像：
```
# wget https://mirrors.kernel.org/centos/7.4.1708/isos/x86_64/sha256sum.txt
# sha256sum -c sha256sum.txt
```

##### 创建 CentOS 7.x 虚拟机

在这个例子中，我创建了 2GB RAM，2 个 CPU 核心，1 个网卡和 40 GB 磁盘空间的 CentOS 7.x 虚拟机，输入：
```
# virt-install \
--virt-type=kvm \
--name centos7 \
--ram 2048 \
--vcpus=1 \
--os-variant=centos7.0 \
--cdrom=/var/lib/libvirt/boot/CentOS-7-x86_64-Minimal-1708.iso \
--network=bridge=br0,model=virtio \
--graphics vnc \
--disk path=/var/lib/libvirt/images/centos7.qcow2,size=40,bus=virtio,format=qcow2
```

从另一个终端通过 ssh 和 type 配置 vnc 登录：
```
# virsh dumpxml centos7 | grep v nc
<graphics type='vnc' port='5901' autoport='yes' listen='127.0.0.1'>
```

请记录下端口值（即 5901）。你需要使用 SSH 客户端来建立隧道和 VNC 客户端才能访问远程 vnc 服务区。在客户端/桌面/ macbook pro 系统中输入以下 SSH 端口转化命令：
`$ ssh vivek@server1.cyberciti.biz -L 5901:127.0.0.1:5901`

一旦你建立了 ssh 隧道，你可以将你的 VNC 客户端指向你自己的 127.0.0.1 (localhost) 地址和端口 5901，如下所示：
[![][7]][7]

你应该看到 CentOS Linux 7 客户虚拟机安装屏幕如下：
[![][8]][8]

现在只需按照屏幕说明进行操作并安装CentOS 7。一旦安装完成后，请继续并单击重启按钮。 远程服务器关闭了我们的 VNC 客户端的连接。 你可以通过 KVM 客户端重新连接，以配置服务器的其余部分，包括基于 SSH 的会话或防火墙。

#### 步骤 5: 使用云镜像

以上安装方法对于学习目的或单个虚拟机而言是可行的。你需要部署大量的虚拟机吗？ 尝试云镜像。你可以根据需要修改预先构建的云图像。例如，使用 [Cloud-init][9] 添加用户，ssh 密钥，设置时区等等，这是处理云实例的早期初始化的事实上的多分发包。让我们看看如何创建带有 1024MB  RAM，20GB 磁盘空间和 1 个 vCPU 的 CentOS 7 虚拟机。（译注： vCPU 即电脑中的虚拟处理器）

##### 获取 CentOS 7 云镜像

```
# cd /var/lib/libvirt/boot
# wget http://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud.qcow2
```

##### 创建所需的目录

```
# D=/var/lib/libvirt/images
# VM=centos7-vm1 ## vm name ##
# mkdir -vp $D/$VM
mkdir: created directory '/var/lib/libvirt/images/centos7-vm1'
```

##### 创建元数据文件

```
# cd $D/$VM
# vi meta-data
```

添加以下东西：
```
instance-id: centos7-vm1
local-hostname: centos7-vm1
```

##### 创建用户数据文件

我将使用 ssh 密钥登录到虚拟机。所以确保你有 ssh-keys：
`# ssh-keygen -t ed25519 -C "VM Login ssh key"`
[![ssh-keygen command][10]][11]

请参阅 "[如何在 Linux/Unix 系统上设置 SSH 密钥][12]" 来获取更多信息。编辑用户数据如下：
```
# cd $D/$VM
# vi user-data
```
添加如下（根据你的设置替换主机名，用户，ssh-authorized-keys）：
```
#cloud-config
 
# Hostname management
preserve_hostname: False
hostname: centos7-vm1
fqdn: centos7-vm1.nixcraft.com
 
# Users
users:
    - default
    - name: vivek
      groups: ['wheel']
      shell: /bin/bash
      sudo: ALL=(ALL) NOPASSWD:ALL
      ssh-authorized-keys:
        - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIMP3MOF2ot8MOdNXCpHem0e2Wemg4nNmL2Tio4Ik1JY VM Login ssh key
 
# Configure where output will go
output:
  all: ">> /var/log/cloud-init.log"
 
# configure interaction with ssh server
ssh_genkeytypes: ['ed25519', 'rsa']
 
# Install my public ssh key to the first user-defined user configured
# in cloud.cfg in the template (which is centos for CentOS cloud images)
ssh_authorized_keys:
  - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIMP3MOF2ot8MOdNXCpHem0e2Wemg4nNmL2Tio4Ik1JY VM Login ssh key
 
# set timezone for VM
timezone: Asia/Kolkata
 
# Remove cloud-init 
runcmd:
  - systemctl stop network && systemctl start network
  - yum -y remove cloud-init
```

##### 复制云镜像

```
# cd $D/$VM
# cp /var/lib/libvirt/boot/CentOS-7-x86_64-GenericCloud.qcow2 $VM.qcow2
```

##### 创建 20GB 磁盘映像

```
# cd $D/$VM
# export LIBGUESTFS_BACKEND=direct
# qemu-img create -f qcow2 -o preallocation=metadata $VM.new.image 20G
# virt-resize --quiet --expand /dev/sda1 $VM.qcow2 $VM.new.image
```
[![Set VM image disk size][13]][13]
覆盖它的缩放图片:
```
# cd $D/$VM
# mv $VM.new.image $VM.qcow2
```

##### 创建一个 cloud-init ISO

`# mkisofs -o $VM-cidata.iso -V cidata -J -r user-data meta-data`
[![Creating a cloud-init ISO][14]][14]

##### 创建一个 pool

```
# virsh pool-create-as --name $VM --type dir --target $D/$VM
Pool centos7-vm1 created
```

##### 安装 CentOS 7 虚拟机

```
# cd $D/$VM
# virt-install --import --name $VM \
--memory 1024 --vcpus 1 --cpu host \
--disk $VM.qcow2,format=qcow2,bus=virtio \
--disk $VM-cidata.iso,device=cdrom \
--network bridge=virbr0,model=virtio \
--os-type=linux \
--os-variant=centos7.0 \
--graphics spice \
--noautoconsole
```
删除不需要的文件：
```
# cd $D/$VM
# virsh change-media $VM hda --eject --config
# rm meta-data user-data centos7-vm1-cidata.iso
```

##### 查找虚拟机的 IP 地址

`# virsh net-dhcp-leases default`
[![CentOS7-VM1- Created][15]][15]

##### 登录到你的虚拟机

使用 ssh 命令:
`# ssh vivek@192.168.122.85`
[![Sample VM session][16]][16]

### 有用的命令

让我们看看管理虚拟机的一些有用的命令。

#### 列出所有虚拟机

`# virsh list --all`

#### 获取虚拟机信息

```
# virsh dominfo vmName
# virsh dominfo centos7-vm1
```

#### 停止/关闭虚拟机

`# virsh shutdown centos7-vm1`

#### 开启虚拟机

`# virsh start centos7-vm1`

#### 将虚拟机标记为在引导时自动启动

`# virsh autostart centos7-vm1`

#### 重新启动（软安全重启）虚拟机

`# virsh reboot centos7-vm1`
重置（硬重置/不安全）虚拟机
`# virsh reset centos7-vm1`

#### 删除虚拟机

```
# virsh shutdown centos7-vm1
# virsh undefine centos7-vm1
# virsh pool-destroy centos7-vm1
# D=/var/lib/libvirt/images
# VM=centos7-vm1
# rm -ri $D/$VM
```
查看 virsh 命令类型的完整列表
```
# virsh help | less
# virsh help | grep reboot
```

### 关于作者

作者是 nixCraft 的创建者，也是经验丰富的系统管理员和 Linux 操作系统/ Unix shell 脚本的培训师。 他曾与全球客户以及 IT，教育，国防和空间研究以及非营利部门等多个行业合作。 在 [Twitter][17]，[Facebook][18]，[Google +][19] 上关注他。

--------------------------------------------------------------------------------

via: [https://www.cyberciti.biz/faq/how-to-install-kvm-on-centos-7-rhel-7-headless-server/][https://www.cyberciti.biz/faq/how-to-install-kvm-on-centos-7-rhel-7-headless-server/]

作者：[Vivek Gite][a]
译者：[MjSeven](https://github.com/MjSeven)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/faq/linux-xen-vmware-kvm-intel-vt-amd-v-support/
[2]:https://www.cyberciti.biz/faq/rhel-centos-fedora-linux-yum-command-howto/ (See Linux/Unix yum command examples for more info)
[3]:https://www.cyberciti.biz/media/new/faq/2018/01/How-to-install-KVM-on-CentOS-7-RHEL-7-Headless-Server.jpg
[4]:https://www.cyberciti.biz/faq/howto-use-grep-command-in-linux-unix/ (See Linux/Unix grep command examples for more info)
[5]:https://www.cyberciti.biz/media/new/faq/2018/01/KVM-default-networking.jpg
[6]:https://www.cyberciti.biz/faq/linux-unix-vim-save-and-quit-command/
[7]:https://www.cyberciti.biz/media/new/faq/2016/01/vnc-client.jpg
[8]:https://www.cyberciti.biz/media/new/faq/2016/01/centos7-guest-vnc.jpg
[9]:https://cloudinit.readthedocs.io/en/latest/index.html
[10]:https://www.cyberciti.biz/media/new/faq/2018/01/ssh-keygen-pub-key.jpg
[11]:https://www.cyberciti.biz/faq/linux-unix-generating-ssh-keys/
[12]:https://www.cyberciti.biz/faq/how-to-set-up-ssh-keys-on-linux-unix/
[13]:https://www.cyberciti.biz/media/new/faq/2018/01/Set-VM-image-disk-size.jpg
[14]:https://www.cyberciti.biz/media/new/faq/2018/01/Creating-a-cloud-init-ISO.jpg
[15]:https://www.cyberciti.biz/media/new/faq/2018/01/CentOS7-VM1-Created.jpg
[16]:https://www.cyberciti.biz/media/new/faq/2018/01/Sample-VM-session.jpg
[17]:https://twitter.com/nixcraft
[18]:https://facebook.com/nixcraft
[19]:https://plus.google.com/+CybercitiBiz

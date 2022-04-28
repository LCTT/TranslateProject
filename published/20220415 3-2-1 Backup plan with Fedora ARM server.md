[#]: subject: "3-2-1 Backup plan with Fedora ARM server"
[#]: via: "https://fedoramagazine.org/3-2-1-backup-plan-with-fedora-arm-server/"
[#]: author: "Hanku Lee https://fedoramagazine.org/author/hankuoffroad/"
[#]: collector: "lujun9972"
[#]: translator: "hwlife"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14519-1.html"

使用 Fedora ARM 服务器来做 3-2-1 备份计划
======

![][1]

Fedora 服务器版操作系统可以运行在类似树莓派的单板计算机（SBC）上。这篇文章针对的用户是想要充分利用实体服务器系统，并使用类似 Cockpit 的内置工具进行数据备份和个人数据的恢复。这里描述了备份的 3 个阶段。

### 必要的准备

想要使用本指南，你所需要的是一个运行着的 Fedora Linux 工作站和以下的项目：
  
  * 你应该阅读、理解和实践 Fedora 文档中 [服务器安装][4] 和 [管理][5] 的要求
  * 一块用来测试 Fedora Linux 的 SBC（单板计算机）。在这里查看 [硬件需求][6]
  * [Fedora ARM][7] [服务器][7] 原始镜像 & ARM 镜像安装器
  * SD 存储卡（64 GB / Class 10）和 SSD 设备两选一
  * 以太网 / DHCP 预留 IP 地址或者静态 IP 地址
  * 提供了 ssh 密钥的 Linux 客户端工作站
  * 选择云存储服务
  * 有额外可用的 Linux 工作站

对于这套环境，在写这篇文章的时候，由于成本和可用性的原因，我选择树莓派 3B+/4B+ （其中一个用来热切换）。当使用 Cockpit 远程连接树莓派服务器时，你可以将树莓派放到路由器附近以便设置。

### 加强服务器的安全

在 SBC 完成服务器的安装和管理后，用 firewalld 加强服务器的安全是一个好的做法。

连接存储设备到服务器之前，一旦服务器在线你必须设置好防火墙。firewalld 是基于区域的防火墙。在依照 Fedora 文档完成安装和管理指南之后，创建一个名为 `FedoraServer` 的预定义区域。

#### firewalld 里的富规则

<ruby>富规则<rt>rich rule</rt></ruby>用来阻止或者允许一个特定的 IP 地址或者地址段。下面这条规则只从（客户端工作站）注册的 IP 地址接受 SSH 连接，并断开其它的连接。在 Cockpit 终端或者客户端工作站终端运行命令是通过 ssh 来连接到服务器的。

```
firewall-cmd --add-rich-rule='rule family=ipv4 source address=<registered_ip_address>/24 service name=ssh log prefix="SSH Logs" level="notice" accept'
```

#### 拒绝所有主机的 ping 请求

使用这个命令来设置 icmp 拒绝，并且不允许 ping 请求：

```
firewall-cmd --add-rich-rule='rule protocol value=icmp reject'
```

要进行其它防火墙控制，比如管理端口和区域，请查阅以下链接。请注意错配防火墙可能会使安全出现漏洞受到攻击。

> **[在 Cockpit 中管理防火墙][8]**

> **[firewalld 规则][9]**

### 配置文件服务器的存储

下一步是连接存储设备到 SBC，然后使用 Cockpit 对新插入的存储设备进行分区。使用 Cockpit 的图形化服务器管理界面，管理一个家庭实验室（可以是一个或者多个服务器）比之前更加简单。Fedora Linux 服务器标准提供了 Cockpit。

在这个阶段，一个通过 SBC 的 USB 插口接电的 SSD 设备无需额外电源供给就可以工作。

  * 将存储设备连接到 SBC 的 USB 接口
  * 运行之后（按上面的“必要的准备”所设置的那样），然后在你的客户端工作站浏览器上访问 **机器的 IP 地址:9090** 
  * 登录进 Cockpit 之后，点击 Cockpit 页面顶部的“<ruby>打开管理访问权限<rt>Turn on administrative access</rt></ruby>” 
  * 点击左边面板的 “<ruby>存储<rt>Storage</rt></ruby>” 按钮
  * 选择下面显示的 “<ruby>驱动器<rt>Drives</rt></ruby>”，然后分区并格式化一个空白的存储设备
    ![Cockpit Storage management][10]
  * 在选定的存储设备这个界面上，创建一个新的分区表或者格式化并创建新的分区。当初始化磁盘的时候，在 “<ruby>Partitioning<rt>分区</rt></ruby>” 类型选项上，选择 “GPT 分区表”
  * 选择一个文件系统类型，这里选择 “EXT4” 。这对于一个限制 I/O 能力（比如 USB 2.0 接口）和限制带宽（小于 200MB/s）的设备是适合的
  ![Create a partition in Cockpit][11]
  * 要在设备上创建单个占据整个存储空间的分区，指定它的挂载点，比如 `/media` 然后点击 “<ruby>确定<rt>Ok</rt></ruby>” 。
  * 点击 “<ruby>Create partition<rt>创建分区</rt></ruby>”，创建一个挂载点为 `/media` 的新分区。

### 创建备份和恢复备份

备份很少是一刀切的。这里有一些选择比如数据备份在哪里，备份数据的步骤，验证一些自动化，并确定怎样来恢复备份了的数据。

![Backup workflow – version 1.0][12]

#### 备份 1. 用 rsync 从客户端远程同步到文件服务器（树莓派）

这个传输用到的命令是：

```
rsync -azP ~/source syncuser@host1:/destination
```

参数:
- `-a`/`--archive`：归档 
- `-z`/`--compress`：压缩 
- `-P`/`--progress`：显示进度 

要使用更多的选项运行 `rsync`，可以设置以下的选项：

- `--inplace`：直接替换来更新目标文档
- `--append`：追加数据到较短的文档中

在将文档备份到存储空间之前，源端文档的文件重复消除和压缩是减少备份数据容量最有效的方式。

每天工作结束，我会手动运行这个。一旦我设置了云备份工作流，自动化脚本是一个优势。

关于 `rsync` 的详细信息，请在 [这里][13] 访问 Fedora 杂志的文章。

#### 备份 2. 使用 rysnc 从文件服务器远程同步到主要的云存储上

选择云存储是考虑的因素；

  * 成本：上传、存储空间和下载费用
  * 支持 `rsync`、`sftp`
  * 数据冗余（RAID 10 或者运行中的数据中心冗余计划）
  * 快照

符合这些云存储标准之一的就是 Hetzner 托管的 Nextcloud– [存储盒子][14]。你不会受到供应商限制，可以自由切换而没有退出惩罚。

##### 在文件服务器上生成 SSH 密钥并创建授权密钥文件

使用 `ssh-keygen` 命令为文件服务器和云存储生成一对新的 SSH 密钥对。

```
ssh-keygen
Generating public/private rsa key pair.
Enter file in which to save the key . . .
```

插入要求的 SSH 公钥到新的本地授权密钥文件中。

```
cat .ssh/id_rsa.pub >> storagebox_authorized_keys
```

##### 传输密钥文件到云存储

下一步就是上传生成了的授权密钥文件到存储盒子。要做这些，先用 700 权限创建 `.ssh` 目录，然后用 SSH 公钥创建授权文件并赋予 600 权限。运行以下命令。

```
echo -e "mkdir .ssh \n chmod 700 .ssh \n put storagebox_authorized_keys .ssh/authorized_keys \n chmod 600 .ssh/authorized_keys" | sftp <username>@<username>.your-storagebox.de
```

##### 通过 ssh 使用 rsync

使用 `rsync` 同步你的文件目录当前状态到存储盒子。

```
rsync --progress -e 'ssh -p23' --recursive <local_directory> <username>@<username>.your-storagebox.de:<target_directory>
```

这个过程被叫做推送操作，因为它 “推送” 本地系统的一个目录到一个远程的系统中去。

##### 从云存储中恢复目录

要从存储盒子恢复目录，转换到这个目录：

```
rsync --progress -e 'ssh -p23' --recursive <username>@<username>.your-storagebox.de:<remote_directory> <local_directory>
```

#### 备份 3. 客户端备份到第二个云储存

[Deja Dup][15] 是 Fedora 软件仓库中为 Fedora 工作站提供快速备份解决方案的工具。它拥有 GPG 加密、计划任务、文件包含（哪个目录要备份）等功能。

![Backing up to the secondary cloud][16]

![Restoring files from cloud storage][17]

### 归档个人数据

不是所有数据都需要 3-2-1 备份策略。这就是个人数据共享。我将一台拥有 1TB 硬盘的笔记本作为我个人数据的档案（家庭照片）。

转到设置中的 “<ruby>共享<rt>Sharing</rt></ruby>” （在我的例子中是 GNOME 文件管理器）并切换滑块以启用共享。

![][18]

打开 “<ruby>文件共享<rt>file sharing</rt></ruby>”，“<ruby>网络<rt>Networks</rt></ruby>” 和 “<ruby>需要的密码<rt>Required password</rt></ruby>”，允许你使用 WebDAV 协议在你的本地网络上分享你的公共文件夹给其它的工作站。

![][19]

### 准备回滚选项

未测试的备份并不比完全没有备份好。我在家庭实验室环境中使用 “热切换” 方法来避免像频繁的断电或者液体损坏的情况发生。然而，我的建议方案远没有达到灾难恢复计划或企业 IT 中的自动故障修复。

  * 定期运行文件恢复操作
  * 备份 ssh/GPG 密钥到一个额外的存储设备中
  * 复制一个 Fedora ARM 服务器的原始镜像到一个 SD 卡中
  * 在主云存储中保持全备份的快照
  * 自动化备份过程最小化减少人为错误或者疏忽

### 使用 Cockpit 追踪活动并解决问题

当你的项目在成长时，你所管理的服务器数量也在增长。在 Cockpit 中追踪活动和警告可以减轻你的管理负担。你可以使用 Cockpit 的图形化界面的三种方法来归档这些。

#### SELinux 菜单

怎样诊断网络问题，找到日志并在 Cockpit 中解决问题：

  * 去 SELinux 中检查日志
  * 检查“<ruby>解决方案详细信息<rt>solution details</rt></ruby>”
  * 当必要时，选择 “<ruby>应用这个方案<rt>Apply this solution</rt></ruby>”
  * 如果必要，查看自动化脚本并运行它

![SELinux logs][20]

#### 网络或者存储日志

服务器日志会跟踪 CPU 负载、内存使用、网络活动、存储性能和系统日志关联的详细指标。日志会组织在网络面板或者存储面板里显示。

![Storage logs in Cockpit][21]

#### 软件更新

在预设的时间和频率下，Cockpit 可以帮助进行安全更新。当你需要时，你可以运行所有的更新。

![Software updates][22]

恭喜你在 Fedora ARM 服务器版本上搭建了一个文件/备份服务器。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/3-2-1-backup-plan-with-fedora-arm-server/

作者：[Hanku Lee][a]
选题：[lujun9972][b]
译者：[hwlife](https://github.com/hwlife)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/hankuoffroad/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2022/04/3-2-1_backup-816x345.jpg
[2]: https://unsplash.com/@markuswinkler?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/computer-backup?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://docs.fedoraproject.org/en-US/fedora-server/server-installation-sbc/
[5]: https://docs.fedoraproject.org/en-US/fedora-server/sysadmin-postinstall/
[6]: https://docs.fedoraproject.org/en-US/quick-docs/raspberry-pi/
[7]: https://arm.fedoraproject.org/
[8]: https://fedoramagazine.org/managing-network-interfaces-and-firewalld-in-cockpit/
[9]: https://www.redhat.com/sysadmin/firewalld-rules-and-scenarios
[10]: https://fedoramagazine.org/wp-content/uploads/2022/03/Screenshot-from-2022-03-29-22-05-00b-1024x576.png
[11]: https://fedoramagazine.org/wp-content/uploads/2022/03/Screenshot-from-2022-03-29-22-03-36a.png
[12]: https://fedoramagazine.org/wp-content/uploads/2022/04/Backups3-1-1024x525.jpg
[13]: https://fedoramagazine.org/copying-large-files-with-rsync-and-some-misconceptions/
[14]: https://docs.hetzner.com/robot/storage-box/
[15]: https://fedoramagazine.org/easy-backups-with-deja-dup/
[16]: https://fedoramagazine.org/wp-content/uploads/2022/03/Screenshot-from-2022-03-29-22-47-30.png
[17]: https://fedoramagazine.org/wp-content/uploads/2022/03/Screenshot-from-2022-03-29-22-41-57.png
[18]: https://fedoramagazine.org/wp-content/uploads/2022/04/Screenshot-from-2022-04-14-20-48-49-1024x733.png
[19]: https://fedoramagazine.org/wp-content/uploads/2022/04/Screenshot-from-2022-04-14-20-51-18st.png
[20]: https://fedoramagazine.org/wp-content/uploads/2022/04/Screenshot-from-2022-04-02-11-24-30b-1024x441.png
[21]: https://fedoramagazine.org/wp-content/uploads/2022/04/Screenshot-from-2022-04-04-21-47-06SL-1024x259.png
[22]: https://fedoramagazine.org/wp-content/uploads/2022/04/Screenshot-from-2022-04-04-21-35-42b.png

[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13240-1.html)
[#]: subject: (Convert your Windows install into a VM on Linux)
[#]: via: (https://opensource.com/article/21/1/virtualbox-windows-linux)
[#]: author: (David Both https://opensource.com/users/dboth)

在 Linux 上将你的 Windows 系统转换为虚拟机
======

> 下面是我如何配置 VirtualBox 虚拟机以在我的 Linux 工作站上使用物理的 Windows 操作系统。

![](https://img.linux.net.cn/data/attachment/album/202103/27/105053kyd66r1cpr1s2vz2.jpg)

我经常使用 VirtualBox 来创建虚拟机来测试新版本的 Fedora、新的应用程序和很多管理工具，比如 Ansible。我甚至使用 VirtualBox 来测试创建一个 Windows 访客主机。

我从来没有在我的任何一台个人电脑上使用 Windows 作为我的主要操作系统，甚至也没在虚拟机中执行过一些用 Linux 无法完成的冷门任务。不过，我确实为一个需要使用 Windows 下的财务程序的组织做志愿者。这个程序运行在办公室经理的电脑上，使用的是预装的 Windows 10 Pro。

这个财务应用程序并不特别，[一个更好的 Linux 程序][2] 可以很容易地取代它，但我发现许多会计和财务主管极不愿意做出改变，所以我还没能说服我们组织中的人迁移。

这一系列的情况，加上最近的安全恐慌，使得我非常希望将运行 Windows 的主机转换为 Fedora，并在该主机上的虚拟机中运行 Windows 和会计程序。

重要的是要明白，我出于多种原因极度不喜欢 Windows。主要原因是，我不愿意为了在新的虚拟机上安装它而再花钱购买一个 Windows 许可证（Windows 10 Pro 大约需要 200 美元）。此外，Windows 10 在新系统上设置时或安装后需要足够的信息，如果微软的数据库被攻破，破解者就可以窃取一个人的身份。任何人都不应该为了注册软件而需要提供自己的姓名、电话号码和出生日期。

### 开始

这台实体电脑已经在主板上唯一可用的 m.2 插槽中安装了一个 240GB 的 NVMe m.2 的 SSD 存储设备。我决定在主机上安装一个新的 SATA SSD，并将现有的带有 Windows 的 SSD 作为 Windows 虚拟机的存储设备。金士顿在其网站上对各种 SSD 设备、外形尺寸和接口做了很好的概述。

这种方法意味着我不需要重新安装 Windows 或任何现有的应用软件。这也意味着，在这台电脑上工作的办公室经理将使用 Linux 进行所有正常的活动，如电子邮件、访问 Web、使用 LibreOffice 创建文档和电子表格。这种方法增加了主机的安全性。唯一会使用 Windows 虚拟机的时间是运行会计程序。

### 先备份

在做其他事情之前，我创建了整个 NVMe 存储设备的备份 ISO 镜像。我在 500GB 外置 USB 存储盘上创建了一个分区，在其上创建了一个 ext4 文件系统，然后将该分区挂载到 `/mnt`。我使用 `dd` 命令来创建镜像。

我在主机中安装了新的 500GB SATA SSD，并从<ruby>临场<rt>live</rt></ruby> USB 上安装了 Fedora 32 Xfce <ruby>偏好版<rt>spin</rt></ruby>。在安装后的初次重启时，在 GRUB2 引导菜单上，Linux 和 Windows 操作系统都是可用的。此时，主机可以在 Linux 和 Windows 之间进行双启动。

### 在网上寻找帮助

现在我需要一些关于创建一个使用物理硬盘或 SSD 作为其存储设备的虚拟机的信息。我很快就在 VirtualBox 文档和互联网上发现了很多关于如何做到这一点的信息。虽然 VirtualBox 文档初步帮助了我，但它并不完整，遗漏了一些关键信息。我在互联网上找到的大多数其他信息也很不完整。

在我们的记者 Joshua Holm 的帮助下，我得以突破这些残缺的信息，并以一个可重复的流程来完成这项工作。

### 让它发挥作用

这个过程其实相当简单，虽然需要一个玄妙的技巧才能实现。当我准备好这一步的时候，Windows 和 Linux 操作系统已经到位了。

首先，我在 Linux 主机上安装了最新版本的 VirtualBox。VirtualBox 可以从许多发行版的软件仓库中安装，也可以直接从 Oracle VirtualBox 仓库中安装，或者从 VirtualBox 网站上下载所需的包文件并在本地安装。我选择下载 AMD64 版本，它实际上是一个安装程序而不是一个软件包。我使用这个版本来规避一个与这个特定项目无关的问题。

安装过程总是在 `/etc/group` 中创建一个 `vboxusers` 组。我把打算运行这个虚拟机的用户添加到 `/etc/group` 中的 `vboxusers` 和 `disk` 组。将相同的用户添加到 `disk` 组是很重要的，因为 VirtualBox 是以启动它的用户身份运行的，而且还需要直接访问 `/dev/sdx` 特殊设备文件才能在这种情况下工作。将用户添加到 `disk` 组可以提供这种级别的访问权限，否则他们就不会有这种权限。

然后，我创建了一个目录来存储虚拟机，并赋予它 `root.vboxusers` 的所有权和 `775` 的权限。我使用 `/vms` 用作该目录，但可以是任何你想要的目录。默认情况下，VirtualBox 会在创建虚拟机的用户的子目录中创建新的虚拟机。这将使多个用户之间无法共享对虚拟机的访问，从而不会产生巨大的安全漏洞。将虚拟机目录放置在一个可访问的位置，可以共享虚拟机。

我以非 root 用户的身份启动 VirtualBox 管理器。然后，我使用 VirtualBox 的“<ruby>偏好<rt>Preferences</rt></ruby> => <ruby>一般<rt>General</rt></ruby>”菜单将“<ruby>默认机器文件夹<rt>Default Machine Folder</rt></ruby>”设置为 `/vms` 目录。

我创建的虚拟机没有虚拟磁盘。“<ruby>类型<rt>Type<rt></ruby>” 应该是 `Windows`，“<ruby>版本<rt>Version</rt></ruby>”应该设置为 `Windows 10 64-bit`。为虚拟机设置一个合理的内存量，但只要虚拟机处于关闭状态，以后可以更改。在安装的“<ruby>硬盘<rt>Hard disk</rt></ruby>”页面，我选择了 “<ruby>不要添加虚拟硬盘<rt>Do not add a virtual hard disk</rt></ruby>”，点击“<ruby>创建<rt>Create</rt></ruby>”。新的虚拟机出现在VirtualBox 管理器窗口中。这个过程也创建了 `/vms/Test1` 目录。

我使用“<ruby>高级<rt>Advanced</rt></ruby>”菜单在一个页面上设置了所有的配置，如图 1 所示。“<ruby>向导模式<rt>Guided Mode</rt></ruby>”可以获得相同的信息，但需要更多的点击，以通过一个窗口来进行每个配置项目。它确实提供了更多的帮助内容，但我并不需要。

![VirtualBox 对话框：创建新的虚拟机，但不添加硬盘][3]

*图 1：创建一个新的虚拟机，但不要添加硬盘。*

然后，我需要知道 Linux 给原始 Windows 硬盘分配了哪个设备。在终端会话中以 root 身份使用 `lshw` 命令来发现 Windows 磁盘的设备分配情况。在本例中，代表整个存储设备的设备是 `/dev/sdb`。

```
# lshw -short -class disk,volume
H/W path           Device      Class          Description
=========================================================
/0/100/17/0        /dev/sda    disk           500GB CT500MX500SSD1
/0/100/17/0/1                  volume         2047MiB Windows FAT volume
/0/100/17/0/2      /dev/sda2   volume         4GiB EXT4 volume
/0/100/17/0/3      /dev/sda3   volume         459GiB LVM Physical Volume
/0/100/17/1        /dev/cdrom  disk           DVD+-RW DU-8A5LH
/0/100/17/0.0.0    /dev/sdb    disk           256GB TOSHIBA KSG60ZMV
/0/100/17/0.0.0/1  /dev/sdb1   volume         649MiB Windows FAT volume
/0/100/17/0.0.0/2  /dev/sdb2   volume         127MiB reserved partition
/0/100/17/0.0.0/3  /dev/sdb3   volume         236GiB Windows NTFS volume
/0/100/17/0.0.0/4  /dev/sdb4   volume         989MiB Windows NTFS volume
[root@office1 etc]#
```

VirtualBox 不需要把虚拟存储设备放在 `/vms/Test1` 目录中，而是需要有一种方法来识别要从其启动的物理硬盘。这种识别是通过创建一个 `*.vmdk` 文件来实现的，该文件指向将作为虚拟机存储设备的原始物理磁盘。作为非 root 用户，我创建了一个 vmdk 文件，指向整个 Windows 设备 `/dev/sdb`。

```
$ VBoxManage internalcommands createrawvmdk -filename /vms/Test1/Test1.vmdk -rawdisk /dev/sdb
RAW host disk access VMDK file /vms/Test1/Test1.vmdk created successfully.
```

然后，我使用 VirtualBox 管理器 “<ruby>文件<rt>File</rt></ruby> => <ruby>虚拟介质管理器<rt>Virtual Media Manager</rt></ruby>” 对话框将 vmdk 磁盘添加到可用硬盘中。我点击了“<ruby>添加<rt>Add</rt></ruby>”，文件管理对话框中显示了默认的 `/vms` 位置。我选择了 `Test1` 目录，然后选择了 `Test1.vmdk` 文件。然后我点击“<ruby>打开<rt>Open</rt></ruby>”，`Test1.vmdk` 文件就显示在可用硬盘列表中。我选择了它，然后点击“<ruby>关闭<rt>Close</rt></ruby>”。

下一步就是将这个 vmdk 磁盘添加到我们的虚拟机的存储设备中。在 “Test1 VM” 的设置菜单中，我选择了 “<ruby>存储<rt>Storage</rt></ruby>”，并点击了添加硬盘的图标。这时打开了一个对话框，在一个名为“<ruby>未连接<rt>Not attached</rt></ruby>”的列表中显示了 `Test1vmdk` 虚拟磁盘文件。我选择了这个文件，并点击了“<ruby>选择<rt>Choose</rt></ruby>”按钮。这个设备现在显示在连接到 “Test1 VM” 的存储设备列表中。这个虚拟机上唯一的其他存储设备是一个空的 CD/DVD-ROM 驱动器。

我点击了“<ruby>确定<rt>OK</rt></ruby>”，完成了将此设备添加到虚拟机中。

在新的虚拟机工作之前，还有一个项目需要配置。使用 VirtualBox 管理器设置对话框中的 “Test1 VM”，我导航到 “<ruby>系统<rt>System</rt></ruby> => <ruby>主板<rt>Motherboard</rt></ruby>”页面，并在 “<ruby>启用 EFI<rt>Enable EFI</rt></ruby>”的方框中打上勾。如果你不这样做，当你试图启动这个虚拟机时，VirtualBox 会产生一个错误，说明它无法找到一个可启动的介质。

现在，虚拟机从原始的 Windows 10 硬盘驱动器启动。然而，我无法登录，因为我在这个系统上没有一个常规账户，而且我也无法获得 Windows 管理员账户的密码。

### 解锁驱动器

不，本节并不是要破解硬盘的加密，而是要绕过众多 Windows 管理员账户之一的密码，而这些账户是不属于组织中某个人的。

尽管我可以启动 Windows 虚拟机，但我无法登录，因为我在该主机上没有账户，而向人们索要密码是一种可怕的安全漏洞。尽管如此，我还是需要登录这个虚拟机来安装 “VirtualBox Guest Additions”，它可以提供鼠标指针的无缝捕捉和释放，允许我将虚拟机调整到大于 1024x768 的大小，并在未来进行正常的维护。

这是一个完美的用例，Linux 的功能就是更改用户密码。尽管我是访问之前的管理员的账户来启动，但在这种情况下，他不再支持这个系统，我也无法辨别他的密码或他用来生成密码的模式。我就直接清除了上一个系统管理员的密码。

有一个非常不错的开源软件工具，专门用于这个任务。在 Linux 主机上，我安装了 `chntpw`，它的意思大概是：“更改 NT 的密码”。

```
# dnf -y install chntpw
```

我关闭了虚拟机的电源，然后将 `/dev/sdb3` 分区挂载到 `/mnt` 上。我确定 `/dev/sdb3` 是正确的分区，因为它是我在之前执行 `lshw` 命令的输出中看到的第一个大的 NTFS 分区。一定不要在虚拟机运行时挂载该分区，那样会导致虚拟机存储设备上的数据严重损坏。请注意，在其他主机上分区可能有所不同。

导航到 `/mnt/Windows/System32/config` 目录。如果当前工作目录（PWD）不在这里，`chntpw` 实用程序就无法工作。请启动该程序。

```
# chntpw -i SAM
chntpw version 1.00 140201, (c) Petter N Hagen
Hive <SAM> name (from header): <\SystemRoot\System32\Config\SAM>
ROOT KEY at offset: 0x001020 * Subkey indexing type is: 686c <lh>
File size 131072 [20000] bytes, containing 11 pages (+ 1 headerpage)
Used for data: 367/44720 blocks/bytes, unused: 14/24560 blocks/bytes.

<>========<> chntpw Main Interactive Menu <>========<>

Loaded hives: <SAM>

  1 - Edit user data and passwords
  2 - List groups
      - - -
  9 - Registry editor, now with full write support!
  q - Quit (you will be asked if there is something to save)


What to do? [1] ->
```

`chntpw` 命令使用 TUI（文本用户界面），它提供了一套菜单选项。当选择其中一个主要菜单项时，通常会显示一个次要菜单。按照明确的菜单名称，我首先选择了菜单项 `1`。

```
What to do? [1] -> 1

===== chntpw Edit User Info & Passwords ====

| RID -|---------- Username ------------| Admin? |- Lock? --|
| 01f4 | Administrator                  | ADMIN  | dis/lock |
| 03eb | john                           | ADMIN  | dis/lock |
| 01f7 | DefaultAccount                 |        | dis/lock |
| 01f5 | Guest                          |        | dis/lock |
| 01f8 | WDAGUtilityAccount             |        | dis/lock |

Please enter user number (RID) or 0 to exit: [3e9]
```

接下来，我选择了我们的管理账户 `john`，在提示下输入 RID。这将显示用户的信息，并提供额外的菜单项来管理账户。

```
Please enter user number (RID) or 0 to exit: [3e9] 03eb
================= USER EDIT ====================

RID     : 1003 [03eb]
Username: john
fullname:
comment :
homedir :

00000221 = Users (which has 4 members)
00000220 = Administrators (which has 5 members)

Account bits: 0x0214 =
[ ] Disabled        | [ ] Homedir req.    | [ ] Passwd not req. |
[ ] Temp. duplicate | [X] Normal account  | [ ] NMS account     |
[ ] Domain trust ac | [ ] Wks trust act.  | [ ] Srv trust act   |
[X] Pwd don't expir | [ ] Auto lockout    | [ ] (unknown 0x08)  |
[ ] (unknown 0x10)  | [ ] (unknown 0x20)  | [ ] (unknown 0x40)  |

Failed login count: 0, while max tries is: 0
Total  login count: 47

- - - - User Edit Menu:
 1 - Clear (blank) user password
 2 - Unlock and enable user account [probably locked now]
 3 - Promote user (make user an administrator)
 4 - Add user to a group
 5 - Remove user from a group
 q - Quit editing user, back to user select
Select: [q] > 2
```

这时，我选择了菜单项 `2`，“<ruby>解锁并启用用户账户<rt>Unlock and enable user account</rt></ruby>”，这样就可以删除密码，使我可以不用密码登录。顺便说一下 —— 这就是自动登录。然后我退出了该程序。在继续之前，一定要先卸载 `/mnt`。

我知道，我知道，但为什么不呢! 我已经绕过了这个硬盘和主机的安全问题，所以一点也不重要。这时，我确实登录了旧的管理账户，并为自己创建了一个新的账户，并设置了安全密码。然后，我以自己的身份登录，并删除了旧的管理账户，这样别人就无法使用了。

网上也有 Windows Administrator 账号的使用说明（上面列表中的 `01f4`）。如果它不是作为组织管理账户，我可以删除或更改该账户的密码。还要注意的是，这个过程也可以从目标主机上运行临场 USB 来执行。

### 重新激活 Windows

因此，我现在让 Windows SSD 作为虚拟机在我的 Fedora 主机上运行了。然而，令人沮丧的是，在运行了几个小时后，Windows 显示了一条警告信息，表明我需要“激活 Windows”。

在看了许许多多的死胡同网页之后，我终于放弃了使用现有激活码重新激活的尝试，因为它似乎已经以某种方式被破坏了。最后，当我试图进入其中一个在线虚拟支持聊天会话时，虚拟的“获取帮助”应用程序显示我的 Windows 10 Pro 实例已经被激活。这怎么可能呢？它一直希望我激活它，然而当我尝试时，它说它已经被激活了。

### 或者不

当我在三天内花了好几个小时做研究和实验时，我决定回到原来的 SSD 启动到 Windows 中，以后再来处理这个问题。但后来 Windows —— 即使从原存储设备启动，也要求重新激活。

在微软支持网站上搜索也无济于事。在不得不与之前一样的自动支持大费周章之后，我拨打了提供的电话号码，却被自动响应系统告知，所有对 Windows 10 Pro 的支持都只能通过互联网提供。到现在，我已经晚了将近一天才让电脑运行起来并安装回办公室。

### 回到未来

我终于吸了一口气，购买了一份 Windows 10 Home，大约 120 美元，并创建了一个带有虚拟存储设备的虚拟机，将其安装在上面。

我将大量的文档和电子表格文件复制到办公室经理的主目录中。我重新安装了一个我们需要的 Windows 程序，并与办公室经理验证了它可以工作，数据都在那里。

### 总结

因此，我的目标达到了，实际上晚了一天，花了 120 美元，但使用了一种更标准的方法。我仍在对权限进行一些调整，并恢复 Thunderbird 通讯录；我有一些 CSV 备份，但 `*.mab` 文件在 Windows 驱动器上包含的信息很少。我甚至用 Linux 的 `find` 命令来定位原始存储设备上的所有。

我走了很多弯路，每次都要自己重新开始。我遇到了一些与这个项目没有直接关系的问题，但却影响了我的工作。这些问题包括一些有趣的事情，比如把 Windows 分区挂载到我的 Linux 机器的 `/mnt` 上，得到的信息是该分区已经被 Windows 不正确地关闭（是的，在我的 Linux 主机上），并且它已经修复了不一致的地方。即使是 Windows 通过其所谓的“恢复”模式多次重启后也做不到这一点。

也许你从 `chntpw` 工具的输出数据中发现了一些线索。出于安全考虑，我删掉了主机上显示的其他一些用户账号，但我从这些信息中看到，所有的用户都是管理员。不用说，我也改了。我仍然对我遇到的糟糕的管理方式感到惊讶，但我想我不应该这样。

最后，我被迫购买了一个许可证，但这个许可证至少比原来的要便宜一些。我知道的一点是，一旦我找到了所有必要的信息，Linux 这一块就能完美地工作。问题是处理 Windows 激活的问题。你们中的一些人可能已经成功地让 Windows 重新激活了。如果是这样，我还是想知道你们是怎么做到的，所以请把你们的经验添加到评论中。

这是我不喜欢 Windows，只在自己的系统上使用 Linux 的又一个原因。这也是我将组织中所有的计算机都转换为 Linux 的原因之一。只是需要时间和说服力。我们只剩下这一个会计程序了，我需要和财务主管一起找到一个适合她的程序。我明白这一点 —— 我喜欢自己的工具，我需要它们以一种最适合我的方式工作。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/virtualbox-windows-linux

作者：[David Both][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/puzzle_computer_solve_fix_tool.png?itok=U0pH1uwj (Puzzle pieces coming together to form a computer screen)
[2]: https://opensource.com/article/20/7/godbledger
[3]: https://opensource.com/sites/default/files/virtualbox.png

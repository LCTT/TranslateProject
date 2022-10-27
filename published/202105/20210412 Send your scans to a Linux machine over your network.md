[#]: subject: (Send your scans to a Linux machine over your network)
[#]: via: (https://opensource.com/article/21/4/linux-scan-samba)
[#]: author: (Marc Skinner https://opensource.com/users/marc-skinner)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13395-1.html)

通过网络将你的扫描结果发送到 Linux 机器上
======

> 设置一个 Samba 共享，使扫描仪可以容易地被网络上的一台 Linux 计算机访问。

![](https://img.linux.net.cn/data/attachment/album/202105/16/111724ft11r181pc1bu21p.jpg)

自由软件运动 [因为一台设计不良的打印机][2] 而开始。几十年后，打印机和扫描仪制造商继续重新发明轮子，无视既定的通用协议。因此，每隔一段时间，你就会偶然发现一台打印机或扫描仪似乎无法与你的操作系统配合使用。

最近，我在一台佳能三合一扫描仪（佳能 Maxify MB2720）上遇到了这种情况。我用开源方案解决这个扫描仪的问题。具体来说，我设置了一个 Samba 共享，使扫描仪在我的网络上可用。

[Samba 项目][3] 是一个用于 Linux/Unix 与 Windows 互操作的套件。尽管它是大多数用户从未与之交互的低级代码，但该软件使得在你的本地网络上共享文件变得很容易，而不管使用的是什么平台。

我使用的是 Fedora，所以这些说明应该适用于任何基于 RPM 的 Linux 发行版。对于其他发行版，可能需要做一些小的修改。下面是我的做法。

### 获取佳能工具

从佳能的网站上下载所需的用于 Windows 的 “<ruby>佳能快速实用工具箱<rt>Canon Quick Utility Toolbox</rt></ruby>”。该软件是必需的，因为它是配置打印机目标文件夹位置和凭证的唯一方法。完成后，你就不需要再使用该工具了，除非你想做出改变。

在配置打印机之前，你必须在你的 Linux 电脑或服务器上设置一个 Samba 共享。用以下命令安装 Samba：

```
$ sudo dnf -y install samba
```

创建 `/etc/smb.conf` 文件，内容如下：

```
[global]
        workgroup = WORKGROUP
        netbios name = MYSERVER
        security = user
        #CORE needed for CANON PRINTER SCAN FOLDER
        min protocol = CORE
        #NTML AUTHV1 needed for CANON PRINTER SCAN FOLDER
        ntlm auth = yes
        passdb backend = tdbsam

        printing = cups
        printcap name = cups
        load printers = no
        cups options = raw

        hosts allow = 127. 192.168.33.
        max smbd processes = 1000

[homes]
        comment = Home Directories
        valid users = %S, %D%w%S
        browseable = No
        writable = yes
        read only = No
        inherit acls = Yes

[SCANS]
        comment = MB2720 SCANS
        path = /mnt/SCANS
        public = yes
        writable = yes
        browseable = yes
        printable = no
        force user = tux
        create mask = 770
```

在接近结尾的 `force user` 这行中，将用户名从 `tux` 改为你自己的用户名。

不幸的是，佳能打印机不能与高于 CORE 或 NTML v2 认证的服务器信息块（[SMB][4]）协议一起工作。由于这个原因，Samba 共享必须配置最古老的 SMB 协议和 NTML 认证版本。这无论如何都不理想，而且有安全问题，所以我创建了一个单独的 Samba 服务器，专门用于扫描仪。我的另一台共享所有家庭网络文件的 Samba 服务器仍然使用 SMB 3 和 NTML v2 认证版本。

启动 Samba 服务端服务，并启用它：

```
$ sudo systemctl start smb
$ sudo systemctl enable smb
```

### 创建一个 Samba 用户

创建你的 Samba 用户并为其设置密码：

```
$ sudo smbpasswd -a tux
```

在提示符下输入你的密码。

假设你想在 Linux 系统上挂载你的 Samba 扫描仪，你需要做几个步骤。

创建一个 Samba 客户端凭证文件。我的看起来像这样：

```
$ sudo cat /root/smb-credentials.txt
username=tux
password=mySTRONGpassword
```

改变权限，使其不能被其他人阅读：

```
$ sudo chmod 640 /root/smb-credentials.txt
```

创建一个挂载点并将其添加到 `/etc/fstab` 中：

```
$ sudo mkdir /mnt/MB2720-SCANS
```

在你的 `/etc/fstab` 中添加以下这行：

```
//192.168.33.50/SCANS  /mnt/MB2720-SCANS  cifs vers=3.0,credentials=/root/smb-credentials.txt,gid=1000,uid=1000,_netdev    0 0
```

这将使用 [CIFS][5] 将 Samba 共享扫描挂载到新的挂载点，强制采用 SMBv3，并使用存储在 `/root/smb-credetials.txt` 中的用户名和密码。它还传递用户的组标识符（GID）和用户标识符（UID），让你拥有 Linux 挂载的全部所有权。`_netdev` 选项是必需的，以便在网络正常后（例如重启后）挂载该挂载点，因为该挂载点需要网络来访问。

### 配置佳能软件

现在你已经创建了 Samba 共享，在服务器上进行了配置，并将该共享配置到 Linux 客户端上，你需要启动“佳能快速实用工具箱”来配置打印机。因为佳能没有为 Linux 发布工具箱，所以这一步需要 Windows。你可以尝试 [在 WINE 上运行它][6]，但如果失败了，你就必须向别人借一台 Windows 电脑，或者在 [GNOME Boxes][8] 或 [VirtualBox][9] 中运行一个 [Windows 开发者虚拟机][7]。

打开打印机，然后启动佳能快速实用工具箱。它应该能找到你的打印机。如果不能看到你的打印机，你必须先将打印机配置为 LAN 或无线网络。

在工具箱中，点击“<ruby>目标文件夹设置<rt>Destination Folder Settings</rt></ruby>”。

![Canon Quick Utility Toolbox][10]

输入打印机管理密码。我的默认密码是 “canon”。

单击“<ruby>添加<rt>Add</rt></ruby>”按钮。

![Add destination folder][12]

在表格中填写“<ruby>显示名<rt>Displayed Name</rt></ruby>”、“<ruby>目标位置共享文件夹名称<rt>Shared Folder Name in Destination</rt></ruby>”，以及你的 Samba “<ruby>域名/用户名<rt>Domain Name/User Name</rt></ruby>”和“<ruby>密码<rt>Password</rt></ruby>”。

我把 “<ruby>PIN 码<rt>PIN Code</rt></ruby>”留空，但如果你想要求每次从打印机扫描时都要输入 PIN 码，你可以设置一个。这在办公室里很有用，每个用户都有自己的 Samba 共享和 PIN 码来保护他们的扫描。

点击“<ruby>连接测试<rt>Connection Test</rt></ruby>”来验证表格数据。

点击 “OK” 按钮。

点击 “<ruby>注册到打印机<rt>Register to Printer</rt></ruby>”，将你的配置保存到打印机上。

![Register to Printer ][13]

一切都设置好了。点击“<ruby>退出<rt>Exit</rt></ruby>”。你现在已经完成了 Windows 的操作，可能还有工具箱，除非你需要改变什么。

### 开始扫描

你现在可以从打印机扫描，并从其 LCD 菜单中选择你的“目标文件夹”。扫描结果将直接保存到 Samba 共享中，你可以从你的 Linux 电脑上访问该共享。

为方便起见，用以下命令在你的 Linux 桌面或家目录上创建一个符号链接：

```
$ sudo ln -sd /mnt/MB2720-SCANS /home/tux/Desktop/MB2720-SCANS
```

这就是全部内容了！

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/linux-scan-samba

作者：[Marc Skinner][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/marc-skinner
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/files_documents_paper_folder.png?itok=eIJWac15 (Files in a folder)
[2]: https://opensource.com/article/18/2/pivotal-moments-history-open-source
[3]: http://samba.org/
[4]: https://en.wikipedia.org/wiki/Server_Message_Block
[5]: https://searchstorage.techtarget.com/definition/Common-Internet-File-System-CIFS
[6]: https://opensource.com/article/21/2/linux-wine
[7]: https://developer.microsoft.com/en-us/windows/downloads/virtual-machines/
[8]: https://opensource.com/article/19/5/getting-started-gnome-boxes-virtualization
[9]: https://www.virtualbox.org/
[10]: https://opensource.com/sites/default/files/uploads/canontoolbox.png (Canon Quick Utility Toolbox)
[11]: https://creativecommons.org/licenses/by-sa/4.0/
[12]: https://opensource.com/sites/default/files/add_destination_folder.png (Add destination folder)
[13]: https://opensource.com/sites/default/files/uploads/canonregistertoprinter.png (Register to Printer )

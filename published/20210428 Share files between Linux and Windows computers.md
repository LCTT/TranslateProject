[#]: subject: (Share files between Linux and Windows computers)
[#]: via: (https://opensource.com/article/21/4/share-files-linux-windows)
[#]: author: (Stephan Avenwedde https://opensource.com/users/hansic99)
[#]: collector: (lujun9972)
[#]: translator: (hanszhao80)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-14537-1.html)

如何在 Linux 和 Windows 电脑之间共享文件
======

> 使用 Samba 设置跨平台文件共享。

![](https://img.linux.net.cn/data/attachment/album/202205/02/233859oqqjvfr6tqz9bfqp.jpg)

如果你使用不同的操作系统，能够在它们之间共享文件会让你倍感方便。这篇文章介绍如何使用 [Samba][3] 和 [mount.cifs][4] 在 Linux （[Fedora 33][2]）和 Windows 10 之间设置文件共享。

Samba 是 [SMB/CIFS][5] 协议的 Linux 实现，允许通过网络连接直接访问共享的文件夹和打印机。 mount.cifs 是 Samba 套件的一部分，可让你在 Linux 下挂载 [CIFS][5] 文件系统。

> **注意**: 这些说明适用于在你的私有本地网络内，或在 Linux 宿主机和虚拟化的 Windows 访客机之间的虚拟主机专用网络中共享文件。不要将本文视为你公司网络的操作指南，因为本文没有实现必要的网络安全考虑。

### 从 Windows 访问 Linux

本节介绍从 Windows 文件资源管理器访问用户的 Linux 主目录。

#### 1、安装和配置 Samba

进入你的系统安装 Samba:

```
dnf install samba
```

Samba 是一个系统守护进程，其配置文件位于 `/etc/samba/smb.conf`。它的默认配置应该就可以工作。如果不行，下面这个最小化配置应该可以解决问题：

```
[global]
        workgroup = SAMBA
        server string = %h server (Samba %v)
        invalid users = root
        security = user
[homes]
        comment = Home Directories
        browseable = no
        valid users = %S
        writable = yes
```

你可以在该项目网站的 [smb.conf][6] 部分找到参数的详细说明。

#### 2、修改 LinuxSE

如果你的 Linux 发行版受 [SELinux][7] 保护（比如 Fedora），必须通过以下命令才能通过 Samba 共享主目录：

```
setsebool -P samba_enable_home_dirs on
```

通过以下命令查看这个值：

```
getsebool samba_enable_home_dirs
```

输出如下：

![Sebool][8]

#### 3、启用你的用户

Samba 使用一组用户/密码来管理连接权限。通过键入以下命令将你的 Linux 用户添加到该集合中：

```
smbpasswd -a <你的用户名>
```

系统提示你输入密码。这是一个 _全新_ 的密码；而不是你账户的当前密码。请输入你想用来登录 Samba 的密码。

键入以下命令得到有 Samba 使用权限的用户列表：

```
pdbedit -L -v
```

键入以下命令删除一个用户：

```
smbpasswd -x <用户名>
```

#### 4、开启 Samba 

既然 Samba 是一个系统守护进程，你可以在 Fedora 上键入以下命令启动它：

```
systemctl start smb
```

这将为当前会话开启 Samba 服务。如果想让它自启动，键入以下命令：

```
systemctl enable smb
```

在某些系统上，Samba 守护进程注册为 `smbd`。

#### 4、配置防火墙

你的防火墙会默认阻拦 Samba。通过配置防火墙允许 Samba 能永久访问网络。

你可以在命令行执行如下操作：

```
firewall-cmd --add-service=samba --permanent
```

或者，你可以使用 `firewall-config` 工具以图形化方式进行操作：

![firewall-config][10]

#### 5、从 Windows 访问 Samba

在 Windows 中，打开文件资源管理器。在地址栏中，键入两个反斜杠（`\\`），紧跟你的 Linux 机器的地址（IP 地址或主机名）：

![从 Windows 访问 Linux][11]

系统将提示你输入登录信息。输入第 3 步中的用户名和密码组合。你现在应该可以访问 Linux 机器上的主目录：

![从 Windows 访问 Linux][12]

### 从 Linux 访问 Windows

以下步骤说明了如何从 Linux 访问共享的 Windows 文件夹。要实现这一点，需要你的 Windows 用户帐户具有管理员权限。

#### 1、启用文件共享

通过点击 “Windows 按钮” > “<ruby>设置<rt>Settings</rt></ruby>” > “<ruby>网络和 Internet<rt>Network & Internet</rt></ruby>” ，或者右键单击任务栏右下角的小监视器图标，<ruby>打开网络和共享中心<rt>Open Network an d Sharing Center</rt></ruby>：

![打开网络和共享中心][13]

在打开的窗口中，找到你要使用的连接并记下其配置文件。我使用了 **以太网 3**，它被标记为 <ruby>公用网络<rt>Public Network</rt></ruby>。

> **注意**：如果你的 PC 经常连接公用网络，请考虑将本地计算机的连接配置文件更改为 **私有**。

记住你的网络配置，然后单击 <ruby>更改高级共享设置<rt>Change advanced sharing settings</rt></ruby>：

![更改高级共享设置][14]

选择与你的连接对应的配置文件并打开 <ruby>网络发现<rt>network discovery</rt></ruby> 和 <ruby>文件和打印机共享<rt>file and printer sharing</rt></ruby>：

![网络共享设置][15]

#### 2、定义一个共享文件夹

通过右键单击你要共享的文件夹打开上下文菜单，导航到 <ruby>授予访问权限<rt>Give access to</rt></ruby>，然后选择 <ruby>特定用户...<rt>Specific people...</rt></ruby>：

![授予访问权限][16]

检查你当前的用户名是否在列表中。点击 <ruby>共享<rt>Share</rt></ruby> 将此文件夹标记为共享：

![标记为共享][17]

你可以通过在文件资源管理器的地址栏中输入 `\\localhost` 来显示所有共享文件夹的列表：

![共享文件夹][18]

![共享文件夹][19]

#### 3、在 Linux 下挂载共享文件夹

回到你的 Linux 系统，打开一个命令行，然后创建一个新文件夹，用于挂载 Windows 共享：

```
mkdir ~/WindowsShare
```

挂载 Windows 共享是使用 `mount.cifs` 完成的，它应该被默认安装。使用如下命令临时挂载你的共享文件夹：

```
sudo mount.cifs //<address-of-windows-pc>/MySharedFolder ~/WindowsShare/ -o user=<Windows-user>,uid=$UID
```

在这个命令里：

  * `<address-of-windows-pc>` 是 Windows PC 的地址信息（IP 或主机名）
  * `<Windows-user>` 是允许访问共享文件夹的用户（见步骤 2）

系统将提示你输入 Windows 密码。之后，你将能够使用普通 Linux 用户访问 Windows 上的共享文件夹。

要卸载共享文件夹：

```
sudo umount ~/WindowsShare/
```

你还可以在系统启动时挂载 Windows 共享文件夹。按照 [这些步骤][20] 相应地配置你的系统。

### 总结

在这里展示了如何建立临时的文件夹共享访问权限，每次重启后都要重新设置，因此修改成永久访问会更便利。我经常在不同的系统之间来回切换，对我而言设置直接文件访问非常实用。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/share-files-linux-windows

作者：[Stephan Avenwedde][a]
选题：[lujun9972][b]
译者：[hanszhao80](https://github.com/hanszhao80)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/hansic99
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003499_01_cloud21x_cc.png?itok=5UwC92dO (Blue folders flying in the clouds above a city skyline)
[2]: https://getfedora.org/en/workstation/download/
[3]: https://www.samba.org/
[4]: https://linux.die.net/man/8/mount.cifs
[5]: https://en.wikipedia.org/wiki/Server_Message_Block
[6]: https://www.samba.org/samba/docs/current/man-html/smb.conf.5.html
[7]: https://www.redhat.com/en/topics/linux/what-is-selinux
[8]: https://opensource.com/sites/default/files/uploads/sebool.png (Enabling Samba to enable user directory access)
[9]: https://creativecommons.org/licenses/by-sa/4.0/
[10]: https://opensource.com/sites/default/files/uploads/firewall_configuration.png (firewall-config tool)
[11]: https://opensource.com/sites/default/files/uploads/windows_access_shared_1.png (Accessing Linux machine from Windows)
[12]: https://opensource.com/sites/default/files/uploads/windows_acess_shared_2.png (Accessing Linux machine from Windows)
[13]: https://opensource.com/sites/default/files/uploads/open_network_and_sharing_center.png (Open network and sharing center)
[14]: https://opensource.com/sites/default/files/uploads/network_and_sharing_center_2.png (Change advanced sharing settings)
[15]: https://opensource.com/sites/default/files/uploads/network_sharing.png (Network sharing settings)
[16]: https://opensource.com/sites/default/files/pictures/give_access_to.png (Give access)
[17]: https://opensource.com/sites/default/files/pictures/tag_as_shared.png (Tag as shared)
[18]: https://opensource.com/sites/default/files/uploads/show_shared_folder_1.png (Shared folders)
[19]: https://opensource.com/sites/default/files/uploads/show_shared_folder_2.png (Shared folders)
[20]: https://timlehr.com/auto-mount-samba-cifs-shares-via-fstab-on-linux/

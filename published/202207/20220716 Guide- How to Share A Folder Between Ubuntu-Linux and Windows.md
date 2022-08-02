[#]: subject: "Guide: How to Share A Folder Between Ubuntu/Linux and Windows"
[#]: via: "https://www.debugpoint.com/guide-how-share-folder-between-ubuntu-linux-windows/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "MjSeven"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14850-1.html"

如何在 Ubuntu/Linux 和 Windows 之间共享文件夹
======

![](https://img.linux.net.cn/data/attachment/album/202207/21/104750kh3y9craf6s6nasj.jpg)

> 本初学者指南解释了如何在 Ubuntu/Linux 中快速共享一个文件夹。

在 Ubuntu/Linux 中共享一个文件夹并在其他操作系统（如 Windows）中通过网络访问并不难。默认情况下，Ubuntu 并没有安装所需的软件包。但是，你可以打开安装向导来自动安装所需的软件。

本 [指南][1] 适用于所有 Ubuntu 版本（包括 [22.04][2]、20.04、18.04、19.10 以及即将发布的版本 —— 除非此功能的设计发生重大的变化）。

### Ubuntu 中共享文件夹的步骤

**步骤 1：** 打开文件管理器，右键单击共享的文件夹。点击上下文菜单中的“本地网络共享”选项。

![本地网络共享选项][3]

**步骤 2：** 在文件夹共享对话框中点击共享文件夹复选框。

这将在你的系统中安装 [Samba][4] 软件包。Samba 用于在 Windows 和 Unix 系统之间通过网络共享文件和打印机。

![文件夹共享选项 - 安装 Samba][5]

**步骤 3：** 安装 Samba 后，执行以下操作共享文件夹或目录。

  * 选中共享文件夹复选框。
  * 输入共享名称。这将是你从另一个系统（如 Windows）看到的名称。尽量不要使用任何带有空格的名称。
  * （可选）通过勾选相应选项，你可以控制共享文件夹的写入权限，以及允许访客访问。
  * 如果你允许访客访问，则没有凭据的人可以访问共享文件夹。所以要谨慎。
  * 如果你希望用户输入用户名和密码，打开终端并运行以下命令。

```
sudo smbpasswd -a 用户名
```

`用户名` 应该是对应 Ubuntu 系统的有效用户。

现在，你应该已经设置好了共享的文件夹或目录。

### 如何访问共享文件夹

从 Ubuntu/Linux 系统中访问共享文件夹，你需要系统的 IP 地址或主机名。为此，打开“<ruby>系统设置<rt>System Settings</rt></ruby> -> Wi-Fi -> <ruby>获取 IP 地址<rt>Get the IP address</rt></ruby>”。

![IP 地址设置][6]

如果你运行的是 Linux 发行版不是 Ubuntu，此步骤略有不同。你可能想运行 `ip addr` 来获取 IP 地址，如下所示：

![在 Linux 中查找 IP 地址][7]

一旦你获得 IP 地址，就可以在 Ubuntu/Linux 系统中打开文件管理器，然后在地址栏中输入以下内容。注意：你应该修改为你系统的 IP 地址。

你现在可以看到共享文件夹上面显示了一个小共享图标，表示网络共享文件夹。

![共享文件夹][8]

要在 **Windows 系统** 访问共享文件夹，打开运行（按下 `Windows + R`）或打开资源管理器，输入以下地址。注意：你应该修改为你系统的 IP 地址和文件夹名称。

```
\\192.168.43.19\Folder
```

你应该能够查看共享文件夹的内容，并根据授予的权限修改它。

### 总结

我已经向你展示了如何从 Ubuntu 共享一个件夹，并通过 IP 地址在 Windows 系统中访问。对于其他 Linux 发行版，你也可以执行相同的步骤。如果本文对你有帮助，在下面的评论框中告诉我。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/guide-how-share-folder-between-ubuntu-linux-windows/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/category/tutorials/
[2]: https://www.debugpoint.com/web-stories/ubuntu-22-04-review/
[3]: https://www.debugpoint.com/wp-content/uploads/2020/01/Local-Network-Share-Option.jpg
[4]: https://en.wikipedia.org/wiki/Samba_(software)
[5]: https://www.debugpoint.com/wp-content/uploads/2020/01/Folder-Sharing-Option-Install-Samba-1024x552.jpg
[6]: https://www.debugpoint.com/wp-content/uploads/2020/01/IP-Address-Settings.jpg
[7]: https://www.debugpoint.com/wp-content/uploads/2020/01/Finding-out-IP-Address-in-Linux.jpg
[8]: https://www.debugpoint.com/wp-content/uploads/2020/01/Share-Folder-1.jpg

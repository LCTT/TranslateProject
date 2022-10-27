[#]: subject: "Open source file sharing with this Linux tool"
[#]: via: "https://opensource.com/article/21/12/file-sharing-linux-samba"
[#]: author: "Don Watkins https://opensource.com/users/don-watkins"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14145-1.html"

用 Samba 跨平台共享文件
======

> Samba 是一种灵活的文件共享工具，它将你可能在组织中运行的所有不同平台结合在一起。

![](https://img.linux.net.cn/data/attachment/album/202201/04/092708dsjqu1fbfjjhee1j.jpg)

在我接触 Linux 的早期，我是纽约州一个小型学前教育学区的技术总监。我们的技术预算总是捉襟见肘。我们是一个 Windows 2000 活动目录域，但我们的中央服务器磁盘空间有限，而且没有教师的主目录。此外，我们经历过十几次员工电脑硬盘故障。

我正在寻找一种方法，以最小的成本保存员工的工作。这时我发现了 Samba。在那之前，我一直将 Linux 用于内容过滤，不知道我们的 Windows 工作站可以连接到服务器并保存文件备份。

[Samba 项目][2] 自 1992 年以来一直存在。当我开始试验这个项目的时候，这个项目已经有 10 年历史了，我对如何配置它一无所知。我买了一本书并阅读了如何实现它，然后我从我们的电脑柜中取出一台旧电脑，购买了一个 300G 的希捷 IDE 驱动器，安装了 Linux，并配置了 Samba。我使用了一个简单的配置，并且它成功了。在向我们的一个 IT 助理展示后，我们部署了这个解决方案。硬盘故障的问题继续存在，但我们的员工不再需要担心失去他们所有的辛苦工作。

Samba 采用 [GPL][3] 许可证，并在大多数 Linux 发行版上广泛使用。Samba 有很好的 [文档][4]，Fedora 用户可以查阅这份在 [Fedora 上配置 Samba][5] 的文档。

### 在 Linux 上安装 Samba

你可以使用你的发行版的包管理器来安装 Samba。

在 Fedora、CentOS、RHEL、Mageia 和类似的系统上：

```
$ sudo dnf install samba
```

在 Debian, Linux Mint 和类似系统上：

```
$ sudo apt install samba
```

### 用 Samba 创建一个共享文件夹

创建一个简单的共享文件夹只需要五个步骤。

1、在你的 Linux 服务器上创建一个你希望用户能够保存共享文件的目录。这个目录可以是服务器上的任何地方：在 `/home` 或 `/opt` 或任何最适合你的地方。我使用我的主目录，我把共享目录称为 `sambashare`。

```
$ mkdir /home/don/sambashare
```

在 Fedora 和其他运行 SELinux 的发行版上，你必须对这个共享目录给予安全许可：

```
$ sudo semanage fcontext --add --type "samba_share_t" ~/sambashare
$ sudo restorecon -R ~/sambashare
```

2、用 Nano 或你选择的文本编辑器编辑 Samba 配置文件。

```
$ sudo nano /etc/samba/smb.conf
```

在 `smb.conf` 文件的底部添加以下内容，用你自己的共享目录的位置替换我例子中的 `/home/don/sambashare` 路径：

```
[sambashare]
        comment = Samba on Linux       
        path = /home/don/sambashare
        read only = no
        browsable = yes
```

如果你使用 Nano，按 `Ctrl-O`，然后按**回车**来保存，按 `Ctrl-X` 退出。

3、启动或重启 Samba 服务，这取决于你的发行版。

在 Fedora 和类似的系统中，没有明确的许可，服务是不会启动的，所以现在就可以启动 Samba，并在启动时启动：

```
$ sudo systemctl enable –now smb.conf
```

在 Debian 和类似系统中，Samba 默认在安装后启动，所以你必须现在就重启它：

```
$ sudo service smbd restart
```

4、更新你的防火墙规则，允许访问你的 Samba 共享。该如何做取决于你的系统使用什么防火墙。

如果你正在运行 firewalld：

```
$ sudo firewall-cmd --permanent --add-service=samba
$ sudo firewall-cmd --reload
```

如果你正在运行 UFW：

```
$ sudo ufw allow samba
```

5、现在你需要设置一个密码来访问你的 Samba 共享。这个用户名（在我的例子中是 don）必须属于你系统中的一个账户。

```
$ sudo smbpasswd -a don
```

我在每个 Samba 共享中都放置了一个简单的 `README` 文件，这样用户就会明白这个目录位于服务器上，他们必须在 VPN 上才能从家里访问它等等。

### 从 Windows 和 Mac 访问 Samba

在 Windows 电脑上，打开文件管理器（Windows Explorer），访问路径 `ip-address-of-the-Linux-computer/sambashare`。系统会提示你输入 Samba 共享密码，然后 `sambashare` 目录中的文件会出现在你的文件管理器窗口中，就像它们存在于你的桌面上一样。你可以开始在网络上的这个新共享目录中存储你的文件。

在 macOS 电脑上，进入 Finder 菜单，选择 Go。在出现的对话框中，输入 `smb://ip-address/sambashare`，并按照提示输入 Samba 密码。

### Samba 意味着共享

Samba 使共享文件变得容易。你可以在 Samba 中使用许多其他方案来创建共享位置，包括用户组的公共文件夹，只接受传入文件的收件箱，以及其他你可能需要的东西。它是开源的、灵活的，而且它把你可能在你的办公室里运行的所有不同的平台联合起来。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/12/file-sharing-linux-samba

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/files_documents_paper_folder.png?itok=eIJWac15 (Files in a folder)
[2]: https://www.samba.org/
[3]: https://www.samba.org/samba/docs/GPL.html
[4]: https://www.samba.org/samba/docs/
[5]: https://docs.fedoraproject.org/en-US/quick-docs/samba/

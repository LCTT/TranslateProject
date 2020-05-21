[#]: collector: (lujun9972)
[#]: translator: (lxbwolf)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to create a personal file server with SSH on Linux)
[#]: via: (https://opensource.com/article/20/3/personal-file-server-ssh)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)

怎样在 Linux 下用 SSH 搭建私人文件服务器
======
通过 SSH 连接远程 Linux 系统很简单。下面是教程。
![Hand putting a Linux file folder into a drawer][1]

使用树莓派可以搭建对很多事物有用的廉价家庭服务器。我的树莓派最常用来做[打印服务器][2]，可以在我的家庭网络中共享激光打印机，或作为私人文件服务器保存项目副本和其他数据。

我的文件服务器有很多用途。假设我现在有一个项目，比如一本新书，我想备份我的工作的快照和所有关联的文件。这种场景下，我只需要把 **BookProject** 文件夹复制到文件服务器的 **BookBackup** 文件夹。

或者我现在正在清理我的本地文件，我发现有些文件现在不需要，但是我不确定是否要删除，我会把它们复制到文件服务器的 **KeepForLater** 文件夹。对于清理我日常用的 Linux 系统上杂乱的文件，以及把不常用的文件备份到私人文件服务器，这是一种很方便的方法。

用树莓派或其他 Linux 系统搭建私人文件服务器不需要配置 NFS（<ruby>网络文件系统<rt>Network File System</rt></ruby>>）或 CIFS（<ruby>通用互联网文件系统<rt>Common Internet File System</rt></ruby>）或改造其他的文件共享系统如 WebDAV。你可以很轻松的使用 SSH 来搭建远程文件服务器。下面是教程。

### 在远程服务器上配置 SSHD

你的 Linux 系统可能已经安装了 SSH daemon（sshd），甚至它是默认执行的。如果没有运行，你可以使用你 Linux 发行版本上你想要的任何控制面板来轻松配置 SSH。我在树莓派上运行了 [Fedora ARM][3]，通过把树莓派的 web 浏览器指向 9090 端口，我可以远程访问控制面板。（在我的家庭网络中，树莓派的 IP 地址是 **10.0.0.11**，因此我连接的是 **10.0.0.11:9090**。）如果 SSH daemon 默认没有运行，你可以在控制面板的 Services 里把它设置为开机启动。

![sshd in the list of system services][4]

你可以在系统服务列表里找到 sshd。

![slider to activate sshd][5]

如果 **sshd** 没有开启，点击切换按钮打开它。

### 你有账号吗？

你需要有个远程系统的账号。它可以与你本地系统的账号相同，也可以不同。

在流行的 Raspbian 发行版本上，默认的账号名是 **pi**。但是其他的 Linux 发行版本可能需要你在安装系统时就设置一个独一无二的新用户。如果你不知道你的用户名，你可以用系统的控制面板创建一个。在我的树莓派上，我创建了一个 **jhall** 账号，与我日常用的 Linux 桌面机器的用户名相同。

![Set up a new account on Fedora Server][6]

如果你用的是 Fedora 服务器，你可以点击 **Create New Account** 按钮来创建新账号。

![Set password or SSH key][7]

不要忘记设置密码或添加公钥。

### 可选：添加公钥

如果你把公钥添加到远程 Linux 系统上，你就可以不使用密码登录。这一步是可选的；如果你愿意，你仍可以用密码登录。

你可以在下面 Opensource.com 的文章中学到更多关于 SSH key 的信息：

  * [SSH key 管理工具][8]
  * [用 Seahorse 对 SSH key 进行图形化管理][9]
  * [如何管理多个 SSH key][10]
  * [使用 GPG key 作为鉴权依据开启 SSH 访问][11]



### 创建文件管理器快捷方式

现在你已经在远程系统上启动 SSH daemon 了，也设置了用户名和密码，最后一步就是在你本地的文件管理器中创建一个快捷方式，地址映射到远程 Linux 系统。我的桌面是 GNOME，但是在其他的 Linux 桌面上的基本操作步骤都是一样的。

#### 建立初始连接

在 GNOME 的文件管理器中，在左边导航栏找到 **+Other Locations** 按钮。点击它会出现一个 **Connect to Server** 提示框。在框中输入远程 Linux 服务器的地址，地址以 SSH 连接协议开头。

![Creating a shortcut in GNOME file manager][12]

GNOME 文件管理器支持多种连接协议。以 **sftp://** 或 **ssh://** 开头的服务器地址，会创建 SSH 连接。

如果你远程 Linux 系统的用户名与本地的相同，那么你只需要输入服务器的地址和文件夹路径就可以了。比如要连接到我的树莓派的 **/home/jhall** 目录，我输入：


```
`sftp://10.0.0.11/home/jhall`
```

![GNOME file manager Connect to Server][13]

如果你远程 Linux 系统的用户名与本地的不同，你可以在远程系统地址前加 **@** 符号来指定远程系统的用户名。要连接到远程的 Raspbian 系统，你可能要输入：


```
`sftp://pi@10.0.0.11/home/pi`
```

![GNOME file manager Connect to Server][14]

如果你没有把公钥添加到远程服务器，那么你需要输入密码。如果你已经添加，GNOME 文件管理器应该会自动打开远程系统上的文件夹来让你跳转到不同的目录。

![GNOME file manager connection][15]

#### 创建一个快捷方式，之后就可以轻松连接服务器

在 GNOME 文件管理器中，这很简单。右击导航栏中远程系统的名字，选择 **Add Bookmark** 。这一步操作就创建了连接到远程路径的快捷方式。

![GNOME file manager - adding bookmark][16]

如果你想把标签中的快捷方式改成一个更容易记的名字，你可以右击快捷方式选择 **Rename**。

### 总结！

通过 SSH 连接到远程 Linux 系统是很简单的事。你可以用相同的方式连接到家庭文件服务器以外的其他系统。我还创建了一个能让我立即访问我的提供商的 web 服务器上的文件的快捷方式和另一个能迅速打开我的项目服务器的文件夹的快捷方式。SSH 保证了它们是安全的连接；所有的传输都是加密的。当我通过 SSH 打开远程的文件时，我可以像在本地操作一样使用 GNOME 文件管理器轻松打开远程文件。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/personal-file-server-ssh

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/yearbook-haff-rx-linux-file-lead_0.png?itok=-i0NNfDC (Hand putting a Linux file folder into a drawer)
[2]: https://opensource.com/article/18/3/print-server-raspberry-pi
[3]: https://arm.fedoraproject.org/
[4]: https://opensource.com/sites/default/files/uploads/fedora-server-control-panel-sshd.png (sshd in the list of system services)
[5]: https://opensource.com/sites/default/files/uploads/fedora-server-control-panel-sshd-service.png (slider to activate sshd)
[6]: https://opensource.com/sites/default/files/uploads/fedora-server-control-panel-accounts_create-user.png (Set up a new account on Fedora Server)
[7]: https://opensource.com/sites/default/files/uploads/fedora-server-control-panel-accounts.png (Set password or SSH key)
[8]: https://opensource.com/article/20/2/ssh-tools
[9]: https://opensource.com/article/19/4/ssh-keys-seahorse
[10]: https://opensource.com/article/19/4/gpg-subkeys-ssh-manage
[11]: https://opensource.com/article/19/4/gpg-subkeys-ssh
[12]: https://opensource.com/sites/default/files/uploads/gnome-file-manager-other-locations.png (Creating a shortcut in GNOME file manager)
[13]: https://opensource.com/sites/default/files/uploads/gnome-file-manager-other-sftp.png (GNOME file manager Connect to Server)
[14]: https://opensource.com/sites/default/files/uploads/gnome-file-manager-other-sftp-username.png (GNOME file manager Connect to Server)
[15]: https://opensource.com/sites/default/files/uploads/gnome-file-manager-remote-jhall.png (GNOME file manager connection)
[16]: https://opensource.com/sites/default/files/uploads/gnome-file-manager-remote-jhall-add-bookmark.png (GNOME file manager - adding bookmark)

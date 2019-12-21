[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11584-1.html)
[#]: subject: (How to add a user to your Linux desktop)
[#]: via: (https://opensource.com/article/19/11/add-user-gui-linux)
[#]: author: (Alan Formy-Duval https://opensource.com/users/alanfdoss)

如何在 Linux 桌面添加用户
======

> 无论是在安装过程中还是在桌面中，通过图形界面管理用户都非常容易。

![Team of people around the world][1]

添加用户是你在一个新系统上要做的第一件事。而且，你通常需要在计算机的整个生命周期中管理用户。

我的关于 [useradd 命令][2]文章提供了更深入的对 Linux 的用户管理的了解。`useradd` 是一个命令行工具，但是你也可以在 Linux 上以图形方式管理用户。这就是本文的主题。

### 在 Linux 安装过程中添加用户

大多数 Linux 发行版都提供了在安装过程中创建用户的步骤。例如，Fedora 30 安装程序 Anaconda 创建标准的 `root` 用户和另一个本地用户帐户。在安装过程中进入“配置”页面时，单击“用户设置”下的“用户创建”。

![Fedora Anaconda Installer - Add a user][3]

在用户创建页面上，输入用户的详细信息：全名、用户名和密码。你还可以选择是否使用户成为管理员。

![Create a user during installation][4]

点击“高级”按钮打开“高级用户配置”页面。如果需要除默认设置以外的其他设置，那么可以在此处指定主目录的路径以及用户和组 ID。你也可以输入用户所属的其他组。

![Advanced user configuration][5]

### 在 Linux 桌面上添加用户

#### GNOME

许多 Linux 发行版都使用 GNOME 桌面。以下截图来自 Red Hat Enterprise Linux 8.0，但是在其他发行版（如 Fedora、Ubuntu 或 Debian）中，该过程相似。

首先打开“设置”。然后打开“详细”，选择“用户”，单击“解锁”，然后输入密码（除非你已经以 root 用户登录）。这样将用“添加用户”按钮代替“解锁”按钮。

![GNOME user settings][6]

现在，你可以通过单击“添加用户”，然后选择“帐户类型”然后输入“用户名”和“密码”来添加用户。

在下面的截图中，已经输入了用户名，设置保留为默认设置。我不必输入“用户名”，因为它是在我在“全名”字段中输入时自动创建的。如果你不喜欢自动补全，你仍然可以对其进行修改。

![GNOME settings - add user][7]

这将为名为 Sonny 的用户创建一个标准帐户。Sonny 首次登录时需要提供密码。

接下来，将显示用户。在此页面可以选择每个用户进行自定义或者删除。例如，你可能想选择一个头像或设置默认语言。

![GNOME new user][8]

#### KDE

KDE 是另一个流行的 Linux 桌面环境。下面是 Fedora 30 上 KDE Plasma 的截图。你可以看到，在 KDE 中添加用户与在 GNOME 中添加用户非常相似。

![KDE settings - add user][9]

### 总结

除 GNOME 和 KDE 外，其他桌面环境和窗口管理器也有图形用户管理工具。无论是在安装时还是安装后，在 Linux 中以图形方式添加用户都是快速简便的。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/add-user-gui-linux

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/team_global_people_gis_location.png?itok=Rl2IKo12 (Team of people around the world)
[2]: https://opensource.com/article/19/10/linux-useradd-command
[3]: https://opensource.com/sites/default/files/uploads/screenshot_fedora30_anaconda2.png (Fedora Anaconda Installer - Add a user)
[4]: https://opensource.com/sites/default/files/uploads/screenshot_fedora30_anaconda3.png (Create a user during installation)
[5]: https://opensource.com/sites/default/files/uploads/screenshot_fedora30_anaconda4.png (Advanced user configuration)
[6]: https://opensource.com/sites/default/files/uploads/gnome_settings_user_unlock.png (GNOME user settings)
[7]: https://opensource.com/sites/default/files/uploads/gnome_settings_adding_user.png (GNOME settings - add user)
[8]: https://opensource.com/sites/default/files/uploads/gnome_settings_user_new.png (GNOME new user)
[9]: https://opensource.com/sites/default/files/uploads/kde_settings_adding_user.png (KDE settings - add user)

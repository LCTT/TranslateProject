[#]: subject: "Add, switch, delete, and manage Linux users in KDE"
[#]: via: "https://opensource.com/article/22/2/manage-linux-users-kde"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14322-1.html"

在 KDE 中添加、切换、删除和管理 Linux 用户
======

> 在一台电脑上维护独立的用户是一种奢侈，也是保护你自己和你关心的人的数据安全的一个好方法。

![](https://img.linux.net.cn/data/attachment/album/202203/03/104151iwevek3xzcr1113u.jpg)

在一个家庭中共享一台电脑通常是一件很随意的事情。当你需要电脑时，你拿起它并开始使用它。这在理论上很简单，而且大部分情况下是有效的。也就是说，直到你不小心拿起公用电脑，不小心把你的服务器的正常运行时间的截图发到你伴侣的烹饪博客上。然后，就到了建立独立用户帐户的时候了。

从一开始，Linux 就是一个多用户系统。它的设计是把每个用户，只要他们登录，都当作一个独特的人，有一个属于他们自己的桌面，一个独特的网络浏览器配置文件，访问他们自己的文档和文件，等等。KDE Plasma 桌面做了很多工作，使得从一个帐户切换到另一个帐户很容易，但首先你必须为每个你期望使用电脑的人设置一个用户帐户。你也可以为客人设置一个特殊的帐户（我称这个帐户为 `guest`）。

### 在 KDE 中添加用户

在 Linux 上有不同的方法来添加用户。一种方法是系统管理员式的 [使用终端][2]。当你有很多用户需要添加时，这是非常有效的，所以你想把这个过程自动化或者只是减少鼠标点击的次数。

不过在 Plasma 桌面上，你可以用<ruby>用户<rt>Users</rt></ruby>程序来添加用户。<ruby>用户<rt>Users</rt></ruby>实际上是<ruby>系统设置<rt>System Settings</rt></ruby>中的一个控制面板，但你可以从你的应用菜单中启动它，就像它是一个独立的应用。

![Users in KDE System Settings][3]

要添加一个用户，点击窗口底部的<ruby>添加新用户<rt>Add New User</rt></ruby>按钮。

![Adding a user in KDE][5]

给新用户一个<ruby>名字<rt>Name</rt></ruby>和一个<ruby>用户名<rt>Username</rt></ruby>。这些可能是相同的，但意图是他们的名字是他们的姓名，而他们的用户名是他们用于使用的入口。例如，我的名字是 “Seth Kenlon”，而我的用户名是 `seth`。

将新用户指定为<ruby>标准用户<rt>Standard</rt></ruby>或<ruby>管理员<rt>Administraor</rt></ruby>。标准用户只对自己的环境有完全的控制权。他们可以 [安装 Flatpak][6] 并将数据保存到他们的主目录，但他们不能影响机器上的其他用户。这是有用户帐户的好处之一。我不会认为我允许使用我的电脑的任何人打算删除对我很重要的数据，但意外还是发生了。通过为我自己和我的伴侣创建一个单独的用户帐户，我在保护我们每个人的数据，我也在保护我们每个人，避免意外地移动一个文件或误放对另一个人很重要的数据。

管理员可以进行全系统的更改。我通常在我的电脑上为自己保留这个角色，我也希望我的伴侣在她自己的电脑上为自己保留这个角色。然而，在工作中，这个角色属于 IT 部门。

为用户创建一个<ruby>密码<rt>Password</rt></ruby>，并重复<ruby>确认<rt>Confirm</rt></ruby>。登录后，新用户可以改变他们的密码。

要完成用户创建，请点击<ruby>创建<rt>Create</rt></ruby>按钮。

### 切换用户

在桌面有两种不同的方式来切换用户。你可以注销，然后让另一个用户登录，或者你可以从应用菜单的<ruby>电源/会话<rt>Power / Sessions</rt></ruby>子菜单中选择<ruby>切换用户<rt>Switch user</rt></ruby>。

![Switching users in KDE][7]

当一个新用户登录时，你的当前桌面会被“冻结”或暂停，而另一个用户的新桌面会被调出来。你所有的窗口都保持打开。你甚至可以在游戏中切换用户（如果你正在战斗中，你应该先暂停一下），当你切换回来时，你可以从你离开的地方继续。更好的是，你的所有进程也会继续运行。所以你可以在渲染视频或编译代码时切换用户，当你切换回来时，你的视频已经完成了渲染，或者你的代码已经完成了编译（只要有足够的时间）。

![Login][8]

### 删除用户

当我有客人时，我经常在他们的逗留期间创建一个客人帐户，当他们离开后，我就删除这个帐户。

你可以通过删除一个用户的用户帐户来从你的电脑中删除该用户。这将删除他们的所有数据，所以要确保你要删除的用户已经把他们需要的东西从机器上迁移掉了！

<ruby>删除用户<rt>Delete User</rt></ruby>按钮位于<ruby>用户<rt>Users</rt></ruby>控制面板中的每个用户帐户下，也就是你最初创建用户的地方。

![Deleting a user][9]

### Linux 用户管理

在计算机上维护独立的用户是一种奢侈，也是保护你自己的数据和你关心的人的数据安全的好方法。它允许每个用户都是独一无二的，并使桌面成为他们自己的。在 Linux 中，这很容易，而且没什么影响，因此可以为朋友、房客和家人创建用户。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/manage-linux-users-kde

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/connection_people_team_collaboration.png?itok=0_vQT8xV (people in different locations who are part of the same team)
[2]: https://www.redhat.com/sysadmin/linux-commands-manage-users
[3]: https://opensource.com/sites/default/files/kde-users.jpg (Users in KDE System Settings)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://opensource.com/sites/default/files/kde-users-add.jpg (Adding a user in KDE)
[6]: https://opensource.com/article/21/11/install-flatpak-linux
[7]: https://opensource.com/sites/default/files/kde-users-switch.jpg (Switching users in KDE)
[8]: https://opensource.com/sites/default/files/kde-users-login.jpg (Login)
[9]: https://opensource.com/sites/default/files/kde-users-delete.jpg (Deleting a user)

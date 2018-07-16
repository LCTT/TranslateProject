每日Ubuntu小技巧——添加用户到已存在的组
================

对于刚开始使用Ubuntu的用户和新手来说，尤其是从Ubuntu中不在包含旧式的用户和组的管理工具后，管理用户和组变的富有挑战性。在先前Ubuntu的版本下，用户可以通过Gnome系统工具下的用户管理工具轻松的管理用户和组。

现在，在Ubuntu上没有了这个工具，现在唯一的工具也仅仅允许你创建、管理和删除用户，所以如果你需要在Ubuntu中从组里面添加或删除用户，那么你将需要用到命令行终端或控制台。

举个例子，如果你想要让某些用户访问文件或提升他们的访问权限，最好方式就是改变组的权限。你可以创建一个组，接着给这个组正确的权限，在添加用户到组时，用户可以获得与组相同的权限。

因为当前Ubuntu不能用工具轻易的管理组权限，这个简洁的教程，将告诉你如何用命令行完成以上操作，这仅仅是一行代码，一旦你理解了，这并不难。

开始吧，按**Ctrl-Alt-T**打开终端。

查看Ubuntu上所有的组，键入命令`groupmod`并（**连按三次tab键**）

    groupmod <连按三次tab键>

![](http://www.liberiangeek.net/wp-content/uploads/2013/09/groupsubuntuadduser.png)

这会列出现在你系统上的所有用户组，现在添加用户到已存在的组吧，运行下列命令：

    sudo adduser 用户名 组名

例如，如果你想添加Richard到sudo组，运行下列命令：

    sudo adduser richard sudo

好了，去验证用户的相关组，运行下列命令：

    id richard

试试吧!

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2013/09/daily-ubuntu-tips-adding-users-existing-groups/

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[Luoxcat](https://github.com/Luoxcat) 校对：[wxy](https://github.com/wxy)

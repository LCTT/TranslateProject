每日Ubuntu小技巧——了解Root帐号
================================================================================
对于想了解Root帐号的Ubuntu新手，这里有一个简短的文章会让你对root账号和如何使用及为什么使用root账号有些清楚的认识。如你所见，每个版本的Ubuntu都会带一个root账号。

root账号也被称作管理员账号。你可以将root账号看作是有着同上帝一样的权力的账号。它可以删除任何文件，任何目录并对系统做出任何修改。root账号的权限是无限制的。

由于root账号过于强大，系统会自动地产生一个密码串，该密码串在系统上不可能通过加密来匹配到，如此一来用户就不能使用root帐号登入系统了。相对直接用root帐号登录，Ubuntu更支持用户使用sudo命令。

sudo命令可以使已获得授权的用户在不知道root帐号的密码也不使用root帐号的情况下，通过使用自己的密码暂时提升自己的权限。

如果你因为一些其它原因仍然想要使用root帐号并用它登录系统，很简单，给它设置一个密码就可以了。这样就可以使能root帐号了。

    sudo passwd

上面的命令可以激活root帐号，但是想要用root帐号登录系统，你还必须打开被Ubuntu禁用的手动登录功能。手动登录功能允许用户输入帐号和相应的登录密码而不仅仅是从登录界面选择一个帐号登录。

要在**Ubuntu 13.10**中打开手动登录选项，你可以运行下面的命令

    sudo gedit /etc/lightdm/lightdm.conf.d/50-unity-greeter.conf

然后如图所示添加下面这一行文字

    greeter-show-manual-login=true

![](	)

保存并重启电脑。

对于较早版本的Ubuntu，你可以在另外一个位置，即**/etc/lightdm**目录下找到这个配置文件。文件名可能叫**lightdm.conf**。

修改完后，在登录界面，你就可以输入root帐号和相应的密码然后登录系统了。

![](http://www.liberiangeek.net/wp-content/uploads/2013/09/ubuntu-root-logon-1.png)

如果你想锁定/禁用root帐号，使用下面的命令

    sudo passwd -l root

使用愉快！

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2013/09/daily-ubuntu-tipsknowing-root-account/

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[Linchenguang](https://github.com/Linchenguang) 校对：[wxy](https://github.com/wxy)

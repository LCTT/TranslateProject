[#]: subject: "How To Reset Sudo Password In Ubuntu 22.04 / 20.04 LTS"
[#]: via: "https://ostechnix.com/how-to-reset-sudo-password-in-ubuntu-20-04-lts/"
[#]: author: "sk https://ostechnix.com/author/sk/"
[#]: collector: "lkxed"
[#]: translator: "robsean"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

如何在 Ubuntu 22.04 / 20.04 LTS 中重新设置 sudo 密码
======
在 Ubuntu 中重新设置已忘记的 root 用户的密码

这篇简单的指南将向你解释，如何在 Ubuntu 22.04 好 20.04 LTS 桌面环境中，以及从服务器版本中的 <ruby>恢复<rt>rescue</rt></ruby> 模式中重新设置 sudo 密码。

### 介绍

在 **[安装 Ubuntu][1]** 时，新创建的一个用户将会带有 sudo 权限，用以执行各种各样的管理任务。

如果你的 Ubuntu 系统有多个 sudo 用户，你能够从另外一个 sudo 用户的账号下，轻松地重新设置所忘记的一个 sudo 用户或管理员用户的密码。

如果你只有一个 sudo 用户，并且忘记了密码怎么办？没有问题! 从 Ubuntu 的 **<ruby>恢复<rt>rescue</rt></ruby>** 或 **<ruby>单一用户<rt>single user</rt></ruby>**** 模式中恢复 sudo 用户密码很容易。

虽然这篇指南是在 Ubuntu 22.04 和 20.04 LTS 版本上进行的正式测试，不过，下面给定的步骤对于其它的 Ubuntu 版本和衍生版本来说是相同的。

### 在 Ubuntu 22.04 / 20.04 LTS 中重新设置 sudo 密码

首先，启动你的 Ubuntu 系统到 **<ruby>恢复<rt>rescue</rt></ruby>** 模式下，来重新设置一个 sudo 用户的密码，如下面的链接所述。

> [如何启动到 Ubuntu 22.04 /  20.04 / 18.04 的 <ruby>恢复<rt>rescue</rt></ruby> 模式 或 <ruby>急救<rt>Emergency</rt></ruby> 模式 ][2]

在吗进入到 **<ruby>恢复<rt>rescue</rt></ruby>** 模式下，通过运行下面的命令，以读/写的模式挂载  root (**/**) 文件系统：

```
# mount -n -o remount,rw /
```

现在，使用 **"passwd"** 命令来重新设置 sudo 用户的密码:

```
# passwd ostechnix
```

在这里，**"ostechnix"** 是 sudo 用户的名称。 使用你自己的用户名称来替换掉它。

输入两次密码：

```
New password:
Retype new password:
passwd: password updated successfully
```

![Reset Sudo Password In Ubuntu 22.04 / 20.04 LTS][3]

就这样。我们已经重新设置 sudo 用户密码。如果你按照上面链接所述的 **方法 1** 来进入到 **<ruby>恢复<rt>rescue</rt></ruby>** 模式，按下 **“Ctrl+d”** 组合键来启动到正常模式。或者，你也可以输入下面的任意一个命令来启动到正常模式。

```
# systemctl default
```

或，

```
# exit
```

如果你想重新启动系统，而不是启动到正常模式，输入：

```
# systemctl reboot
```

如果你已经按照上面链接所述的 **方法 2** 进入到<ruby>恢复<rt>rescue</rt></ruby> 模式，输入：

```
# exit
```

你将返回到 <ruby>恢复菜单<rt>recovery menu</rt></ruby> 。 现在 "**<ruby>恢复正常启动<rt>Resume normal boot</rt></ruby>**" ，并按下 <ruby>回车<rt>ENTER</rt></ruby> 键。

![Boot Into Normal Mode In Ubuntu][4]

在强调一次，选择 <ruby>确定<rt>OK</rt></ruby> 按钮，并按下 <ruby>回车<rt>ENTER</rt></ruby> 按键来继续启动到正常模式：

![Exit Recovery Mode And Boot Into Normal Mode][5]

现在，你在运行管理命令时可以使用新的 sudo 密码。

##### 如果我把用户名称和密码都忘了怎么办？

如果你忘记了用户名称，在 <ruby>恢复<rt>rescue</rt></ruby> 模式下，你可以很容易地列出你的 Linux 系统中的用户名称，使用目录：

```
# cat etc/passwd
```

来自我 Ubuntu 22.04 系统的输出示例：

```
[...]
ostechnix:x:1000:1000:Ostechnix,,,:/home/ostechnix:/bin/bash
[...]
```

好了，现在，你找到用户名称了。只需要按照上面的步骤来重新设置用户的密码即可。

--------------------------------------------------------------------------------

via: https://ostechnix.com/how-to-reset-sudo-password-in-ubuntu-20-04-lts/

作者：[sk][a]
选题：[lkxed][b]
译者：[robsean](https://github.com/robsean)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/sk/
[b]: https://github.com/lkxed
[1]: https://ostechnix.com/install-ubuntu-desktop/
[2]: https://ostechnix.com/how-to-boot-into-rescue-mode-or-emergency-mode-in-ubuntu-18-04/
[3]: https://ostechnix.com/wp-content/uploads/2022/05/Reset-Sudo-Password-In-Ubuntu.png
[4]: https://ostechnix.com/wp-content/uploads/2020/05/Boot-into-normal-mode-in-Ubuntu.png
[5]: https://ostechnix.com/wp-content/uploads/2020/05/Booting-into-normal-mode-from-rescue-mode-in-Ubuntu.png

让 sudo 在你输入错误的密码时“嘲讽”你
============================================================

**sudoers** 是 Linux 中的默认 sudo 安全策略插件，但是经验丰富的系统管理员可以自定义安全策略以及输入输出日志记录的插件。它由 `/etc/sudoers` 这个文件驱动，或者也可在 LDAP 中。

你可以在上面的文件中定义 **sudoers** <ruby>嘲讽<rt>insults</rt></ruby> 或其他选项。它在 `defaults` 部分下设置。请阅读我们的上一篇文章[在 Linux 中设置 `sudo` 时 10 个有用的 sudoers 配置][1]。

在本文中，我们将解释一个 sudoers 配置参数，以允许个人或系统管理员设置 [sudo 命令][2]，当系统用户输入错误密码时“嘲讽”他们。

首先打开文件 `/etc/sudoers`，如下所示：

```
$ sudo visudo
```

进入 `defaults` 部分，并添加下面的行：

```
Defaults   insults
```

下面是我系统中 `/etc/sudoers` 默认展示的 `defaults` 部分。

[
 ![Set sudo Insults Parameter](http://www.tecmint.com/wp-content/uploads/2017/01/Set-sudo-Insults-Parameter.png) 
][3]

*设置 sudo insults 参数*

从上面的截图中，你可以看到 `defaults` 中还有许多其他默认值定义，例如，每次用户输入错误的密码时发送邮件到 root、设置安全路径、配置自定义 sudo 日志文件等。

保存并关闭文件。

运行 `sudo` 命令并输入错误的密码，然后观察 insults 选项是如何工作的：

```
$ sudo visudo
```
[
 ![sudo Insult in Action](http://www.tecmint.com/wp-content/uploads/2017/01/How-sudo-Insult-Works.png) 
][4]

*实践 sudo insult*

**注意**：当配置 insults 参数时，它会禁用 `badpass_message` 参数，该参数在用户输入错误的密码时，会在命令行中输出特定的消息（默认消息为 “**sorry, try again**”）。

要修改该消息，请将 `badpass_message` 参数添加到 `/etc/sudoers` 文件中，如下所示。

```
Defaults  badpass_message="Password is wrong, please try again"  #try to set a message of your own
```
[
 ![Set sudo badpassword Message](http://www.tecmint.com/wp-content/uploads/2017/01/Set-sudo-badpassword-Message.png) 
][5]

*设置 sudo 错误密码消息*

保存并关闭文件，然后调用 `sudo` 查看它是如何工作的，你设置的 `badpass_message` 消息会在每次你或任何系统用户输入错误的密码的时候打印出来。

```
$ sudo visudo
```
[
 ![Sudo badpassword Message](http://www.tecmint.com/wp-content/uploads/2017/01/sudo-badpassword-Message.png) 
][6]

*sudo 密码错误消息*

就是这样了，在本文中，我们回顾了如何在用户输入错误的密码时将 `sudo` 设置为显示嘲讽。请通过下面的评论栏分享你的想法。

--------------------------------------------------------------------------------

作者简介：

![](http://1.gravatar.com/avatar/4e444ab611c7b8c7bcb76e58d2e82ae0?s=128&d=blank&r=g)

Aaron Kili 是 Linux 和 F.O.S.S 爱好者，将来的 Linux SysAdmin、web 开发人员，目前是 TecMint 的内容创建者，他喜欢用电脑工作，并坚信分享知识。

--------------------------------------------------------------------------------


via: http://www.tecmint.com/sudo-insult-when-enter-wrong-password/

作者：[Aaron Kili][a]
译者：[geekpi](https://github.com/geekpi)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/sudoers-configurations-for-setting-sudo-in-linux/
[2]:http://www.tecmint.com/su-vs-sudo-and-how-to-configure-sudo-in-linux/
[3]:http://www.tecmint.com/wp-content/uploads/2017/01/Set-sudo-Insults-Parameter.png
[4]:http://www.tecmint.com/wp-content/uploads/2017/01/How-sudo-Insult-Works.png
[5]:http://www.tecmint.com/wp-content/uploads/2017/01/Set-sudo-badpassword-Message.png
[6]:http://www.tecmint.com/wp-content/uploads/2017/01/sudo-badpassword-Message.png

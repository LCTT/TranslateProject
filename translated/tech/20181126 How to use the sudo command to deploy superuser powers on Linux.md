[#]: collector: (lujun9972)
[#]: translator: (stevenzdg988 )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: subject: (How to use the sudo command to deploy superuser powers on Linux)
[#]: via: (https://www.networkworld.com/article/3322504/linux/selectively-deploying-your-superpowers-on-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)
[#]: url: ( )

如何使用 sudo 命令在 Linux 上部署超级用户权限
======

![](https://images.idgesg.net/images/article/2018/11/superman-100781085-large.jpg)

当您偶尔需要以超级用户权限运行命令时， **sudo** 命令非常方便，但是当它没有完成您期望的所有操作时，有时会遇到问题。假设您要在某个日志文件的末尾添加一条重要消息，并尝试像这样做：

```
$ echo "Important note" >> /var/log/somelog
-bash: /var/log/somelog: Permission denied
```

好的，看起来您需要使用一些额外的权限。通常，您无法使用您的用户帐户写入系统日志文件。让我们用 **sudo** 再试一次吧。

```
$ sudo !!
sudo echo "Important note" >> /var/log/somelog
-bash: /var/log/somelog: Permission denied
```

嗯，也不能运行。我们再尝试一下。

```
$ sudo 'echo "Important note" >> /var/log/somelog'
sudo: echo "Important note" >> /var/log/somelog: command not found
```

**[ 另请参阅:[ Linux 疑难解答的提示和技巧][1] ]**

### 当前运行了什么?

对上面显示的第一个命令的响应表明您缺少写入日志文件所需的权限。在第二种情况下，您只是尝试使用root权限运行前面输入的命令，但这导致了 ** Permission denied ** 错误。在第三种情况中，您尝试通过将整个命令放在引号中并重新运行命令， 却出现 **command not found** 错误。那么，出了什么问题？

  * 第一个命令：如果没有 root 权限，则无法写入该日志。
  * 第二个命令：超级用户权限没有赋予重定向。
  * 第三个命令：Sudo 无法识别你作为“命令”放入引号的所有内容。

如果你在没有 sudo 访问权限的情况下尝试使用 sudo，你会看到如下错误：

```
nemo is not in the sudoers file. This incident will be reported.
```

### 你能做什么?

一个相当简单的选项是使用 sudo 命令简单地成为 root 用户。鉴于您拥有 sudo 权限，您可以使用以下命令执行此操作：

```
$ sudo su
[sudo] password for nemo:
#
```

请注意，提示已更改以显示出您的新权限。然后，您可以以 root 用户身份运行原始命令：

```
# echo "Important note" >> /var/log/somelog
```

接着你可以输入 ** ^d ** 并原始用户。当然，一些 sudo 配置可能会阻止你使用 sudo 成为 root 用户。

另外一个选项是仅使用 ** su ** 命令将用户切换到 root 用户，但这需要知道 root 用户密码。许多人将被授予访问sudo而无需提供 root 用户密码，因此这并不总是有效。

如果您将用户切换到 root 用户，则可以以 root 用户身份运行命令。这种方法存在的问题是：1）每个行使 root 权限的人都必须知道 root 密码（不是很安全）; 2）如果你在你之后未能退出特权状态，将会受到重大错误的影响。运行需要root权限的特定命令。sudo命令旨在允许您仅在真正需要时使用root权限，并控制每个sudo用户应具有的root权限。它还可以轻松恢复为您在正常用户状态下工作。

另请注意，整个讨论的前提是您可以访问 sudo，并且您的访问权限不是狭义定义的。稍后详细介绍。

另一种选项是使用不同的命令。如果通过编辑添加到文件是一个选项，您可以使用诸如 “sudo vi /var/log/somelog” 之类的命令，尽管编辑活动日志文件通常不是一个好主意，因为系统可能会频繁需要读写此文件。

最后一个选项便是更复杂的使用以下命令之一来解决我们之前遇到的问题，但它们涉及更复杂的语法。当遇到 “ Permission denied ”拒绝后，第一个命令允许您使用重复命令 !! ：

```
$ sudo echo "Important note" >> /var/log/somelog
-bash: /var/log/somelog: Permission denied
$ !!:gs/>/|sudo tee -a / <=====
$ tail -1 /var/log/somelog
Important note
```

第二个允许您通过使用 sudo 命令将消息传递给 **tee** 来添加消息。请注意，**-a ** 选项指定文本应附加到文件：

```
$ echo "Important note" | sudo tee -a /var/log/somelog
$ tail -1 /var/log/somelog
Important note
```

### sudo 有多可控?

这个问题的快速解决取决于管理它的人。大多数Linux系统默认设置非常简单。如果将用户分配给特定组，可能称为 **wheel** 或 **admin**，则该用户将能够以 root 身份运行任何命令，而无需知道 root 密码。这是大多数 Linux 系统上的默认设置。将一个用户添加到特权组文件 **/etc/group** 中后，该用户便可以使用 root 权限运行任何命令。另一方面，可以进行配置sudo，以便某些用户只能以 root 身份运行单个命令或任何一组命令中的任何命令。

例如，如果将以下所示的行添加到 **/etc/sudoers** 文件中，则允许用户 “nemo” 以 root 权限运行 **whoami** 命令。虽然这在现实世界中可能没有任何意义，但它作为一个例子非常有效。

```
# User alias specification
nemo ALL=(root) NOPASSWD: WHOAMI

# Cmnd alias specification
Cmnd_Alias WHOAMI = /usr/bin/whoami
```

请注意，我们添加了一个命令的别名（Cmnd_Alias），它指定了可以运行的命令 - 带有其完整路径 - 以及一个用户别名，允许该用户使用 sudo 甚至无需输入密码运行该单个命令。

当 nemo 用户运行命令 **sudo whoami** 时，便会看到：

```
$ sudo whoami
root
```

请注意，由于 nemo 使用 sudo 运行命令，因此对命令 **whoami** 的响应显示当前命令运行时的用户是 **root** 用户。

对于其他命令，nemo 会得到如下显示内容：

```
$ sudo date
[sudo] password for nemo:
Sorry, user nemo is not allowed to execute '/bin/date' as root on butterfly.
```

### sudo的默认配置

在默认方法中，向 **/etc/sudoers** 文件中添加一定的内容，我们将得到一定的便利，如下所示：

```
$ sudo egrep "admin|sudo" /etc/sudoers
# Members of the admin group may gain root privileges
%admin ALL=(ALL) ALL        <=====
# Allow members of group sudo to execute any command
%sudo ALL=(ALL:ALL) ALL <=====
```

在这些行中，**％admin** 和 **％sudo** 都能提交允许添加到其中一个以 root 用户身份运行任何命令的组的任何用户使用 sudo 命令。

**/etc/group** 文件中的其中一行如下所示，使其单独列出该组的成员，从而为他们提供 sudo 权限，而无需在 **/etc/sudoers** 文件中进行任何更改。

```
sudo:x:27:shs,nemo
```

### 结语

sudo 命令旨在允许您根据需要轻松部署超级用户访问权限，同时也能为用户提供非常有限的特权访问权限。您可能在执行命令时遇到需要与简单的 “sudo” 命令不同的方法的问题，并且从 **sudo** 获得的响应，并且指出您遇到的这个问题。

加入 [Facebook][2] 和 [LinkedIn][3] 上的 Network World 社区，评论置顶的重要主题。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3322504/linux/selectively-deploying-your-superpowers-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/stevenzdg988)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3242170/linux/invaluable-tips-and-tricks-for-troubleshooting-linux.html
[2]: https://www.facebook.com/NetworkWorld/
[3]: https://www.linkedin.com/company/network-world

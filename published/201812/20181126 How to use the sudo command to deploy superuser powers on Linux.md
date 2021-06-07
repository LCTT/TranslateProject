有所为，有所不为：在 Linux 中使用超级用户权限
======

> sudo 命令允许特权用户以 root 用户身份运行全部或部分命令，但是理解其能做什么和不能做什么很有帮助。

![](https://images.idgesg.net/images/article/2018/11/superman-100781085-large.jpg)

在你想要使用超级权限临时运行一条命令时，`sudo` 命令非常方便，但是当它不能如你期望的工作时，你也会遇到一些麻烦。比如说你想在某些日志文件结尾添加一些重要的信息，你可能会尝试这样做：  

```
$ echo "Important note" >> /var/log/somelog
-bash: /var/log/somelog: Permission denied
```

好吧，看起来你似乎需要一些额外的特权。一般来说，你不能使用你的用户账号向系统日志中写入东西。我们使用 `sudo` 再尝试一次吧。  

```
$ sudo !!
sudo echo "Important note" >> /var/log/somelog
-bash: /var/log/somelog: Permission denied
```

嗯，它还是没有啥反应。我们来试点不同的吧。  

```
$ sudo 'echo "Important note" >> /var/log/somelog'
sudo: echo "Important note" >> /var/log/somelog: command not found
```

也可以查看：[在 Linux 下排查故障的宝贵提示和技巧][1]。

### 接下来该干什么？

上面在执行完第一条命令后的回应显示，我们缺少向日志文件写入时必须的特权。第二次，我们使用 root 权限运行了第一次的命令，但是返回了一个“没有权限”的错误。第三次，我们把整个命令放在一个引号里面再运行了一遍，返回了一个“没有发现命令”的错误。所以，到底错在哪里了呢？   

* 第一条命令：没有 root 特权，你无法向这个日志中写入东西。
* 第二条命令：你的超级权限没有延伸到重定向。
* 第三条命令：`sudo` 不理解你用引号括起来的整个 “命令”。

而且如果你的用户还未添加到 sudo 用户组的时候，如果尝试使用 `sudo`，你可能已经看到过像下面的这么一条错误了：

```
nemo is not in the sudoers file. This incident will be reported.
```

### 你可以做什么？

一个相当简单的选择就是使用 `sudo` 命令暂时成为 root。鉴于你已经有了 sudo 特权，你可以使用下面的命令执行此操作：  

```
$ sudo su
[sudo] password for nemo:
#
```

注意这个改变的提示符表明了你的新身份。然后你就可以以 root 运行之前的命令了：  

```
# echo "Important note" >> /var/log/somelog
```

接着你可以输入 `^d` 返回你之前的身份。当然了，一些 sudo 的配置可能会阻止你使用 `sudo` 命令成为 root。

另一个切换用户为 root 的方法是仅用 `su` 命令，但是这需要你知道 root 密码。许多人被赋予了访问 sudo 的权限，而并不知道 root 密码，所以这并不是总是可行。

（采用 su 直接）切换到 root 之后，你就可以以 root 的身份运行任何你想执行的命令了。这种方式的问题是：1) 每个想要使用 root 特权的人都需要事先知道 root 的密码（这样不很安全）；2) 如果在运行需要 root 权限的特定命令后未能退出特权状态，你的系统可能会受到一些重大错误的波及。`sudo` 命令旨在允许您仅在真正需要时使用 root 权限，并控制每个 sudo 用户应具有的 root 权限。它也可以使你在使用完 root 特权之后轻松地回到普通用户的状态。

另外请注意，整个讨论的前提是你可以正常地访问 sudo，并且你的访问权限没有受限。详细的内容后面会介绍到。  

还有一个选择就是使用一个不同的命令。如果通过编辑文件从而在其后添加内容是一种选择的话，你也许可以使用 `sudo vi /var/log/somelog`，虽然编辑一个活跃的日志文件通常不是一个好主意，因为系统可能会频繁的向这个文件中进行写入操作。  

最后一个但是有点复杂的选择是，使用下列命令之一可以解决我们之前看到的问题，但是它们涉及到了很多复杂的语法。第一个命令允许你在得到 “没有权限” 的拒绝之后可以使用 `!!` 重复你的命令：  

```
$ sudo echo "Important note" >> /var/log/somelog
-bash: /var/log/somelog: Permission denied
$ !!:gs/>/|sudo tee -a /    <=====
$ tail -1 /var/log/somelog
Important note
```

第二种是通过 `sudo` 命令，把你想要添加的信息传递给 `tee`。注意，`-a` 指定了你要**附加**文本到目标文件： 

```
$ echo "Important note" | sudo tee -a /var/log/somelog
$ tail -1 /var/log/somelog
Important note
```

### sudo 有多可控？

回答这个问题最快速的回答就是，它取决于管理它的人。大多数 Linux 的默认设置都非常简单。如果一个用户被安排到了一个特别的组中，例如 `wheel` 或者 `admin` 组，那这个用户无需知道 root 的密码就可以拥有运行任何命令的能力。这就是大多数 Linux 系统中的默认设置。一旦在 `/etc/group` 中添加了一个用户到了特权组中，这个用户就可以以 root 的权力运行任何命令。另一方面，可以配置 sudo，以便一些用户只能够以 root 身份运行单一指令或者一组命令中的任何一个。  

如果把像下面展示的这些行添加到了 `/etc/sudoers` 文件中，例如 “nemo” 这个用户可以以 root 身份运行 `whoami` 命令。在现实中，这可能不会造成任何影响，它非常适合作为一个例子。  

```
# User alias specification
nemo ALL=(root) NOPASSWD: WHOAMI

# Cmnd alias specification
Cmnd_Alias WHOAMI = /usr/bin/whoami
```

注意，我们添加了一个命令别名（`Cmnd_Alias`），它指定了一个可以运行的命令的全路径，以及一个用户别名，允许这个用户无需密码就可以使用 `sudo` 执行的单个命令。  

当 nemo 运行 `sudo whoami` 命令的时候，他将会看到这个：  

```
$ sudo whoami
root
```

注意这个，因为 nemo 使用 `sudo` 执行了这条命令，`whoami` 会显示该命令运行时的用户是 `root`。

至于其他的命令，nemo 将会看到像这样的一些内容：  

```
$ sudo date
[sudo] password for nemo:
Sorry, user nemo is not allowed to execute '/bin/date' as root on butterfly.
```

### sudo 的默认设置

在默认路径中，我们会利用像下面展示的 `/etc/sudoers` 文件中的几行：  

```
$ sudo egrep "admin|sudo" /etc/sudoers
# Members of the admin group may gain root privileges
%admin ALL=(ALL) ALL        <=====
# Allow members of group sudo to execute any command
%sudo ALL=(ALL:ALL) ALL     <=====
```

在这几行中，`%admin` 和 `%sudo` 都说明了任何添加到这些组中的人都可以使用 `sudo` 命令以 root 的身份运行任何命令。  

下面列出的是 `/etc/group` 中的一行，它意味着每一个在该组中列出的成员，都拥有了 sudo 特权，而无需在 `/etc/sudoers` 中进行任何修改。  

```
sudo:x:27:shs,nemo
```

### 总结

`sudo` 命令意味着你可以根据需要轻松地部署超级用户的访问权限，而且只有在需要的时候才能赋予用户非常有限的特权访问权限。你可能会遇到一些与简单的 `sudo command` 不同的问题，不过在 `sudo` 的回应中应该会显示你遇到了什么问题。  


--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3322504/linux/selectively-deploying-your-superpowers-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[dianbanjiu](https://github.com/dianbanjiu)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3242170/linux/invaluable-tips-and-tricks-for-troubleshooting-linux.html
[2]: https://www.facebook.com/NetworkWorld/
[3]: https://www.linkedin.com/company/network-world

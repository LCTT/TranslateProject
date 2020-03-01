[#]: collector: (lujun9972)
[#]: translator: (laingke)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11830-1.html)
[#]: subject: (Setting up passwordless Linux logins using public/private keys)
[#]: via: (https://www.networkworld.com/article/3514607/setting-up-passwordless-linux-logins-using-publicprivate-keys.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

使用公钥/私钥对设定免密的 Linux 登录方式
======

> 使用一组公钥/私钥对让你不需要密码登录到远程 Linux 系统或使用 ssh 运行命令，这会非常方便，但是设置过程有点复杂。下面是帮助你的方法和脚本。

![](https://img.linux.net.cn/data/attachment/album/202001/29/141343ldps4muy4kp64k4l.jpg)

在 [Linux][1] 系统上设置一个允许你无需密码即可远程登录或运行命令的帐户并不难，但是要使它正常工作，你还需要掌握一些繁琐的细节。在本文，我们将完成整个过程，然后给出一个可以帮助处理琐碎细节的脚本。

设置好之后，如果希望在脚本中运行 `ssh` 命令，尤其是希望配置自动运行的命令，那么免密访问特别有用。

需要注意的是，你不需要在两个系统上使用相同的用户帐户。实际上，你可以把公用密钥用于系统上的多个帐户或多个系统上的不同帐户。

设置方法如下。

### 在哪个系统上启动？

首先，你需要从要发出命令的系统上着手。那就是你用来创建 `ssh` 密钥的系统。你还需要可以访问远程系统上的帐户并在其上运行这些命令。

为了使角色清晰明了，我们将场景中的第一个系统称为 “boss”，因为它将发出要在另一个系统上运行的命令。

因此，命令提示符如下：

```
boss$
```

如果你还没有在 boss 系统上为你的帐户设置公钥/私钥对，请使用如下所示的命令创建一个密钥对。注意，你可以在各种加密算法之间进行选择。（一般使用 RSA 或 DSA。）注意，要在不输入密码的情况下访问系统，你需要在下面的对话框中的两个提示符出不输入密码。

如果你已经有一个与此帐户关联的公钥/私钥对，请跳过此步骤。

```
boss$ ssh-keygen -t rsa
Generating public/private rsa key pair.
Enter file in which to save the key (/home/myself/.ssh/id_rsa):
Enter passphrase (empty for no passphrase):            <== 按下回车键即可
Enter same passphrase again:                           <== 按下回车键即可
Your identification has been saved in /home/myself/.ssh/id_rsa.
Your public key has been saved in /home/myself/.ssh/id_rsa.pub.
The key fingerprint is:
SHA256:1zz6pZcMjA1av8iyojqo6NVYgTl1+cc+N43kIwGKOUI myself@boss
The key's randomart image is:
+---[RSA 3072]----+
|     . ..        |
|   E+ .. .       |
|  .+ .o + o      |
|   ..+.. .o* .   |
|    ... So+*B o  |
|    +   ...==B . |
| . o .   ....++. |
|o o   . . o..o+  |
|=..o.. ..o  o.   |
+----[SHA256]-----+
```

上面显示的命令将创建公钥和私钥。其中公钥用于加密，私钥用于解密。因此，这些密钥之间的关系是关键的，私有密钥**绝不**应该被共享。相反，它应该保存在 boss 系统的 `.ssh` 文件夹中。

注意，在创建时，你的公钥和私钥将会保存在 `.ssh` 文件夹中。

下一步是将**公钥**复制到你希望从 boss 系统免密访问的系统。你可以使用 `scp` 命令来完成此操作，但此时你仍然需要输入密码。在本例中，该系统称为 “target”。

```
boss$ scp .ssh/id_rsa.pub myacct@target:/home/myaccount
myacct@target's password:
```

你需要安装公钥在 target 系统（将运行命令的系统）上。如果你没有 `.ssh` 目录（例如，你从未在该系统上使用过 `ssh`），运行这样的命令将为你设置一个目录：

```
target$ ssh localhost date
target$ ls -la .ssh
total 12
drwx------ 2 myacct myacct 4096 Jan 19 11:48 .
drwxr-xr-x 6 myacct myacct 4096 Jan 19 11:49 ..
-rw-r--r-- 1 myacct myacct  222 Jan 19 11:48 known_hosts
```

仍然在目标系统上，你需要将从“boss”系统传输的公钥添加到 `.ssh/authorized_keys` 文件中。如果该文件已经存在，使用下面的命令将把它添加到文件的末尾；如果文件不存在，则创建该文件并添加密钥。

```
target$ cat id_rsa.pub >> .ssh/authorized_keys
```

下一步，你需要确保你的 `authorized_keys` 文件权限为 600。如果还不是，执行命令 `chmod 600 .ssh/authorized_keys`。

```
target$ ls -l authorized_keys
-rw------- 1 myself myself 569 Jan 19 12:10 authorized_keys
```

还要检查目标系统上 `.ssh` 目录的权限是否设置为 700。如果需要，执行 `chmod 700 .ssh` 命令修改权限。

```
target$ ls -ld .ssh
drwx------ 2 myacct myacct 4096 Jan 14 15:54 .ssh
```

此时，你应该能够从 boss 系统远程免密运行命令到目标系统。除非目标系统上的目标用户帐户拥有与你试图连接的用户和主机相同的旧公钥，否则这应该可以工作。如果是这样，你应该删除早期的（并冲突的）条目。

### 使用脚本

使用脚本可以使某些工作变得更加容易。但是，在下面的示例脚本中，你会遇到的一个烦人的问题是，在配置免密访问权限之前，你必须多次输入目标用户的密码。一种选择是将脚本分为两部分——需要在 boss 系统上运行的命令和需要在 target 系统上运行的命令。

这是“一步到位”版本的脚本：

```
#!/bin/bash
# NOTE: This script requires that you have the password for the remote acct
#       in order to set up password-free access using your public key

LOC=`hostname`  # the local system from which you want to run commands from
                # wo a password

# get target system and account
echo -n "target system> "
read REM
echo -n "target user> "
read user

# create a key pair if no public key exists
if [ ! -f ~/.ssh/id_rsa.pub ]; then
  ssh-keygen -t rsa
fi

# ensure a .ssh directory exists in the remote account
echo checking for .ssh directory on remote system
ssh $user@$REM "if [ ! -d /home/$user/.ssh ]; then mkdir /home/$user/.ssh; fi"

# share the public key (using local hostname)
echo copying the public key
scp ~/.ssh/id_rsa.pub $user@$REM:/home/$user/$user-$LOC.pub

# put the public key into the proper location
echo adding key to authorized_keys
ssh $user@$REM "cat /home/$user/$user-$LOC.pub >> /home/$user/.ssh/authorized_ke
ys"

# set permissions on authorized_keys and .ssh (might be OK already)
echo setting permissions
ssh $user@$REM "chmod 600 ~/.ssh/authorized_keys"
ssh $user@$REM "chmod 700 ~/.ssh"

# try it out -- should NOT ask for a password
echo testing -- if no password is requested, you are all set
ssh $user@$REM /bin/hostname
```

脚本已经配置为在你每次必须输入密码时告诉你它正在做什么。交互看起来是这样的:

```
$ ./rem_login_setup
target system> fruitfly
target user> lola
checking for .ssh directory on remote system
lola@fruitfly's password:
copying the public key
lola@fruitfly's password:
id_rsa.pub                                    100%  567   219.1KB/s   00:00
adding key to authorized_keys
lola@fruitfly's password:
setting permissions
lola@fruitfly's password:
testing -- if no password is requested, you are all set
fruitfly
```

在上面的场景之后，你就可以像这样登录到 lola 的帐户：

```
$ ssh lola@fruitfly
[lola@fruitfly ~]$
```

一旦设置了免密登录，你就可以不需要键入密码从 boss 系统登录到 target 系统，并且运行任意的 `ssh` 命令。以这种免密的方式运行并不意味着你的帐户不安全。然而，根据 target 系统的性质，保护你在 boss 系统上的密码可能变得更加重要。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3514607/setting-up-passwordless-linux-logins-using-publicprivate-keys.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[laingke](https://github.com/laingke)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3215226/what-is-linux-uses-featres-products-operating-systems.html
[2]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE21620&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[3]: https://www.networkworld.com/article/3143050/linux/linux-hardening-a-15-step-checklist-for-a-secure-linux-server.html#tk.nww-fsb
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world

[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10514-1.html)
[#]: subject: (How to Update/Change Users Password in Linux Using Different Ways)
[#]: via: (https://www.2daygeek.com/linux-passwd-chpasswd-command-set-update-change-users-password-in-linux-using-shell-script/)
[#]: author: (Vinoth Kumar https://www.2daygeek.com/author/vinoth/)

如何使用不同的方式更改 Linux 用户密码
======

在 Linux 中创建用户账号时，设置用户密码是一件基本的事情。每个人都使用 `passwd` 命令跟上用户名，比如 `passwd USERNAME` 来为用户设置密码。

确保你一定要设置一个难以猜测的密码，这可以帮助你使系统更安全。我的意思是，密码应该是字母、符号和数字的组合。此外，出于安全原因，我建议你至少每月更改一次密码。

当你使用 `passwd` 命令时，它会要求你输入两次密码来设置。这是一种设置用户密码的原生方法。

如果你不想两次更新密码，并希望以不同的方式进行更新，怎么办呢？当然，这可以的，有可能做到。

如果你是 Linux 管理员，你可能已经多次问过下面的问题。你可能、也可能没有得到这些问题的答案。

无论如何，不要担心，我们会回答你所有的问题。

  * 如何用一条命令更改用户密码？
  * 如何在 Linux 中为多个用户更改为相同的密码？
  * 如何在 Linux 中更改多个用户的密码？
  * 如何在 Linux 中为多个用户更改为不同的密码？
  * 如何在多个 Linux 服务器中更改用户的密码？
  * 如何在多个 Linux 服务器中更改多个用户的密码？

### 方法-1：使用 passwd 命令

`passwd` 命令是在 Linux 中为用户设置、更改密码的标准方法。以下是标准方法。

```
# passwd renu
Changing password for user renu.
New password:
BAD PASSWORD: The password contains the user name in some form
Retype new password:
passwd: all authentication tokens updated successfully.
```

如果希望在一条命令中设置或更改密码，运行以下命令。它允许用户在一条命令中更新密码。

```
# echo "new_password" | passwd --stdin thanu
Changing password for user thanu.
passwd: all authentication tokens updated successfully.
```

### 方法-2：使用 chpasswd 命令

`chpasswd` 是另一个命令，允许我们为 Linux 中的用户设置、更改密码。如果希望在一条命令中使用 `chpasswd` 命令更改用户密码，用以下格式。

```
# echo "thanu:new_password" | chpasswd
```

### 方法-3：如何为多个用户设置不同的密码

如果你要为 Linux 中的多个用户设置、更改密码，并且使用不同的密码，使用以下脚本。

为此，首先我们需要使用以下命令获取用户列表。下面的命令将列出拥有 `/home` 目录的用户，并将输出重定向到 `user-list.txt` 文件。

```
# cat /etc/passwd | grep "/home" | cut -d":" -f1 > user-list.txt
```

使用 `cat` 命令列出用户。如果你不想重置特定用户的密码，那么从列表中移除该用户。

```
# cat user-list.txt
centos
magi
daygeek
thanu
renu
```

创建以下 shell 小脚本来实现此目的。

```
# vi password-update.sh

#!/bin/sh
for user in `more user-list.txt`
do
echo "[email protected]" | passwd --stdin "$user"
chage -d 0 $user
done
```

给 `password-update.sh` 文件设置可执行权限。

```
# chmod +x password-update.sh
```

最后运行脚本来实现这一目标。

```
# ./password-up.sh

magi
Changing password for user magi.
passwd: all authentication tokens updated successfully.
daygeek
Changing password for user daygeek.
passwd: all authentication tokens updated successfully.
thanu
Changing password for user thanu.
passwd: all authentication tokens updated successfully.
renu
Changing password for user renu.
passwd: all authentication tokens updated successfully.
```

### 方法-4：如何为多个用户设置相同的密码

如果要在 Linux 中为多个用户设置、更改相同的密码，使用以下脚本。

```
# vi password-update.sh

#!/bin/sh
for user in `more user-list.txt`
do
echo "new_password" | passwd --stdin "$user"
chage -d 0 $user
done
```

### 方法-5：如何在多个服务器中更改用户密码

如果希望更改多个服务器中的用户密码，使用以下脚本。在本例中，我们将更改 `renu` 用户的密码，确保你必须提供你希望更新密码的用户名而不是我们的用户名。

确保你必须将服务器列表保存在 `server-list.txt` 文件中，每个服务器应该在单独一行中。

```
# vi password-update.sh

#!/bin/bash
for server in `cat server-list.txt`
do
ssh [email protected]$server 'passwd --stdin renu <<EOF
new_passwd
new_passwd
EOF';
done
```

你将得到与我们类似的输出。

```
# ./password-update.sh

New password: BAD PASSWORD: it is based on a dictionary word
BAD PASSWORD: is too simple
Retype new password: Changing password for user renu.
passwd: all authentication tokens updated successfully.
New password: BAD PASSWORD: it is based on a dictionary word
BAD PASSWORD: is too simple
Retype new password: Changing password for user renu.
passwd: all authentication tokens updated successfully.
```

### 方法-6：如何使用 pssh 命令更改多个服务器中的用户密码

`pssh` 是一个在多个主机上并行执行 ssh 连接的程序。它提供了一些特性，例如向所有进程发送输入，向 ssh 传递密码，将输出保存到文件以及超时处理。导航到以下链接以了解关于 [PSSH 命令][1]的更多信息。

```
# pssh -i -h /tmp/server-list.txt "printf '%s\n' new_pass new_pass | passwd --stdin root"
```

你将获得与我们类似的输出。

```
[1] 07:58:07 [SUCCESS] CentOS.2daygeek.com
Changing password for user root.
passwd: all authentication tokens updated successfully.
Stderr: New password: BAD PASSWORD: it is based on a dictionary word
BAD PASSWORD: is too simple
Retype new password:
[2] 07:58:07 [SUCCESS] ArchLinux.2daygeek.com
Changing password for user root.
passwd: all authentication tokens updated successfully.
Stderr: New password: BAD PASSWORD: it is based on a dictionary word
BAD PASSWORD: is too simple
```

### 方法-7：如何使用 chpasswd 命令更改多个服务器中的用户密码

或者，我们可以使用 `chpasswd` 命令更新多个服务器中的用户密码。

```
# ./password-update.sh

#!/bin/bash
for server in `cat server-list.txt`
do
ssh [email protected]$server 'echo "magi:new_password" | chpasswd'
done
```

### 方法-8：如何使用 chpasswd 命令在 Linux 服务器中更改多个用户的密码

为此，首先创建一个文件，以下面的格式更新用户名和密码。在本例中，我创建了一个名为 `user-list.txt` 的文件。

参考下面的详细信息。

```
# cat user-list.txt
magi:new@123
daygeek:new@123
thanu:new@123
renu:new@123
```

创建下面的 shell 小脚本来实现这一点。

```
# vi password-update.sh

#!/bin/bash
for users in `cat user-list.txt`
do
echo $users | chpasswd
done
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-passwd-chpasswd-command-set-update-change-users-password-in-linux-using-shell-script/

作者：[Vinoth Kumar][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/vinoth/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/pssh-parallel-ssh-run-execute-commands-on-multiple-linux-servers/

[#]: collector: (lujun9972)
[#]: translator: (NeverKnowsTomorrow)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10768-1.html)
[#]: subject: (Four Methods To Add A User To Group In Linux)
[#]: via: (https://www.2daygeek.com/linux-add-user-to-group-primary-secondary-group-usermod-gpasswd/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

在 Linux 中把用户添加到组的四个方法
======

Linux 组是用于管理 Linux 中用户帐户的组织单位。对于 Linux 系统中的每一个用户和组，它都有惟一的数字标识号。它被称为 用户 ID（UID）和组 ID（GID）。组的主要目的是为组的成员定义一组特权。它们都可以执行特定的操作，但不能执行其他操作。

Linux 中有两种类型的默认组。每个用户应该只有一个 <ruby>主要组<rt>primary group</rt></ruby> 和任意数量的 <ruby>次要组<rt>secondary group</rt></ruby>。

* **主要组：** 创建用户帐户时，已将主要组添加到用户。它通常是用户的名称。在执行诸如创建新文件（或目录）、修改文件或执行命令等任何操作时，主要组将应用于用户。用户的主要组信息存储在 `/etc/passwd` 文件中。
* **次要组：** 它被称为次要组。它允许用户组在同一组成员文件中执行特定操作。例如，如果你希望允许少数用户运行 Apache（httpd）服务命令，那么它将非常适合。

你可能对以下与用户管理相关的文章感兴趣。

* [在 Linux 中创建用户帐户的三种方法？][1]
* [如何在 Linux 中创建批量用户？][2]
* [如何在 Linux 中使用不同的方法更新/更改用户密码？][3]

可以使用以下四种方法实现。

* `usermod`：修改系统帐户文件，以反映在命令行中指定的更改。
* `gpasswd`：用于管理 `/etc/group` 和 `/etc/gshadow`。每个组都可以有管理员、成员和密码。
* Shell 脚本：可以让管理员自动执行所需的任务。
* 手动方式：我们可以通过编辑 `/etc/group` 文件手动将用户添加到任何组中。

我假设你已经拥有此操作所需的组和用户。在本例中，我们将使用以下用户和组：`user1`、`user2`、`user3`，另外的组是 `mygroup` 和 `mygroup1`。

在进行更改之前，我希望检查一下用户和组信息。详见下文。

我可以看到下面的用户与他们自己的组关联，而不是与其他组关联。

```
# id user1
uid=1008(user1) gid=1008(user1) groups=1008(user1)

# id user2
uid=1009(user2) gid=1009(user2) groups=1009(user2)

# id user3
uid=1010(user3) gid=1010(user3) groups=1010(user3)
```

我可以看到这个组中没有关联的用户。

```
# getent group mygroup
mygroup:x:1012:

# getent group mygroup1
mygroup1:x:1013:
```

### 方法 1：使用 usermod 命令

`usermod` 命令修改系统帐户文件，以反映命令行上指定的更改。

#### 如何使用 usermod 命令将现有的用户添加到次要组或附加组？

要将现有用户添加到辅助组，请使用带有 `-G` 选项和组名称的 `usermod` 命令。

语法：

```
# usermod [-G] [GroupName] [UserName]
```

如果系统中不存在给定的用户或组，你将收到一条错误消息。如果没有得到任何错误，那么用户已经被添加到相应的组中。

```
# usermod -a -G mygroup user1
```

让我使用 `id` 命令查看输出。是的，添加成功。

```
# id user1
uid=1008(user1) gid=1008(user1) groups=1008(user1),1012(mygroup)
```

#### 如何使用 usermod 命令将现有的用户添加到多个次要组或附加组？

要将现有用户添加到多个次要组中，请使用带有 `-G` 选项的 `usermod` 命令和带有逗号分隔的组名称。

语法：

```
# usermod [-G] [GroupName1,GroupName2] [UserName]
```

在本例中，我们将把 `user2` 添加到 `mygroup` 和 `mygroup1` 中。

```
# usermod -a -G mygroup,mygroup1 user2
```

让我使用 `id` 命令查看输出。是的，`user2` 已成功添加到 `myGroup` 和 `myGroup1` 中。

```
# id user2
uid=1009(user2) gid=1009(user2) groups=1009(user2),1012(mygroup),1013(mygroup1)
```

#### 如何改变用户的主要组？

要更改用户的主要组，请使用带有 `-g` 选项和组名称的 `usermod` 命令。

语法：

```
# usermod [-g] [GroupName] [UserName]
```

我们必须使用 `-g` 改变用户的主要组。

```
# usermod -g mygroup user3
```

让我们看看输出。是的，已成功更改。现在，显示`user3` 主要组是 `mygroup` 而不是 `user3`。

```
# id user3
uid=1010(user3) gid=1012(mygroup) groups=1012(mygroup)
```

### 方法 2：使用 gpasswd 命令

`gpasswd` 命令用于管理 `/etc/group` 和 `/etc/gshadow`。每个组都可以有管理员、成员和密码。

#### 如何使用 gpasswd 命令将现有用户添加到次要组或者附加组？

要将现有用户添加到次要组，请使用带有 `-M` 选项和组名称的 `gpasswd` 命令。

语法：

```
# gpasswd [-M] [UserName] [GroupName]
```

在本例中，我们将把 `user1 ` 添加到 `mygroup` 中。

```
# gpasswd -M user1 mygroup
```

让我使用 `id` 命令查看输出。是的，`user1` 已成功添加到 `mygroup` 中。

```
# id  user1
uid=1008(user1) gid=1008(user1) groups=1008(user1),1012(mygroup)
```

#### 如何使用 gpasswd 命令添加多个用户到次要组或附加组中？

要将多个用户添加到辅助组中，请使用带有 `-M` 选项和组名称的 `gpasswd` 命令。

语法：

```
# gpasswd [-M] [UserName1,UserName2] [GroupName]
```

在本例中，我们将把 `user2` 和 `user3` 添加到 `mygroup1` 中。

```
# gpasswd -M user2,user3 mygroup1
```

让我使用 `getent` 命令查看输出。是的，`user2` 和 `user3` 已成功添加到 `myGroup1` 中。

```
# getent group mygroup1
mygroup1:x:1013:user2,user3
```

#### 如何使用 gpasswd 命令从组中删除一个用户？

要从组中删除用户，请使用带有 `-d` 选项的 `gpasswd` 命令以及用户和组的名称。

语法：

```
# gpasswd [-d] [UserName] [GroupName]
```

在本例中，我们将从 `mygroup` 中删除 `user1` 。

```
# gpasswd -d user1 mygroup
Removing user user1 from group mygroup
```

### 方法 3：使用 Shell 脚本

基于上面的例子，我知道 `usermod` 命令没有能力将多个用户添加到组中，可以通过 `gpasswd` 命令完成。但是，它将覆盖当前与组关联的现有用户。

例如，`user1` 已经与 `mygroup` 关联。如果要使用 `gpasswd` 命令将 `user2` 和 `user3` 添加到 `mygroup` 中，它将不会按预期生效，而是对组进行修改。

如果要将多个用户添加到多个组中，解决方案是什么？

两个命令中都没有默认选项来实现这一点。

因此，我们需要编写一个小的 shell 脚本来实现这一点。

#### 如何使用 gpasswd 命令将多个用户添加到次要组或附加组？

如果要使用 `gpasswd` 命令将多个用户添加到次要组或附加组，请创建以下 shell 脚本。

创建用户列表。每个用户应该在单独的行中。

```bash
$ cat user-lists.txt
user1
user2
user3
```

使用以下 shell 脚本将多个用户添加到单个次要组。

```bash
vi group-update.sh

#!/bin/bash
for user in `cat user-lists.txt`
do
usermod -a -G mygroup $user
done
```

设置 `group-update.sh` 文件的可执行权限。

```
# chmod + group-update.sh
```

最后运行脚本来实现它。

```
# sh group-update.sh
```

让我看看使用 `getent` 命令的输出。 是的，`user1`、`user2` 和 `user3` 已成功添加到 `mygroup` 中。

```
# getent group mygroup
mygroup:x:1012:user1,user2,user3
```

#### 如何使用 gpasswd 命令将多个用户添加到多个次要组或附加组？

如果要使用 `gpasswd` 命令将多个用户添加到多个次要组或附加组中，请创建以下 shell 脚本。

创建用户列表。每个用户应该在单独的行中。

```bash
$ cat user-lists.txt
user1
user2
user3
```

创建组列表。每组应在单独的行中。

```bash
$ cat group-lists.txt
mygroup
mygroup1
```

使用以下 shell 脚本将多个用户添加到多个次要组。

```bash
#!/bin/sh
for user in `more user-lists.txt`
do
for group in `more group-lists.txt`
do
usermod -a -G $group $user
done
```

设置 `group-update-1.sh` 文件的可执行权限。

```
# chmod +x group-update-1.sh
```

最后运行脚本来实现它。

```
# sh group-update-1.sh
```

让我看看使用 `getent` 命令的输出。 是的，`user1`、`user2` 和 `user3` 已成功添加到 `mygroup` 中。

```
# getent group mygroup
mygroup:x:1012:user1,user2,user3
```

此外，`user1`、`user2` 和 `user3` 已成功添加到 `mygroup1` 中。

```
# getent group mygroup1
mygroup1:x:1013:user1,user2,user3
```

### 方法 4：在 Linux 中将用户添加到组中的手动方法

我们可以通过编辑 `/etc/group` 文件手动将用户添加到任何组中。

打开 `/etc/group` 文件并搜索要更新用户的组名。最后将用户更新到相应的组中。

```
# vi /etc/group
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-add-user-to-group-primary-secondary-group-usermod-gpasswd/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[NeverKnowsTomorrow](https://github.com/NeverKnowsTomorrow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux 中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/linux-user-account-creation-useradd-adduser-newusers/
[2]: https://www.2daygeek.com/how-to-create-the-bulk-users-in-linux/
[3]: https://www.2daygeek.com/linux-passwd-chpasswd-command-set-update-change-users-password-in-linux-using-shell-script/

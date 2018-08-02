如何强制用户在下次登录 Linux 时更改密码
======

当你使用默认密码创建用户时，你必须强制用户在下一次登录时更改密码。

当你在一个组织中工作时，此选项是强制性的。因为老员工可能知道默认密码，他们可能会也可能不会尝试不当行为。

这是安全投诉之一，所以，确保你必须以正确的方式处理此事而无任何失误。即使是你的团队成员也要一样做。

大多数用户都很懒，除非你强迫他们更改密码，否则他们不会这样做。所以要做这个实践。

出于安全原因，你需要经常更改密码，或者至少每个月更换一次。

确保你使用的是难以猜测的密码（大小写字母，数字和特殊字符的组合）。它至少应该为 10-15 个字符。

我们运行了一个 shell 脚本来在 Linux 服务器中创建一个用户账户，它会自动为用户附加一个密码，密码是实际用户名和少量数字的组合。

我们可以通过使用以下两种方法来实现这一点：

  * passwd 命令
  * chage 命令

**建议阅读：**

- [如何在 Linux 上检查用户所属的组][1]
- [如何在 Linux 上检查创建用户的日期][2]
- [如何在 Linux 中重置/更改用户密码][3]
- [如何使用 passwd 命令管理密码过期和老化][4]

### 方法 1：使用 passwd 命令

`passwd` 的意思是“密码”。它用于更新用户的身份验证令牌。`passwd` 命令/实用程序用于设置、修改或更改用户的密码。

普通的用户只能更改自己的账户，但超级用户可以更改任何账户的密码。

此外，我们还可以使用其他选项，允许用户执行其他活动，例如删除用户密码、锁定或解锁用户账户、设置用户账户的密码过期时间等。

在 Linux 中这可以通过调用 Linux-PAM 和 Libuser API 执行。

在 Linux 中创建用户时，用户详细信息将存储在 `/etc/passwd` 文件中。`passwd` 文件将每个用户的详细信息保存为带有七个字段的单行。

此外，在 Linux 系统中创建新用户时，将更新以下四个文件。

  * `/etc/passwd`： 用户详细信息将在此文件中更新。
  * `/etc/shadow`： 用户密码信息将在此文件中更新。
  * `/etc/group`： 新用户的组详细信息将在此文件中更新。
  * `/etc/gshadow`： 新用户的组密码信息将在此文件中更新。

#### 如何使用 passwd 命令执行此操作

我们可以使用 `passwd` 命令并添加 `-e` 选项来执行此操作。

为了测试这一点，让我们创建一个新用户账户，看看它是如何工作的。

```
# useradd -c "2g Admin - Magesh M" magesh && passwd magesh
Changing password for user magesh.
New password:
Retype new password:
passwd: all authentication tokens updated successfully.
```

使用户账户的密码失效，那么在下次登录尝试期间，用户将被迫更改密码。

```
# passwd -e magesh
Expiring password for user magesh.
passwd: Success
```

当我第一次尝试使用此用户登录系统时，它要求我设置一个新密码。

```
login as: magesh
[email protected]'s password:
You are required to change your password immediately (root enforced)
WARNING: Your password has expired.
You must change your password now and login again!
Changing password for user magesh.
Changing password for magesh.
(current) UNIX password:
New password:
Retype new password:
passwd: all authentication tokens updated successfully.
Connection to localhost closed.
```

### 方法 2：使用 chage 命令

`chage` 意即“改变时间”。它会更改用户密码过期信息。

`chage` 命令会改变上次密码更改日期之后需要修改密码的天数。系统使用此信息来确定用户何时必须更改他/她的密码。

它允许用户执行其他活动，例如设置帐户到期日期，到期后设置密码失效，显示帐户过期信息，设置密码更改前的最小和最大天数以及设置到期警告天数。

#### 如何使用 chage 命令执行此操作

让我们在 `chage` 命令的帮助下，通过添加 `-d` 选项执行此操作。

为了测试这一点，让我们创建一个新用户帐户，看看它是如何工作的。我们将创建一个名为 `thanu` 的用户帐户。

```
# useradd -c "2g Editor - Thanisha M" thanu && passwd thanu
Changing password for user thanu.
New password:
Retype new password:
passwd: all authentication tokens updated successfully.
```

要实现这一点，请使用 `chage` 命令将用户的上次密码更改日期设置为 0。

```
# chage -d 0 thanu

# chage -l thanu
Last password change : Jul 18, 2018
Password expires : never
Password inactive : never
Account expires : never
Minimum number of days between password change : 0
Maximum number of days between password change : 99999
Number of days of warning before password expires : 7
```

当我第一次尝试使用此用户登录系统时，它要求我设置一个新密码。

```
login as: thanu
[email protected]'s password:
You are required to change your password immediately (root enforced)
WARNING: Your password has expired.
You must change your password now and login again!
Changing password for user thanu.
Changing password for thanu.
(current) UNIX password:
New password:
Retype new password:
passwd: all authentication tokens updated successfully.
Connection to localhost closed.
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-force-user-to-change-password-on-next-login-in-linux/

作者：[Prakash Subramanian][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/prakash/
[1]:https://www.2daygeek.com/how-to-check-which-groups-a-user-belongs-to-on-linux/
[2]:https://www.2daygeek.com/how-to-check-user-created-date-on-linux/
[3]:https://www.2daygeek.com/passwd-command-examples/
[4]:https://www.2daygeek.com/passwd-command-examples-part-l/

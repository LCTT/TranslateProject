[#]: collector: (lujun9972)
[#]: translator: (liujing97)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10698-1.html)
[#]: subject: (How To Set Password Policies In Linux)
[#]: via: (https://www.ostechnix.com/how-to-set-password-policies-in-linux/)
[#]: author: (SK https://www.ostechnix.com/author/sk/)

如何设置 Linux 系统的密码策略
======

![](https://www.ostechnix.com/wp-content/uploads/2016/03/How-To-Set-Password-Policies-In-Linux-720x340.jpg)

虽然 Linux 的设计是安全的，但还是存在许多安全漏洞的风险，弱密码就是其中之一。作为系统管理员，你必须为用户提供一个强密码。因为大部分的系统漏洞就是由于弱密码而引发的。本教程描述了在基于 DEB 系统的 Linux，比如 Debian、Ubuntu、Linux Mint 等和基于 RPM 系统的 Linux，比如 RHEL、CentOS、Scientific Linux 等的系统下设置像**密码长度**、**密码复杂度**、**密码有效期**等密码策略。

### 在基于 DEB 的系统中设置密码长度

默认情况下，所有的 Linux 操作系统要求用户**密码长度最少 6 个字符**。我强烈建议不要低于这个限制。并且不要使用你的真实名称、父母、配偶、孩子的名字，或者你的生日作为密码。即便是一个黑客新手，也可以很快地破解这类密码。一个好的密码必须是至少 6 个字符，并且包含数字、大写字母和特殊符号。

通常地，在基于 DEB 的操作系统中，密码和身份认证相关的配置文件被存储在 `/etc/pam.d/` 目录中。

设置最小密码长度，编辑 `/etc/pam.d/common-password` 文件；

```
$ sudo nano /etc/pam.d/common-password
```

找到下面这行：

```
password [success=2 default=ignore] pam_unix.so obscure sha512
```

![][2]

在末尾添加额外的文字：`minlen=8`。在这里我设置的最小密码长度为 `8`。

```
password [success=2 default=ignore] pam_unix.so obscure sha512 minlen=8
```

![](https://www.ostechnix.com/wp-content/uploads/2016/03/sk@sk-_002-3-1.jpg)

保存并关闭该文件。这样一来，用户现在不能设置小于 8 个字符的密码。

### 在基于 RPM 的系统中设置密码长度

**在 RHEL、CentOS、Scientific Linux 7.x** 系统中， 以 root 身份执行下面的命令来设置密码长度。

```
# authconfig --passminlen=8 --update
```

查看最小密码长度，执行：

```
# grep "^minlen" /etc/security/pwquality.conf
```

**输出样例：**

```
minlen = 8
```

**在 RHEL、CentOS、Scientific Linux 6.x** 系统中，编辑 `/etc/pam.d/system-auth` 文件：

```
# nano /etc/pam.d/system-auth
```

找到下面这行并在该行末尾添加：

```
password requisite pam_cracklib.so try_first_pass retry=3 type= minlen=8
```

![](https://www.ostechnix.com/wp-content/uploads/2016/03/root@server_003-3.jpg)

如上设置中，最小密码长度是 `8` 个字符。

### 在基于 DEB 的系统中设置密码复杂度

此设置会强制要求密码中应该包含多少类型，比如大写字母、小写字母和其他字符。

首先，用下面命令安装密码质量检测库：

```
$ sudo apt-get install libpam-pwquality
```

之后，编辑 `/etc/pam.d/common-password` 文件：

```
$ sudo nano /etc/pam.d/common-password
```

为了设置密码中至少有一个**大写字母**，则在下面这行的末尾添加文字 `ucredit=-1`。

```
password requisite pam_pwquality.so retry=3 ucredit=-1
```

![](https://www.ostechnix.com/wp-content/uploads/2016/03/sk@sk-_001-7.jpg)

设置密码中至少有一个**小写字母**，如下所示。

```
password requisite pam_pwquality.so retry=3 dcredit=-1
```

设置密码中至少含有其他字符，如下所示。

```
password requisite pam_pwquality.so retry=3 ocredit=-1
```

正如你在上面样例中看到的一样，我们设置了密码中至少含有一个大写字母、一个小写字母和一个特殊字符。你可以设置被最大允许的任意数量的大写字母、小写字母和特殊字符。

你还可以设置密码中被允许的字符类的最大或最小数量。

下面的例子展示了设置一个新密码中被要求的字符类的最小数量：

```
password requisite pam_pwquality.so retry=3 minclass=2
```

### 在基于 RPM 的系统中设置密码复杂度

**在 RHEL 7.x / CentOS 7.x / Scientific Linux 7.x 中：**

设置密码中至少有一个小写字母，执行：

```
# authconfig --enablereqlower --update
```

查看该设置，执行：

```
# grep "^lcredit" /etc/security/pwquality.conf
```

**输出样例：**

```
lcredit = -1
```

类似地，使用以下命令去设置密码中至少有一个大写字母：

```
# authconfig --enablerequpper --update
```

查看该设置：

```
# grep "^ucredit" /etc/security/pwquality.conf
```

**输出样例：**

```
ucredit = -1
```

设置密码中至少有一个数字，执行：

```
# authconfig --enablereqdigit --update
```

查看该设置，执行：

```
# grep "^dcredit" /etc/security/pwquality.conf
```

**输出样例：**

```
dcredit = -1
```

设置密码中至少含有一个其他字符，执行：

```
# authconfig --enablereqother --update
```

查看该设置，执行：

```
# grep "^ocredit" /etc/security/pwquality.conf
```

**输出样例：**

```
ocredit = -1
```

在 **RHEL 6.x / CentOS 6.x / Scientific Linux 6.x systems** 中，以 root 身份编辑 `/etc/pam.d/system-auth` 文件：

```
# nano /etc/pam.d/system-auth
```

找到下面这行并且在该行末尾添加：

```
password requisite pam_cracklib.so try_first_pass retry=3 type= minlen=8 dcredit=-1 ucredit=-1 lcredit=-1 ocredit=-1
```

如上设置中，密码必须要至少包含 `8` 个字符。另外，密码必须至少包含一个大写字母、一个小写字母、一个数字和一个其他字符。

### 在基于 DEB 的系统中设置密码有效期

现在，我们将要设置下面的策略。

  1. 密码被使用的最长天数。
  2. 密码更改允许的最小间隔天数。
  3. 密码到期之前发出警告的天数。 

设置这些策略，编辑：

```
$ sudo nano /etc/login.defs
```

在你的每个需求后设置值。

```
PASS_MAX_DAYS 100
PASS_MIN_DAYS 0
PASS_WARN_AGE 7
```

![](https://www.ostechnix.com/wp-content/uploads/2016/03/sk@sk-_002-8.jpg)

正如你在上面样例中看到的一样，用户应该每 `100` 天修改一次密码，并且密码到期之前的 `7` 天开始出现警告信息。

请注意，这些设置将会在新创建的用户中有效。

为已存在的用户设置修改密码的最大间隔天数，你必须要运行下面的命令：

```
$ sudo chage -M <days> <username>
```

设置修改密码的最小间隔天数，执行：

```
$ sudo chage -m <days> <username>
```

设置密码到期之前的警告，执行：

```
$ sudo chage -W <days> <username>
```

显示已存在用户的密码，执行：

```
$ sudo chage -l sk
```

这里，**sk** 是我的用户名。

**输出样例：**

```
Last password change : Feb 24, 2017
Password expires : never
Password inactive : never
Account expires : never
Minimum number of days between password change : 0
Maximum number of days between password change : 99999
Number of days of warning before password expires : 7
```

正如你在上面看到的输出一样，该密码是无限期的。

修改已存在用户的密码有效期，

```
$ sudo chage -E 24/06/2018 -m 5 -M 90 -I 10 -W 10 sk
```

上面的命令将会设置用户 `sk` 的密码期限是 `24/06/2018`。并且修改密码的最小间隔时间为 `5` 天，最大间隔时间为 `90` 天。用户账号将会在 `10` 天后被自动锁定，而且在到期之前的 `10` 天前显示警告信息。

### 在基于 RPM 的系统中设置密码效期

这点和基于 DEB 的系统是相同的。

### 在基于 DEB 的系统中禁止使用近期使用过的密码

你可以限制用户去设置一个已经使用过的密码。通俗的讲，就是说用户不能再次使用相同的密码。

为设置这一点，编辑 `/etc/pam.d/common-password` 文件：

```
$ sudo nano /etc/pam.d/common-password
```

找到下面这行并且在末尾添加文字 `remember=5`：

```
password        [success=2 default=ignore]      pam_unix.so obscure use_authtok try_first_pass sha512 remember=5
```

上面的策略将会阻止用户去使用最近使用过的 5 个密码。

### 在基于 RPM 的系统中禁止使用近期使用过的密码

这点对于 RHEL 6.x 和 RHEL 7.x 和它们的衍生系统 CentOS、Scientific Linux 是相同的。 

以 root 身份编辑 `/etc/pam.d/system-auth` 文件，

```
# vi /etc/pam.d/system-auth
```

找到下面这行，并且在末尾添加文字 `remember=5`。

```
password     sufficient     pam_unix.so sha512 shadow nullok try_first_pass use_authtok remember=5
```

现在你了解了 Linux 中的密码策略，以及如何在基于 DEB 和 RPM 的系统中设置不同的密码策略。

就这样，我很快会在这里发表另外一天有趣而且有用的文章。在此之前请保持关注。如果您觉得本教程对你有帮助，请在您的社交，专业网络上分享并支持我们。

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-set-password-policies-in-linux/

作者：[SK][a]
选题：[lujun9972][b]
译者：[liujing97](https://github.com/liujing97)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]: http://www.ostechnix.com/wp-content/uploads/2016/03/sk@sk-_003-2-1.jpg

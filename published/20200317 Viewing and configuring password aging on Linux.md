[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12041-1.html)
[#]: subject: (Viewing and configuring password aging on Linux)
[#]: via: (https://www.networkworld.com/article/3532815/viewing-and-configuring-password-aging-on-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

在 Linux 上查看和配置密码时效
======

![](https://images.idgesg.net/images/article/2019/09/cso_nw_user_id_password_credentials_authentication_by_bluebay2014_gettyimages-924698706_2400x1600-100811223-large.jpg)

> 使用正确的设置，可以强制 Linux 用户定期更改密码。以下是查看密码时效以及如何更改其中设置的方法。

可以将 Linux 系统上的用户密码配置为永久或设置过期时间，以让人们必须定期重置它们。出于安全原因，通常认为定期更改密码是一种好习惯，但默认并未配置。

要查看和修改密码时效，你需要熟悉几个重要的命令：`chage` 命令及其 `-l` 选项，以及 `passwd` 命令及其 `-S` 选项。本文会介绍这些命令，还有其他一些 `chage` 命令选项来配置密码时效。

### 查看密码时效设置

确定某个特定帐户是否已设置密码时效的方法是使用如下 `chage` 命令。请注意，除了你自己的帐户以外，其他任何帐户都需要 root 权限。请注意下面的密码到期日期。

```
$ sudo chage -l dory
Last password change                                    : Mar 15, 2020
Password expires                                        : Jun 13, 2020    <==
Password inactive                                       : never
Account expires                                         : never
Minimum number of days between password change          : 10
Maximum number of days between password change          : 90
Number of days of warning before password expires       : 14
```

如果未应用密码时效，那么帐户信息将如下所示：

```
$ sudo chage -l nemo
Last password change                                    : Jan 14, 2019
Password expires                                        : never         <==
Password inactive                                       : never
Account expires                                         : Mar 26, 2706989
Minimum number of days between password change          : 0
Maximum number of days between password change          : 99999
Number of days of warning before password expires       : 7
```

你也可以使用 `passwd -S` 命令查看某些信息，但是你需要知道输出中的每个字段代表什么：

```
dory$ passwd -S
dory P 03/15/2020 10 90 14 -1
```

这里的七个字段代表：

* 1 – 用户名
* 2 - 帐户状态（`L` = 锁定，`NP` = 无密码，`P` = 可用密码）
* 3 – 上次密码更改的日期
* 4 – 可更改最低时效（如果没有这么多天，则不能更改密码）
* 5 – 最长时效（这些天后，密码必须更改）
* 6 – 密码过期前提前警告的天数
* 7 – 密码过期后锁定之前的天数（设为无效）

需要注意的一件事是，`chage` 命令不会显示帐户是否被锁定；它仅显示密码时效设置。另一方面，`passwd -S` 命令将告诉你密码被锁定的时间。在此例中，请注意帐户状态为 `L`：

```
$ sudo passwd -S dorothy
dorothy L 07/09/2019 0 99999 7 10
```

通过将 `/etc/shadow` 文件中通常包含密码的“哈希”字段变为 `!`，从而达成锁定的效果。

```
$ sudo grep dorothy /etc/shadow
dorothy:!:18086:0:99999:7:10::    <==
```

帐户被锁定的事实在 `chage` 输出中并不明显：

```
$ sudo chage -l dorothy
Last password change                                    : Jul 09, 2019
Password expires                                        : never
Password inactive                                       : never
Account expires                                         : never
Minimum number of days between password change          : 0
Maximum number of days between password change          : 99999
Number of days of warning before password expires       : 7
```

### 密码时效的一些选项

最常用的设置是最短和最长的天数。它们经常结合使用。例如，你可以配置一个密码，使其最长不能使用超过 90 天（最大），然后添加一个有效期为一周或 10 天（最小）的密码。这样可以确保用户不会在需要更改密码后马上改回以前的密码。

```
$ sudo chage -M 90 -m 10 shark
$ sudo chage -l shark
Last password change                                    : Mar 16, 2020
Password expires                                        : Jun 14, 2020
Password inactive                                       : never
Account expires                                         : never
Minimum number of days between password change          : 10    <==
Maximum number of days between password change          : 90    <==
Number of days of warning before password expires       : 7
```

你还可以使用 `-E` 选项为帐户设置特定的到期日期。

```
$ sudo chage -E 2020-11-11 tadpole
$ sudo chage -l tadpole
Last password change                                    : Oct 15, 2019
Password expires                                        : never
Password inactive                                       : never
Account expires                                         : Nov 11, 2020  <==
Minimum number of days between password change          : 0
Maximum number of days between password change          : 99999
Number of days of warning before password expires       : 7
```

密码时效可能是一个重要的选择，只要它不鼓励用户使用过于简单的密码或以不安全的方式写下来即可。有关控制密码字符（例如，大小写字母、数字等的组合）的更多信息，请参考这篇关于[密码复杂度][3]的文章。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3532815/viewing-and-configuring-password-aging-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/newsletters/signup.html
[2]: https://www.networkworld.com/blog/itaas-and-the-corporate-storage-technology/?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE22140&utm_content=sidebar (ITAAS and Corporate Storage Strategy)
[3]: https://www.networkworld.com/article/2726217/how-to-enforce-password-complexity-on-linux.html
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world

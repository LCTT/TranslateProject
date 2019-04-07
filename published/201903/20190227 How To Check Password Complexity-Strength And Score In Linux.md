[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10623-1.html)
[#]: subject: (How To Check Password Complexity/Strength And Score In Linux?)
[#]: via: (https://www.2daygeek.com/how-to-check-password-complexity-strength-and-score-in-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

如何在 Linux 中检查密码的复杂性/强度和评分？
======

我们都知道密码的重要性。最好的密码就是使用难以猜测密码。另外，我建议你为每个服务使用不同的密码，如电子邮件、ftp、ssh 等。最重要的是，我建议你们经常更改密码，以避免不必要的黑客攻击。

默认情况下，RHEL 和它的衍生版使用 cracklib 模块来检查密码强度。我们将教你如何使用 cracklib 模块检查密码强度。

如果你想检查你创建的密码评分，请使用 pwscore 包。

如果你想创建一个好密码，最起码它应该至少有 12-15 个字符长度。它应该按以下组合创建，如字母（小写和大写）、数字和特殊字符。Linux 中有许多程序可用于检查密码复杂性，我们今天将讨论有关 cracklib 模块和 pwscore 评分。

### 如何在 Linux 中安装 cracklib 模块？

cracklib 模块在大多数发行版仓库中都有，因此，请使用发行版官方软件包管理器来安装它。

对于 Fedora 系统，使用 [DNF 命令][1]来安装 cracklib。

```
$ sudo dnf install cracklib
```

对于 Debian/Ubuntu 系统，使用 [APT-GET 命令][2] 或 [APT 命令][3]来安装 libcrack2。

```
$ sudo apt install libcrack2
```

对于基于 Arch Linux 的系统，使用 [Pacman 命令][4]来安装 cracklib。

```
$ sudo pacman -S cracklib
```

对于 RHEL/CentOS 系统，使用 [YUM 命令][5]来安装 cracklib。

```
$ sudo yum install cracklib
```

对于 openSUSE Leap 系统，使用 [Zypper 命令][6]来安装 cracklib。

```
$ sudo zypper install cracklib
```

### 如何在 Linux 中使用 cracklib 模块检查密码复杂性？

我在本文中添加了一些示例来助你更好地了解此模块。

如果你提供了任何如人名或地名或常用字，那么你将看到一条消息“它存在于字典的单词中”。

```
$ echo "password" | cracklib-check
password: it is based on a dictionary word
```

Linux 中的默认密码长度为 7 个字符。如果你提供的密码少于 7 个字符，那么你将看到一条消息“它太短了”。

```
$ echo "123" | cracklib-check
123: it is WAY too short
```

当你提供像我们这样的好密码时，你会看到 “OK”。

```
$ echo "ME$2w!@fgty6723" | cracklib-check
ME!@fgty6723: OK
```

### 如何在 Linux 中安装 pwscore？

pwscore 包在大多数发行版仓库中都有，因此，请使用发行版官方软件包管理器来安装它。

对于 Fedora 系统，使用 [DNF 命令][1]来安装 libpwquality。

```
$ sudo dnf install libpwquality
```

对于 Debian/Ubuntu 系统，使用 [APT-GET 命令][2] 或 [APT 命令][3]来安装 libpwquality。

```
$ sudo apt install libpwquality
```

对于基于 Arch Linux 的系统，使用 [Pacman 命令][4]来安装 libpwquality。

```
$ sudo pacman -S libpwquality
```

对于 RHEL/CentOS 系统，使用 [YUM 命令][5]来安装 libpwquality。

```
$ sudo yum install libpwquality
```

对于 openSUSE Leap 系统，使用 [Zypper 命令][6]来安装 libpwquality。

```
$ sudo zypper install libpwquality
```

如果你提供了任何如人名或地名或常用字，那么你将看到一条消息“它存在于字典的单词中”。

```
$ echo "password" | pwscore
Password quality check failed:
 The password fails the dictionary check - it is based on a dictionary word
```

Linux 中的默认密码长度为 7 个字符。如果你提供的密码少于 7 个字符，那么你将看到一条消息“密码短于 8 个字符”。

```
$ echo "123" | pwscore
Password quality check failed:
 The password is shorter than 8 characters
```

当你像我们这样提供了一个好的密码时，你将会看到“密码评分”。

```
$ echo "ME!@fgty6723" | pwscore
90
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-check-password-complexity-strength-and-score-in-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[2]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[3]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[4]: https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[5]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[6]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/

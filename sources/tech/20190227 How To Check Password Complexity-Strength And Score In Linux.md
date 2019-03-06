[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Check Password Complexity/Strength And Score In Linux?)
[#]: via: (https://www.2daygeek.com/how-to-check-password-complexity-strength-and-score-in-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

How To Check Password Complexity/Strength And Score In Linux?
======

We all know the password importance. It’s a best practices to use hard and guess password.

Also, i advise you to use the different password for each services such as email, ftp, ssh, etc.,

In top of that i suggest you guys to change the password frequently to avoid an unnecessary hacking attempt.

By default RHEL and it’s clone uses `cracklib` module to check password strength.

We are going to teach you, how to check the password strength using cracklib module.

If you would like to check the password score which you have created then use the `pwscore` package.

If you would like to create a good password, basically it should have minimum 12-15 characters length.

It should be created in the following combinations like, Alphabets (Lower case & Upper case), Numbers and Special Characters.

There are many utilities are available in Linux to check a password complexity and we are going to discuss about `cracklib` module today.

### How To Install cracklib module In Linux?

The cracklib module is available in most of the distribution repository so, use the distribution official package manager to install it.

For **`Fedora`** system, use **[DNF Command][1]** to install cracklib.

```
$ sudo dnf install cracklib
```

For **`Debian/Ubuntu`** systems, use **[APT-GET Command][2]** or **[APT Command][3]** to install libcrack2.

```
$ sudo apt install libcrack2
```

For **`Arch Linux`** based systems, use **[Pacman Command][4]** to install cracklib.

```
$ sudo pacman -S cracklib
```

For **`RHEL/CentOS`** systems, use **[YUM Command][5]** to install cracklib.

```
$ sudo yum install cracklib
```

For **`openSUSE Leap`** system, use **[Zypper Command][6]** to install cracklib.

```
$ sudo zypper install cracklib
```

### How To Use The cracklib module In Linux To Check Password Complexity?

I have added few example in this article to make you understand better about this module.

If you are given any words like, person name or place name or common word then you will be getting an message “it is based on a dictionary word”.

```
$ echo "password" | cracklib-check
password: it is based on a dictionary word
```

The default password length in Linux is `Seven` characters. If you give any password less than seven characters then you will be getting an message “it is WAY too short”.

```
$ echo "123" | cracklib-check
123: it is WAY too short
```

You will be getting `OK` When you give good password like us.

```
$ echo "ME$2w!@fgty6723" | cracklib-check
ME!@fgty6723: OK
```

### How To Install pwscore In Linux?

The pwscore package is available in most of the distribution official repository so, use the distribution package manager to install it.

For **`Fedora`** system, use **[DNF Command][1]** to install libpwquality.

```
$ sudo dnf install libpwquality
```

For **`Debian/Ubuntu`** systems, use **[APT-GET Command][2]** or **[APT Command][3]** to install libpwquality.

```
$ sudo apt install libpwquality
```

For **`Arch Linux`** based systems, use **[Pacman Command][4]** to install libpwquality.

```
$ sudo pacman -S libpwquality
```

For **`RHEL/CentOS`** systems, use **[YUM Command][5]** to install libpwquality.

```
$ sudo yum install libpwquality
```

For **`openSUSE Leap`** system, use **[Zypper Command][6]** to install libpwquality.

```
$ sudo zypper install libpwquality
```

If you are given any words like, person name or place name or common word then you will be getting a message “it is based on a dictionary word”.

```
$ echo "password" | pwscore
Password quality check failed:
 The password fails the dictionary check - it is based on a dictionary word
```

The default password length in Linux is `Seven` characters. If you give any password less than seven characters then you will be getting an message “it is WAY too short”.

```
$ echo "123" | pwscore
Password quality check failed:
 The password is shorter than 8 characters
```

You will be getting `password score` When you give good password like us.

```
$ echo "ME!@fgty6723" | pwscore
90
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-check-password-complexity-strength-and-score-in-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[2]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[3]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[4]: https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[5]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[6]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/

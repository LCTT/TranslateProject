[#]: subject: "How To Reset Sudo Password In Ubuntu 22.04 / 20.04 LTS"
[#]: via: "https://ostechnix.com/how-to-reset-sudo-password-in-ubuntu-20-04-lts/"
[#]: author: "sk https://ostechnix.com/author/sk/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How To Reset Sudo Password In Ubuntu 22.04 / 20.04 LTS
======
Reset Forgotten Root Password In Ubuntu

This brief guide explains how to reset sudo password in Ubuntu 22.04 and 20.04 LTS desktop and server editions from rescue mode.

### Introduction

When **[installing Ubuntu][1]**, a new user will be created with sudo privileges to perform all sorts of administrative tasks.

If your Ubuntu system have multiple sudo users, you can easily reset the forgotten password of a sudo user or administrative user from another sudo user's account.

What If you have only one sudo user and you lost the password? No problem! It is very easy to recover forgotten sudo user password in Ubuntu from the **"rescue"** or **"single user"** mode.

This guide has been officially tested on Ubuntu 22.04 and 20.04 LTS editions, however the steps given below are same for other Ubuntu versions and derivatives.

### Reset Sudo Password In Ubuntu 22.04 / 20.04 LTS

First, boot your Ubuntu system into rescue mode to reset a sudo user's password as described in the link below.

> [How To Boot Into Rescue Mode Or Emergency Mode In Ubuntu 22.04 /  20.04 / 18.04][2]

After you entered into the rescue mode, mount the root (**/**) file system in read/write mode by running the following command:

```
# mount -n -o remount,rw /
```

Now, reset the sudo user's password using **"passwd"** command:

```
# passwd ostechnix
```

Here, **"ostechnix"** is the sudo user. Replace it with your own user name.

Enter the password twice:

```
New password:
Retype new password:
passwd: password updated successfully
```

![Reset Sudo Password In Ubuntu 22.04 / 20.04 LTS][3]

That's it. We have reset the sudo user password. If you have followed the **Method 1** to enter into rescue mode as described in the above link, press **“Ctrl+d”** to boot into normal mode. Alternatively, you can type any one of the following commands to boot into normal mode.

```
# systemctl default
```

Or,

```
# exit
```

If you want to reboot the system instead of booting into normal mode, enter:

```
# systemctl reboot
```

If you have followed the **Method 2** to enter into rescue mode as described in the above link, type:

```
# exit
```

You will go back to the recovery menu. Choose "**Resume normal boot**" and hit ENTER key.

![Boot Into Normal Mode In Ubuntu][4]

Again, choose OK and press ENTER to continue booting into normal mode:

![Exit Recovery Mode And Boot Into Normal Mode][5]

You can now use the new sudo password when running administrative commands.

##### What If I Forgot Both Username And Password?

If you forget the username, you can easily list the available users in your Linux system from the rescue mode using command:

```
# cat etc/passwd
```

Sample output from my Ubuntu 22.04 system:

```
[...]
ostechnix:x:1000:1000:Ostechnix,,,:/home/ostechnix:/bin/bash
[...]
```

Well, you now have the user name. Just follow the aforementioned steps to reset the user's password.

--------------------------------------------------------------------------------

via: https://ostechnix.com/how-to-reset-sudo-password-in-ubuntu-20-04-lts/

作者：[sk][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/sk/
[b]: https://github.com/lkxed
[1]: https://ostechnix.com/install-ubuntu-desktop/
[2]: https://ostechnix.com/how-to-boot-into-rescue-mode-or-emergency-mode-in-ubuntu-18-04/
[3]: https://ostechnix.com/wp-content/uploads/2022/05/Reset-Sudo-Password-In-Ubuntu.png
[4]: https://ostechnix.com/wp-content/uploads/2020/05/Boot-into-normal-mode-in-Ubuntu.png
[5]: https://ostechnix.com/wp-content/uploads/2020/05/Booting-into-normal-mode-from-rescue-mode-in-Ubuntu.png

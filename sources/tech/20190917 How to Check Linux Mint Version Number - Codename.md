[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Check Linux Mint Version Number & Codename)
[#]: via: (https://itsfoss.com/check-linux-mint-version/)
[#]: author: (Sergiu https://itsfoss.com/author/sergiu/)

How to Check Linux Mint Version Number & Codename
======

Linux Mint has a major release (like Mint 19) every two years and minor releases (like Mint 19.1, 19.2 etc) every six months or so. You can upgrade Linux Mint version on your own or it may get automatically update for the minor releases.

Between all these release, you may wonder which Linux Mint version you are using. Knowing the version number is also helpful in determining whether a particular software is available for your system or if your system has reached end of life.

There could be a number of reasons why you might require the Linux Mint version number and there are various ways you can obtain this information. Let me show you both graphical and command line ways to get the Mint release information.

  * [Check Linux Mint version using command line][1]
  * [Check Linux Mint version information using GUI][2]



### Ways to check Linux Mint version number using terminal

![][3]

I’ll go over several ways you can check your Linux Mint version number and codename using very simple commands. You can open up a **terminal** from the **Menu** or by pressing **CTRL+ALT+T** (default hotkey).

The **last two entries** in this list also output the **Ubuntu release** your current Linux Mint version is based on.

#### 1\. /etc/issue

Starting out with the simplest CLI method, you can print out the contents of **/etc/issue** to check your **Version Number** and **Codename**:

```
[email protected]:~$ cat /etc/issue
Linux Mint 19.2 Tina \n \l
```

#### 2\. hostnamectl

![hostnamectl][4]

This single command (**hostnamectl**) prints almost the same information as that found in **System Info**. You can see your **Operating System** (with **version number**), as well as your **kernel version**.3.

#### 3\. lsb_release

**lsb_release** is a very simple Linux utility to check basic information about your distribution:

```
[email protected]:~$ lsb_release -a
No LSB modules are available.
Distributor ID:    LinuxMint
Description:    Linux Mint 19.2 Tina
Release:    19.2
Codename:    tina
```

**Note:** *I used the **–***_**a**_ _tag to print all parameters, but you can also use **-s** for short form, **-d** for description etc. (check **man lsb_release** for all tags)._

#### 4\. /etc/linuxmint/info

![/etc/linuxmint/info][5]

This isn’t a command, but rather a file on any Linux Mint install. Simply use cat command to print it’s contents to your terminal and see your **Release Number** and **Codename**.

[][6]

Suggested read  Get Rid Of Two Google Chrome Icons From Dock In Elementary OS Freya [Quick Tip]

#### 5\. Use /etc/os-release to get Ubuntu codename as well

![/etc/os-release][7]

Linux Mint is based on Ubuntu. Each Linux Mint release is based on a different Ubuntu release. Knowing which Ubuntu version your Linux Mint release is based on is helpful in cases where you’ll have to use Ubuntu codename while adding a repository like when you need to [install the latest Virtual Box in Linux Mint][8].

**os-release** is yet another file similar to **info**, showing you the codename for the **Ubuntu** release your Linux Mint is based on.

#### 6\. Use /etc/upstream-release/lsb-release to get only Ubuntu base info

If you only ****want to see information about the **Ubuntu** base, output **/etc/upstream-release/lsb-release**:

```
[email protected]:~$ cat /etc/upstream-release/lsb-release
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=18.04
DISTRIB_CODENAME=bionic
DISTRIB_DESCRIPTION="Ubuntu 18.04 LTS"
```

Bonus Tip: [You can just check Linux kernel version][9] with the **uname** command:

```
[email protected]:~$ uname -r
4.15.0-54-generic
```

**Note:** _**-r** stands for **release**, however you can check the other flags with **man uname**._

### Check Linux Mint version information using GUI

If you are not comfortable with the terminal and commands, you can use the graphical method. As you would expect, this one is pretty straight-forward.

Open up the **Menu** (bottom-left corner) and then go to **Preferences &gt; System Info**:

![Linux Mint Menu][10]

Alternatively, in the Menu you can search for **System Info**:

![Menu Search System Info][11]

Here you can see both your operating system (including version number), your kernel and the version number of your DE:

![System Info][12]

**Wrapping Up**

I have covered some different ways you can quickly check the version and name (as well as the Ubuntu base and kernel) of the Linux Mint release you are running. I hope you found this beginner tutorial helpful. Let us know in the comments which one is your favorite method!

--------------------------------------------------------------------------------

via: https://itsfoss.com/check-linux-mint-version/

作者：[Sergiu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sergiu/
[b]: https://github.com/lujun9972
[1]: tmp.pL5Hg3N6Qt#terminal
[2]: tmp.pL5Hg3N6Qt#GUI
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/09/check-linux-mint-version.png?ssl=1
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/09/hostnamectl.jpg?ssl=1
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/09/linuxmint_info.jpg?ssl=1
[6]: https://itsfoss.com/rid-google-chrome-icons-dock-elementary-os-freya/
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/09/os_release.jpg?ssl=1
[8]: https://itsfoss.com/install-virtualbox-ubuntu/
[9]: https://itsfoss.com/find-which-kernel-version-is-running-in-ubuntu/
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/09/linux_mint_menu.jpg?ssl=1
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/09/menu_search_system_info.jpg?ssl=1
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/09/system_info.png?ssl=1

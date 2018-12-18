[#]: collector: (lujun9972)
[#]: translator: (LazyWolfLin)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Update Ubuntu [Terminal & GUI Methods] It's FOSS)
[#]: via: (https://itsfoss.com/update-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

如何更新 Ubuntu [终端及GUI方式] It's FOSS
======

**这篇教程将向你展示如何更新服务器版本或者桌面版本的Ubuntu。它还解释了更新和升级之间的区别以及你应该了解的有关于Ubuntu Linux中的更新的一些其他内容。**

如果你是一个新手并已经体验Ubuntu数天或几周，你可能想知道如何更新你的[Ubuntu][1]系统以获取安全补丁，错误修复和应用升级。

更新 Ubuntu 非常简单。我并不夸张的说。它简单得只要运行两个命令。让我来告诉你更多更新细节。

请注意，本教程适用于 Ubuntu 18.04，16.04 或任何其他版本。命令行方式也适用于基于 Ubuntu 的发行版如 Linux Mint，Linux Lite，elementary OS 等。

### 通过命令行更新 Ubuntu

![如何更新 Ubuntu][2]

在桌面上，打开终端。你可以在菜单里找到它或者使用 Ctrl+Alt+T [快捷键][3]。如果你登陆到一台 [Ubuntu 服务器][4]，那你已经在访问一个终端了。

在终端里，你只需要使用以下命令：

```
sudo apt update && sudo apt upgrade -y
```

它将询问密码，而你可以使用你账号的密码。输入时，你将不会看到任何内容在屏幕上，所以请继续输入你的密码并按回车键。

现在，我来解释下上面的命令。

事实上，这不是一条命令。它由两条命令组成。符号 `&&` 是合并两条命令的一个方法，第二条命令仅在前一条命令执行成功时执行。

当命令 `apt upgrade` 要求你在安装更新前确认时，末尾的参数 `-y` 会自动输入 yes。

请注意，你也可以逐条使用这两条命令：

```
sudo apt update
sudo apt upgrade
```

这将花费更长的时间，因为你必须等待第一条命令执行完成后才能输入第二条命令。

#### 说明：sudo apt update

This command updates the local database of available packages. If you won’t run this command, the local database won’t be updated and your system will not know if there are any new versions available.

This is why when you run the sudo apt update, you’ll see lots of URLs in the output. The command fetches the package information from the respective repositories (the URLs you see in the output).

![Updating Ubuntu Linux][5]

At the end of the command, it tells you how many packages can be upgraded. You can see these packages by running the following command:

```
apt list --upgradable
```

**Additional Reading:** Read this article to learn [what is Ign, Hit and Get in the apt update command output][6].

#### 说明：sudo apt upgrade

This command matches the versions of installed packages with the local database. It collects all of them and then it will list all of the packages that have a newer version available. At this point, it will ask if you want to upgrade (the installed packages to the newer version).

![Update Ubuntu Linux via Command Line][7]

You can type ‘yes’, ‘y’ or just press enter to confirm the installation of updates.

So the bottom line is that the sudo apt update checks for the availability of new versions while as the sudo apt upgrade actually performs the update.

The term update might be confusing as you might expect the apt update command to update the system by installing the updates but that doesn’t happen.

### 通过 GUI 更新 Ubuntu［适用于桌面用户］

If you are using Ubuntu as a desktop, you don’t have to go to terminal just for updating the system. You can still use the command line but it’s optional for you.

In the menu, look for ‘Software Updater’ and run it.

![Run Software Updater in Ubuntu][8]

It will check if there are updates available for your system.

![Checking if updates are available for Ubuntu][9]

If there are updates available, it will give provide you with options to install the updates.

![Install Updates via Update Manager in Ubuntu][10]

Click on Install Now, it may ask for your password.

![Installing Updates in Ubuntu Linux via GUI][11]

Once you enter your password, it will start installing the updates.

![Updating Ubuntu via GUI][12]

In some cases, you may need to reboot the system for the installed updates to work properly. You’ll be notified at the end of the update if you need to restart the system.

![Updating Ubuntu via GUI][12]

You can choose to restart later if you don’t want to reboot your system straightaway.

![Installing updates via GUI in Ubuntu][13]

Tip: If the software updater returns an error, you should use the command ‘sudo apt update’ in the terminal. The last few lines of the output will contain the actual error message. You can search on the internet for that error and fix the problem.

### 更新 Ubuntu 时要记住几件事

You just learned how to update your Ubuntu system. If you are interested, you should also know these few things around Ubuntu updates.

#### 更新后清理

Your system will have some unnecessary packages that won’t be required after the updates. You can remove such packages and [free up some space][14] using this command:

```
sudo apt autoremove
```

####  在 Ubuntu Server 中热修复内核以避免重启

In case of a Linux kernel updates, you’ll have to restart the system after the update. This is an issue when you don’t want downtime for your server.

[Live patching][15] feature allows the patching of Linux kernel while the kernel is still running. In other words, you don’t have to reboot your system.

If you manage servers, you may want to [enable live patching in Ubuntu][16].

#### 版本升级是不同的

The updates discussed here is to keep your Ubuntu install fresh and updated. It doesn’t cover the [version upgrades][17] (for example upgrading Ubuntu 16.04 to 18.04).

[Ubuntu version][18] upgrades are entirely a different thing. It updates the entire operating system core. You need to make proper backups before starting this lengthy process.

### 总结

I hope you liked this tutorial on updating the Ubuntu system and you learned a few new things.

If you have any questions, please fee free to ask. If you are an experienced Linux users and have some tip that can make this tutorial more useful, please share it with the rest of us.

--------------------------------------------------------------------------------

via: https://itsfoss.com/update-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.ubuntu.com/
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/12/how-to-update-ubuntu.png?resize=800%2C450&ssl=1
[3]: https://itsfoss.com/ubuntu-shortcuts/
[4]: https://www.ubuntu.com/download/server
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/12/update-ubunt-1.jpeg?resize=800%2C357&ssl=1
[6]: https://itsfoss.com/apt-get-linux-guide/
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2018/12/update-ubunt-2.jpeg?ssl=1
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/12/update-ubuntu-via-GUI-1.jpeg?resize=800%2C250&ssl=1
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2018/12/update-ubuntu-via-GUI-2.jpeg?resize=800%2C250&ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/12/update-ubuntu-GUI-3.jpeg?resize=800%2C365&ssl=1
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2018/12/install-update-ubuntu-1.jpg?resize=800%2C450&ssl=1
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/12/installing-updates-ubuntu.jpg?ssl=1
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2018/12/installing-updates-ubuntu-2.jpeg?ssl=1
[14]: https://itsfoss.com/free-up-space-ubuntu-linux/
[15]: https://www.ubuntu.com/livepatch
[16]: https://www.cyberciti.biz/faq/howto-live-patch-ubuntu-linux-server-kernel-without-rebooting/
[17]: https://itsfoss.com/upgrade-ubuntu-version/
[18]: https://itsfoss.com/how-to-know-ubuntu-unity-version/

[#]: subject: "What is Build Essential Package in Ubuntu? How to Install it?"
[#]: via: "https://itsfoss.com/build-essential-ubuntu/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

What is Build Essential Package in Ubuntu? How to Install it?
======

_**Brief: This is a quick tip to inform new Ubuntu users about the build-essential package, its usefulness and the installation steps.**_

Installing build-essential package in Ubuntu is as simple as typing this command in the terminal:

```
sudo apt update && sudo apt install build-essential
```

But there are several questions around it that you may want answers to:

  * What is build essential package?
  * What does it contain?
  * Why should you install it (if install at all)?
  * How to install it?
  * How to remove it?



### What is build-essential package in Ubuntu?

The build-essential package actually belongs to Debian. It is not a piece of software in itself. It contains a list of packages that are required to create a Debian package (deb). These packages are libc, gcc, g++, make, dpkg-dev etc. The build-essential package contains those required packages as dependencies, so when you install build-essential, you install all those packages in one single command.

Please do NOT consider build-essential to be a super package that will magically install all kind of development tools from Ruby to Go for you in a single command. It has some development tool but not all.

#### Why would you want to install build-essential package?

It is used for creating DEB packages from the source code of an application. An average user does not go around creating DEB packages everyday, right?

However, some users may use their Ubuntu Linux system for software development. You want to [run c program in Ubuntu][1], you need gcc compiler. You want to [run C++ programs in Ubuntu][2], you need g++ compiler. If you have to use an unusual software that is only available from the source code, your system will throw [make command not found error][3] because you need to install make tool first.

All this can be installed individually, of course. However, it is much easier to take advantage of the build-essential package and install all these development tools at once. That’s the benefit you get.

It is like the [ubuntu-restricted-extras package that allows you to install several media codecs][4] at once.

Now that you know the advantage of this package, let’s see how to install it.

### Installing build-essential package in Ubuntu Linux

![][5]

Open a terminal in Ubuntu by pressing the Ctrl+Alt+T shortcut and enter the following command:

```
sudo apt update
```

With sudo command, you’ll be asked to enter your account’s password. When you type it, nothing is displayed on the screen. That is fine. That’s how it works in most Linux systems. Type your password blindly and press enter.

![][6]

The apt update command refreshes the local package cache. This is essential for a fresh Ubuntu install.

After that, run the following command to install build-essential tool:

```
sudo apt install build-essential
```

It should show all the packages it is going to install. Press Y when asked for confirmation:

![][7]

Wait a bit for the installation to complete. That’s it.

### Removing build-essential tool from Ubuntu

Keeping those development tools won’t harm your system. but if you are running low on the disk space, you may consider removing it.

Removing software is easy in Ubuntu thanks to the apt remove command:

```
sudo apt remove build-essential
```

It will be a good idea to run the autoremove command to remove the residual dependency packages as well:

```
sudo apt autoremove
```

You know all the essential about build-essential package now (pun intended). Enjoy it :)

--------------------------------------------------------------------------------

via: https://itsfoss.com/build-essential-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/run-c-program-linux/
[2]: https://itsfoss.com/c-plus-plus-ubuntu/
[3]: https://itsfoss.com/make-command-not-found-ubuntu/
[4]: https://itsfoss.com/install-media-codecs-ubuntu/
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/Build-Essential-Ubuntu.png?resize=800%2C450&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/apt-update.png?resize=800%2C467&ssl=1
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/install-build-essential-ubuntu.png?resize=800%2C434&ssl=1

[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Install VirtualBox on Ubuntu [Beginner’s Tutorial])
[#]: via: (https://itsfoss.com/install-virtualbox-ubuntu)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

How to Install VirtualBox on Ubuntu [Beginner’s Tutorial]
======

**This beginner’s tutorial explains various ways to install VirtualBox on Ubuntu and other Debian-based Linux distributions.**

Oracle’s free and open source offering [VirtualBox][1] is an excellent virtualization tool, specially for desktop operating systems. I prefer using it over [VMWare Workstation in Linux][2], another virtualization tool.

You can use virtualization software like VirtualBox for installing and using another operating system within a virtual machine.

For example, you can [install Linux on VirtualBox inside Windows][3]. Similarly, you can also [install Windows inside Linux using VirtualBox][4].

You can also use VirtualBox for installing another Linux distribution in your current Linux system. Actually, this is what I use it for. If I hear about a nice Linux distribution, instead of installing it on a real system, I test it on a virtual machine. It’s more convenient when you just want to try out a distribution before making a decision about installing it on your actual machine.

![Linux installed inside Linux using VirtualBox][5]Ubuntu 18.10 installed inside Ubuntu 18.04

In this beginner’s tutorial, I’ll show you various ways of installing Oracle VirtualBox on Ubuntu and other Debian-based distributions.

### Installing VirtualBox on Ubuntu and Debian based Linux distributions

The installation methods mentioned here should also work for other Debian and Ubuntu-based Linux distributions such as Linux Mint, elementary OS etc.

#### Method 1: Install VirtualBox from Ubuntu Repository

**Pros** : Easy installation

**Cons** : Installs older version

The easiest way to install VirtualBox on Ubuntu would be to search for it in the Software Center and install it from there.

![VirtualBox in Ubuntu Software Center][6]VirtualBox is available in Ubuntu Software Center

You can also install it from the command line using the command:

```
sudo apt install virtualbox
```

However, if you [check the package version before installing it][7], you’ll see that the VirtualBox provided by Ubuntu’s repository is quite old.

For example, the current VirtualBox version at the time of writing this tutorial is 6.0 but the one in Software Center is 5.2. This means you won’t get the newer features introduced in the [latest version of VirtualBox][8].

#### Method 2: Install VirtualBox using Deb file from Oracle’s website

**Pros** : Easily install the latest version

**Cons** : Can’t upgrade to newer version

If you want to use the latest version of VirtualBox on Ubuntu, the easiest way would be to [use the deb file][9].

Oracle provides read to use binary files for VirtualBox releases. If you look at its download page, you’ll see the option to download the deb installer files for Ubuntu and other distributions.

![VirtualBox Linux Download][10]

You just have to download this deb file and double click on it to install it. It’s as simple as that.

However, the problem with this method is that you won’t get automatically updated to the newer VirtualBox releases. The only way is to remove the existing version, download the newer version and install it again. That’s not very convenient, is it?

#### Method 3: Install VirualBox using Oracle’s repository

**Pros** : Automatically updates with system updates

**Cons** : Slightly complicated installation

Now this is the command line method and it may seem complicated to you but it has advantages over the previous two methods. You’ll get the latest version of VirtualBox and it will be automatically updated to the future releases. That’s what you would want, I presume.

To install VirtualBox using command line, you add the Oracle VirtualBox’s repository in your list of repositories. You add its GPG key so that your system trusts this repository. Now when you install VirtualBox, it will be installed from Oracle’s repository instead of Ubuntu’s repository. If there is a new version released, VirtualBox install will be updated along with the system updates. Let’s see how to do that.

First, add the key for the repository. You can download and add the key using this single command.

```
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
```

```
Important for Mint users

The next step will work for Ubuntu only. If you are using Linux Mint or some other distribution based on Ubuntu, replace $(lsb_release -cs) in the command with the Ubuntu version your current version is based on. For example, Linux Mint 19 series users should use bionic and Mint 18 series users should use xenial. Something like this

sudo add-apt-repository “deb [arch=amd64] <http://download.virtualbox.org/virtualbox/debian> **bionic** contrib“
```

Now add the Oracle VirtualBox repository in the list of repositories using this command:

```
sudo add-apt-repository "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib"
```

If you have read my article on [checking Ubuntu version][11], you probably know that ‘lsb_release -cs’ will print the codename of your Ubuntu system.

**Note** : If you see [add-apt-repository command not found][12] error, you’ll have to install software-properties-common package.

Now that you have the correct repository added, refresh the list of available packages through these repositories and install VirtualBox.

```
sudo apt update && sudo apt install virtualbox-6.0
```

**Tip** : A good idea would be to type sudo apt install **virtualbox–** and hit tab to see the various VirtualBox versions available for installation and then select one of them by typing it completely.

![Install VirtualBox via terminal][13]

### How to remove VirtualBox from Ubuntu

Now that you have learned to install VirtualBox, I would also mention the steps to remove it.

If you installed it from the Software Center, the easiest way to remove the application is from the Software Center itself. You just have to find it in the [list of installed applications][14] and click the Remove button.

Another ways is to use the command line.

```
sudo apt remove virtualbox virtualbox-*
```

Note that this will not remove the virtual machines and the files associated with the operating systems you installed using VirtualBox. That’s not entirely a bad thing because you may want to keep them safe to use it later or in some other system.

**In the end…**

I hope you were able to pick one of the methods to install VirtualBox. I’ll also write about using it effectively in another article. For the moment, if you have and tips or suggestions or any questions, feel free to leave a comment below.


--------------------------------------------------------------------------------

via: https://itsfoss.com/install-virtualbox-ubuntu

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.virtualbox.org
[2]: https://itsfoss.com/install-vmware-player-ubuntu-1310/
[3]: https://itsfoss.com/install-linux-in-virtualbox/
[4]: https://itsfoss.com/install-windows-10-virtualbox-linux/
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/02/linux-inside-linux-virtualbox.png?resize=800%2C450&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/virtualbox-ubuntu-software-center.jpg?ssl=1
[7]: https://itsfoss.com/know-program-version-before-install-ubuntu/
[8]: https://itsfoss.com/oracle-virtualbox-release/
[9]: https://itsfoss.com/install-deb-files-ubuntu/
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/02/virtualbox-download.jpg?resize=800%2C433&ssl=1
[11]: https://itsfoss.com/how-to-know-ubuntu-unity-version/
[12]: https://itsfoss.com/add-apt-repository-command-not-found/
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/install-virtualbox-ubuntu-terminal.png?resize=800%2C165&ssl=1
[14]: https://itsfoss.com/list-installed-packages-ubuntu/

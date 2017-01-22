Install Latest ‘Thunderbird’ Email Client in Linux Systems
============================================================

Thunderbird is an open source free cross-platform web based email, news and chat client application that is designed to handle multiple email accounts and news feeds.

On December 28, 2016 Mozilla team announced the release of Thunderbird 45.6.0. This new version comes with these features and they are:

### Thunderbird 45.6.0 Features

1.  The system integration dialog was shown every time when starting Thunderbird
2.  Various bug fixes and improvements in performance.
3.  Various security fixes.

Check out more about what’s new features and known issues for Thunderbird 45.6.0 version at [Thunderbird Release Note][1].

This article will explain you how to install Thunderbird email client on Linux distributions such as Fedora, Ubuntu and its derivatives.

In many Linux distributions Thunderbird package included by default, and can be installed using the default package management system, because it will:

1.  Ensure that you have all the needed libraries
2.  Adds a Desktop shortcut to launch Thunderbird
3.  Make Thunderbird accessible to all system users on your computer
4.  It may not offer you the latest version of Thunderbird

### Install Thunderbird Email Client in Linux

To install Thunderbird from the default system repositories issue:

```
$ sudo apt-get install thunderbird   [On Ubuntu based systems]
$ dnf install thunderbird            [On Fedora based systems]
```

As I said, installing from default repositories will give you older version of Thunderbird. If you want to install most recent version of Mozilla Thunderbird, you can use the PPA maintained by the Mozilla team.

Use CTRL + ALT + T from the desktop to open terminal and add the Thunderbird repository under Ubuntu and its derivatives.

```
$ sudo add-apt-repository ppa:ubuntu-mozilla-security/ppa
```

Next, update the system software packages using update command.

```
$ sudo apt-get update
```

Once you’ve updated the system, install it using the following command.

```
$ sudo apt-get install thunderbird
```

### Thunderbird Preview

[
 ![Install Thunderbird in Linux](http://www.tecmint.com/wp-content/uploads/2012/11/Install-Thunderbird-in-Linux.png) 
][2]

Install Thunderbird in Linux

That’s it, you’ve successfully installed Thunderbird 45.6.0 under your Linux system. Thunderbird also available for other operating systems at [Thunderbird download][3] page.

--------------------------------------------------------------------------------

作者简介：

![](http://1.gravatar.com/avatar/7badddbc53297b2e8ed7011cf45df0c0?s=256&d=blank&r=g)

I am Ravi Saive, creator of TecMint. A Computer Geek and Linux Guru who loves to share tricks and tips on Internet. Most Of My Servers runs on Open Source Platform called Linux. Follow Me: Twitter, Facebook and Google+

--------------------------------------------------------------------------------


via: http://www.tecmint.com/install-thunderbird-in-ubuntu-fedora-linux/

作者：[Ravi Saive][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/admin/
[1]:https://www.mozilla.org/en-US/thunderbird/45.6.0/releasenotes/
[2]:http://www.tecmint.com/wp-content/uploads/2012/11/Install-Thunderbird-in-Linux.png
[3]:http://www.mozilla.org/en-US/products/thunderbird/

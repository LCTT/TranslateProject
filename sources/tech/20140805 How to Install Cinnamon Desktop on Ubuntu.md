How to Install Cinnamon Desktop on Ubuntu
======
**This tutorial shows you how to install Cinnamon desktop environment on Ubuntu.**

[Cinnamon][1] is the default desktop environment of [Linux Mint][2]. Unlike Unity desktop environment in Ubuntu, Cinnamon is more traditional but elegant looking desktop environment with the bottom panel and app menu etc. Many Windows migrants [prefer Linux Mint over Ubuntu][3] because of Cinnamon desktop and its Windows-resembling user interface.

Now, you don’t need to [install Linux Mint][4] just for trying Cinnamon. In this tutorial, I’ll show you **how to install Cinnamon in Ubuntu 18.04, 16.04 and 14.04**.

You should note something before you install Cinnamon desktop on Ubuntu. Sometimes, installing additional desktop environments leads to conflict between the desktop environments. This may result in a broken session, broken applications and features etc. This is why you should be careful in making this choice.

### How to Install Cinnamon on Ubuntu

![How to install cinnamon desktop on Ubuntu Linux][5]

There used to be a-sort-of official PPA from Cinnamon team for Ubuntu but it doesn’t exist anymore. Don’t lose heart. There is an unofficial PPA available and it works perfectly. This PPA consists of the latest Cinnamon version.

Open a terminal and use the following commands:

```
sudo add-apt-repository ppa:embrosyn/cinnamon
sudo apt update && sudo apt install cinnamon

```

It will download files of around 150 MB in size (if I remember correctly). This also provides you with Nemo (Nautilus fork) and Cinnamon Control Center. This bonus stuff gives a closer feel of Linux Mint.

### Using Cinnamon desktop environment in Ubuntu

Once you have installed Cinnamon, log out of the current session. At the login screen, click on the Ubuntu symbol beside the username:

![](https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2014/08/Change_Desktop_Environment_Ubuntu.jpeg)

When you do this, it will give you all the desktop environments available for your system. No need to tell you that you have to choose Cinnamon:

![](https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2014/08/Install_Cinnamon_Ubuntu.jpeg)

Now you should be logged in to Ubuntu with Cinnamon desktop environment. Remember, you can do the same to switch back to Unity. Here is a quick screenshot of what it looked like to run **Cinnamon in Ubuntu** :

![](https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2014/08/Cinnamon_Ubuntu_1404.jpeg)

Looks completely like Linux Mint, isn’t it? I didn’t find any compatibility issue between Cinnamon and Unity. I switched back and forth between Unity and Cinnamon and both worked perfectly.

#### Remove Cinnamon from Ubuntu

It is understandable that you might want to uninstall Cinnamon. We will use PPA Purge for this purpose. Let’s install PPA Purge first:

```
sudo apt-get install ppa-purge

```

Afterward, use the following command to purge the PPA:

```
sudo ppa-purge ppa:embrosyn/cinnamon

```

In related articles, I suggest you to read more about [how to remove PPA in Linux][6].

I hope this post helps you to **install Cinnamon in Ubuntu**. Do share your experience with Cinnamon.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-cinnamon-on-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[1]: http://cinnamon.linuxmint.com/
[2]: http://www.linuxmint.com/
[3]: https://itsfoss.com/linux-mint-vs-ubuntu/
[4]: https://itsfoss.com/guide-install-linux-mint-16-dual-boot-windows/
[5]: https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/09/install-cinnamon-ubuntu.png
[6]: https://itsfoss.com/how-to-remove-or-delete-ppas-quick-tip/

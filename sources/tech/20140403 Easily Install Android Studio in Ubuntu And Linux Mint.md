Easily Install Android Studio in Ubuntu And Linux Mint
======
[Android Studio][1], Google’s own IDE for Android development, is a nice alternative to Eclipse with ADT plugin. Android Studio can be installed from its source code but in this quick post, we shall see **how to install Android Studio in Ubuntu 18.04, 16.04 and corresponding Linux Mint variants**.

Before you proceed to install Android Studio, make sure that you have [Java installed in Ubuntu][2].

![How to install Android Studio in Ubuntu][3]

### Install Android Studio in Ubuntu and other distributions using Snap

Ever since Ubuntu started focusing on Snap packages, more software have started providing easy to install Snap packages. Android Studio is one of them. Ubuntu users can simply find the Android Studio application in the Software Center and install it from there.

![Install Android Studio in Ubuntu from Software Center][4]

If you see an error while installing Android Studio from Software Center, you can use the [Snap commands][5] to install Android studio.
```
sudo snap install android-studio --classic

```

Easy peasy!

### Alternative Method 1: Install Android Studio using umake in Ubuntu

You can also easily install Android Studio using Ubuntu Developer Tools Center, now known as [Ubuntu Make][6]. Ubuntu Make provides a command line tool to install various development tools, IDE etc. Ubuntu Make is available in Ubuntu repository.

To install Ubuntu Make, use the commands below in a terminal:

`sudo apt-get install ubuntu-make`

Once you have installed Ubuntu Make, use the command below to install Android Studio in Ubuntu:
```
umake android

```

It will give you a couple of options in the course of the installation. I presume that you can handle it. If you decide to uninstall Android Studio, you can use the same umake tool in the following manner:
```
umake android --remove

```

### Alternative Method 2: Install Android Studio in Ubuntu and Linux Mint via unofficial PPA

Thanks to [Paolo Ratolo][7], we have a PPA which can be used to easily install Android Studio in Ubuntu 16.04, 14.04, Linux Mint and other Ubuntu based distributions. Just note that it will download around 650 MB of data. So mind your internet connection as well as data charges (if any).

Open a terminal and use the following commands:
```
sudo apt-add-repository ppa:paolorotolo/android-studio
sudo apt-get update
sudo apt-get install android-studio

```

Was it not easy? While installing a program from source code is fun in a way, it is always nice to have such PPAs. Once we have seen how to install Android Studio, lets see how to uninstall it.

### Uninstall Android Studio:

If you don’t have already, install PPA Purge:
```
sudo apt-get install ppa-purge

```

Now use the PPA Purge to purge the installed PPA:
```
sudo apt-get remove android-studio

sudo ppa-purge ppa:paolorotolo/android-studio

```

That’s it. I hope this quick helps you to **install Android Studio in Ubuntu and Linux Mint**. Before you run Android Studio, make sure to [install Java in Ubuntu][8] first. In similar posts, I advise you to read [how to install and configure Ubuntu SDK][9] and [how to easily install Microsoft Visual Studio in Ubuntu][10].

Any questions or suggestions are always welcomed. Ciao :)

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-android-studio-ubuntu-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://itsfoss.com/author/abhishek/
[1]:http://developer.android.com/sdk/installing/studio.html
[2]:https://itsfoss.com/install-java-ubuntu-1404/
[3]:https://itsfoss.com/wp-content/uploads/2014/04/Android_Studio_Ubuntu.jpeg
[4]:https://itsfoss.com/wp-content/uploads/2014/04/install-android-studio-snap-800x469.jpg
[5]:https://itsfoss.com/install-snap-linux/
[6]:https://wiki.ubuntu.com/ubuntu-make
[7]:https://plus.google.com/+PaoloRotolo
[8]:https://itsfoss.com/install-java-ubuntu-1404/ (How To Install Java On Ubuntu 14.04)
[9]:https://itsfoss.com/install-configure-ubuntu-sdk/
[10]:https://itsfoss.com/install-visual-studio-code-ubuntu/

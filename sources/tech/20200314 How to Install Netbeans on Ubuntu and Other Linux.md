[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Install Netbeans on Ubuntu and Other Linux)
[#]: via: (https://itsfoss.com/install-netbeans-ubuntu/)
[#]: author: (Community https://itsfoss.com/author/itsfoss/)

How to Install Netbeans on Ubuntu and Other Linux
======

_**In this tutorial, you’ll learn various ways to install Netbeans IDE on Ubuntu and other Linux distributions.**_

[NetBeans][1] is an open source integrated development environment that comes with good cross-platform support. This tool has been recognized by the Java and C/C++ development community widely.

The development environment is quite flexible. You can configure this tool to support a wide array of development objectives. Practically, you can develop Web, Desktop and Mobile Applications without leaving this platform. It’s amazing, isn’t it? Besides this, the user can add a wide array of known languages such as [PHP][2], C, C++, HTML, [Ajax][3], JavaScript, JSP, Ruby on Rails and the list goes on and on!

If you are looking to install Netbeans on Linux, you have several ways to do that. I have written this tutorial primarily for Ubuntu but some installation methods are applicable to other distributions as well.

  * [Installing Netbeans on Ubuntu using apt][4]: for Ubuntu and Ubuntu-based distributions but usually **it has older version of Netbeans**
  * [Installing Netbeans on Ubuntu using Snap][5]: for any Linux distribution that has Snap packaging support enabled
  * [Installing Netbeans using Flatpak][6]: for any Linux distribution with Flatpak package support



### Installing Netbeans IDE on Ubuntu using Apt package manager

If you search for Netbeans in Ubuntu Software Center, you’ll find two Netbeans available. The Apache Netbeans is the snap version which is bigger in download size but gives you the latest Netbeans.

You can install it in one click. No need to open terminal. Easiest way.

![Apache Netbeans in Ubuntu Software Center][7]

You may also opt for using the apt command but with apt version, you won’t get the latest Netbeans. For example, at the time of writing this tutorial, Ubuntu 18.04 has Netbeans version 10 available via Apt while Snap has the latest Netbeans 11.

If you are a fan of [apt or apt-get][8], you can [enable the universe repository][9] and install Netbeans using this command in the terminal:

```
sudo apt install netbeans
```

### Installing Netbeans IDE on any Linux distribution using Snap

![][10]

Snap is a universal package manager and if [you have enabled Snap on your distribution][11], you can install it using the following command:

```
sudo snap install netbeans --classic
```

The process might take some time to complete because the total download size is around 1 GB. Once done, you will see the app in the application launcher.

Not only you’ll get the latest Netbeans with Snap, the installed version will be automatically updated to the newer version.

### Installing Netbeans using Flatpak

[Flatpak][12] is another universal packaging like Snap. Some distributions support Flatpak by default while you can [enable Flatpak support][13] on others.

Once you have the Flatpak support on your distribution, you can use the following command to install Netbeans:

```
flatpak install flathub org.apache.netbeans
```

Alernatively, you can always download the source code of this open source software and compile it yourself.

[Download Netbeans][14]

Hopefully, you selected one of the above methods to install Netbeans on your Ubuntu Linux system. But which one did you use? Did you face any issues? Do let us know.

![][15]

### Srimanta Koley

Srimanta is a passionate writer, a distrohopper &amp; open source enthusiast. He is extremely fond of everything related to technology. He loves to read books and has an unhealthy addiction to the 90s!

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-netbeans-ubuntu/

作者：[Community][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/itsfoss/
[b]: https://github.com/lujun9972
[1]: https://netbeans.org/
[2]: https://www.php.net/
[3]: https://en.wikipedia.org/wiki/Ajax_(programming)
[4]: tmp.ZNFNEC210y#apt
[5]: tmp.ZNFNEC210y#snap
[6]: tmp.ZNFNEC210y#flatpak
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/apache-netbeans-ubuntu-software-center.jpg?ssl=1
[8]: https://itsfoss.com/apt-vs-apt-get-difference/
[9]: https://itsfoss.com/ubuntu-repositories/
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/03/Install_Netbeans_Linux.jpg?ssl=1
[11]: https://itsfoss.com/install-snap-linux/
[12]: https://flatpak.org/
[13]: https://itsfoss.com/flatpak-guide/
[14]: https://netbeans.apache.org/download/index.html
[15]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/03/srimanta.jpg?ssl=1

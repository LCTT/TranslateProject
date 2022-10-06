[#]: subject: "4 Ways to Install deb Files in Ubuntu [Beginner’s Guide]"
[#]: via: "https://www.debugpoint.com/install-deb-files/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

4 Ways to Install deb Files in Ubuntu [Beginner’s Guide]
======
This absolute beginner’s guide explains the steps required to install deb (*.deb) files in Ubuntu. This applies to all Ubuntu-based Linux distributions such as Linux Mint, elementary OS, etc.

### What is a .deb file?

The .deb files are the software package format used by Debian and its derivatives such as Ubuntu, Linux Mint, elementary, etc. These files are archive files consisting of control and installation packages. Any source code can be packaged as .deb using certain methods, and the output file can be installed in target systems provided dependencies are satisfied.

The .deb files support GPG signatures for verification while they can be converted to other package formats as well, such as .rpm using [alien][1].

### Install deb files in Ubuntu and Other Derivatives – 4 Methods

There are several ways to install deb files in Ubuntu. We will explain four different steps for absolutely new users.

#### 1. GUI Method using Software [Recommeneded for Ubuntu users]

This is probably the easiest method to install .deb files in Ubuntu. It uses the in-house *Software* tool.

* Browse to the .deb file location using the file manager.
* Right-click on the .deb file and click ‘Open with the software install’.
* Wait for the Software to open, then click Install.
* After the installation is finished, you can find the application in the app grid.

![Open with Software in Ubuntu][2]

#### 2. Terminal Method using GDEBI Package Manager

![Install deb files using gdebi][3]

The [gdebi package manager][4] is a super handy tool to install any .deb files in Ubuntu. The advantage of using gdebi is that it resolves all the dependencies and installs them for you automatically.

The gdebi package manager is not installed by default in Ubuntu. You have to install it separately.

* Open a terminal and run the below command to install gdebi.

```
sudo apt install gdebi
```

* Once installed, browse to the location of the .deb file via the terminal and run the following command.
* Change the path and package name as per your application.

```
sudo gdebi /path/package_name.deb
```

* The above command will install the .deb file for you automatically.

#### 3. Install deb files using dpkg Package Manager

* The legacy [dpkg][5] can also be used to install .deb files.
* You can use its switch “-i” to install any .deb package. The dpkg is already installed by default in all Debian-based systems. Here’s the command to install.

```
sudo dpkg -i /path/package_name.deb
```

* However, dpkg may give you a dependency error while installing the package. If it gives such an error, then run the following command to install the pending dependencies.

```
sudo apt-get install -f
```

* That would conclude the .deb file installation using dpkg.

#### 4. Install deb files using apt

![Install deb files using apt][6]

* Using the default apt package manager also, you can easily install any .deb file. The apt package manager is a powerful utility; you can do many things with it.
* That said, to install any .deb package using apt, use any of the following commands.

```
sudo apt install ./package_name.debsudo apt install /path/package_name.deb
```

* Make sure to change the path and package name as per your package name.

### How to uninstall the .deb file package

Uninstalling an installed deb package requires the actual installed package name. And that is different (in most cases) than the actual .deb file name. So, to find out the installed package name use the following command.

```
dpkg -I package_name.deb
```

Then using the package name, follow any of the below commands to remove it from your system.

```
sudo apt remove package_namesudo dpkg -r package_name
```

![Remove package using dpkg][7]

Also, as the last step, you can use the autoremove of apt package manager to remove any unwanted package that may have been there in your system when you installed the package using the above commands,

```
sudo apt autoremove
```

### Closing Notes

I hope this absolute beginner’s guide helps you to know various ways to install a .deb file in Ubuntu and other similar derivatives. Armed with this basic knowledge, you can explore further using man pages of these utilities.

*Cheers*.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/install-deb-files/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://wiki.debian.org/Alien
[2]: https://www.debugpoint.com/wp-content/uploads/2021/04/Open-with-Software-in-Ubuntu.jpg
[3]: https://www.debugpoint.com/wp-content/uploads/2021/04/Install-using-gdebi.jpg
[4]: http://manpages.ubuntu.com/manpages/bionic/man1/gdebi.1.html
[5]: https://linux.die.net/man/1/dpkg
[6]: https://www.debugpoint.com/wp-content/uploads/2021/04/Install-deb-file-using-apt.jpg
[7]: https://www.debugpoint.com/wp-content/uploads/2021/04/Remove-package-using-dpkg.jpg

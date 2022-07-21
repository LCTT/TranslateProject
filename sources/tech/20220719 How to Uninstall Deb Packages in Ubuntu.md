[#]: subject: "How to Uninstall Deb Packages in Ubuntu"
[#]: via: "https://itsfoss.com/uninstall-deb-ubuntu/"
[#]: author: "Abhishek Prakash https://itsfoss.com/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Uninstall Deb Packages in Ubuntu
======
Installing applications from a deb file is quite simple. You double click on it and it opens in the Software Center application and you install it from there.

[Installing applications from a deb file][1] is quite simple. You double click on it and it opens in the Software Center application and you install it from there.

But what about uninstalling a .deb package in Ubuntu or Debian? How do you remove the package you installed some time back.

While there are several ifs and buts around it, the simplest and most reliable way of deleting a deb file is by using the apt remove command.

```
sudo apt remove program_name
```

As you can see, **you need to know the exact package name here**. This may not always be straightforward. For example, if you install Google Chrome on Ubuntu, the program is known as ‘google-chrome-stable’ in the command line. Did you already know that? I guess not.

In this tutorial, I’ll go into detail about finding the exact package name and then using it to remove the application. I’ll also discuss using a graphical method for deleting .deb packages.

### Removing package installed via deb files from Ubuntu

Before I show you how to remove deb packages from the command line, let’s just quickly look at it in the Software Center application.

#### Method 1: Check if the application can be removed from the software center

Ubuntu has the Software Center GUI application that allows to search for applications, install them and remove them.

The Software Center may not show the application installed when you search for it.

![Searching for installed applications may not show any results in Ubuntu Software Center][2]

However, you may still find it under the “Installed” section if you scroll down. The external applications are usually displayed without their logo.

![Some installed applications can be found in the ‘installed’ tab of the Software Center][3]

If you find it, you can remove the application by clicking the trash icon or remove button.

![Removing applications from the Ubuntu software center][4]

**Bottom line: Check if the application can be removed from the software center.**

#### Method 2: Delete applications using apt command

I am presuming that you don’t know the exact name of the application command. It is only natural that you may not know that Google Chrome is installed as google-chrome-stable and Edge is installed as microsoft-edge-stable.

The tab completion may help if you have the first few letters. Otherwise, you can [list the installed applications with apt command][5] and use grep to search for the application name:

```
apt list --installed | grep -i possible_package_name
```

For example, you can intelligently guess that the Google Chrome package should have chrome in its name. You may search it like this:

```
apt list --installed | grep -i chrome
```

You may get more than one result in some cases.

![check if google chrome installed in ubuntu][6]

If you are not sure what the packages do, you can always get their details with:

```
apt info exact_package_name
```

Once you have the exact package name, you can delete it using the apt remove command.

```
sudo apt remove exact_package_name
```

You can also use apt-get remove or dpkg uninstall commands.

![Removing applications installed via deb files using the apt command][7]

#### Method 3: Use Synaptic Package Manager to remove deb applications

Another method is to use the [Synaptic Package Manager][8]. Before GNOME created its graphical package manager in the form of the Software Center, Synaptic was the default GUI package manager in Ubuntu and many other distributions.

It is still the recommended tool on the [Xfce desktop environment][9].

Install it first:

```
sudo apt install synaptic
```

Open Synaptic and search for the package name. Look for the installed packages that are marked green. Right-click on them and click on ‘mark for removal’. Hit apply after that.

![Removing Deb packages using Synaptic package manager][10]

### Did it help you?

I am more than comfortable using the apt command to remove the packages installed from .deb files. But I can understand that not everyone is comfortable using the command line.

I find the Software Center lacking when it comes to the removal of applications installed from external deb files. It could do a better job here.

I hope you have a better understanding of removing deb packages now. Let me know if you have any questions.

--------------------------------------------------------------------------------

via: https://itsfoss.com/uninstall-deb-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/install-deb-files-ubuntu/
[2]: https://itsfoss.com/wp-content/uploads/2022/07/search-for-installed-applications-ubuntu-software-center.png
[3]: https://itsfoss.com/wp-content/uploads/2022/07/installed-applications-in-ubuntu-software-center-scaled.webp
[4]: https://itsfoss.com/wp-content/uploads/2022/07/removing-applications-from-ubuntu-software-center-scaled.webp
[5]: https://itsfoss.com/list-installed-packages-ubuntu/
[6]: https://itsfoss.com/wp-content/uploads/2022/07/check-if-google-chrome-installed-in-Ubuntu.png
[7]: https://itsfoss.com/wp-content/uploads/2022/07/removing-deb-files-applications-ubuntu.png
[8]: https://itsfoss.com/synaptic-package-manager/
[9]: https://www.xfce.org/
[10]: https://itsfoss.com/wp-content/uploads/2022/07/removing-deb-files-using-synaptic-scaled.webp

[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Using the Lightweight Apt Package Manager Synaptic in Ubuntu and Other Debian-based Linux Distributions)
[#]: via: (https://itsfoss.com/synaptic-package-manager/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Using the Lightweight Apt Package Manager Synaptic in Ubuntu and Other Debian-based Linux Distributions
======

This week’s open source software highlight is Synaptic. Learn what this good old package manager can do that the modern software managers cannot.

### What is Synaptic package manager?

[Synaptic][1] is a lightweight GUI front end to [apt package management system][2] used in Debian, Ubuntu, Linux Mint and many other Debian/Ubuntu based distributions.

Basically, everything that you can do [using the apt-get commands in the terminal][3] can be achieved with Synaptic.

![][4]

There was a time when Synaptic was the default graphical software manager on almost all Debian-based Linux distributions. It was considered to be a user-friendly, easy to use way of managing applications.

Things changed as modern software manager tools like [GNOME Software][5] and [KDE Discover][6] came up with more modern and intuitive UI. These software managers have better interface, display the package information in a more friendly way with thumbnails, ratings and reviews.

Eventually, Synaptic got [confined to mostly lightweight Linux distributions][7].

#### Why would you use an ‘ancient’ software like Synaptic package manager?

You don’t have to. Not most of the time, of course.

But Synaptic is still a lot versatile than the likes of GNOME Software. Remember, it is basically GUI front end to apt which means it can do (almost) everything you do with [apt commands in the terminal][8].

For example, if you want to [prevent the update of a specific package in Ubuntu][9], you can do that in Synaptic but not in GNOME/Ubuntu Software Center.

![][10]

Also, I have noticed some issues with the Software Center in Ubuntu 20.04. It’s slow to load, it’s slow when searching for software and it is full of snap application (that not everyone prefers).

Synaptic is also [one of the lightweight applications you can use in Ubuntu][7] to speed up your system a bit.

#### Synaptic package manager features

Here is a summary of what you can do with Synaptic:

  * Update the package cache
  * Upgrade the entire system
  * Manage package repositories
  * Search for packages by name, description, maintainer, version, dependencies etc
  * List packages by section, status (installed), origin or more
  * Sort packages by name, status, size or version
  * Get information related to a package
  * Lock package version
  * Install specific version of a package



There are more features that you may explore on your own.

### How to install Synaptic package manager on Ubuntu

Synaptic package manager is available in the Universe repository in Ubuntu. If it is enabled, you may find it in the Software Center:

![Synaptic in Ubuntu Software Center][11]

You may also install Synaptic via command line. Make sure to enable universe repository first:

```
sudo add-apt-repository univers
```

And then update the cache (not required in Ubuntu 18.04 and higher versions):

```
sudo apt update
```

Now, use the command below to install synaptic package manager:

```
sudo apt install synaptic
```

That’s it.

### How to use Synaptic package manager

Once installed, you can search for Synaptic in the menu and start it from there:

![][12]

You can see that the interface is not among the best-looking ones here. Note the color of the checkboxes. White means the package is not installed, green means it is installed.

![][4]

You can search for an application and click on the checkbox to mark it for installation. It will also highlight packages (in green) that will be installed as dependencies. Hit apply to install the selected packages:

![][13]

You can [see all the installed packages in Ubuntu][14] using Synaptic. You can also choose to remove packages from this view.

![][15]

You can see packages available in individual repositories by displaying them based on Origin. Good way to see [which PPA offers what packages][16]. You can install or remove packages as described above.

![][17]

Usually, when you update Ubuntu, all the packages are updated at once. With Synaptic, you can easily choose which packages you want to update/upgrade to a newer version.

![][18]

You can also lock the version of packages so that they don’t get updated along with the system updates.

![][10]

You can also search for packages using Synaptic. This is like [searching for packages using apt-cache search command][19].

![][20]

If you think you made the wrong selection, you can click Undo from the Edit menu.

There are plenty more you can do with Synaptic and I cannot cover all the possible usages. I have covered the most common ones here and I leave you to explore it, if you are going to use Synaptic.

### Synaptic is not for everyone

If you don’t like Synaptic, you can remove it from the Software Center or using this command in terminal:

```
sudo apt remove synaptic
```

There was another lightweight software manager for Ubuntu called [AppGrid][21]. It hasn’t been updated in recent times as far as I know.

Synaptic is certainly not for everyone. It lists libraries and packages that you won’t otherwise see in the regular Software Center. If you removed a library that you were not aware of, it may cause issues.

I think that Synaptic is suitable for intermediate to advanced users who want better control over the package management without going the command line way.

What do you say? Have you ever used Synaptic for package management? Do you reply on software center or you just dive into the terminal? Do share your preference in the comment section.

--------------------------------------------------------------------------------

via: https://itsfoss.com/synaptic-package-manager/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.nongnu.org/synaptic/
[2]: https://en.wikipedia.org/wiki/APT_(software)
[3]: https://itsfoss.com/apt-get-linux-guide/
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/synaptic-interface.png?ssl=1
[5]: https://wiki.gnome.org/Apps/Software
[6]: https://userbase.kde.org/Discover
[7]: https://itsfoss.com/lightweight-alternative-applications-ubuntu/
[8]: https://itsfoss.com/apt-command-guide/
[9]: https://itsfoss.com/prevent-package-update-ubuntu/
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/06/lock-version-synaptic.png?ssl=1
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/synaptic-ubuntu-software-center.png?ssl=1
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/synaptic-package-manager-ubuntu.jpg?ssl=1
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/06/install-packages-in-synaptic.png?ssl=1
[14]: https://itsfoss.com/list-installed-packages-ubuntu/
[15]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/remove-packages-using-synaptic.png?ssl=1
[16]: https://itsfoss.com/ppa-guide/
[17]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/06/see-packages-by-repositories-synaptic.png?ssl=1
[18]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/upgrade-packages-synaptic.png?ssl=1
[19]: https://itsfoss.com/apt-search-command/
[20]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/06/search-results-synaptic.png?ssl=1
[21]: https://itsfoss.com/app-grid-lighter-alternative-ubuntu-software-center/

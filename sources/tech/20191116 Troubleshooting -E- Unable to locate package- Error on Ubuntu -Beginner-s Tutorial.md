[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Troubleshooting “E: Unable to locate package” Error on Ubuntu [Beginner’s Tutorial])
[#]: via: (https://itsfoss.com/unable-to-locate-package-error-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Troubleshooting “E: Unable to locate package” Error on Ubuntu [Beginner’s Tutorial]
======

_**This beginner tutorial shows how to go about fixing the E: Unable to locate package error on Ubuntu Linux.**_

One of the [many ways of installing software in Ubuntu][1] is to use the [apt-get][2] or the [apt command][3]. You open a terminal and use the program name to install it like this:

```
sudo apt install package_name
```

Sometimes, you may encounter an error while trying to install application in this manner. The error reads:

```
sudo apt-get install package_name
Reading package lists... Done
Building dependency tree
Reading state information... Done
E: Unable to locate package package_name
```

The error is self explanatory. Your Linux system cannot find the package that you are trying to install. But why is it so? Why can it not find the package? Let’s see some of the actions you can take to fix this issue.

### Fixing ‘Unable to locate package error’ on Ubuntu

![][4]

Let’s see how to troubleshoot this issue one step at a time.

#### 1\. Check the package name (no, seriously)

This should be the first thing to check. Did you make a typo in the package name? I mean, if you are trying to [install vlc][5] and you typed vcl, it will surely fail. Typos are common so make sure that you have not made any mistakes in typing the name of the package.

#### 2\. Update the repository cache

If this is the first time you are using your system after installing, you should run the update command:

```
sudo apt update
```

This command won’t [update Ubuntu][6] straightaway. I recommend to get through the [concept of Ubuntu repositories][7]. Basically, the ‘apt update’ command builds a local cache of available packages.

When you use the install command, apt package manager searches the cache to get the package and version information and then download it from its repositories over the network. If the package is not in this cache, your system won’t be able to install it.

When you have a freshly installed Ubuntu system, the cache is empty. This is why you should run the apt update command right after installing Ubuntu or any other distributions based on Ubuntu (like Linux Mint).

Even if its not a fresh install, your apt cache might be outdated. It’s always a good idea to update it.

#### 3\. Check if package is available for your Ubuntu version

Alright! You checked the name of the package and it is correct. You run the update command to rebuild the cache and yet you see the unable to locate package error.

It is possible that the package is really not available. But you are following the instructions mentioned on some website and everyone else seems to be able to install it like that. What could be the issue?

I can see two things here. Either the package available in Universe repository and your system hasn’t enabled it or the package is not available on your Ubuntu version altogether. Don’t get confused. I’ll explain it for you.

First step, [check the Ubuntu version you are running][8]. Open a terminal and use the following command:

```
lsb_release -a
```

You’ll get the Ubuntu version number and the codename in the output. The codename is what important here:

```
[email protected]:~$ lsb_release -a
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 18.04.3 LTS
Release:        18.04
Codename:       bionic
```

![Ubuntu Version Check][9]

As you can see here, I am using Ubuntu 18.04 and its codename is _bionic_. You may have something else but you get the gist of what you need to note here.

Once you have the version number and the codename, head over to the Ubuntu packages website:

[Ubuntu Packages][10]

Scroll down a bit on this page and go to the Search part. You’ll see a keyword field. Enter the package name (which cannot be found by your system) and then set the correct distribution codename. The section should be ‘any’. When you have set these three details, hit the search button.

![Ubuntu Package Search][11]

This will show if the package is available for your Ubuntu version and if yes, which repository it belongs to. In my case, I searched for [Shutter screenshot tool][12] and this is what it showed me for Ubuntu 18.04 Bionic version:

![Package Search Result][13]

In my case, the package name is an exact match. This means the package shutter is available for Ubuntu 18.04 Bionic but in the ‘Universe repository’. If you are wondering what the heck is Universe repository, please [refer to the Ubuntu repository article I had mentioned earlier][7].

If the intended package is available for your Ubuntu version but it a repository like universe or multiverse, you should enable these additional repositories:

```
sudo add-apt-repository universe multiverse
```

You must also update the cache so that your system is aware of the new packages available through these repositories:

```
sudo apt update
```

Now if you try to install the package, things should be fine.

#### Nothing works, what now?

If Ubuntu Packages website also shows that the package is not available for your specific version, then you’ll have to find some other ways to install the package.

Take Shutter for example. It’s an [excellent screenshot tool for Linux][14] but it hasn’t been updated in years and thus Ubuntu has dropped it from Ubuntu 18.10 and newer versions. How to install it now? Thankfully, some third party developer created a personal repository (PPA) and you can install it using that. [Please read this detailed guide to [understand PPA in Ubuntu][15].] You can search for packages and their PPA on Ubuntu’s Launchpad website.

Do keep in mind that you shouldn’t add random (unofficial) PPAs to your repositories list. I advise sticking with what your distribution provides.

If there are no PPAs, check the official website of the project and see if they provide some alternative ways of installing the application. Some projects provide .[DEB files][16] or [AppImage][17] files. Some projects have switched to [Snap packages][18].

In other words, check the official website of the project and check if they have changed their installation method.

If nothing works, perhaps the project itself is discontinued and if that’s the case, you should look for its alternative application.

**In the end…**

If you are new to Ubuntu or Linux, things could be overwhelming. This is why I am covering some basic topics like this so that you get a better understanding of how things work in your system.

I hope this tutorial helps you handling the package error in Ubuntu. If you have questions or suggestions, please feel free to ask in the comment section.

--------------------------------------------------------------------------------

via: https://itsfoss.com/unable-to-locate-package-error-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/remove-install-software-ubuntu/
[2]: https://itsfoss.com/apt-get-linux-guide/
[3]: https://itsfoss.com/apt-command-guide/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/11/unable_to_locate_package_error_ubuntu.png?ssl=1
[5]: https://itsfoss.com/install-latest-vlc/
[6]: https://itsfoss.com/update-ubuntu/
[7]: https://itsfoss.com/ubuntu-repositories/
[8]: https://itsfoss.com/how-to-know-ubuntu-unity-version/
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/11/ubuntu_version_check.jpg?ssl=1
[10]: https://packages.ubuntu.com/
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/11/ubuntu_package_search.png?ssl=1
[12]: https://itsfoss.com/install-shutter-ubuntu/
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/11/package_search_result.png?resize=800%2C311&ssl=1
[14]: https://itsfoss.com/take-screenshot-linux/
[15]: https://itsfoss.com/ppa-guide/
[16]: https://itsfoss.com/install-deb-files-ubuntu/
[17]: https://itsfoss.com/use-appimage-linux/
[18]: https://itsfoss.com/use-snap-packages-ubuntu-16-04/

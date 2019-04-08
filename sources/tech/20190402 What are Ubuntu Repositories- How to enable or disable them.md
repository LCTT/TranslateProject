[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What are Ubuntu Repositories? How to enable or disable them?)
[#]: via: (https://itsfoss.com/ubuntu-repositories)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

What are Ubuntu Repositories? How to enable or disable them?
======

_**This detailed article tells you about various repositories like universe, multiverse in Ubuntu and how to enable or disable them.**_

So, you are trying to follow a tutorial from the web and installing a software using apt-get command and it throws you an error:

```
E: Unable to locate package xyz
```

You are surprised because others the package should be available. You search on the internet and come across a solution that you have to enable universe or multiverse repository to install that package.

**You can enable universe and multiverse repositories in Ubuntu using the commands below:**

```
sudo add-apt-repository universe multiverse
sudo apt update
```

You installed the universe and multiverse repository but do you know what are these repositories? How do they play a role in installing packages? Why there are several repositories?

I’ll explain all these questions in detail here.

### The concept of repositories in Ubuntu

Okay, so you already know that to [install software in Ubuntu][1], you can use the [apt command][2]. This is the same [APT package manager][3] that Ubuntu Software Center utilizes underneath. So all the software (except Snap packages) that you see in the Software Center are basically from APT.

Have you ever wondered where does the apt program install the programs from? How does it know which packages are available and which are not?

Apt basically works on the repository. A repository is nothing but a server that contains a set of software. Ubuntu provides a set of repositories so that you won’t have to search on the internet for the installation file of various software of your need. This centralized way of providing software is one of the main strong points of using Linux.

The APT package manager gets the repository information from the /etc/apt/sources.list file and files listed in /etc/apt/sources.list.d directory. Repository information is usually in the following format:

```
deb http://us.archive.ubuntu.com/ubuntu/ bionic main
```

In fact, you can [go to the above server address][4] and see how the repository is structured.

When you [update Ubuntu using the apt update command][5], the apt package manager gets the information about the available packages (and their version info) from the repositories and stores them in local cache. You can see this in /var/lib/apt/lists directory.

Keeping this information locally speeds up the search process because you don’t have to go through the network and search the database of available packages just to check if a certain package is available or not.

Now you know how repositories play an important role, let’s see why there are several repositories provided by Ubuntu.

### Ubuntu Repositories: Main, Universe, Multiverse, Restricted and Partner

![][6]

Software in Ubuntu repository are divided into five categories: main, universe, multiverse, restricted and partner.

Why Ubuntu does that? Why not put all the software into one single repository? To answer this question, let’s see what are these repositories:

#### **Main**

When you install Ubuntu, this is the repository enabled by default. The main repository consists of only FOSS (free and open source software) that can be distributed freely without any restrictions.

Software in this repository are fully supported by the Ubuntu developers. This is what Ubuntu will provide with security updates until your system reaches end of life.

#### **Universe**

This repository also consists free and open source software but Ubuntu doesn’t guarantee of regular security updates to software in this category.

Software in this category are packaged and maintained by the community. The Universe repository has a vast amount of open source software and thus it enables you to have access to a huge number of software via apt package manager.

#### **Multiverse**

Multiverse contains the software that are not FOSS. Due to licensing and legal issues, Ubuntu cannot enable this repository by default and cannot provide fix and updates.

It’s up to you to decide if you want to use Multiverse repository and check if you have the right to use the software.

#### **Restricted**

Ubuntu tries to provide only free and open source software but that’s not always possible specially when it comes to supporting hardware.

The restricted repositories consists of proprietary drivers.

#### **Partner**

This repository consist of proprietary software packaged by Ubuntu for their partners. Earlier, Ubuntu used to provide Skype trough this repository.

#### Third party repositories and PPA (Not provided by Ubuntu)

The above five repositories are provided by Ubuntu. You can also add third party repositories (it’s up to you if you want to do it) to access more software or to access newer version of a software (as Ubuntu might provide old version of the same software).

For example, if you add the repository provided by [VirtualBox][7], you can get the latest version of VurtualBox. It will add a new entry in your sources.list.

You can also install additional application using PPA (Personal Package Archive). I have written about [what is PPA and how it works][8] in detail so please read that article.

Tip

Try NOT adding anything other than Ubuntu’s repositories in your sources.list file. You should keep this file in pristine condition because if you mess it up, you won’t be able to update your system or (at times) even install new packages.

### Add universe, multiverse and other repositories

As I had mentioned earlier, only the Main repository is enabled by default when you install Ubuntu. To access more software, you can add the additional repositories.

Let me show you how to do it in command line first and then I’ll show you the GUI ways as well.

To enable Universe repository, use:

```
sudo add-apt-repository universe
```

To enable Restricted repository, use:

```
sudo add-apt-repository restricted
```

To enable Multiverse repository, use this command:

```
sudo add-apt-repository multiverse
```

You must use sudo apt update command after adding the repository so that you system creates the local cache with package information.

If you want to **remove a repository** , simply add -r like **sudo add-apt-repository -r universe**.

Graphically, go to Software & Updates and you can enable the repositories here:

![Adding Universe, Restricted and Multiverse repositories][9]

You’ll find the option to enable partner repository in the Other Software tab.

![Adding Partner repository][10]

To disable a repository, simply uncheck the box.

### Bonus Tip: How to know which repository a package belongs to?

Ubuntu has a dedicated website that provides you with information about all the packages available in the Ubuntu archive. Go to Ubuntu Packages website.

[Ubuntu Packages][11]

You can search for a package name in the search field. You can select if you are looking for a particular Ubuntu release or a particular repository. I prefer using ‘any’ option in both fields.

![][12]

It will show you all the matching packages, Ubuntu releases and the repository information.

![][13]

As you can see above the package tor is available in the Universe repository for various Ubuntu releases.

**Conclusion**

I hope this article helped you in understanding the concept of repositories in Ubuntu.

If you have any questions or suggestions, please feel free to leave a comment below. If you liked the article, please share it on social media sites like Reddit and Hacker News.

--------------------------------------------------------------------------------

via: https://itsfoss.com/ubuntu-repositories

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/remove-install-software-ubuntu/
[2]: https://itsfoss.com/apt-command-guide/
[3]: https://wiki.debian.org/Apt
[4]: http://us.archive.ubuntu.com/ubuntu/
[5]: https://itsfoss.com/update-ubuntu/
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/03/ubuntu-repositories.png?resize=800%2C450&ssl=1
[7]: https://itsfoss.com/install-virtualbox-ubuntu/
[8]: https://itsfoss.com/ppa-guide/
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/03/enable-repositories-ubuntu.png?resize=800%2C490&ssl=1
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/03/enable-partner-repository-ubuntu.png?resize=800%2C490&ssl=1
[11]: https://packages.ubuntu.com
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/03/search-packages-ubuntu-archive.png?ssl=1
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/03/search-packages-ubuntu-archive-1.png?resize=800%2C454&ssl=1

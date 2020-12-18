[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Install RPM Files on Fedora Linux [Beginner’s Tutorial])
[#]: via: (https://itsfoss.com/install-rpm-files-fedora/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

How to Install RPM Files on Fedora Linux [Beginner’s Tutorial]
======

_**This beginner article explains how to install RPM packages on Fedora and Red Hat Linux. It also shows you how to remove those RPM packages afterwards.**_

When you start using Fedora Linux in the Red Hat domain, sooner or later, you’ll come across .rpm files. Like .exe files in Windows and .deb files in Ubuntu and Debian, .rpm files enable you to quickly install a software from it on [Fedora][1].

You could find and install plenty of software from the software center, specially [if you enable additional repositories in Fedora][2]. But sometimes you’ll find software available on their website in RPM format.

Like .exe files in Windows, you **download the .rpm file and double click on it to install it**. Don’t worry, I’ll show you the detailed steps.

### Installing RPM files on Fedora and Red Hat Linux

I’ll be showing you three ways to install RPM files:

  * [Install RPM files with software center][3] (GUI method)
  * [Install RPM files using DNF command][4] (CLI method)
  * [Install RPM files using Yum command][5] (CLI method for Red Hat)



#### Method 1: Use software center

The simplest method is to use the default software center in Fedora. It’s really simple. Go to the folder where you downloaded the .rpm file. It is usually the Downloads folder.

Just **double click on the RPM file and it will be opened in the software center**.

Alternatively, you can right click on the file and choose to install it via Software Center.

![Either double click or right click and choose Software Install][6]

When it is opened in the software center, you should see the installation option. Just hit the install button and enter your account’s password when prompted for it.

![Install RPM via Fedora Software Center][7]

It’s easy, right?

#### Method 2: Use DNF command to install RPM file

This is the command line method. Fedora uses the new DNF [package manager][8] and you can use it to install downloaded RPM files as well.

Open a terminal and switch to the directory where you have the RPM file downloaded. You can also provide the path to the RPM file. Use the DNF command like this:

```
sudo dnf install rpm_file_name
```

Here’s a screenshot where I installed [Google Chrome on Fedora with dnf command][9]:

![Installing RPM files using DNF command][10]

#### Method 3: Install RPM files in Red Hat using Yum command

Unlike Fedora, Red Hat still uses the good old Yum package manager. You won’t find the DNF command here, yet.

The process is the same as DNF command. You go to the directory where the RPM file is located or provide its path.

```
sudo yum install path_to_RPM_file
```

That’s it. Nothing fancier.

### How to remove RPM packages

Removing a RPM package isn’t a big deal either. And no, you don’t need the original rpm file that you used to install the program.

You may find the installed package in the software center and remove application from there.

![Removing RPM Package][11]

Alternatively, you can use the DNF or YUM command with `remove` option.

With DNF, use this command:

```
sudo dnf remove rpm_package_name
```

With Yum, use this command:

```
sudo yum remove rpm_package_name
```

You probably won’t remember the exact package name and that’s fine. What you can do is to type the first few letters of the package and then hit tab. This is assuming that you have tab completion enabled which usually is.

And that’s all you need to do here. Pretty simple, right? Being a beginner, you may struggle with a simple task like this and I hope you feel more confident with Fedora thanks to quick tutorials like this.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-rpm-files-fedora/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://getfedora.org/
[2]: https://itsfoss.com/fedora-third-party-repos/
[3]: tmp.TvkJtlRJ6T#gui-method
[4]: tmp.TvkJtlRJ6T#use-dnf
[5]: tmp.TvkJtlRJ6T#use-yum
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/12/installing-rpm-file-fedora.png?resize=800%2C449&ssl=1
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/12/install-rpm-fedora-software-center.jpg?resize=799%2C193&ssl=1
[8]: https://itsfoss.com/package-manager/
[9]: https://itsfoss.com/install-google-chrome-fedora/
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/12/install-rpm-using-dnf-install.jpg?resize=800%2C474&ssl=1
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/12/remove-rpm-package-fedora.jpg?resize=790%2C190&ssl=1

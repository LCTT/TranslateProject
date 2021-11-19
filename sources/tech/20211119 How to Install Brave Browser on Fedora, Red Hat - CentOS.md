[#]: subject: "How to Install Brave Browser on Fedora, Red Hat & CentOS"
[#]: via: "https://itsfoss.com/install-brave-browser-fedora/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Install Brave Browser on Fedora, Red Hat & CentOS
======

[Brave][1] is an increasingly [popular web browser for Linux][2] and other operating system. The focus on blocking ads and tracking by default along with Chrome extension support has made Brave a popular choice among Linux users.

In this tutorial, you’ll learn to install Brave on Fedora Linux. You’ll also learn about updating it and removing it.

The tutorial has been tested on Fedora but it should also be valid for other distributions in the Red Hat domain such as CentOS, Alma Linux and Rocky Linux.

### Install Brave browser on Fedora Linux

You’ll have to go to the command line way for installing Brave here.

As a prerequisite, please ensure that dnf-plugin-core is installed.

```

    sudo dnf install dnf-plugins-core

```

The next step is to add the Brave repository to your system:

```

    sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/

```

You should also import and add the repository key so that your system trusts the packages coming from this newly added repository:

```

    sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

```

![Adding Brave Browser repository in Fedora Linux][3]

You are all set to go now. Install Brave with this command:

```

    sudo dnf install brave-browser

```

**Press Y when asked to confirm** your choice. It should take a few seconds or a couple of minutes based on your internet speed. If the DNF cache was not updated recently, it may even take longer.

![Installing Brave Browser in Fedora][4]

Once the installation finishes, look for Brave in the system menu and start from there.

![Start Brave browser in Fedora Linux][5]

### Updating Brave browser on Fedora Linux

You have added a repository for the browser and also imported its key. Your system trusts the packages coming from this repository.

So, when there is a new Brave browser release and it is made available to this repository, you’ll get it through the regular system upgrades.

In other words, you don’t have to do anything special. Just keep your Fedora system updated and if there is a new version from Brave, it should be automatically installed with system updates.

### Removing Brave browser from Fedora Linux

![Brave Browser in Fedora Linux][6]

If you do not like Brave for some reasons, you can remove it from your system. Just use the dnf remove command:

```

    sudo dnf remove brave-browser

```

Press Y when asked:

![Removing Brave browser from Fedora Linux][7]

You may also choose to disable the brave-browser-rpm-release.s3.brave.com_x86_64_.repoor delete this file completely from the /etc/yum/repos.d. Though it’s not really mandatory.

I hope you find this quick tip helpful. If you have any questions or suggestions, please let me know.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-brave-browser-fedora/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://brave.com/
[2]: https://itsfoss.com/best-browsers-ubuntu-linux/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/adding-Brave-browser-repository-in-Fedora.png?resize=800%2C300&ssl=1
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/Installing-Brave-Browser-Fedora.png?resize=800%2C428&ssl=1
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/start-brave-fedora-linux.png?resize=759%2C219&ssl=1
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/Brave-Browser-in-Fedora-Linux.png?resize=800%2C530&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/removing-Brave-browser-Fedora-Linux.png?resize=800%2C399&ssl=1

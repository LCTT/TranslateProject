How to Install Git and Setup Git Account in RHEL, CentOS and Fedora
=========

For newbies, Git is a free and open source, fast and distributed version control system (VCS), which by design is based on speed, efficient performance and data integrity to support small-scale to extensive software development projects.

Git is a software repository that allows you to keep a track of your software changes, revert to previous version and create another versions of files and directories.

Git is written in C, with a mix of Perl and a variety of shell scripts, it’s primarily intended to run on the Linux kernel and has a number of remarkable features as listed below:

1.  Easy to learn
2.  It is fast and most of its operations are carried out locally, in addition, this offers it a tremendous speed on centralized systems that need to communicate with remote servers.
3.  Highly efficient
4.  Supports data integrity checks
5.  Enables cheap local branching
6.  Offers a convenient staging area
7.  It also maintains multiple work-flows together with many others

In this how-to guide, we shall move through the necessary steps of installing Git on CentOS/RHEL 7/6 and Fedora 20-24 Linux distributions along with how to configure Git so that you can start participating right away..

### Install Git Using Yum

We shall install Git from the system default repositories, and make sure that your system is up-to-date with the latest version of packages by running the [YUM package manager][8] update command below:

```
# yum update

```

Next, install Git by typing the following command:

```
# yum install git 

```

After git successfully installed, you can issue the following command to display the version of Git installed:

```
# git --version 

```

[![Check Git Installed Version](http://www.tecmint.com/wp-content/uploads/2016/10/Check-Git-Version.png)][7]

Check Git Installed Version

Important: Installing Git from default repositories will give you older version. If you looking to have a most recent version of Git, consider compiling from source using following instructions.

### Install Git from Source

Before you begin, first you need to install required software dependencies from the default repositories, along with the utilities that needed to build a binary from source:

```
# yum groupinstall "Development Tools"
# yum install gettext-devel openssl-devel perl-CPAN perl-devel zlib-devel

```

After you have installed required software dependencies, go to the official [Git release page][6] and grab the latest version and compile it from source using following series of command:

```
# wget https://github.com/git/git/archive/v2.10.1.tar.gz -O git.tar.gz
# tar -zxf git.tar.gz
# cd git-2.10.1/
# make configure
# ./configure --prefix=/usr/local
# make install
# git --version

```

[![Check Installed Git Version](http://www.tecmint.com/wp-content/uploads/2016/10/Check-Git-Source-Version.png)][5]

Check Installed Git Version

**Suggested Read:** [11 Best Git Clients and Git Repository Viewers for Linux][4]

### Set Up Git Account in Linux

In this section, we shall cover how to set up a Git account with correct user information such as name and email address to avoid any commit errors, and the `git config` command is used to do that.

Important: Make sure to replace username with the actual name for the Git user to be created and used on your system.

You can start by creating a Git user with the [useradd command][3] as below, where the `-m` flag used to create the user’s home directory under `/home` and `-s` specifies the user’s default shell.

```
# useradd -m -s /bin/bash username 
# passwd username

```

Now, add the new user to the wheel group to enable the account to use the `sudo` command:

```
# usermod username -aG wheel 

```

[![Create Git User Account](http://www.tecmint.com/wp-content/uploads/2016/10/Create-Git-User-Account.png)][2]

Create Git User Account

Then configure Git with the new user as follows:

```
# su username 
$ sudo git config --global user.name "Your Name"
$ sudo git config --global user.email "you@example.com"

```

Now verify Git configuration using following command.

```
$ sudo git config --list 

```

If there are no errors with the configurations, you should be able to view an output with the following details:

```
user.name=username
user.email= username@some-domian.com

```

[![Setup Git Account in Linux](http://www.tecmint.com/wp-content/uploads/2016/10/Setup-Git-Account.png)][1]
>Setup Git Account in Linux

##### Conclusion

In this simple tutorial, we have looked at how to install Git on your Linux system as well as configuring it. I believe the instructions are easy to follow, however, to get in touch with us for any questions or suggestions you can make use of the reaction section below.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/install-git-centos-fedora-redhat/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+tecmint+%28Tecmint%3A+Linux+Howto%27s+Guide%29

作者：[Aaron Kili ][a]

译者：[译者ID](https://github.com/译者ID)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/wp-content/uploads/2016/10/Setup-Git-Account.png
[2]:http://www.tecmint.com/wp-content/uploads/2016/10/Create-Git-User-Account.png
[3]:http://www.tecmint.com/add-users-in-linux/
[4]:http://www.tecmint.com/best-gui-git-clients-git-repository-viewers-for-linux/
[5]:http://www.tecmint.com/wp-content/uploads/2016/10/Check-Git-Source-Version.png
[6]:https://github.com/git/git/releases
[7]:http://www.tecmint.com/wp-content/uploads/2016/10/Check-Git-Version.png
[8]:http://www.tecmint.com/20-linux-yum-yellowdog-updater-modified-commands-for-package-mangement/

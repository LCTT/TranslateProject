Translating by GOLinux!
How to Convert From RPM to DEB and DEB to RPM Package Using Alien
================================================================================
As I’m sure you already know, there are plenty of ways to install software in Linux: using the package management system provided by your distribution ([aptitude, yum, or zypper][1], to name a few examples), compiling from source (though somewhat rare these days, it was the only method available during the early days of Linux), or utilizing a low level tool such as dpkg or rpm with .deb and .rpm standalone, precompiled packages, respectively.

![Convert RPM to DEB and DEB to RPM](http://www.tecmint.com/wp-content/uploads/2015/08/Convert-RPM-to-DEB-and-DEB-to-RPM.png)

Convert RPM to DEB and DEB to RPM Package Using Alien

In this article we will introduce you to alien, a tool that converts between different Linux package formats, with .rpm to .deb (and vice versa) being the most common usage.

This tool, even when its author is no longer maintaining it and states in his website that alien will always probably remain in experimental status, can come in handy if you need a certain type of package but can only find that program in another package format.

For example, alien saved my day once when I was looking for a .deb driver for a inkjet printer and couldn’t find any – the manufacturer only provided a .rpm package. I installed alien, converted the package, and before long I was able to use my printer without issues.

That said, we must clarify that this utility should not be used to replace important system files and libraries since they are set up differently across distributions. Only use alien as a last resort if the suggested installation methods at the beginning of this article are out of the question for the required program.

Last but not least, we must note that even though we will use CentOS and Debian in this article, alien is also known to work in Slackware and even in Solaris, besides the first two distributions and their respective families.

### Step 1: Installing Alien and Dependencies ###

To install alien in CentOS/RHEL 7, you will need to enable the EPEL and the Nux Dextop (yes, it’s Dextop – not Desktop) repositories, in that order:

    # yum install epel-release
    # rpm --import http://li.nux.ro/download/nux/RPM-GPG-KEY-nux.ro

The latest version of the package that enables this repository is currently 0.5 (published on Aug. 10, 2015). You should check [http://li.nux.ro/download/nux/dextop/el7/x86_64/][2] to see whether there’s a newer version before proceeding further:

    # rpm -Uvh http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm

then do,

    # yum update && yum install alien

In Fedora, you will only need to run the last command.

In Debian and derivatives, simply do:

    # aptitude install alien

### Step 2: Converting from .deb to .rpm Package ###

For this test we have chosen dateutils, which provides a set of date and time utilities to deal with large amounts of financial data. We will download the .deb package to our CentOS 7 box, convert it to .rpm and install it:

![Check CentOS Version](http://www.tecmint.com/wp-content/uploads/2015/08/Check-Linux-OS-Version.png)

Check CentOS Version

    # cat /etc/centos-release
    # wget http://ftp.us.debian.org/debian/pool/main/d/dateutils/dateutils_0.3.1-1.1_amd64.deb
    # alien --to-rpm --scripts dateutils_0.3.1-1.1_amd64.deb

![Convert .deb to .rpm package in Linux](http://www.tecmint.com/wp-content/uploads/2015/08/Convert-deb-to-rpm-package.png)

Convert .deb to .rpm package in Linux

**Important**: (Please note how, by default, alien increases the version minor number of the target package. If you want to override this behavior, add the –keep-version flag).

If we try to install the package right away, we will run into a slight issue:

    # rpm -Uvh dateutils-0.3.1-2.1.x86_64.rpm 

![Install RPM Package](http://www.tecmint.com/wp-content/uploads/2015/08/Install-RPM-Package.png)

Install RPM Package

To solve this issue, we will enable the epel-testing repository and install the rpmrebuild utility to edit the settings of the package to be rebuilt:

    # yum --enablerepo=epel-testing install rpmrebuild

Then run,

    # rpmrebuild -pe dateutils-0.3.1-2.1.x86_64.rpm

Which will open up your default text editor. Go to the `%files` section and delete the lines that refer to the directories mentioned in the error message, then save the file and exit:

![Convert .deb to Alien Version](http://www.tecmint.com/wp-content/uploads/2015/08/Convert-Deb-Package-to-Alien-Version.png)

Convert .deb to Alien Version

When you exit the file you will be prompted to continue with the rebuild. If you choose Y, the file will be rebuilt into the specified directory (different than the current working directory):

    # rpmrebuild –pe dateutils-0.3.1-2.1.x86_64.rpm

![Build RPM Package](http://www.tecmint.com/wp-content/uploads/2015/08/Build-RPM-Package.png)

Build RPM Package

Now you can proceed to install the package and verify as usual:

    # rpm -Uvh /root/rpmbuild/RPMS/x86_64/dateutils-0.3.1-2.1.x86_64.rpm
    # rpm -qa | grep dateutils

![Install Build RPM Package](http://www.tecmint.com/wp-content/uploads/2015/08/Install-Build-RPM-Package.png)

Install Build RPM Package

Finally, you can list the individual tools that were included with dateutils and alternatively check their respective man pages:

    # ls -l /usr/bin | grep dateutils

![Verify Installed RPM Package](http://www.tecmint.com/wp-content/uploads/2015/08/Verify-Installed-Package.png)

Verify Installed RPM Package

### Step 3: Converting from .rpm to .deb Package ###

In this section we will illustrate how to convert from .rpm to .deb. In a 32-bit Debian Wheezy box, let’s download the .rpm package for the zsh shell from the CentOS 6 OS repository. Note that this shell is not available by default in Debian and derivatives.

    # cat /etc/shells
    # lsb_release -a | tail -n 4

![Check Shell and Debian OS Version](http://www.tecmint.com/wp-content/uploads/2015/08/Check-Shell-Debian-OS-Version.png)

Check Shell and Debian OS Version

    # wget http://mirror.centos.org/centos/6/os/i386/Packages/zsh-4.3.11-4.el6.centos.i686.rpm
    # alien --to-deb --scripts zsh-4.3.11-4.el6.centos.i686.rpm

You can safely disregard the messages about a missing signature:

![Convert .rpm to .deb Package](http://www.tecmint.com/wp-content/uploads/2015/08/Convert-rpm-to-deb-Package.png)

Convert .rpm to .deb Package

After a few moments, the .deb file should have been generated and be ready to install:

    # dpkg -i zsh_4.3.11-5_i386.deb

![Install RPM Converted Deb Package](http://www.tecmint.com/wp-content/uploads/2015/08/Install-Deb-Package.png)

Install RPM Converted Deb Package

After the installation, you can verify that zsh is added to the list of valid shells:

    # cat /etc/shells

![Confirm Installed Zsh Package](http://www.tecmint.com/wp-content/uploads/2015/08/Confirm-Installed-Package.png)

Confirm Installed Zsh Package

### Summary ###

In this article we have explained how to convert from .rpm to .deb and vice versa to install packages as a last resort when such programs are not available in the repositories or as distributable source code. You will want to bookmark this article because all of us will need alien at one time or another.

Feel free to share your thoughts about this article using the form below.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/convert-from-rpm-to-deb-and-deb-to-rpm-package-using-alien/

作者：[Gabriel Cánepa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:http://www.tecmint.com/linux-package-management/
[2]:http://li.nux.ro/download/nux/dextop/el7/x86_64/

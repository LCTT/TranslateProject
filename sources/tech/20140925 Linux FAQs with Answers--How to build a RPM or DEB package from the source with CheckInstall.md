Linux FAQs with Answers--How to build a RPM or DEB package from the source with CheckInstall
================================================================================
> **Question**: I would like to install a software program by building it from the source. Is there a way to build and install a package from the source, instead of running "make install"? That way, I could uninstall the program easily later if I want to. 

If you have installed a Linux program from its source by running "make install", it becomes really tricky to remove it completely, unless the author of the program provides an uninstall target in the Makefile. You will have to compare the complete list of files in your system before and after installing the program from source, and manually remove all the files that were added during the installation.

That is when CheckInstall can come in handy. CheckInstall keeps track of all the files created or modified by an install command line (e.g., "make install" "make install_modules", etc.), and builds a standard binary package, giving you the ability to install or uninstall it with your distribution's standard package management system (e.g., yum for Red Hat or apt-get for Debian). It has been also known to work with Slackware, SuSe, Mandrake and Gentoo as well, as per the [official documentation][1].

In this post, we will only focus on Red Hat and Debian based distributions, and show how to build a RPM or DEB package from the source using CheckInstall.

### Installing CheckInstall on Linux ###

To install CheckInstall on Debian derivatives:

    # aptitude install checkinstall 

To install CheckInstall on Red Hat-based distributions, you will need to download a pre-built .rpm of CheckInstall (e.g., searchable from [http://rpm.pbone.net][2]), as it has been removed from the Repoforge repository. The .rpm package for CentOS 6 works in CentOS 7 as well.

    # wget ftp://ftp.pbone.net/mirror/ftp5.gwdg.de/pub/opensuse/repositories/home:/ikoinoba/CentOS_CentOS-6/x86_64/checkinstall-1.6.2-3.el6.1.x86_64.rpm
    # yum install checkinstall-1.6.2-3.el6.1.x86_64.rpm 

Once checkinstall is installed, you can use the following format to build a package for particular software.

    # checkinstall <install-command> 

Without <install-command> argument, the default install command "make install" will be used.

### Build a RPM or DEB Pacakge with CheckInstall ###

In this example, we will build a package for [htop][3], an interactive text-mode process viewer for Linux (like top on steroids). 

First, let's download the source code from the official website of the project. As a best practice, we will store the tarball in /usr/local/src, and untar it.

    # cd /usr/local/src
    # wget http://hisham.hm/htop/releases/1.0.3/htop-1.0.3.tar.gz
    # tar xzf htop-1.0.3.tar.gz
    # cd htop-1.0.3 

Let's find out the install command for htop, so that we can invoke checkinstall with the command. As shown below, htop is installed with 'make install' command.

    # ./configure
    # make install 

Therefore, to build a htop package, we can invoke checkinstall without any argument, which will then use 'make install' command to build a package. Along the process, the checkinstall command will ask you a series of questions.

In short, here are the commands to build a package for **htop**:

    # ./configure
    # checkinstall 

Answer 'y' to "Should I create a default set of package docs?":

![](https://farm6.staticflickr.com/5577/15118597217_1fdd0e0346_z.jpg)

You can enter a brief description of the package, then press Enter twice:

![](https://farm4.staticflickr.com/3898/15118442190_604b71d9af.jpg)

Enter a number to modify any of the following values or Enter to proceed:

![](https://farm4.staticflickr.com/3898/15118442180_428de59d68_z.jpg)

Then checkinstall will create a .rpm or a .deb package automatically, depending on what your Linux system is:

On CentOS 7:

![](https://farm4.staticflickr.com/3921/15282103066_5d688b2217_z.jpg)

On Debian 7:

![](https://farm4.staticflickr.com/3905/15118383009_4909a7c17b_z.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/build-rpm-deb-package-source-checkinstall.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://checkinstall.izto.org/docs/README
[2]:http://rpm.pbone.net/
[3]:http://ask.xmodulo.com/install-htop-centos-rhel.html
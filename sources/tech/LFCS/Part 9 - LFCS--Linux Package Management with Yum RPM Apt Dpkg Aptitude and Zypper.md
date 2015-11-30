Flowsnow translating...
Part 9 - LFCS: Linux Package Management with Yum, RPM, Apt, Dpkg, Aptitude and Zypper
================================================================================
Last August, the Linux Foundation announced the LFCS certification (Linux Foundation Certified Sysadmin), a shiny chance for system administrators everywhere to demonstrate, through a performance-based exam, that they are capable of succeeding at overall operational support for Linux systems. A Linux Foundation Certified Sysadmin has the expertise to ensure effective system support, first-level troubleshooting and monitoring, including finally issue escalation, when needed, to engineering support teams.

![Linux Package Management](http://www.tecmint.com/wp-content/uploads/2014/11/lfcs-Part-9.png)

Linux Foundation Certified Sysadmin – Part 9

Watch the following video that explains about the Linux Foundation Certification Program.

注：youtube 视频
<iframe width="720" height="405" frameborder="0" allowfullscreen="allowfullscreen" src="//www.youtube.com/embed/Y29qZ71Kicg"></iframe>

This article is a Part 9 of 10-tutorial long series, today in this article we will guide you about Linux Package Management, that are required for the LFCS certification exam.

### Package Management ###

In few words, package management is a method of installing and maintaining (which includes updating and probably removing as well) software on the system.

In the early days of Linux, programs were only distributed as source code, along with the required man pages, the necessary configuration files, and more. Nowadays, most Linux distributors use by default pre-built programs or sets of programs called packages, which are presented to users ready for installation on that distribution. However, one of the wonders of Linux is still the possibility to obtain source code of a program to be studied, improved, and compiled.

**How package management systems work**

If a certain package requires a certain resource such as a shared library, or another package, it is said to have a dependency. All modern package management systems provide some method of dependency resolution to ensure that when a package is installed, all of its dependencies are installed as well.

**Packaging Systems**

Almost all the software that is installed on a modern Linux system will be found on the Internet. It can either be provided by the distribution vendor through central repositories (which can contain several thousands of packages, each of which has been specifically built, tested, and maintained for the distribution) or be available in source code that can be downloaded and installed manually.

Because different distribution families use different packaging systems (Debian: *.deb / CentOS: *.rpm / openSUSE: *.rpm built specially for openSUSE), a package intended for one distribution will not be compatible with another distribution. However, most distributions are likely to fall into one of the three distribution families covered by the LFCS certification.

**High and low-level package tools**

In order to perform the task of package management effectively, you need to be aware that you will have two types of available utilities: low-level tools (which handle in the backend the actual installation, upgrade, and removal of package files), and high-level tools (which are in charge of ensuring that the tasks of dependency resolution and metadata searching -”data about the data”- are performed).

注：表格

<table cellspacing="0" border="0">
  <colgroup width="200">
  </colgroup>
  <colgroup width="200">
  </colgroup>
  <colgroup width="200">
  </colgroup>
  <tbody>
    <tr>
      <td bgcolor="#AEA79F" align="CENTER" height="18" style="border: 1px solid #000001;"><b><span style="color: black;">DISTRIBUTION</span></b></td>
      <td bgcolor="#AEA79F" align="CENTER" style="border: 1px solid #000001;"><b><span style="color: black;">LOW-LEVEL TOOL</span></b></td>
      <td bgcolor="#AEA79F" align="CENTER" style="border: 1px solid #000001;"><b><span style="color: black;">HIGH-LEVEL TOOL</span></b></td>
    </tr>
    <tr class="alt">
      <td bgcolor="#FFFFFF" align="LEFT" height="18" style="border: 1px solid #000001;"><span style="color: black;">&nbsp;Debian and derivatives</span></td>
      <td bgcolor="#FFFFFF" align="LEFT" style="border: 1px solid #000001;"><span style="color: black;">&nbsp;dpkg</span></td>
      <td bgcolor="#FFFFFF" align="LEFT" style="border: 1px solid #000001;"><span style="color: black;">&nbsp;apt-get / aptitude</span></td>
    </tr>
    <tr>
      <td bgcolor="#FFFFFF" align="LEFT" height="18" style="border: 1px solid #000001;"><span style="color: black;">&nbsp;CentOS</span></td>
      <td bgcolor="#FFFFFF" align="LEFT" style="border: 1px solid #000001;"><span style="color: black;">&nbsp;rpm</span></td>
      <td bgcolor="#FFFFFF" align="LEFT" style="border: 1px solid #000001;"><span style="color: black;">&nbsp;yum</span></td>
    </tr>
    <tr class="alt">
      <td bgcolor="#FFFFFF" align="LEFT" height="18" style="border: 1px solid #000001;"><span style="color: black;">&nbsp;openSUSE</span></td>
      <td bgcolor="#FFFFFF" align="LEFT" style="border: 1px solid #000001;"><span style="color: black;">&nbsp;rpm</span></td>
      <td bgcolor="#FFFFFF" align="LEFT" style="border: 1px solid #000001;"><span style="color: black;">&nbsp;zypper</span></td>
    </tr>
  </tbody>
</table>

Let us see the descrption of the low-level and high-level tools.

dpkg is a low-level package manager for Debian-based systems. It can install, remove, provide information about and build *.deb packages but it can’t automatically download and install their corresponding dependencies.

- Read More: [15 dpkg Command Examples][1]

apt-get is a high-level package manager for Debian and derivatives, and provides a simple way to retrieve and install packages, including dependency resolution, from multiple sources using the command line. Unlike dpkg, apt-get does not work directly with *.deb files, but with the package proper name.

- Read More: [25 apt-get Command Examples][2]

aptitude is another high-level package manager for Debian-based systems, and can be used to perform management tasks (installing, upgrading, and removing packages, also handling dependency resolution automatically) in a fast and easy way. It provides the same functionality as apt-get and additional ones, such as offering access to several versions of a package.

rpm is the package management system used by Linux Standard Base (LSB)-compliant distributions for low-level handling of packages. Just like dpkg, it can query, install, verify, upgrade, and remove packages, and is more frequently used by Fedora-based distributions, such as RHEL and CentOS.

- Read More: [20 rpm Command Examples][3]

yum adds the functionality of automatic updates and package management with dependency management to RPM-based systems. As a high-level tool, like apt-get or aptitude, yum works with repositories.

- Read More: [20 yum Command Examples][4]
-
### Common Usage of Low-Level Tools ###

The most frequent tasks that you will do with low level tools are as follows:

**1. Installing a package from a compiled (*.deb or *.rpm) file**

The downside of this installation method is that no dependency resolution is provided. You will most likely choose to install a package from a compiled file when such package is not available in the distribution’s repositories and therefore cannot be downloaded and installed through a high-level tool. Since low-level tools do not perform dependency resolution, they will exit with an error if we try to install a package with unmet dependencies.

    # dpkg -i file.deb 		[Debian and derivative]
    # rpm -i file.rpm 		[CentOS / openSUSE]

**Note**: Do not attempt to install on CentOS a *.rpm file that was built for openSUSE, or vice-versa!

**2. Upgrading a package from a compiled file**

Again, you will only upgrade an installed package manually when it is not available in the central repositories.

    # dpkg -i file.deb 		[Debian and derivative]
    # rpm -U file.rpm 		[CentOS / openSUSE]

**3. Listing installed packages**

When you first get your hands on an already working system, chances are you’ll want to know what packages are installed.

    # dpkg -l 		[Debian and derivative]
    # rpm -qa 		[CentOS / openSUSE]

If you want to know whether a specific package is installed, you can pipe the output of the above commands to grep, as explained in [manipulate files in Linux – Part 1][6] of this series. Suppose we need to verify if package mysql-common is installed on an Ubuntu system.

    # dpkg -l | grep mysql-common

![Check Installed Packages in Linux](http://www.tecmint.com/wp-content/uploads/2014/11/Check-Installed-Package.png)

Check Installed Packages

Another way to determine if a package is installed.

    # dpkg --status package_name 		[Debian and derivative]
    # rpm -q package_name 			[CentOS / openSUSE]

For example, let’s find out whether package sysdig is installed on our system.

    # rpm -qa | grep sysdig

![Check sysdig Package](http://www.tecmint.com/wp-content/uploads/2014/11/Check-sysdig-Package.png)

Check sysdig Package

**4. Finding out which package installed a file**

    # dpkg --search file_name
    # rpm -qf file_name

For example, which package installed pw_dict.hwm?

    # rpm -qf /usr/share/cracklib/pw_dict.hwm

![Query File in Linux](http://www.tecmint.com/wp-content/uploads/2014/11/Query-File-in-Linux.png)

Query File in Linux

### Common Usage of High-Level Tools ###

The most frequent tasks that you will do with high level tools are as follows.

**1. Searching for a package**

aptitude update will update the list of available packages, and aptitude search will perform the actual search for package_name.

    # aptitude update && aptitude search package_name

In the search all option, yum will search for package_name not only in package names, but also in package descriptions.

    # yum search package_name
    # yum search all package_name
    # yum whatprovides “*/package_name”

Let’s supposed we need a file whose name is sysdig. To know that package we will have to install, let’s run.

    # yum whatprovides “*/sysdig”

![Check Package Description in Linux](http://www.tecmint.com/wp-content/uploads/2014/11/Check-Package-Description.png)

Check Package Description

whatprovides tells yum to search the package the will provide a file that matches the above regular expression.

    # zypper refresh && zypper search package_name		[On openSUSE]

**2. Installing a package from a repository**

While installing a package, you may be prompted to confirm the installation after the package manager has resolved all dependencies. Note that running update or refresh (according to the package manager being used) is not strictly necessary, but keeping installed packages up to date is a good sysadmin practice for security and dependency reasons.

    # aptitude update && aptitude install package_name 		[Debian and derivatives]
    # yum update && yum install package_name 			[CentOS]
    # zypper refresh && zypper install package_name 		[openSUSE]

**3. Removing a package**

The option remove will uninstall the package but leaving configuration files intact, whereas purge will erase every trace of the program from your system.
# aptitude remove / purge package_name
# yum erase package_name

    ---Notice the minus sign in front of the package that will be uninstalled, openSUSE ---

    # zypper remove -package_name

Most (if not all) package managers will prompt you, by default, if you’re sure about proceeding with the uninstallation before actually performing it. So read the onscreen messages carefully to avoid running into unnecessary trouble!

**4. Displaying information about a package**

The following command will display information about the birthday package.

    # aptitude show birthday
    # yum info birthday
    # zypper info birthday

![Check Package Information in Linux](http://www.tecmint.com/wp-content/uploads/2014/11/Check-Package-Information.png)

Check Package Information

### Summary ###

Package management is something you just can’t sweep under the rug as a system administrator. You should be prepared to use the tools described in this article at a moment’s notice. Hope you find it useful in your preparation for the LFCS exam and for your daily tasks. Feel free to leave your comments or questions below. We will be more than glad to get back to you as soon as possible.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/linux-package-management/

作者：[Gabriel Cánepa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:http://www.tecmint.com/dpkg-command-examples/
[2]:http://www.tecmint.com/useful-basic-commands-of-apt-get-and-apt-cache-for-package-management/
[3]:http://www.tecmint.com/20-practical-examples-of-rpm-commands-in-linux/
[4]:http://www.tecmint.com/20-linux-yum-yellowdog-updater-modified-commands-for-package-mangement/
[5]:http://www.tecmint.com/sed-command-to-create-edit-and-manipulate-files-in-linux/

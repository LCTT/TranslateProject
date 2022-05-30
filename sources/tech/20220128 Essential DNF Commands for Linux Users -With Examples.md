[#]: subject: "Essential DNF Commands for Linux Users [With Examples]"
[#]: via: "https://www.debugpoint.com/2022/01/dnf-commands-examples/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Essential DNF Commands for Linux Users [With Examples]
======
We give you a quick reference of essential dnf commands with examples in this guide.

### What is DNF?

DNF (Dandified Yum) is a package manager used in RPM based Linux systems (RHEL, [Fedora][1], etc.). It is a successor of Yum package manager (Yellowdog Update Modified). The DNF package manager is efficient on performance, memory consumption and dependency resolution issues.

This package manager is one of the best package manager other than apt package manager which is used in Ubuntu based systems. If you compare them, well, they are both awesome and have all the identical features.

But with my experience, I feel that DNF fails lesser than apt in tricky situations. DNF handles package, dependency crisis in much better and differently. But that’s completely personal opinion.

### In Brief

In case, you reached this page in a hurry and no time to read the entire article, here’s a quick summary of this entire page with commands in this below table, with link to the detail section of this page.

**Description** | **Command**
---|---
[Check the version of DNF installed in your systems][2] | dnf –version
[Help about DNF][3] | dnf help
dnf help search
[List of Installed and Available Packages][4] | dnf list
dnf list available
dnf list installed
[Repository list][5] | dnf repolist
dnf repolist all
[Display specific information about a package][6] | dnf info package_name
[Search for any package and details about it][7] | dnf search package_name
[Find which package contains a package, value][8] | dnf provides package_name
[Installing packages using DNF][9] | dnf install package_name
[Installing a package that you downloaded manually][10] | dnf localinstall your_package_name.rpm
[Reinstalling a package][11] | dnf reinstall package_name
[Update Check and Updating your system][12] | dnf check-update
dnf list updates
dnf update
dnf update package_name
[Downgrading a package][13] | dnf downgrade package_name
[Downgrade or upgrade all packages][14] | dnf distro-sync
[Uninstall a package][15] | dnf remove application_name
[Group operations using DNF][16] | dnf grouplist
dnf groupinstall group_name
dnf groupremove group_name
[Clean up your system using DNF][17] | dnf clean all
dnf autoremove
[Find out DNF command execution history][18] | dnf history
dnf history info id_number

Now, let’s look at the above DNF commands with examples.

### DNF Commands Examples

#### Installing DNF

This might be the rare scenario when DNF is not installed in an applicable Linux system. But if DNF is not installed in your RPM based distribution, you can use Yum to install DNF.

```
    yum install dnf
```

#### 1. Check the version of DNF installed in your systems

The following command shows the version included in your Linux system.

```
    dnf --version
```

#### 2. Getting the help about DNF

You can easily get all the necessary DNF options and command line switches using the help option.

```
    dnf help
```

For a specific help, say, about installation for example, you can pass the parameter as below to show that piece of help.

```
    dnf help search
```

#### 3. List of Installed and Available Packages

The dnf list command gives you the list of installed and available packages. A little caution. This command may take some to execute, depending on your system state, and internet connection. Because it fetches the metadata from server.

```
    dnf list
```

If you want a more specific list, you can use the available or installed switch to filter out the list. See below.

```
    dnf list available
```

For installed list, use the below command.

```
    dnf list installed
```

![dnf installed packages][19]

#### 4. Repository list using DNF

There are times you want to see the list of enabled repositories in your Linux systems. With the dnf repolist command, you can achieve that.

```
    dnf repolist
```

So, this command gives you all the enabled repo. If you want the disabled ones as well, try below command.

```
    dnf repolist all
```

![Repo list using DNF][20]

#### 5. Display specific information about a package

There are times when you need to find out details about a package. So, you can easily find that out using the below command.

```
    dnf info package_name
```

![Information about a specific package using DNF][21]

#### 6. Search for any package and details about it

Use the following search command to find any package and their source. Replace package_name with your own. As you can see in this below example, it highlights the package and their source. It gives you the result in two sections – when name is exactly matched and also in summary/description.

```
    dnf search package_name
```

![Search for any package using DNF][22]

#### 7. Find which package contains a package, value

Sometimes, you require finding out which packages or sources contains a particular executable or package name. Then the dnf provides command helps. For example, you want to find out which sources contain ifconfig, then you can find it out like below example. This is one of the best feature of dnf while researching dependency problems.

```
    dnf provides package_name
```

![dnf provides command example][23]

#### 8. Installing packages using DNF

Probably the most used command is dnf install which helps to install an application or package. The command is simple.

```
    dnf install package_name
```

If you want to install from a specific repo, you can use the –enablerepo switch while issuing this command.

```
    dnf --enablerepo=epel install phpmyadmin
```

#### 9. Installing a package that you downloaded manually

There are times, when you manually downloaded a .rpm package locally. And you want to install. You can install the same using localinstall command with .rpm file full qualified path.

```
    dnf localinstall your_package_name.rpm
```

[][24]

The above command should resolve all the dependencies while installing a target .rpm package. If not, one can issue the following command.

```
    dnf --nogpgcheck localinstall your_package_name.rpm
```

Another way to install a local .rpm package is using the dnf install command.

```
    dnf install *.rpm
```

#### 10. Reinstalling a package

Reinstalling a package is simple using the reinstallation switch of DNF.

```
    dnf reinstall package_name
```

#### 11. Update Check and Updating your system

In an RPM based system (such as Fedora, Red Hat Linux, etc.), update is primarily handled by DNF package manager. The following four commands take care of various update scenarios, as explained below.

The check-update option checks for all the update available for your system. This option also takes a package name in its parameter. However, if no package name is specified, then it checks for updates for all installed packages in your system.

```
    dnf check-update
```

To list out all the updates in your Linux system, use the list option.

```
    dnf list updates
```

And to install updates for your entire Linux system, issue the update option.

```
    dnf update
```

You can also update a specific application or package by mentioning the package name as parameter to the update option.

```
    dnf update package_name
```

#### 12. Downgrading a package

If you need to downgrade a package to its prior version, then you can use the downgrade option of DNF. Be very careful while issuing this command. This command erases the current version of a package and install the highest of all the prior lower version available.

```
    dnf downgrade package_name
```

![Downgrading a package using DNF][25]

#### 13. Downgrade or upgrade all packages

The distro-sync command downgrade or upgrade all packages to the latest versions for your system enabled repos.

```
    dnf distro-sync
```

#### 14. Uninstall a package

You can uninstall or remove any application or package using remove option of DNF.

```
    dnf remove application_name
```

#### 15. Group operations using DNF

One of the great feature of RPM based system is grouping of packages. A group is a collection of packages logically grouped together. It helps to install them all at one go by issuing a single command with group name.

The grouplist command gives you the name of available groups.

```
    dnf grouplist
```

![DNF grouplist command][26]

And to install a group with all packages of it, use groupinstall option with the group name.

```
    dnf groupinstall group_name
```

Remove a group and all the packages using the groupremove option.

```
    dnf groupremove group_name
```

#### 16. Clean up your system using DNF

To remove all the temporary files for enabled repos in your system, use the clean option with all switch.

```
    dnf clean all
```

If you want to remove a specific temporary file, use the various options as outlined below.

Removes cache files for repo metadata.

```
    dnf clean dbcache
```

Remove the local cookie files that contains download time signature of the packages for each repo.

```
    dnf clean expire-cache
```

Removes all the repo metadata.

```
    dnf clean metadata
```

Removes any cached packages.

```
    dnf clean packages
```

Over time, a system consumes many applications and packages installed by the user. The following autoremove option removes all the leaf packages that are installed as dependencies for any user installed applications but no longer needed. So, they can be safely removed to recover disk space.

```
    dnf autoremove
```

![Clean up your system using DNF][27]

#### 17. Find out DNF command execution history

If you want a list of all commands that has run using DNF since the beginning of a Linux system, then use the history option. This lists all the commands that issued until now.

```
    dnf history
```

To view more details about a specific history, use the info option with the ID number, as shown in the above list. This is one of the amazing feature of DNF, where you can exactly find out what happened on that particular DNF command. It contains the start and end time, who ran it, what are the packages installed, updated, etc.

```
    dnf history info id_number
```

![DNF history command examples][28]

### Closing Notes

I am sure, you know already about most of the above DNF commands that explained with examples. But hey, a ready reference of DNF commands is always needed when things go wrong. So, I hope this DNF commands with examples guide helps you find out the DNF command which you are looking for, and eventually resolve your problem.

Let me know whether this helps, or, any command you would like to add in this list.

_[Official DNF Command reference][29]_

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/01/dnf-commands-examples/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/tag/fedora
[2]: tmp.PKOlKcPzZd#1-check-the-version-of-dnf-installed-in-your-systems
[3]: tmp.PKOlKcPzZd#2-getting-the-help-about-dnf
[4]: tmp.PKOlKcPzZd#3-list-of-installed-and-available-packages
[5]: tmp.PKOlKcPzZd#4-repository-list-using-dnf
[6]: tmp.PKOlKcPzZd#5-display-specific-information-about-a-package
[7]: tmp.PKOlKcPzZd#6-search-for-any-package-and-details-about-it
[8]: tmp.PKOlKcPzZd#7-find-which-package-contains-a-package-value
[9]: tmp.PKOlKcPzZd#8-installing-packages-using-dnf
[10]: tmp.PKOlKcPzZd#9-installing-a-package-that-you-downloaded-manually
[11]: tmp.PKOlKcPzZd#10-reinstalling-a-package
[12]: tmp.PKOlKcPzZd#11-update-check-and-updating-your-system
[13]: tmp.PKOlKcPzZd#12-downgrading-a-package
[14]: tmp.PKOlKcPzZd#13-downgrade-or-upgrade-all-packages
[15]: tmp.PKOlKcPzZd#14-uninstall-a-package
[16]: tmp.PKOlKcPzZd#15-group-operations-using-dnf
[17]: tmp.PKOlKcPzZd#16-clean-up-your-system-using-dnf
[18]: tmp.PKOlKcPzZd#17-find-out-dnf-command-execution-history
[19]: https://www.debugpoint.com/wp-content/uploads/2022/01/dnf-installed-packages-1024x549.jpg
[20]: https://www.debugpoint.com/wp-content/uploads/2022/01/Repo-list-using-DNF-1024x549.jpg
[21]: https://www.debugpoint.com/wp-content/uploads/2022/01/Information-about-a-specific-package-using-DNF-1024x481.jpg
[22]: https://www.debugpoint.com/wp-content/uploads/2022/01/Search-for-any-package-using-DNF-1024x481.jpg
[23]: https://www.debugpoint.com/wp-content/uploads/2022/01/dnf-provides-command-example-1024x290.jpg
[24]: https://www.debugpoint.com/2020/08/how-to-switch-desktop-environment-in-fedora/
[25]: https://www.debugpoint.com/wp-content/uploads/2022/01/Downgrading-a-package-using-DNF-1024x412.jpg
[26]: https://www.debugpoint.com/wp-content/uploads/2022/01/DNF-grouplist-command-1024x541.jpg
[27]: https://www.debugpoint.com/wp-content/uploads/2022/01/Clean-up-your-system-using-DNF-1024x216.jpg
[28]: https://www.debugpoint.com/wp-content/uploads/2022/01/DNF-history-command-examples-1024x711.jpg
[29]: https://dnf.readthedocs.io/en/latest/command_ref.html

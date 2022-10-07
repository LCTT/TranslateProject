[#]: subject: "Essential DNF Commands for Linux Users [With Examples]"
[#]: via: "https://www.debugpoint.com/dnf-commands-examples/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Essential DNF Commands for Linux Users [With Examples]
======
We give you a quick reference of essential DNF commands with examples in this guide.

### What is DNF ?

DNF (Dandified Yum) is a package manager used in RPM-based Linux systems (RHEL, Fedora, etc.). It is a successor of the Yum package manager (Yellowdog Update Modified). The DNF package manager is efficient in performance, memory consumption and dependency resolution issues.

This package manager is one of the best package managers other than apt package manager, which is used in Ubuntu-based systems. If you compare them, well, they are both awesome and have all the identical features.

But with my experience, I feel that DNF fails lesser than apt in tricky situations. DNF handles package dependency crisis much better and differently. But that’s entirely my personal opinion.

### In Brief

In case you reached this page in a hurry and have no time to read the entire article, here’s a quick summary of this page with commands in the below table, with a link to the detail section.

| Description | Command | 
| :- | :- |
| Check the version of DNF installed in your systems | dnf –version | 
| Help about DNF | dnf helpdnf help search | 
| List of Installed and Available Packages | dnf listdnf list availablednf list installed | 
| Repository list | dnf repolistdnf repolist all | 
| Display specific information about a package | dnf info package_name | 
| Search for any package and details about it | dnf search package_name | 
| Find which package contains a package, value | dnf provides package_name | 
| Installing packages using DNF | dnf install package_name | 
| Installing a package that you downloaded manually | dnf localinstall your_package_name.rpm | 
| Reinstalling a package | dnf reinstall package_name | 
| Update Check and Updating your system | dnf check-updatednf list updatesdnf updatednf update package_name | 
| Downgrading a package | dnf downgrade package_name | 
| Downgrade or upgrade all packages | dnf distro-sync | 
| Uninstall a package | dnf remove application_name | 
| Group operations using DNF | dnf grouplistdnf groupinstall group_namednf groupremove group_name | 
| Clean up your system using DNF | dnf clean alldnf autoremove | 
| Find out DNF command execution history | dnf historydnf history info id_number |

Now, let’s look at the above DNF commands with examples.

### DNF Commands Examples

#### Installing DNF

This might be the rare scenario when DNF is not installed in an applicable Linux system. But if DNF is not installed in your RPM-based distribution, you can use Yum to install DNF.

```
yum install dnf
```

#### 1. Check the version of DNF installed in your systems

The following command shows the version included in your Linux system.

```
dnf --version
```

#### 2. Getting help with DNF

You can easily get all the necessary DNF options and command line switches using the help option.

```
dnf help
```

For specific help, say, about installation, for example, you can pass the parameter below to show that piece of help.

```
dnf help search
```

#### 3. List of Installed and Available Packages

The dnf list command gives you the list of installed and available packages. A little caution. Depending on your system state and internet connection, this command may take some time to execute. Because it fetches the metadata from the server.

```
dnf list
```

If you want a more specific list, you can use the available or installed switch to filter out the list. See below.

```
dnf list available
```

For the installed list, use the below command.

```
dnf list installed
```

![dnf installed packages][1]

#### 4. Repository list using DNF

Sometimes you want to see the list of enabled repositories in your Linux systems. With the `dnf repolist` command, you can achieve that.

```
dnf repolist
```

So, this command gives you all the enabled repo. If you want the disabled ones as well, try below command.

```
dnf repolist all
```

![Repo list using DNF][2]

#### 5. Display specific information about a package

There are times when you need to find out details about a package. So, you can easily find that out using the below command.

```
dnf info package_name
```

![Information about a specific package using DNF][3]

#### 6. Search for any package and details about it

Use the following search command to find any package and its source. Replace `package_name` with your own. As you can see in the below example, it highlights the package and its source. It gives you the result in two sections – when the name is precisely matched and also in the summary/description.

```
dnf search package_name
```

![Search for any package using DNF][4]

#### 7. Find which package contains a package or value

Sometimes, you require finding out which packages or sources contains a particular executable or package name. Then the dnf provides command helps.

For example, if you want to find out which sources contain ifconfig, then you can find them like the example below. This is one of the best features of `dnf` while researching dependency problems.

```
dnf provides package_name
```

![dnf provides command example][5]

#### 8. Installing packages using DNF

Probably the most used command is dnf install which helps to install an application or package. The command is simple.

```
dnf install package_name
```

If you want to install from a specific repo, you can use the `--enablerepo` switch while issuing this command.

```
dnf --enablerepo=epel install phpmyadmin
```

#### 9. Installing a package that you downloaded manually

There are times when you manually downloaded a `.rpm` package locally. And you want to install. You can install the same using `localinstall` command with `.rpm` file full qualified path.

```
dnf localinstall your_package_name.rpm
```

**Notes**

**>** The above command should resolve all the dependencies while installing a target `.rpm` package. If not, one can issue the following command.

```
dnf --nogpgcheck localinstall your_package_name.rpm
```

**>** Another way to install a local `.rpm` package is using the `dnf install` command.

```
dnf install *.rpm
```

#### 10. Reinstalling a package

Reinstalling a package is simple using the reinstallation switch of DNF.

```
dnf reinstall package_name
```

#### 11. Update Check and Updating your system

In an RPM-based system (such as Fedora, Red Hat Linux, etc.), the DNF package manager primarily handles the update. The following four commands take care of various update scenarios, as explained below.

The check-update option checks for all the updates available for your system. This option also takes a package name in its parameter. However, if no package name is specified, then it checks for updates for all installed packages in your system.

```
dnf check-update
```

To list out all the updates in your Linux system, use the `list` option.

```
dnf list updates
```

And to install updates for your entire Linux system, issue the `update` option.

```
dnf update
```

You can also update a specific application or package by mentioning the package name as a parameter to the update option.

```
dnf update package_name
```

#### 12. Downgrading a package

If you need to downgrade a package to its prior version, then you can use the downgrade option of DNF. Be very careful while issuing this command. This command erases the current version of a package and installs the highest of all the prior lower version available.

```
dnf downgrade package_name
```

![Downgrading a package using DNF][6]

#### 13. Downgrade or upgrade all packages

The `distro-sync` command downgrade or upgrade all packages to the latest versions for your system enabled repos.

```
dnf distro-sync
```

#### 14. Uninstall a package

You can uninstall or remove any application or package using the remove option of DNF.

```
dnf remove application_name
```

#### 15. Group operations using DNF

One of the great features of RPM based system is the grouping of packages. A group is a collection of packages logically grouped together. It helps to install them all in one go by issuing a single command with the group name.

The `grouplist` command gives you the name of available groups.

```
dnf grouplist
```

![DNF grouplist command][7]

And to install a group with all packages of it, use `groupinstall` option with the group name.

```
dnf groupinstall group_name
```

Remove a group and all the packages using the `groupremove` option.

```
dnf groupremove group_name
```

#### 16. Clean up your system using DNF

To remove all the temporary files for enabled repos in your system, use the `clean` option with all switch.

```
dnf clean all
```

If you want to remove a specific temporary file, use the various options as outlined below.

Removes cache files for repo metadata.

```
dnf clean dbcache
```

Remove the local cookie files containing the packages’ download time signature for each repo.

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

Over time, a system consumes many applications and packages installed by the user. The following `autoremove` option removes all the leaf packages installed as dependencies for any user-installed applications that are no longer needed. So they can be safely removed to [recover disk space][8].

```
dnf autoremove
```

![Clean up your system using DNF][9]

#### 17. Find out the DNF command execution history

If you want a list of all commands that have run using DNF since the beginning of a Linux system, then use the history option. This lists all the commands that issued until now.

```
dnf history
```

To view more details about a specific history, use the info option with the ID number shown in the above list. This is one of the amazing features of DNF, where you can find out exactly what happened on that particular DNF command. It contains the start and end time, who ran it, what packages were installed, and updated, etc.

```
dnf history info id_number
```

![DNF history command examples][10]

### Closing Notes

I am sure you know already about most of the above DNF commands that are explained with examples. But hey, a ready reference of DNF commands is always needed when things go wrong. So, I hope this DNF commands with examples guide helps you find the DNF command you are looking for and eventually resolve your problem.

Let me know whether this helps or any commands you would like to add to this list.

*[Official DNF Command reference][11]*

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/dnf-commands-examples/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/wp-content/uploads/2022/01/dnf-installed-packages-1024x549.jpg
[2]: https://www.debugpoint.com/wp-content/uploads/2022/01/Repo-list-using-DNF-1024x549.jpg
[3]: https://www.debugpoint.com/wp-content/uploads/2022/01/Information-about-a-specific-package-using-DNF-1024x481.jpg
[4]: https://www.debugpoint.com/wp-content/uploads/2022/01/Search-for-any-package-using-DNF-1024x481.jpg
[5]: https://www.debugpoint.com/wp-content/uploads/2022/01/dnf-provides-command-example-1024x290.jpg
[6]: https://www.debugpoint.com/wp-content/uploads/2022/01/Downgrading-a-package-using-DNF-1024x412.jpg
[7]: https://www.debugpoint.com/wp-content/uploads/2022/01/DNF-grouplist-command-1024x541.jpg
[8]: https://www.debugpoint.com/tag/clean-up
[9]: https://www.debugpoint.com/wp-content/uploads/2022/01/Clean-up-your-system-using-DNF-1024x216.jpg
[10]: https://www.debugpoint.com/wp-content/uploads/2022/01/DNF-history-command-examples-1024x711.jpg
[11]: https://dnf.readthedocs.io/en/latest/command_ref.html

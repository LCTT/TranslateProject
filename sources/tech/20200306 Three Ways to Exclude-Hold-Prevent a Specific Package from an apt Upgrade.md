[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Three Ways to Exclude/Hold/Prevent a Specific Package from an apt Upgrade)
[#]: via: (https://www.2daygeek.com/debian-ubuntu-exclude-hold-prevent-packages-from-apt-get-upgrade/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

Three Ways to Exclude/Hold/Prevent a Specific Package from an apt Upgrade
======

Sometimes you may accidentally update packages that are not updated due to some application dependency.

This is always the case during the entire system update or automatic package upgrade process.

If this happens, it may break the application function.

This creates a serious problem and you need to spend a lot of time fixing the problem.

See the following article if you want to **[Exclude Specific Packages from Yum Update][1]**

How to avoid this kind of situation?

How do I exclude packages from apt-get update?

Yes, it can be done using the following three methods on Debian and Ubuntu systems.

  * **[apt-mark Command][2]**
  * **[dpkg Command][3]**
  * aptitude Command



We will show in detail each.

### Method-1: How to Exclude Packages Update on Debian/Ubuntu System Using the apt-mark Command

The apt-mark is used to mark/unmark a package as being automatically installed.

The Hold option is used to mark a package as blocked, which prevents the package from being automatically installed, upgraded, or removed.

The unhold option is used to cancel a previously set hold on a package to allow all actions to be repeated.

Run the following command to hold the given package using the **apt-mark** command.

```
$ sudo apt-mark hold nano
nano set on hold.
```

Once you have hold some packages, run the following apt-mark command to view them.

```
$ sudo apt-mark showhold
nano
```

This will show that the **“nano”** package will not be upgraded when you perform a full system update.

```
$ sudo apt update

Reading package lists… Done
Building dependency tree
Reading state information… Done
Calculating upgrade… Done
The following packages have been kept back:
  nano
0 upgraded, 0 newly installed, 0 to remove and 1 not upgraded.
```

Run the following command to unhold the “nano” package using the apt-mark command.

```
$ sudo apt-mark unhold nano
Canceled hold on nano.
```

### Method-2: How to Exclude Packages Update on Debian/Ubuntu System Using the dpkg Command

The dpkg command is a CLI tool to install, build, remove and manage Debian packages. The primary and more user-friendly front-end for dpkg is aptitude.

Run the following command to block a given package using the dpkg command.

**Syntax:**

```
$ echo "package_name hold" | sudo dpkg --set-selections
```

Run the below dpkg command to hold the **“apache2”** package.

```
$ echo "apache2 hold" | sudo dpkg --set-selections
```

Once you have hold some packages, run the following command to view them.

```
$ sudo dpkg --get-selections | grep "hold"
apache2                        hold
```

It will show that the **“apache2”** package will not be upgraded when you perform a full system update.

```
$ sudo apt update

Reading package lists… Done
Building dependency tree
Reading state information… Done
Calculating upgrade… Done
The following packages have been kept back:
  apache2
0 upgraded, 0 newly installed, 0 to remove and 1 not upgraded.
```

Run the following command to unhold the given package using the dpkg command.

**Syntax:**

```
$ echo "package_name install" | sudo dpkg --set-selections
```

Run the following command to unhold the “apache2” package using the dpkg command.

```
$ echo "apache2 install" | sudo dpkg --set-selections
```

### Method-3: How to Exclude Packages Update on Debian/Ubuntu System Using the aptitude Command

The aptitude command is a text-based package management interface to the Debian and it’s derivative.

It allows the user to view a list of packages and to perform package management tasks such as installing, upgrading, and removing packages. Actions may be performed from a visual interface or from the command-line.

Run the following command to hold the given package using the aptitude command.

```
$ sudo aptitude hold python3
```

Once you have hold some packages, run the following aptitude command to view them.

```
$ sudo dpkg --get-selections | grep "hold"
or
$ sudo apt-mark showhold

python3
```

This will show that the **“python3”** package will not be upgraded when you perform a full system update.

```
$ sudo apt update

Reading package lists… Done
Building dependency tree
Reading state information… Done
Calculating upgrade… Done
The following packages have been kept back:
  python3
0 upgraded, 0 newly installed, 0 to remove and 1 not upgraded.
```

Run the following command to unhold the **“python3”** package using the apt-mark command.

```
$ sudo aptitude unhold python3
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/debian-ubuntu-exclude-hold-prevent-packages-from-apt-get-upgrade/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/redhat-centos-yum-update-exclude-specific-packages/
[2]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[3]: https://www.2daygeek.com/dpkg-command-to-manage-packages-on-debian-ubuntu-linux-mint-systems/

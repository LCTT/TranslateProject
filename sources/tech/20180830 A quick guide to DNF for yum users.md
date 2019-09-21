A quick guide to DNF for yum users
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/dropbox.jpg?itok=qFwcqboT)

Dandified yum, better known as [DNF][1], is a software package manager for RPM-based Linux distributions that installs, updates, and removes packages. It was first introduced in Fedora 18 in a testable state (i.e., tech preview), but it's been Fedora's default package manager since Fedora 22.

  * Dependency calculation based on modern dependency-solving technology
  * Optimized memory-intensive operations
  * The ability to run in Python 2 and Python 3
  * Complete documentation available for Python APIs



Since it is the next-generation version of the traditional yum package manager, it has more advanced and robust features than you'll find in yum. Some of the features that distinguish DNF from yum are:

DNF uses [hawkey][2] libraries, which resolve RPM dependencies for running queries on client machines. These are built on top of libsolv, a package-dependency solver that uses a satisfiability algorithm. You can find more details on the algorithm in [libsolv's GitHub][3] repository.

### CLI commands that differ in DNF and yum

Following are some of the changes to yum's command-line interface (CLI) you will find in DNF.

**dnf update** or **dnf upgrade:** Executing either dnf update or dnf upgrade has the same effect in the system: both update installed packages. However, dnf upgrade is preferred since it works exactly like **yum --obsoletes update**.

**resolvedep:** This command doesn't exist in DNF. Instead, execute **dnf provides** to find out which package provides a particular file.

**deplist:** Yum's deplist command, which lists RPM dependencies, was removed in DNF because it uses the package-dependency solver algorithm to solve the dependency query.

**dnf remove <package>:** You must specify concrete versions of whatever you want to remove. For example, **dnf remove kernel** will delete all packages called  "kernel," so make sure to use something like **dnf remove kernel-4.16.x**.

**dnf history rollback:** This check, which undoes transactions after the one you specifiy, was dropped since not all the possible changes in the RPM Database Tool are stored in the history of the transaction.

**--skip-broken:** This install command, which checks packages for dependency problems, is triggered in yum with --skip-broken. However, now it is part of dnf update by default, so there is no longer any need for it.

**-b, --best:** These switches select the best available package versions in transactions. During dnf upgrade, which by default skips over updates that cannot be installed for dependency reasons, this switch forces DNF to consider only the latest packages. Use **dnf upgrade --best**.

**--allowerasing:** Allows erasing of installed packages to resolve dependencies. This option could be used as an alternative to the **yum swap X Y** command, in which the packages to remove are not explicitly defined.

For example: **dnf --allowerasing install Y**.

**\--enableplugin:** This switch is not recognized and has been dropped.

### DNF Automatic

The [DNF Automatic][4] tool is an alternative CLI to dnf upgrade. It can execute automatically and regularly from systemd timers, cron jobs, etc. for auto-notification, downloads, or updates.

To start, install dnf-automatic rpm and enable the systemd timer unit (dnf-automatic.timer). It behaves as specified by the default configuration file (which is /etc/dnf/automatic.conf).
```
# yum install dnf-automatic
# systemctl enable dnf-automatic.timer
# systemctl start dnf-automatic.timer
# systemctl status dnf-automatic.timer
```

![](https://opensource.com/sites/default/files/uploads/dnf-automatic-timer.png)

Other timer units that override the default configuration are listed below. Select the one that meets your system requirements.

  * **dnf-automatic-notifyonly.timer:** Notifies the available updates
  * **dnf-automatic-download.timer:** Downloads packages, but doesn't install them
  * **dnf-automatic-install.timer:** Downloads and installs updates



### Basic DNF commands useful for package management

**# yum install dnf:** This installs DNF RPM from the yum package manager.

![](https://opensource.com/sites/default/files/uploads/yum-install-dnf.png)

**# dnf –version:** This specifies the DNF version.

![](https://opensource.com/sites/default/files/uploads/dnf-version.png)

**# dnf list all** or **# dnf list <package-name>:** This lists all or specific packages; this example lists the kernel RPM available in the system.

![](https://opensource.com/sites/default/files/uploads/dnf-list-kernel.png)

**# dnf check-update** or **# dnf check-update kernel:** This views updates in the system.

![](https://opensource.com/sites/default/files/uploads/dnf-check-update_0.png)

**# dnf search <package-name>:** When you search for a specific package via DNF, it will search for an exact match as well as all wildcard searches available in the repository.

![](https://opensource.com/sites/default/files/uploads/dnf-search.png)

**# dnf repolist all:** This downloads and lists all enabled repositories in the system.

![](https://opensource.com/sites/default/files/uploads/dnf-repolist.png)

**# dnf list --recent** or **# dnf list --recent <package-name>:** The **\--recent** option dumps all recently added packages in the system. Other list options are **\--extras** , **\--upgrades** , and **\--obsoletes**.

![](https://opensource.com/sites/default/files/uploads/dnf-list-recent.png)

**# dnf updateinfo list available** or **# dnf updateinfo list available sec:** These list all the advisories available in the system; including the sec option will list all advisories labeled  "security fix."

![](https://opensource.com/sites/default/files/uploads/dnf-updateinfo-list-available-sec.png)

**# dnf updateinfo list available sec --sec-severity Critical:** This lists all the security advisories in the system marked  "critical."

![](https://opensource.com/sites/default/files/uploads/dnfupdateinfo-severity-critical.png)

**# dnf updateinfo FEDORA-2018-a86100a264 –info:** This verifies the information of any advisory via the **\--info** switch.

![](https://opensource.com/sites/default/files/uploads/dnf-updateinfo-fedora.png)

**# dnf upgrade --security** or **# dnf upgrade --sec-severity Critical:** This applies all the security advisories available in the system. With the **\--sec-severity** option, you can include the packages with severity marked either Critical, Important, Moderate, or Low.

![](https://opensource.com/sites/default/files/uploads/dnf-upgrade-security.png)

### Summary

These are just a small number of DNF's features, changes, and commands. For complete information about DNF's CLI, new plugins, and hook APIs, refer to the [DNF guide][5].

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/guide-yum-dnf

作者：[Amit Das][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/amit-das
[1]: https://fedoraproject.org/wiki/DNF?rd=Dnf
[2]: https://fedoraproject.org/wiki/Features/Hawkey
[3]: https://github.com/openSUSE/libsolv
[4]: https://dnf.readthedocs.io/en/latest/automatic.html
[5]: https://dnf.readthedocs.io/en/latest/index.html

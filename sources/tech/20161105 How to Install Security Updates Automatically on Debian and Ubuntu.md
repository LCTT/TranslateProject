How to Install Security Updates Automatically on Debian and Ubuntu
============================================================

It has been said before -and I couldn’t agree more- that some of the best system administrators are those who seem (note the use of the word seem here) to be lazy all the time.

While that may sound somewhat paradoxical, I bet it must be true in most cases – not because they are not doing the job they are supposed to be doing, but rather because they have automated most of it.

One of the critical needs of a Linux system is to be kept up to date with the latest security patches available for the corresponding distribution.

In this article we will explain how to set up your Debian and Ubuntu system to auto install (or update) essential security packages or patches automatically when needed.

Other Linux distributions such as [CentOS/RHEL configured to install security updates automatically][1].

Needless to say, you will need superuser privileges in order to perform the tasks outlined in this article.

### Configure Automatic Security Updates On Debian/Ubuntu

To begin, install the following packages:

```
# aptitude update -y && aptitude install unattended-upgrades apt-listchanges -y
```

where apt-listchanges will report what has been changed during an upgrade.

Next, open /etc/apt/apt.conf.d/50unattended-upgrades with your preferred text editor and add this line inside the Unattended-Upgrade::Origins-Pattern block:

```
Unattended-Upgrade::Mail "root";
```

Finally, use the following command to create and populated the required configuration file (/etc/apt/apt.conf.d/20auto-upgrades) to activate the unattended updates:

```
# dpkg-reconfigure -plow unattended-upgrades
```

Choose `Yes` when prompted to install unattended upgrades:

[
 ![Configure Unattended Security Updates on Debian](http://www.tecmint.com/wp-content/uploads/2016/11/Configure-Unattended-Security-Updates-on-Debian.png) 
][2]

Configure Unattended Security Updates on Debian

then check that the following two lines have been added to /etc/apt/apt.conf.d/20auto-upgrades:

```
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Unattended-Upgrade "1";
```

And add this line to make reports verbose:

```
APT::Periodic::Verbose "2";
```

Last, inspect /etc/apt/listchanges.conf to make sure notifications will be sent to root.

[
 ![Notify Security Updates on Debian](http://www.tecmint.com/wp-content/uploads/2016/11/Notify-Security-Updates-on-Debian.png) 
][3]

Notify Security Updates on Debian

In this post we have explained how to make sure your system is updated regularly with the latest security patches. Additionally, you learned how to set up notifications in order to keep yourself informed when patches are applied.

Do you have any questions about this article? Feel free to drop us a note using the comment form below. We look forward to hearing from you.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/auto-install-security-updates-on-debian-and-ubuntu

作者：[Gabriel Cánepa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 组织翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:http://www.tecmint.com/auto-install-security-patches-updates-on-centos-rhel/
[2]:http://www.tecmint.com/wp-content/uploads/2016/11/Configure-Unattended-Security-Updates-on-Debian.png
[3]:http://www.tecmint.com/wp-content/uploads/2016/11/Notify-Security-Updates-on-Debian.png

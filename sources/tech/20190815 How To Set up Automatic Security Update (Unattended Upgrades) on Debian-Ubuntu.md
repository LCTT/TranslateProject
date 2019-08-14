[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Set up Automatic Security Update (Unattended Upgrades) on Debian/Ubuntu?)
[#]: via: (https://www.2daygeek.com/automatic-security-update-unattended-upgrades-ubuntu-debian/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

How To Set up Automatic Security Update (Unattended Upgrades) on Debian/Ubuntu?
======

One of an important task for Linux admins to make the system up-to-date.

It’s keep your system more stable and avoid unwanted access and attack.

Installing a package in Linux is a piece of cake.

In the similar way we can update security patches as well.

This is a simple tutorial that will show you to configure your system to receive automatic security updates.

There are some security risks involved when you running an automatic security package upgrades without inspection, but there are also benefits.

If you don’t want to miss security patches and would like to stay up-to-date with the latest security patches.

Then you should set up an automatic security update with help of unattended upgrades utility.

You can **[manually install Security Updates on Debian &amp; Ubuntu systems][1]** if you don’t want to go for automatic security update.

There are many ways that we can automate this. However, we are going with an official method and later we will cover other ways too.

### How to Install unattended-upgrades package in Debian/Ubuntu?

By default unattended-upgrades package should be installed on your system. But in case if it’s not installed use the following command to install it.

Use **[APT-GET Command][2]** or **[APT Command][3]** to install unattended-upgrades package.

```
$ sudo apt-get install unattended-upgrades
```

The below two files are allows you to customize this utility.

```
/etc/apt/apt.conf.d/50unattended-upgrades
/etc/apt/apt.conf.d/20auto-upgrades
```

### Make necessary changes in 50unattended-upgrades file

By default only minimal required options were enabled for security updates. It’s not limited and you can configure many option in this to make this utility more useful.

I have trimmed the file and added only the enabled lines for better clarifications.

```
# vi /etc/apt/apt.conf.d/50unattended-upgrades

Unattended-Upgrade::Allowed-Origins {
        "${distro_id}:${distro_codename}";
        "${distro_id}:${distro_codename}-security";
        "${distro_id}ESM:${distro_codename}";
        };
Unattended-Upgrade::DevRelease "false";
```

There are three origins are enabled and the details are below.

  * **`${distro_id}:${distro_codename}:`**` ` It is necessary because security updates may pull in new dependencies from non-security sources.
  * **`${distro_id}:${distro_codename}-security:`**` ` It is used to get a security updates from sources.
  * **`${distro_id}ESM:${distro_codename}:`**` ` It is used to get a security updates for ESM (Extended Security Maintenance) users.



**Enable Email Notification:** If you would like to receive email notifications after every security update, then modify the following line (uncomment it and add your email id).

From:

```
//Unattended-Upgrade::Mail "root";
```

To:

```
Unattended-Upgrade::Mail "[email protected]";
```

**Auto Remove Unused Dependencies:** You may need to run “sudo apt autoremove” command after every update to remove unused dependencies from the system.

We can automate this task by making the changes in the following line (uncomment it and change “false” to “true”).

From:

```
//Unattended-Upgrade::Remove-Unused-Dependencies "false";
```

To:

```
Unattended-Upgrade::Remove-Unused-Dependencies "true";
```

**Enable Automatic Reboot:** You may need to reboot your system when a security updates installed for kernel. To do so, make the following changes in the following line.

From:

```
//Unattended-Upgrade::Automatic-Reboot "false";
```

To: Uncomment it and change “false” to “true” to enable automatic reboot.

```
Unattended-Upgrade::Automatic-Reboot "true";
```

**Enable Automatic Reboot at The Specific Time:** If automatic reboot is enabled and you would like to perform the reboot at the specific time, then make the following changes.

From:

```
//Unattended-Upgrade::Automatic-Reboot-Time "02:00";
```

To: Uncomment it and change the time as per your requirement. I set it to reboot at 5 AM.

```
Unattended-Upgrade::Automatic-Reboot-Time "05:00";
```

### How to Enable Automatic Security Update?

Now, we have configured the necessary options. Once you are done.

Open the following file and verify it, both the values are set up correctly or not? It should not be a zero’s. (1=enabled, 0=disabled).

```
# vi /etc/apt/apt.conf.d/20auto-upgrades

APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Unattended-Upgrade "1";
```

**Details:**

  * The first line makes apt to perform “apt-get update” automatically every day.
  * The second line makes apt to install security updates automatically every day.



--------------------------------------------------------------------------------

via: https://www.2daygeek.com/automatic-security-update-unattended-upgrades-ubuntu-debian/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/manually-install-security-updates-ubuntu-debian/
[2]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[3]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/

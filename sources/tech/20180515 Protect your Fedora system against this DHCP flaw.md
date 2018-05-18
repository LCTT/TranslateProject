Protect your Fedora system against this DHCP flaw
======
![](https://fedoramagazine.org/wp-content/uploads/2018/05/dhcp-cve-816x345.jpg)

A critical security vulnerability was discovered and disclosed earlier today in dhcp-client. This DHCP flaw carries a high risk to your system and data, especially if you use untrusted networks such as a WiFi access point you don’t own. Read more here for how to protect your Fedora system.

Dynamic Host Control Protocol (DHCP) allows your system to get configuration from a network it joins. Your system will make a request for DHCP data, and typically a server such as a router answers. The server provides the necessary data for your system to configure itself. This is how, for instance, your system configures itself properly for networking when it joins a wireless network.

However, an attacker on the local network may be able to exploit this vulnerability. Using a flaw in a dhcp-client script that runs under NetworkManager, the attacker may be able to run arbitrary commands with root privileges on your system. This DHCP flaw puts your system and your data at high risk. The flaw has been assigned CVE-2018-1111 and has a [Bugzilla tracking bug][1].

### Guarding against this DHCP flaw

New dhcp packages contain fixes for Fedora 26, 27, and 28, as well as Rawhide. The maintainers have submitted these updates to the updates-testing repositories. They should show up in stable repos within a day or so of this post for most users. The desired packages are:

  * Fedora 26: dhcp-4.3.5-11.fc26
  * Fedora 27: dhcp-4.3.6-10.fc27
  * Fedora 28: dhcp-4.3.6-20.fc28
  * Rawhide: dhcp-4.3.6-21.fc29



#### Updating a stable Fedora system

To update immediately on a stable Fedora release, use this command [with sudo][2]. Type your password at the prompt, if necessary:
```
sudo dnf --refresh --enablerepo=updates-testing update dhcp-client

```

Later, use the standard stable repos to update. To update your Fedora system from the stable repos, use this command:
```
sudo dnf --refresh update dhcp-client

```

#### Updating a Rawhide system

If your system is on Rawhide, use these commands to download and update the packages immediately:
```
mkdir dhcp && cd dhcp
koji download-build --arch={x86_64,noarch} dhcp-4.3.6-21.fc29
sudo dnf update ./dhcp-*.rpm

```

After the nightly Rawhide compose, simply run sudo dnf update to get the update.

### Fedora Atomic Host

The fixes for Fedora Atomic Host are in ostree version 28.20180515.1. To get the update, run this command:
```
atomic host upgrade -r

```

This command reboots your system to apply the upgrade.


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/protect-fedora-system-dhcp-flaw/

作者：[Paul W. Frields][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/author/pfrields/
[1]:https://bugzilla.redhat.com/show_bug.cgi?id=1567974
[2]:https://fedoramagazine.org/howto-use-sudo/

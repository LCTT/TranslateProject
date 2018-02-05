(translating by runningwater)
Peeking into your Linux packages
======
Do you ever wonder how many _thousands_ of packages are installed on your Linux system? And, yes, I said "thousands." Even a fairly modest Linux system is likely to have well over a thousand packages installed. And there are many ways to get details on what they are.

First, to get a quick count of your installed packages on a Debian-based distribution such as Ubuntu, use the command **apt list --installed** like this:
```
$ apt list --installed | wc -l
2067

```

This number is actually one too high because the output contains "Listing..." as its first line. This command would be more accurate:
```
$ apt list --installed | grep -v "^Listing" | wc -l
2066

```

To get some details on what all these packages are, browse the list like this:
```
$ apt list --installed | more
Listing...
a11y-profile-manager-indicator/xenial,now 0.1.10-0ubuntu3 amd64 [installed]
account-plugin-aim/xenial,now 3.12.11-0ubuntu3 amd64 [installed]
account-plugin-facebook/xenial,xenial,now 0.12+16.04.20160126-0ubuntu1 all [installed]
account-plugin-flickr/xenial,xenial,now 0.12+16.04.20160126-0ubuntu1 all [installed]
account-plugin-google/xenial,xenial,now 0.12+16.04.20160126-0ubuntu1 all [installed]
account-plugin-jabber/xenial,now 3.12.11-0ubuntu3 amd64 [installed]
account-plugin-salut/xenial,now 3.12.11-0ubuntu3 amd64 [installed]

```

That's a lot of detail to absorb -- especially if you let your eyes wander through all 2,000+ files rolling by. It contains the package names, versions, and more but isn't the easiest information display for us humans to parse. The dpkg-query makes the descriptions quite a bit easier to understand, but they will wrap around your command window unless it's _very_ wide. So, the data display below has been split into the left and right hand sides to make this post easier to read.

Left side:
```
$ dpkg-query -l | more
Desired=Unknown/Install/Remove/Purge/Hold
| Status=Not/Inst/Conf-files/Unpacked/halF-conf/Half-inst/trig-aWait/Trig-pend
|/ Err?=(none)/Reinst-required (Status,Err: uppercase=bad)
||/ Name Version 
+++-==============================================-=================================-
ii a11y-profile-manager-indicator 0.1.10-0ubuntu3 
ii account-plugin-aim 3.12.11-0ubuntu3 
ii account-plugin-facebook 0.12+16.04.20160126-0ubuntu1 
ii account-plugin-flickr 0.12+16.04.20160126-0ubuntu1 
ii account-plugin-google 0.12+16.04.20160126-0ubuntu1 
ii account-plugin-jabber 3.12.11-0ubuntu3 
ii account-plugin-salut 3.12.11-0ubuntu3 
ii account-plugin-twitter 0.12+16.04.20160126-0ubuntu1 
rc account-plugin-windows-live 0.11+14.04.20140409.1-0ubuntu2 

```

Right side:
```
Architecture Description
============-=====================================================================
amd64 Accessibility Profile Manager - Unity desktop indicator
amd64 Messaging account plugin for AIM
all GNOME Control Center account plugin for single signon - facebook
all GNOME Control Center account plugin for single signon - flickr
all GNOME Control Center account plugin for single signon
amd64 Messaging account plugin for Jabber/XMPP
amd64 Messaging account plugin for Local XMPP (Salut)
all GNOME Control Center account plugin for single signon - twitter
all GNOME Control Center account plugin for single signon - windows live

```

The "ii" and "rc" designations at the beginning of each line (see "Left side" above) are package state indicators. The first letter represents the desirable package state:
```
u -- unknown
i -- install
r -- remove/deinstall
p -- purge (remove including config files)
h -- hold

```

The second represents the current package state:
```
n -- not-installed
i -- installed
c -- config-files (only the config files are installed)
U -- unpacked
F -- half-configured (the configuration failed for some reason)
h -- half-installed (installation failed for some reason)
W -- triggers-awaited (the package is waiting for a trigger from another package)
t -- triggers-pending (the package has been triggered)

```

An added "R" at the end of the normally two-character field would indicate that reinstallation is required. You may never run into these.

One easy way to take a quick look at your overall package status is to count how many packages are in which of the different states:
```
$ dpkg-query -l | tail -n +6 | awk '{print $1}' | sort | uniq -c
 2066 ii
 134 rc

```

I excluded the top five lines from the dpkg-query output above because these are the header lines that would have confused the output.

The two lines basically tell us that on this system, 2,066 packages should be and are installed, while 134 other packages have been removed but have left configuration files behind. You can always remove a package's remaining configuration files with a command like this:
```
$ sudo dpkg --purge xfont-mathml

```

Note that the command above would have removed the package binaries along with the configuration files if both were still installed.


--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3242808/linux/peeking-into-your-linux-packages.html

作者：[Sandra Henry-Stocker][a]
译者：[runningwater](https://github.com/runningwater)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.networkworld.com/author/Sandra-Henry_Stocker/

[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Fix ‘E: The package cache file is corrupted, it has the wrong hash’ Error In Ubuntu)
[#]: via: (https://www.ostechnix.com/fix-e-the-package-cache-file-is-corrupted-it-has-the-wrong-hash-error-in-ubuntu/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

Fix ‘E: The package cache file is corrupted, it has the wrong hash’ Error In Ubuntu
======

Today, I tried to update the repository lists in my Ubuntu 18.04 LTS desktop and got an error that says – **E: The package cache file is corrupted, it has the wrong hash**. Here is what I run from the Terminal and its output:

```
$ sudo apt update
```

Sample output:

```
Hit:1 http://it-mirrors.evowise.com/ubuntu bionic InRelease
Hit:2 http://it-mirrors.evowise.com/ubuntu bionic-updates InRelease
Hit:3 http://it-mirrors.evowise.com/ubuntu bionic-backports InRelease
Hit:4 http://it-mirrors.evowise.com/ubuntu bionic-security InRelease
Hit:5 http://ppa.launchpad.net/alessandro-strada/ppa/ubuntu bionic InRelease
Hit:7 http://ppa.launchpad.net/leaeasy/dde/ubuntu bionic InRelease
Hit:8 http://ppa.launchpad.net/rvm/smplayer/ubuntu bionic InRelease
Ign:6 https://dl.bintray.com/etcher/debian stable InRelease
Get:9 https://dl.bintray.com/etcher/debian stable Release [3,674 B]
Fetched 3,674 B in 3s (1,196 B/s)
Reading package lists... Done
E: The package cache file is corrupted, it has the wrong hash
```

![][2]

“The package cache file is corrupted, it has the wrong hash” Error In Ubuntu

After couple Google searches, I found a workaround to fix this error.

If you ever encountered with this error, don’t panic. Just run the following commands to fix it.

Before running the following command, **double check you have added “*” at the end**. It is very important to add ***** at the end of this command. If you don’t add it, it will delete **/var/lib/apt/lists/** directory and there is no way to bring it back. You have been warned!

```
$ sudo rm -rf /var/lib/apt/lists/*
```

Now I tried again to update the system using command:

```
$ sudo apt update
```

![][3]

This time it works!! Hope this helps.

* * *

**Suggested read:**

  * [**How To Fix Broken Ubuntu OS Without Reinstalling It**][4]
  * [**How to fix “Package operation failed” Error in Ubuntu**][5]
  * [**Fix “dpkg: error: parsing file ‘/var/lib/dpkg/updates/0014′” Error In Ubuntu**][6]
  * [**How To Fix “Kernel driver not installed (rc=-1908)” VirtualBox Error In Ubuntu**][7]
  * [**How to fix ‘Failed to install the Extension pack’ error in Ubuntu**][8]



* * *

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/fix-e-the-package-cache-file-is-corrupted-it-has-the-wrong-hash-error-in-ubuntu/

作者：[sk][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[2]: https://www.ostechnix.com/wp-content/uploads/2019/08/The-package-cache-file-is-corrupted.png
[3]: https://www.ostechnix.com/wp-content/uploads/2019/08/apt-update-command-output-in-Ubuntu.png
[4]: https://www.ostechnix.com/how-to-fix-broken-ubuntu-os-without-reinstalling-it/
[5]: https://www.ostechnix.com/how-to-fix-package-operation-failed-error-in-ubuntu/
[6]: https://www.ostechnix.com/fix-dpkg-error-parsing-file-var-lib-dpkg-updates-0014-error-in-ubuntu/
[7]: https://www.ostechnix.com/how-to-fix-kernel-driver-not-installed-rc-1908-virtualbox-error-in-ubuntu/
[8]: https://www.ostechnix.com/some-softwares-are-not-working-after-uninstall-moksha-desktop-from-ubuntu-14-04-lts/

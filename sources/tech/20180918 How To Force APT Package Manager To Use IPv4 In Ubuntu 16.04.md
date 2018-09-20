translating---geekpi

How To Force APT Package Manager To Use IPv4 In Ubuntu 16.04
======

![](https://www.ostechnix.com/wp-content/uploads/2018/09/ipv4-720x340.png)

**APT** , short or **A** dvanced **P** ackage **T** ool, is the default package manager for Debian-based systems. Using APT, we can install, update, upgrade and remove applications from the system. Lately, I have been facing a strange error. Whenever I try update my Ubuntu 16.04 box, I get this error – **“0% [Connecting to in.archive.ubuntu.com (2001:67c:1560:8001::14)]”** and the update process gets stuck for a long time. My Internet connection is working well and I can able to ping all websites including Ubuntu official site. After a couple Google searches, I realized that sometimes the Ubuntu mirrors are not reachable over IPv6. This problem is solved after I force APT package manager to use IPv4 in place of IPv6 to access Ubuntu mirrors while updating the system. If you ever encountered with this error, you can solve it as described below.

### Force APT Package Manager To Use IPv4 In Ubuntu 16.04

To force APT to use IPv4 in place of IPv6 while updating and upgrading your Ubuntu 16.04 LTS systems, simply use the following commands:

```
$ sudo apt-get -o Acquire::ForceIPv4=true update

$ sudo apt-get -o Acquire::ForceIPv4=true upgrade
```

Voila! This time update process run and completed quickly.

You can also make this persistent for all **apt-get** transactions in the future by adding the following line in **/etc/apt/apt.conf.d/99force-ipv4** file using command:

```
$ echo 'Acquire::ForceIPv4 "true";' | sudo tee /etc/apt/apt.conf.d/99force-ipv4
```

**Disclaimer:**

I don’t know if anyone is having this issue lately, but I kept getting this error today at least four to five times in my Ubuntu 16.04 LTS virtual machine and I solved it as described above. I am not sure that it is the recommended solution. Go through Ubuntu forums and make sure this method is legitimate. Since mine is just a VM which I use it only for testing and learning purposes, I don’t mind about the authenticity of this method. Use it on your own risk.

Hope this helps. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-force-apt-package-manager-to-use-ipv4-in-ubuntu-16-04/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/

[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Find Virtualbox Version From Commandline In Linux)
[#]: via: (https://www.ostechnix.com/how-to-find-virtualbox-version-from-commandline-in-linux/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

How To Find Virtualbox Version From Commandline In Linux
======

![FInd Virtualbox version from commandline In Linux][1]

I use **Oracle VirtualBox** and [**KVM**][2] virtualization applications to [**test different Linux operating systems**][3]. While I use KVM occasionally, Virtualbox is always my first choice. It is not because I don’t like KVM, but because I simply get used to Virtualbox. When using [**Virtualbox on my Ubuntu headless server**][4], I needed to find Virtualbox’s version. If it is a GUI, I could easily find it by navigating to **Virtualbox - > About -> Help**. But mine is Ubuntu server which doesn’t has GUI. If you’re ever wondering how to find Virtualbox version from commandline in Linux, here are few ways to do it.

### Find Virtualbox Version From Commandline In Linux

To find the version of installed Virtualbox, open the Terminal and run the following command:

```
$ vboxmanage --version
```

Sample output:

```
5.2.18_Ubuntur123745
```

![][5]

Find Virtualbox Version From Commandline In Linux

As you can see in the above output, the version of installed Virtualbox is **5.2**.

The yet another way to find virtualbox version is:

```
$ vbox-img --version
```

Sample output:

```
5.2.18_Ubuntur123745
```

Alternatively, you can use **“head”** and **“awk”** commands to find the Virtualbox version.

```
$ virtualbox --help | head -n 1 | awk '{print $NF}'
```

Sample output:

```
5.2.18_Ubuntu
```

Or, use **“echo”** command combined with “head” and “awk” commands:

```
$ echo $(virtualbox --help | head -n 1 | awk '{print $NF}')
```

Sample output:

```
5.2.18_Ubuntu
```

The above commands will work on any Linux distributions. If you’re on Ubuntu specifically, you can use **“dpkg”** command to check Virtualbox version.

```
$ dpkg -l | grep virtualbox | awk '{print $3}'
```

Sample output:

```
5.2.30-130521~Ubuntu~bionic
5.2.18-dfsg-2~ubuntu18.04.5
```

That’s it. These are couple ways to find the version of Oracle Virtualbox from Terminal in Linux. Hope this was useful.

**Reference:**

  * [**AskUbuntu**][6]



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-find-virtualbox-version-from-commandline-in-linux/

作者：[sk][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/07/Find-Virtualbox-Version-1-720x340.png
[2]: https://www.ostechnix.com/setup-headless-virtualization-server-using-kvm-ubuntu/
[3]: https://www.ostechnix.com/test-100-linux-and-unix-operating-systems-online-for-free/
[4]: https://www.ostechnix.com/install-oracle-virtualbox-ubuntu-16-04-headless-server/
[5]: https://www.ostechnix.com/wp-content/uploads/2019/07/Find-Virtualbox-Version.png
[6]: https://askubuntu.com/questions/420363/how-do-i-check-virtualbox-version-from-cli

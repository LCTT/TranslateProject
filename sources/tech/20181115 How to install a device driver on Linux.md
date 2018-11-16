How to install a device driver on Linux
======
Learn how Linux drivers work and how to use them.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/car-penguin-drive-linux-yellow.png?itok=twWGlYAc)

One of the most daunting challenges for people switching from a familiar Windows or MacOS system to Linux is installing and configuring a driver. This is understandable, as Windows and MacOS have mechanisms that make this process user-friendly. For example, when you plug in a new piece of hardware, Windows automatically detects it and shows a pop-up window asking if you want to continue with the driver's installation. You can also download a driver from the internet, then just double-click it to run a wizard or import the driver through Device Manager.

This process isn't as easy on a Linux operating system. For one reason, Linux is an open source operating system, so there are [hundreds of Linux distribution variations][1] . This means it's impossible to create one how-to guide that works for all Linux distros. Each Linux operating system handles the driver installation process a different way.

Second, most default Linux drivers are open source and integrated into the system, which makes installing any drivers that are not included quite complicated, even though most hardware devices can be automatically detected. Third, license policies vary among the different Linux distributions. For example, [Fedora prohibits][2] including drivers that are proprietary, legally encumbered, or that violate US laws. And Ubuntu asks users to [avoid using proprietary or closed hardware][3].

To learn more about how Linux drivers work, I recommend reading [An Introduction to Device Drivers][4] in the book Linux Device Drivers.

### Two approaches to finding drivers

#### 1\. User interfaces

If you are new to Linux and coming from the Windows or MacOS world, you'll be glad to know that Linux offers ways to see whether a driver is available through wizard-like programs. Ubuntu offers the [Additional Drivers][5] option. Other Linux distributions provide helper programs, like [Package Manager for GNOME][6], that you can check for available drivers.

#### 2\. Command line

What if you can't find a driver through your nice user interface application? Or you only have access through the shell with no graphic interface whatsoever? Maybe you've even decided to expand your skills by using a console. You have two options:

  A. **Use a repository**
This is similar to the [**homebrew**][7] command in MacOS.** ** By using **yum** , **dnf** , **apt-get** , etc., you're basically adding a repository and updating the package cache.


  B. **Download, compile, and build it yourself**
This usually involves downloading a package directly from a website or using the **wget** command and running the configuration file and Makefile to install it. This is beyond the scope of this article, but you should be able to find online guides if you choose to go this route.



### Check if a driver is already installed

Before jumping further into installing a driver in Linux, let's look at some commands that will determine whether the driver is already available on your system.

The [**lspci**][8] command shows detailed information about all PCI buses and devices on the system:

```
$ lscpci
```

Or with **grep** :

```
$ lscpci | grep SOME_DRIVER_KEYWORD
```

For example, you can type **lspci | grep SAMSUNG** if you want to know if a Samsung driver is installed.

The [**dmesg**][9] command shows all device drivers recognized by the kernel:

```
$ dmesg
```

Or with **grep** :

```
$ dmesg | grep SOME_DRIVER_KEYWORD
```

Any driver that's recognized will show in the results.

If nothing is recognized by the **dmesg** or **lscpi** commands, try these two commands to see if the driver is at least loaded on the disk:

```
$ /sbin/lsmod
```

and

```
$ find /lib/modules
```

Tip: As with **lspci** or **dmesg** , append **| grep** to either command above to filter the results.

If a driver is recognized by those commands but not by **lscpi** or **dmesg** , it means the driver is on the disk but not in the kernel. In this case, load the module with the **modprobe** command:

```
$ sudo modprobe MODULE_NAME
```

Run as this command as **sudo** since this module must be installed as a root user.

### Add the repository and install

There are different ways to add the repository through **yum** , **dnf** , and **apt-get** ; describing them all is beyond the scope of this article. To make it simple, this example will use **apt-get** , but the idea is similar for the other options.

**1\. Delete the existing repository, if it exists.**

```
$ sudo apt-get purge NAME_OF_DRIVER*
```

where **NAME_OF_DRIVER** is the probable name of your driver. You can also add pattern match to your regular expression to filter further.

**2\. Add the repository to the repolist, which should be specified in the driver guide.**

```
$ sudo add-apt-repository REPOLIST_OF_DRIVER
```

where **REPOLIST_OF_DRIVER** should be specified from the driver documentation (e.g., **epel-list** ).

**3\. Update the repository list.**

```
$ sudo apt-get update
```

**4\. Install the package.**

```
$ sudo apt-get install NAME_OF_DRIVER
```

**5\. Check the installation.**

Run the **lscpi** command (as above) to check that the driver was installed successfully.


--------------------------------------------------------------------------------

via: https://opensource.com/article/18/11/how-install-device-driver-linux

作者：[Bryant Son][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/brson
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/List_of_Linux_distributions
[2]: https://fedoraproject.org/wiki/Forbidden_items?rd=ForbiddenItems
[3]: https://www.ubuntu.com/licensing
[4]: https://www.xml.com/ldd/chapter/book/ch01.html
[5]: https://askubuntu.com/questions/47506/how-do-i-install-additional-drivers
[6]: https://help.gnome.org/users/gnome-packagekit/stable/add-remove.html.en
[7]: https://brew.sh/
[8]: https://en.wikipedia.org/wiki/Lspci
[9]: https://en.wikipedia.org/wiki/Dmesg

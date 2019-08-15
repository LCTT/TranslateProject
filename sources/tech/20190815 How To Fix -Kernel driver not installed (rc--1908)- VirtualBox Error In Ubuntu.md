[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Fix “Kernel driver not installed (rc=-1908)” VirtualBox Error In Ubuntu)
[#]: via: (https://www.ostechnix.com/how-to-fix-kernel-driver-not-installed-rc-1908-virtualbox-error-in-ubuntu/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

How To Fix “Kernel driver not installed (rc=-1908)” VirtualBox Error In Ubuntu
======

I use Oracle VirtualBox to test various Linux and Unix distributions. I’ve tested hundred of virtual machines in VirtualBox so far. Today, I started Ubuntu 18.04 server VM in my Ubuntu 18.04 desktop and I got the following error.

```
Kernel driver not installed (rc=-1908)

The VirtualBox Linux kernel driver (vboxdrv) is either not loaded or there is a permission problem with /dev/vboxdrv. Please reinstall virtualbox-dkms package and load the kernel module by executing

'modprobe vboxdrv'

as root.

where: suplibOsInit what: 3 VERR_VM_DRIVER_NOT_INSTALLED (-1908) - The support driver is not installed. On linux, open returned ENOENT.
```

![][2]

“Kernel driver not installed (rc=-1908)” Error in Ubuntu

I clicked OK to close the message box and and I saw another one in the background.

```
Failed to open a session for the virtual machine Ubuntu 18.04 LTS Server.

The virtual machine 'Ubuntu 18.04 LTS Server' has terminated unexpectedly during startup with exit code 1 (0x1).

Result Code:
NS_ERROR_FAILURE (0x80004005)
Component:
MachineWrap
Interface:
IMachine {85cd948e-a71f-4289-281e-0ca7ad48cd89}
```

![][3]

The virtual machine has terminated unexpectedly during startup with exit code 1 (0x1)

I didn’t know what to do first. I ran the following command to check if it helps.

```
$ sudo modprobe vboxdrv
```

And, I got this error.

```
modprobe: FATAL: Module vboxdrv not found in directory /lib/modules/5.0.0-23-generic
```

After carefully reading the both error messages, I realized that I should update the Virtualbox application.

If you ever run into this error in Ubuntu and its variants like Linux Mint, all you have to do is just reinstall or update the **“virtualbox-dkms”** package using command:

```
$ sudo apt install virtualbox-dkms
```

Or, it is much better to update the whole system:

```
$ sudo apt upgrade
```

Now the error has gone and I could start VMs from VirtualBox without any issues.

* * *

**Related read:**

  * [**Solve “Result Code: NS_ERROR_FAILURE (0x80004005)” VirtualBox Error In Arch Linux**][4]



* * *

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-fix-kernel-driver-not-installed-rc-1908-virtualbox-error-in-ubuntu/

作者：[sk][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[2]: https://www.ostechnix.com/wp-content/uploads/2019/08/Kernel-driver-not-installed-virtualbox-ubuntu.png
[3]: https://www.ostechnix.com/wp-content/uploads/2019/08/The-virtual-machine-has-terminated-unexpectedly-during-startup-with-exit-code-1-0x1.png
[4]: https://www.ostechnix.com/solve-result-code-ns_error_failure-0x80004005-virtualbox-error-arch-linux/

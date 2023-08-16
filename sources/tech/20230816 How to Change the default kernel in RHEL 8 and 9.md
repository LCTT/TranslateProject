[#]: subject: "How to Change the default kernel in RHEL 8 and 9"
[#]: via: "https://www.2daygeek.com/changing-default-kernel-rhel-8-rhel-9/"
[#]: author: "Rasool Cool https://www.2daygeek.com/author/rasool/"
[#]: collector: "lujun9972"
[#]: translator: "onionstalgia"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Change the default kernel in RHEL 8 and 9
======

Usually a Linux system boots with the latest installed kernel, which is set by default. It keeps maximum 3 recent versions of Linux Kernel boot entries.

Let’s say you’ve done the yum update, and a new kernel is installed as part of this update. This prevents the application from starting as this kernel is incompatible with the application.

To temporarily fix this problem, you should continue to boot the system into an older kernel.

In this article, we’ll show you how to set old kernel version as default on RHEL 8 and RHEL 9 systems using grubby utility.

  * [**How to Upgrade from RHEL 7 to RHEL 8**][1]



### What is grubby

grubby is a command line tool used for updating and displaying information about the boot loaders configuration files across multiple architectures.

### Checking currently booted kernel

You can check booted/loaded kernel using **uname command** as shown below.

```

    uname -r

    4.18.0-477.13.1.el8_8.x86_64

```

### Listing the Default Kernel

To verify the default kernel version using grubby, run:

```

    grubby --default-kernel

    /boot/vmlinuz-4.18.0-477.13.1.el8_8.x86_64

```

To obtain the index number of the current default kernel, run:

```

    grubby --default-index
    0

```

### Checking installed kernels

To check list of installed kernels, run:

Let’s explain the below output. The latest kernel installed will have the **entry-index** of **`0`** , the next **older kernel** version will get **`1`** , second older kernel version will get **`2`** , and the **rescue kernel** will get an entry-index of **`3`**.

```

    grubby --info=ALL | egrep -i 'index|title'

    index=0
    title="Red Hat Enterprise Linux (4.18.0-477.13.1.el8_8.x86_64) 8.8 (Ootpa)"
    index=1
    title="Red Hat Enterprise Linux (4.18.0-425.19.2.el8_7.x86_64) 8.7 (Ootpa)"
    index=2
    title="Red Hat Enterprise Linux (4.18.0-425.13.1.el8_7.x86_64) 8.7 (Ootpa)"
    index=3
    title="Red Hat Enterprise Linux (0-rescue-13iu76884ec5490puc67j8789s249b0c) 8.2 (Ootpa)"

```

### Changing default kernel Boot entry

This can be done in two ways either using **`'kernel filename'`** or **`'kernel entry-index'`**. We will be going to set ‘ **index=1 (4.18.0-425.19.2.el8_7.x86_64)** ‘ as default kernel due to application dependency.

```

    Syntax:
    grubby --set-default [kernel-filename]

```

```

    grubby --set-default /boot/vmlinuz-4.18.0-425.19.2.el8_7.x86_64
    OR
    grubby --set-default vmlinuz-4.18.0-425.19.2.el8_7.x86_64

```

To change the default kernel boot entry using kernel entry-index:

```

    Syntax:
    grubby --set-default-index=[kernel-entry-index]

```

```

    grubby --set-default-index=1

```

### Rebooting the system

Reboot the system to check whether the old kernel is persistent or not.

```

    reboot
    or
    init 6

```

### Verifying the Changes

Let’s check if the kernel added in the previous step has taken effect or not. Yes, it booted with older kernel **`'N-1'`** as expected.

```

    uname -r
    4.18.0-425.19.2.el8_7.x86_64

    grubby --default-kernel
    /boot/vmlinuz-4.18.0-425.19.2.el8_7.x86_64

```

To check detailed information of all kernel, run:

```

    grubby --info=ALL

```

![][2]

##### Wrapping Up

In this tutorial, we’ve shown you how to set old kernel version as default on RHEL 8 and RHEL 9 systems using grubby utility.

If you have any questions or feedback, feel free to comment below.

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/changing-default-kernel-rhel-8-rhel-9/

作者：[Rasool Cool][a]
选题：[lujun9972][b]
译者：[onionstalgia](https://github.com/onionstalgia)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/rasool/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/upgrading-from-rhel-7-to-rhel-8/
[2]: https://www.2daygeek.com/wp-content/uploads/2023/06/changing-default-kernel-rhel-8-rhel-9-1024x494.jpg

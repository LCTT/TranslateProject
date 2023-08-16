[#]: subject: "How to Disable IPv6 on RHEL using grubby"
[#]: via: "https://www.2daygeek.com/disable-ipv6-rhel/"
[#]: author: "Vinoth Kumar https://www.2daygeek.com/author/vinoth/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Disable IPv6 on RHEL using grubby
======

In computing, there are two types of IP addresses, IPv4 and IPv6. IPv6 offers a much larger addressing scheme than IPv4. However, IPv4 is more widely used by many organizations than IPv6 due to various reasons.

There are situations where you need to disable IPv6 on a RHEL system, such as the application does not support IPv6, the application’s inability or hardware does not support it, etc,.

This can be done in few ways. This tutorial explains one of the easiest methods to disable IPv6 on RHEL system.

### Disabling IPv6 using grubby

The **[grubby utility][1]** can be used to make persistent changes to the grub.cfg file. This is very simplest way to disable IPv6 especially on Red Hat based systems.

### Step-1: Check if IPv6 is enabled or not

First check if your system is using IPv6 with **[ip command][2]**. If any **`'inet6'`** entry is displayed in the below output, IPv6 is enabled on the devices.

```

    ip a | grep -i inet6

    inet6 ::1/128 scope host
    inet6 fe80::b5c2:565a:e972:e572/64 scope link noprefixroute

```

### Step-2: Disabling IPv6

Run the below command to add the following parameter **`'ipv6.disable=1'`** to the **‘grub.cfg’** file for all installed kernels, as RHEL based systems usually have the last three kernels.

The value **`'1'`** means that IPv6 will be disabled for the device.

```

    grubby --update-kernel ALL --args ipv6.disable=1

```

#### Step-2a: Disabling IPv6 (Optional)

If you want to disable IPv6 only for the latest kernel, add the following entry to the ‘grub.cfg’ file.

```

    grubby --update-kernel DEFAULT --args ipv6.disable=1

```

### Step-3: Verifying the grub.cfg file

To ensure that IPv6 is disabled, check that the ‘ipv6.disable=1’ parameter has been added to the ‘grub.cfg’ file before **[restarting the system][3]**. Yes, it was added because I could see this parameter against all kernels as shown below:

```

    grubby --info=ALL

```

![][4]

### Step-4: Rebooting the system

Reboot the system for the change to take effect.

```

    reboot
    or
    init 6

```

### Step-5: IPv6 Verification

Check if IPv6 is disabled or not using the ip command as shown below:

```

    ip a | grep -i inet6

```

If no **‘inet6’** entries are shown in the above output, IPv6 is disabled for all devices.

##### Wrapping Up

I hope you learned how to disable IPv6.

In this tutorial, we have shown you one of the easiest ways to disable IPv6 on a RHEL system, as other methods may require additional steps to disable it completely.

If you have any questions or feedback, feel free to comment below.

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/disable-ipv6-rhel/

作者：[Vinoth Kumar][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/vinoth/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/changing-default-kernel-rhel-8-rhel-9/
[2]: https://www.2daygeek.com/linux-ip-command-configure-network-interface/
[3]: https://www.2daygeek.com/6-commands-to-shutdown-halt-poweroff-reboot-the-linux-system/
[4]: https://www.2daygeek.com/wp-content/uploads/2023/08/Disabling-IPv6-RHEL-1024x503.jpg

[#]: collector: (lujun9972)
[#]: translator: (FSSlc)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (4 Methods To Change The HostName In Linux)
[#]: via: (https://www.2daygeek.com/four-methods-to-change-the-hostname-in-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

4 Methods To Change The HostName In Linux
======

We had written an article yesterday in our website about **[changing hostname in Linux][1]**.

Today we are going to show you that how to change the hostname using different methods. You can choose the best one for you.

systemd systems comes with a handy tool called `hostnamectl` that allow us to manage the system hostname easily.

It’s changing the hostname instantly and doesn’t required reboot when you use the native commands.

But if you modify the hostname manually in any of the configuration file that requires reboot.

In this article we will show you the four methods to change the hostname in systemd system.

hostnamectl command allows to set three kind of hostname in Linux and the details are below.

  * **`Static:`** It’s static hostname which is added by the system admin.
  * **`Transient/Dynamic:`** It’s assigned by DHCP or DNS server at run time.
  * **`Pretty:`** It can be assigned by the system admin. It is a free-form of the hostname that represent the server in the pretty way like, “JBOSS UAT Server”.



It can be done in the following four methods.

  * **`hostnamectl Command:`** hostnamectl command is controling the system hostname.
  * **`nmcli Command:`** nmcli is a command-line tool for controlling NetworkManager.
  * **`nmtui Command:`** nmtui is a text User Interface for controlling NetworkManager.
  * **`/etc/hostname file:`** This file is containing the static system hostname.



### Method-1: Change The HostName Using hostnamectl Command in Linux

hostnamectl may be used to query and change the system hostname and related settings.

Simple run the `hostnamectl` command to view the system hostname.

```
$ hostnamectl
or
$ hostnamectl status

   Static hostname: daygeek-Y700
         Icon name: computer-laptop
           Chassis: laptop
        Machine ID: 31bdeb7b83230a2025d43547368d75bc
           Boot ID: 267f264c448f000ea5aed47263c6de7f
  Operating System: Manjaro Linux
            Kernel: Linux 4.19.20-1-MANJARO
      Architecture: x86-64
```

If you would like to change the hostname, use the following command format.

**The general syntax:**

```
$ hostnamectl set-hostname [YOUR NEW HOSTNAME]
```

Use the following command to change the hostname using hostnamectl command. In this example, i’m going to change the hostname from `daygeek-Y700` to `magi-laptop`.

```
$ hostnamectl set-hostname magi-laptop
```

You can view the updated hostname by running the following command.

```
$ hostnamectl
   Static hostname: magi-laptop
         Icon name: computer-laptop
           Chassis: laptop
        Machine ID: 31bdeb7b83230a2025d43547368d75bc
           Boot ID: 267f264c448f000ea5aed47263c6de7f
  Operating System: Manjaro Linux
            Kernel: Linux 4.19.20-1-MANJARO
      Architecture: x86-64
```

### Method-2: Change The HostName Using nmcli Command in Linux

nmcli is a command-line tool for controlling NetworkManager and reporting network status.

nmcli is used to create, display, edit, delete, activate, and deactivate network connections, as well as control and display network device status. Also, it allow us to change the hostname.

Use the following format to view the current hostname using nmcli.

```
$ nmcli general hostname
daygeek-Y700
```

**The general syntax:**

```
$ nmcli general hostname [YOUR NEW HOSTNAME]
```

Use the following command to change the hostname using nmcli command. In this example, i’m going to change the hostname from `daygeek-Y700` to `magi-laptop`.

```
$ nmcli general hostname magi-laptop
```

It’s taking effect without bouncing the below service. However, for safety purpose just restart the systemd-hostnamed service for the changes to take effect.

```
$ sudo systemctl restart systemd-hostnamed
```

Again run the same nmcli command to check the changed hostname.

```
$ nmcli general hostname
magi-laptop
```

### Method-3: Change The HostName Using nmtui Command in Linux

nmtui is a curses‐based TUI application for interacting with NetworkManager. When starting nmtui, the user is prompted to choose the activity to perform unless it was specified as the first argument.

Run the following command on terminal to launch the terminal user interface.

```
$ nmtui
```

Use the `Down Arrow Mark` to choose the `Set system hostname` option then hit the `Enter` button.
![][3]

This is old hostname screenshot.
![][4]

Just remove the olde one and update the new one then hit `OK` button.
![][5]

It will show you the updated hostname in the screen and simple hit `OK` button to complete it.
![][6]

Finally hit the `Quit` button to exit from the nmtui terminal.
![][7]

It’s taking effect without bouncing the below service. However, for safety purpose just restart the systemd-hostnamed service for the changes to take effect.

```
$ sudo systemctl restart systemd-hostnamed
```

You can view the updated hostname by running the following command.

```
$ hostnamectl
   Static hostname: daygeek-Y700
         Icon name: computer-laptop
           Chassis: laptop
        Machine ID: 31bdeb7b83230a2025d43547368d75bc
           Boot ID: 267f264c448f000ea5aed47263c6de7f
  Operating System: Manjaro Linux
            Kernel: Linux 4.19.20-1-MANJARO
      Architecture: x86-64
```

### Method-4: Change The HostName Using /etc/hostname File in Linux

Alternatively, we can change the hostname by modifying the `/etc/hostname` file. But this method
requires server reboot for changes to take effect.

Check the current hostname using /etc/hostname file.

```
$ cat /etc/hostname
daygeek-Y700
```

To change the hostname, simple overwrite the file because it’s contains only the hostname alone.

```
$ sudo echo "magi-daygeek" > /etc/hostname

$ cat /etc/hostname
magi-daygeek
```

Reboot the system by running the following command.

```
$ sudo init 6
```

Finally verify the updated hostname using /etc/hostname file.

```
$ cat /etc/hostname
magi-daygeek
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/four-methods-to-change-the-hostname-in-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[FSSlc](https://github.com/FSSlc)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/linux-change-set-hostname/
[2]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]: https://www.2daygeek.com/wp-content/uploads/2019/02/four-methods-to-change-the-hostname-in-linux-1.png
[4]: https://www.2daygeek.com/wp-content/uploads/2019/02/four-methods-to-change-the-hostname-in-linux-2.png
[5]: https://www.2daygeek.com/wp-content/uploads/2019/02/four-methods-to-change-the-hostname-in-linux-3.png
[6]: https://www.2daygeek.com/wp-content/uploads/2019/02/four-methods-to-change-the-hostname-in-linux-4.png
[7]: https://www.2daygeek.com/wp-content/uploads/2019/02/four-methods-to-change-the-hostname-in-linux-5.png

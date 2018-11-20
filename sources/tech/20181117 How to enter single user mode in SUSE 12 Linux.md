translating---geekpi

How to enter single user mode in SUSE 12 Linux?
======
Short article to learn how to enter single user mode in SUSE 12 Linux server.

![How to enter single user mode in SUSE 12 Linux][1]

In this short article we will walk you through steps which demonstrate how to enter single user mode in SUSE 12 Linux. Single user mode is always preferred when you are troubleshooting major issues with your system. Single user mode disables networking and no other users are logged in, you rule out many situations of multi user system and it helps you in troubleshooting fast. One of the most popular use of single user mode is to [reset forgotten root password][2].

### 1\. Halt boot process

First of all you need have console of your machine to get into single user mode. If its VM then VM console, if its physical machine then you need its iLO/serial console connected. Reboot system and halt automatic booting of kernel at grub boot menu by pressing any key.

![Kernel selection menu at boot in SUSE 12][3]

### 2\. Edit boot option of kernel

Once you are on above screen, press `e` on selected kernel (which is normally your preferred latest kernel) to update its boot options. You will see be below screen.

![grub2 edits in SUSE 12][4]

Now, scroll down to your booting kernel line and add `init=/bin/bash` at the end of the line as shown below.

![Edit to boot in single user shell][5]

### 3\. Boot kernel with edited entry

Now press `Ctrl-x` or `F10` to boot this edited kernel. Kernel will be booted in single user mode and you will be presented with hash prompt i.e. root access to server. At this point of time, your root file system is mounted in read only mode. So any changes you are doing to system wont be saved.

Run below command to remount root filesystem as re-writable.

```
kerneltalks:/ # mount -o remount,rw /
```

And you are good to go! Go ahead and do your necessary actions in single user mode. Dont forget to reboot server to boot into normal multiuser mode once you are done.

--------------------------------------------------------------------------------

via: https://kerneltalks.com/howto/how-to-enter-single-user-mode-in-suse-12-linux/

作者：[kerneltalks][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://kerneltalks.com
[b]: https://github.com/lujun9972
[1]: https://a4.kerneltalks.com/wp-content/uploads/2018/11/How-to-enter-single-user-mode-in-SUSE-12-Linux.png
[2]: https://kerneltalks.com/linux/recover-forgotten-root-password-rhel/
[3]: https://a1.kerneltalks.com/wp-content/uploads/2018/11/Grub-menu-in-SUSE-12.png
[4]: https://a3.kerneltalks.com/wp-content/uploads/2018/11/grub2-editor.png
[5]: https://a4.kerneltalks.com/wp-content/uploads/2018/11/Edit-to-boot-in-single-user-shell.png

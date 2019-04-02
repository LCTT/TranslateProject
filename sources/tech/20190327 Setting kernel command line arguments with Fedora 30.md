[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Setting kernel command line arguments with Fedora 30)
[#]: via: (https://fedoramagazine.org/setting-kernel-command-line-arguments-with-fedora-30/)
[#]: author: (Laura Abbott https://fedoramagazine.org/makes-fedora-kernel/)

Setting kernel command line arguments with Fedora 30
======

![][1]

Adding options to the kernel command line is a common task when debugging or experimenting with the kernel. The upcoming Fedora 30 release made a change to use Bootloader Spec ([BLS][2]). Depending on how you are used to modifying kernel command line options, your workflow may now change. Read on for more information.

To determine if your system is running with BLS or the older layout, look in the file

```
/etc/default/grub
```

If you see

```
GRUB_ENABLE_BLSCFG=true
```

in there, you are running with the BLS setup and you may need to change how you set kernel command line arguments.

If you only want to modify a single kernel entry (for example, to temporarily work around a display problem) you can use a grubby command

```
$ grubby --update-kernel /boot/vmlinuz-5.0.1-300.fc30.x86_64 --args="amdgpu.dc=0"
```

To remove a kernel argument, you can use the

```
--remove-args
```
argument to grubby

```
$ grubby --update-kernel /boot/vmlinuz-5.0.1-300.fc30.x86_64 --remove-args="amdgpu.dc=0"
```

If there is an option that should be added to every kernel command line (for example, you always want to disable the use of the rdrand instruction for random number generation) you can run a grubby command:

```
$ grubby --update-kernel=ALL --args="nordrand"
```

This will update the command line of all kernel entries and save the option to the saved kernel command line for future entries.

If you later want to remove the option from all kernels, you can again use

```
--remove-args
```
with

```
--update-kernel=ALL
```

```
$ grubby --update-kernel=ALL --remove-args="nordrand"
```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/setting-kernel-command-line-arguments-with-fedora-30/

作者：[Laura Abbott][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/makes-fedora-kernel/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/03/f30-kernel-1-816x345.jpg
[2]: https://fedoraproject.org/wiki/Changes/BootLoaderSpecByDefault

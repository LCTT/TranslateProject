translating---geekpi

How to Install GRUB on Arch Linux (UEFI)
======

![](http://fasterland.net/wp-content/uploads/2018/10/Arch-Linux-Boot-Menu-750x375.jpg)

Some time ago, I wrote a tutorial on **[how to reinstall Grub][1] on Arch Linux after installing Windows.**

A few weeks ago, I had to reinstall **Arch Linux** from scratch on my laptop and I discovered installing **Grub** was not as straightforward as I remembered.

For this reason, I’m going to write this tutorial since **installing Grub on a UEFI bios** during a new **Arch Linux** installation it’s not too easy.

### Locating the EFI partition

The first important thing to do for installing **Grub** on **Arch Linux** is to locate the **EFI** partition.
Let’s run the following command in order to locate this partition:

```
# fdisk -l
```

We need to check the partition marked as **EFI System
**In my case is **/dev/sda2**

After that, we need to mount this partition, for example, on /boot/efi:

```
# mkdir /boot/efi
# mount /dev/sdb2 /boot/efi
```

Another important thing to do is adding this partition into the **/etc/fstab** file.

#### Installing Grub

Now we can install Grub in our system:

```
# grub-mkconfig -o /boot/grub/grub.cfg
# grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
```

#### Adding Windows Automatically into the Grub Menu

In order to automatically add the **Windows entry into the Grub menu** , we need to install the **os-prober** program:

```
# pacman -Sy os-prober
```

In order to add the entry item let’s run the following commands:

```
# os-prober
# grub-mkconfig -o /boot/grub/grub.cfg
# grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
```

You can find more about Grub on Arch Linux [here][2].

--------------------------------------------------------------------------------

via: http://fasterland.net/how-to-install-grub-on-arch-linux-uefi.html

作者：[Francesco Mondello][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://fasterland.net/
[b]: https://github.com/lujun9972
[1]: http://fasterland.net/reinstall-grub-arch-linux.html
[2]: https://wiki.archlinux.org/index.php/GRUB

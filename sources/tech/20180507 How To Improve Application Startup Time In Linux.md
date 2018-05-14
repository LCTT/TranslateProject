How To Improve Application Startup Time In Linux
======

![](https://www.ostechnix.com/wp-content/uploads/2018/05/Preload-720x340.png)
Most Linux distributions are fast enough by default. However, we can still make them a little bit faster using some additional applications and methods. One such application we are about to see is **Preload**. It monitors the most frequently-used applications by the user and adds them to the memory, so that the applications will load little bit faster than before. Because, as you might already know, reading from the RAM is always faster than from the hard drive. Preload runs as a daemon on the background all the time and records the statistics about usage of files by more frequently-used programs. It then fetches those binaries and their dependencies into memory to improve the application loading time. In a nutshell, once preload is installed, you should be able to load the often-used applications much faster.

In this brief tutorial, we are going to see how to install and use Preload to improve an application startup time in Linux.

### Improve Application Startup Time In Linux Using Preload

Preload is available in [**AUR**][1]. So you can install it using AUR helper programs in any Arch-based systems such as Antergos, Manjaro Linux.

Using [**Pacaur**][2]:
```
$ pacaur -S preload

```

Using [**Packer**][3]:
```
$ packer -S preload

```

Using [**Trizen**][4]:
```
$ trizen -S preload

```

Using [**Yay**][5]:
```
$ yay -S preload

```

Using [**Yaourt**][6]:
```
$ yaourt -S preload

```

On Debian, Ubuntu, Linux Mint, Preload is available in the default repositories. So you can install it using APT package manager like below.
```
$ sudo apt-get install preload

```

Once Preload installed, reboot your system. From now on, Preload monitors the frequently-used applications and adds their binaries and libraries into the Memory for faster startup time. For example, if you often use Firefox, Chrome or LibreOffice, Preload will then add those binaries and libraries into RAM, so those applications will start faster. Good thing is it doesn’t need any configuration. It will just work out of the box. If you, however, wants to tweak the configuration, you can do it by editing the default configuration file **/etc/preload.conf**.

### Preload isn’t for everyone!

Here are some drawbacks of Preload and why it is not that effective for everyone, discussed in this [**thread**][7].

  1. I do have a decent specification system with 8GB RAM. So my system is generally fast. Also, I will open heavy memory-consuming applications, such as Firefox, Chrome, VirtualBox, Gimp etc., one or two times per day. They remain open all the time, hence their binaries and libraries are preloaded into memory and occupying the RAM all day. I rarely close and open those applications, so the RAM usage is simply waste.
  2. If you’re using modern systems with SSD, Preload is obviously useless. Because SSDs access time is much faster than normal hard drives, so using Preload is pointless.
  3. Preload significantly affects the boot time. Because the more applications are preloaded into RAM, the longer it takes to get your system up and running.



You will only the see the real difference only if you’re reloading applications a LOT of time per day. So Preload will be ideal for the developers and testers who open and close the applications several times everyday.

For more details about what exactly preload is and how it works, read the complete [**Preload thesis**][8] paper submitted by the author.

And, that’s all for now. Hope this was useful. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-improve-application-startup-time-in-linux/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://aur.archlinux.org/packages/preload/
[2]:https://www.ostechnix.com/install-pacaur-arch-linux/
[3]:https://www.ostechnix.com/install-packer-arch-linux-2/
[4]:https://www.ostechnix.com/trizen-lightweight-aur-package-manager-arch-based-systems/
[5]:https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[6]:https://www.ostechnix.com/install-yaourt-arch-linux/
[7]:https://askubuntu.com/questions/110335/drawbacks-of-using-preload-why-isnt-it-included-by-default
[8]:https://cs.uwaterloo.ca/~brecht/courses/702/Possible-Readings/prefetching-to-memory/preload-thesis.pdf

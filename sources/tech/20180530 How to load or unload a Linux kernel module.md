How to load or unload a Linux kernel module
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_development_programming.png?itok=4OM29-82)

This article is excerpted from chapter 15 of [Linux in Action][1], published by Manning.

Linux manages hardware peripherals using kernel modules. Here's how that works.

A running Linux kernel is one of those things you don't want to upset. After all, the kernel is the software that drives everything your computer does. Considering how many details have to be simultaneously managed on a live system, it's better to leave the kernel to do its job with as few distractions as possible. But if it's impossible to make even small changes to the compute environment without rebooting the whole system, then plugging in a new webcam or printer could cause a painful disruption to your workflow. Having to reboot each time you add a device to get the system to recognize it is hardly efficient.

To create an effective balance between the opposing virtues of stability and usability, Linux isolates the kernel, but lets you add specific functionality on the fly through loadable kernel modules (LKMs). As shown in the figure below, you can think of a module as a piece of software that tells the kernel where to find a device and what to do with it. In turn, the kernel makes the device available to users and processes and oversees its operation.

![Kernel modules][3]

Kernel modules act as translators between devices and the Linux kernel.

There's nothing stopping you from writing your own module to support a device exactly the way you'd like it, but why bother? The Linux module library is already so robust that there's usually no need to roll your own. And the vast majority of the time, Linux will automatically load a new device's module without you even knowing it.

Still, there are times when, for some reason, it doesn't happen by itself. (You don't want to leave that hiring manager impatiently waiting for your smiling face to join the video conference job interview for too long.) To help things along, you'll want to understand a bit more about kernel modules and, in particular, how to find the actual module that will run your peripheral and then how to manually activate it.

### Finding kernel modules

By accepted convention, modules are files with a .ko (kernel object) extension that live beneath the `/lib/modules/` directory. Before you navigate all the way down to those files, however, you'll probably have to make a choice. Because you're given the option at boot time of loading one from a list of releases, the specific software needed to support your choice (including the kernel modules) has to exist somewhere. Well, `/lib/modules`/ is one of those somewheres. And that's where you'll find directories filled with the modules for each available Linux kernel release; for example:
```
$ ls /lib/modules

4.4.0-101-generic

4.4.0-103-generic

4.4.0-104-generic

```

In my case, the active kernel is the version with the highest release number (4.4.0-104-generic), but there's no guarantee that that'll be the same for you (kernels are frequently updated). If you're going to be doing some work with modules that you'd like to use on a live system, you need to be sure you've got the right directory tree.

`uname -r` (the `-r` specifies the kernel release number from within the system information that would normally be displayed):
```
$ uname -r

4.4.0-104-generic

```

Good news: there's a reliable trick. Rather than identifying the directory by name and hoping you'll get the right one, use the system variable that always points to the name of the active kernel. You can invoke that variable using(thespecifies the kernel release number from within the system information that would normally be displayed):

With that information, you can incorporate `uname` into your filesystem references using a process known as command substitution. To navigate to the right directory, for instance, you'd add it to `/lib/modules`. To tell Linux that "uname" isn't a filesystem location, enclose the `uname` part in backticks, like this:
```
$ ls /lib/modules/`uname -r`

build   modules.alias        modules.dep      modules.softdep

initrd  modules.alias.bin    modules.dep.bin  modules.symbols

kernel  modules.builtin      modules.devname  modules.symbols.bin

misc    modules.builtin.bin  modules.order    vdso

```

You'll find most of the modules organized within their subdirectories beneath the `kernel/` directory. Take a few minutes to browse through those directories to get an idea of how things are arranged and what's available. The filenames usually give you a good idea of what you're looking at.
```
$ ls /lib/modules/`uname -r`/kernel

arch  crypto  drivers  fs  kernel  lib  mm

net  sound  ubuntu  virt  zfs

```

That's one way to locate kernel modules; actually, it's the quick and dirty way to go about it. But it's not the only way. If you want to get the complete set, you can list all currently loaded modules, along with some basic information, by using `lsmod`. The first column of this truncated output (there would be far too many to list here) is the module name, followed by the file size and number, and then the names of other modules on which each is dependent:
```
$ lsmod

[...]

vboxdrv          454656  3 vboxnetadp,vboxnetflt,vboxpci

rt2x00usb        24576  1 rt2800usb

rt2800lib        94208  1 rt2800usb

[...]

```

How many are far too many? Well, let's run `lsmod` once again, but this time piping the output to `wc -l` to get a count of the lines:
```
$ lsmod | wc -l

113

```

Those are the loaded modules. How many are available in total? Running `modprobe -c` and counting the lines will give us that number:
```
$ modprobe -c | wc -l

33350

```

There are 33,350 available modules!?! It looks like someone's been working hard over the years to provide us with the software to run our physical devices.

Note: On some systems, you might encounter customized modules that are referenced either with their unique entries in the `/etc/modules` file or as a configuration file saved to `/etc/modules-load.d/`. The odds are that such modules are the product of local development projects, perhaps involving cutting-edge experiments. Either way, it's good to have some idea of what it is you're looking at.

That's how you find modules. Your next job is to figure out how to manually load an inactive module if, for some reason, it didn't happen on its own.

### Manually loading kernel modules

Before you can load a kernel module, logic dictates that you'll have to confirm it exists. And before you can do that, you'll need to know what it's called. Getting that part sometimes requires equal parts magic and luck and some help from of the hard work of online documentation authors.

I'll illustrate the process by describing a problem I ran into some time back. One fine day, for a reason that still escapes me, the WiFi interface on a laptop stopped working. Just like that. Perhaps a software update knocked it out. Who knows? I ran `lshw -c network` and was treated to this very strange information:
```
network UNCLAIMED

    AR9485 Wireless Network Adapter

```

Linux recognized the interface (the Atheros AR9485) but listed it as unclaimed. Well, as they say, "When the going gets tough, the tough search the internet." I ran a search for atheros ar9 linux module and, after sifting through pages and pages of five- and even 10-year-old results advising me to either write my own module or just give up, I finally discovered that (with Ubuntu 16.04, at least) a working module existed. Its name is ath9k.

Yes! The battle's as good as won! Adding a module to the kernel is a lot easier than it sounds. To double check that it's available, you can run `find` against the module's directory tree, specify `-type f` to tell Linux you're looking for a file, and then add the string `ath9k` along with a glob asterisk to include all filenames that start with your string:
```
$ find /lib/modules/$(uname -r) -type f -name ath9k*

/lib/modules/4.4.0-97-generic/kernel/drivers/net/wireless/ath/ath9k/ath9k_common.ko

/lib/modules/4.4.0-97-generic/kernel/drivers/net/wireless/ath/ath9k/ath9k.ko

/lib/modules/4.4.0-97-generic/kernel/drivers/net/wireless/ath/ath9k/ath9k_htc.ko

/lib/modules/4.4.0-97-generic/kernel/drivers/net/wireless/ath/ath9k/ath9k_hw.ko

```

Just one more step, load the module:
```
# modprobe ath9k

```

That's it. No reboots. No fuss.

Here's one more example to show you how to work with active modules that have become corrupted. There was a time when using my Logitech webcam with a particular piece of software would make the camera inaccessible to any other programs until the next system boot. Sometimes I needed to open the camera in a different application but didn't have the time to shut down and start up again. (I run a lot of applications, and getting them all in place after booting takes some time.)

Because this module is presumably active, using `lsmod` to search for the word video should give me a hint about the name of the relevant module. In fact, it's better than a hint: The only module described with the word video is uvcvideo (as you can see in the following):
```
$ lsmod | grep video

uvcvideo               90112  0

videobuf2_vmalloc      16384  1 uvcvideo

videobuf2_v4l2         28672  1 uvcvideo

videobuf2_core         36864  2 uvcvideo,videobuf2_v4l2

videodev              176128  4 uvcvideo,v4l2_common,videobuf2_core,videobuf2_v4l2

media                  24576  2 uvcvideo,videodev

```

There was probably something I could have controlled for that was causing the crash, and I guess I could have dug a bit deeper to see if I could fix things the right way. But you know how it is; sometimes you don't care about the theory and just want your device working. So I used `rmmod` to kill the uvcvideo module and `modprobe` to start it up again all nice and fresh:
```
# rmmod uvcvideo

# modprobe uvcvideo

```

Again: no reboots. No stubborn blood stains.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/how-load-or-unload-linux-kernel-module

作者：[David Clinto][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/dbclinton
[1]:https://www.manning.com/books/linux-in-action?a_aid=bootstrap-it&a_bid=4ca15fc9&chan=opensource
[2]:/file/397906
[3]:https://opensource.com/sites/default/files/uploads/kernels.png (Kernel modules)

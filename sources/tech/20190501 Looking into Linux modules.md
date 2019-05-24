[#]: collector: (lujun9972)
[#]: translator: (bodhix)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Looking into Linux modules)
[#]: via: (https://www.networkworld.com/article/3391362/looking-into-linux-modules.html#tk.rss_all)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Looking into Linux modules
======
The lsmod command can tell you which kernel modules are currently loaded on your system, along with some interesting details about their use.
![Rob Oo \(CC BY 2.0\)][1]

### What are Linux modules?

Kernel modules are chunks of code that are loaded and unloaded into the kernel as needed, thus extending the functionality of the kernel without requiring a reboot. In fact, unless users inquire about modules using commands like **lsmod** , they won't likely know that anything has changed.

One important thing to understand is that there are _lots_ of modules that will be in use on your Linux system at all times and that a lot of details are available if you're tempted to dive into the details.

One of the prime ways that lsmod is used is to examine modules when a system isn't working properly. However, most of the time, modules load as needed and users don't need to be aware of how they are working.

**[ Also see:[Must-know Linux Commands][2] ]**

### Listing modules

The easiest way to list modules is with the **lsmod** command. While this command provides a lot of detail, this is the most user-friendly output.

```
$ lsmod
Module                  Size  Used by
snd_hda_codec_realtek 114688  1
snd_hda_codec_generic  77824  1 snd_hda_codec_realtek
ledtrig_audio          16384  2 snd_hda_codec_generic,snd_hda_codec_realtek
snd_hda_codec_hdmi     53248  1
snd_hda_intel          40960  2
snd_hda_codec         131072  4 snd_hda_codec_generic,snd_hda_codec_hdmi,snd_hda_intel
                                ,snd_hda_codec_realtek
snd_hda_core           86016  5 snd_hda_codec_generic,snd_hda_codec_hdmi,snd_hda_intel
                                ,snd_hda_codec,snd_hda_codec_realtek
snd_hwdep              20480  1 snd_hda_codec
snd_pcm               102400  4 snd_hda_codec_hdmi,snd_hda_intel,snd_hda_codec,snd_hda
                                _core
snd_seq_midi           20480  0
snd_seq_midi_event     16384  1 snd_seq_midi
dcdbas                 20480  0
snd_rawmidi            36864  1 snd_seq_midi
snd_seq                69632  2 snd_seq_midi,snd_seq_midi_event
coretemp               20480  0
snd_seq_device         16384  3 snd_seq,snd_seq_midi,snd_rawmidi
snd_timer              36864  2 snd_seq,snd_pcm
kvm_intel             241664  0
kvm                   626688  1 kvm_intel
radeon               1454080  10
irqbypass              16384  1 kvm
joydev                 24576  0
input_leds             16384  0
ttm                   102400  1 radeon
drm_kms_helper        180224  1 radeon
drm                   475136  13 drm_kms_helper,radeon,ttm
snd                    81920  15 snd_hda_codec_generic,snd_seq,snd_seq_device,snd_hda
                                 _codec_hdmi,snd_hwdep,snd_hda_intel,snd_hda_codec,snd
                                 _hda_codec_realtek,snd_timer,snd_pcm,snd_rawmidi
i2c_algo_bit           16384  1 radeon
fb_sys_fops            16384  1 drm_kms_helper
syscopyarea            16384  1 drm_kms_helper
serio_raw              20480  0
sysfillrect            16384  1 drm_kms_helper
sysimgblt              16384  1 drm_kms_helper
soundcore              16384  1 snd
mac_hid                16384  0
sch_fq_codel           20480  2
parport_pc             40960  0
ppdev                  24576  0
lp                     20480  0
parport                53248  3 parport_pc,lp,ppdev
ip_tables              28672  0
x_tables               40960  1 ip_tables
autofs4                45056  2
raid10                 57344  0
raid456               155648  0
async_raid6_recov      24576  1 raid456
async_memcpy           20480  2 raid456,async_raid6_recov
async_pq               24576  2 raid456,async_raid6_recov
async_xor              20480  3 async_pq,raid456,async_raid6_recov
async_tx               20480  5 async_pq,async_memcpy,async_xor,raid456,async_raid6_re
                                cov
xor                    24576  1 async_xor
raid6_pq              114688  3 async_pq,raid456,async_raid6_recov
libcrc32c              16384  1 raid456
raid1                  45056  0
raid0                  24576  0
multipath              20480  0
linear                 20480  0
hid_generic            16384  0
psmouse               151552  0
i2c_i801               32768  0
pata_acpi              16384  0
lpc_ich                24576  0
usbhid                 53248  0
hid                   126976  2 usbhid,hid_generic
e1000e                245760  0
floppy                 81920  0
```

In the output above:

  * "Module" shows the name of each module
  * "Size" shows the module size (not how much memory it is using)
  * "Used by" shows each module's usage count and the referring modules



Clearly, that's a _lot_ of modules. The number of modules loaded will depend on your system and distribution and what's running. We can count them like this:

```
$ lsmod | wc -l
67
```

To see the number of modules available on the system (not just running), try this command:

```
$ modprobe -c | wc -l
41272
```

### Other commands for examining modules

Linux provides several commands for listing, loading and unloading, examining, and checking the status of modules.

  * depmod -- generates modules.dep and map files
  * insmod -- a simple program to insert a module into the Linux Kernel
  * lsmod -- show the status of modules in the Linux Kernel
  * modinfo -- show information about a Linux Kernel module
  * modprobe -- add and remove modules from the Linux Kernel
  * rmmod -- a simple program to remove a module from the Linux Kernel



### Listing modules that are built in

As mentioned above, the **lsmod** command is the most convenient command for listing modules. There are, however, other ways to examine them. The modules.builtin file lists all modules that are built into the kernel and is used by modprobe when trying to load one of these modules. Note that **$(uname -r)** in the commands below provides the name of the kernel release.

```
$ more /lib/modules/$(uname -r)/modules.builtin | head -10
kernel/arch/x86/crypto/crc32c-intel.ko
kernel/arch/x86/events/intel/intel-uncore.ko
kernel/arch/x86/platform/intel/iosf_mbi.ko
kernel/mm/zpool.ko
kernel/mm/zbud.ko
kernel/mm/zsmalloc.ko
kernel/fs/binfmt_script.ko
kernel/fs/mbcache.ko
kernel/fs/configfs/configfs.ko
kernel/fs/crypto/fscrypto.ko
```

You can get some additional detail on a module by using the **modinfo** command, though nothing that qualifies as an easy explanation of what service the module provides. The omitted details from the output below include a lengthy signature.

```
$ modinfo floppy | head -16
filename:       /lib/modules/5.0.0-13-generic/kernel/drivers/block/floppy.ko
alias:          block-major-2-*
license:        GPL
author:         Alain L. Knaff
srcversion:     EBEAA26742DF61790588FD9
alias:          acpi*:PNP0700:*
alias:          pnp:dPNP0700*
depends:
retpoline:      Y
intree:         Y
name:           floppy
vermagic:       5.0.0-13-generic SMP mod_unload
sig_id:         PKCS#7
signer:
sig_key:
sig_hashalgo:   md4
```

You can load or unload a module using the **modprobe** command. Using a command like the one below, you can locate the kernel object associated with a particular module:

```
$ find /lib/modules/$(uname -r) -name floppy*
/lib/modules/5.0.0-13-generic/kernel/drivers/block/floppy.ko
```

If you needed to load the module, you could use a command like this one:

```
$ sudo modprobe floppy
```

### Wrap-up

Clearly the loading and unloading of modules is a big deal. It makes Linux systems considerably more flexible and efficient than if they ran with a one-size-fits-all kernel. It also means you can make significant changes — including adding hardware — without rebooting.

**[ Two-Minute Linux Tips:[Learn how to master a host of Linux commands in these 2-minute video tutorials][3] ]**

Join the Network World communities on [Facebook][4] and [LinkedIn][5] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3391362/looking-into-linux-modules.html#tk.rss_all

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/04/modules-100794941-large.jpg
[2]: https://www.networkworld.com/article/3391029/must-know-linux-commands.html
[3]: https://www.youtube.com/playlist?list=PL7D2RMSmRO9J8OTpjFECi8DJiTQdd4hua
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world

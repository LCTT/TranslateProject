[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Enable Canonical Kernel Livepatch Service on Ubuntu LTS System?)
[#]: via: (https://www.2daygeek.com/enable-canonical-kernel-livepatch-service-on-ubuntu-lts-system/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

How to Enable Canonical Kernel Livepatch Service on Ubuntu LTS System?
======

Canonical was introduced Live patch Service in Ubuntu 14.04 LTS system.

Live patching service allows you to install and apply critical Linux kernel security updates without rebooting your system.

This means, you don’t need to reboot your system after applying the kernel patches.

But usually, we need to reboot the Linux server after installing the kernel patches to available for the system to use.

Live patching is pretty fast. Most kernel fixes apply in seconds without any issues.

Canonical live patch service is available for user upto 3 systems without any cost.

You can enable Canonical Live patch in both variants desktop and server, through the command line.

This live patching system is intended to address high and critical Linux kernel security vulnerabilities.

Refer the following table for [supported systems][1] and other details.

Ubuntu Release | Arch | Kernel Version | Kernel Variants
---|---|---|---
Ubuntu 18.04 LTS | 64-bit x86 | 4.15 | GA generic and lowlatency kernel variants only
Ubuntu 16.04 LTS | 64-bit x86 | 4.4 | GA generic and lowlatency kernel variants only
Ubuntu 14.04 LTS | 64-bit x86 | 4.4 | Hardware Enablement kernel only

**`Note:`**` ` Canonical Livepatch Service in Ubuntu 14.04 LTS requires users to run the Ubuntu v4.4 kernel in Trusty. Please reboot into this kernel if you are not currently running to use the service.

To do so, follow the below procedures.

### How To Get Live patch Token?

Navigate to [Canonical Live patch service page][2] and choose `Ubuntu user` if you want to use the free service.

It will be applicable upto 3 systems. If you are an `UA customer`, then select Ubuntu Advantage customer. Finally click Get your Live patch token.
[![][3]![][3]][4]

Make sure you already have account in `Ubuntu One`. If no, you can create a new one.

After logged in, you will get a secret key for your account.
[![][3]![][3]][5]

### Install Snap Daemon in Your System

The live patching system is handled through a snap package. So, make sure you have the “snap daemon” installed on your Ubuntu system.

```
$ sudo apt update

$ sudo apt install snapd
```

### How To Install &amp; Configure Live patch Service in Your System?

Install the canonical-livepatch daemon by running the below command.

```
$ sudo snap install canonical-livepatch

canonical-livepatch 9.4.1 from Canonical* installed
```

Run the following command to enable live kernel patches on an Ubuntu machine.

```
$ sudo canonical-livepatch enable xxxxc4xxxx67xxxxbxxxxbxxxxfbxx4e

Successfully enabled device. Using machine-token: xxxxc4xxxx67xxxxbxxxxbxxxxfbxx4e
```

Run the below command to find the status of your livepatched machine.

```
$ sudo canonical-livepatch status

client-version: 9.4.1
architecture: x86_64
cpu-model: Intel(R) Core(TM) i7-6700HQ CPU @ 2.60GHz
last-check: 2019-07-24T12:30:04+05:30
boot-time: 2019-07-24T12:11:06+05:30
uptime: 19m11s
status:
- kernel: 4.15.0-55.60-generic
  running: true
  livepatch:
    checkState: checked
    patchState: nothing-to-apply
    version: ""
    fixes: ""
```

Run the above same command with the `--verbose` switch to get more information about live patched machine.

```
$ sudo canonical-livepatch status --verbose
```

Execute the below command, if you would like to run the patch manually.

```
$ sudo canonical-livepatch refresh

Before refresh:

kernel: 4.15.0-55.60-generic
fully-patched: true
version: ""

After refresh:

kernel: 4.15.0-55.60-generic
fully-patched: true
version: ""
```

You will be getting one of the below status in the `patchState` output.

  * **applied:** There are no vulnerabilities found
  * **nothing-to-apply:** Vulnerabilities are found and patched successfully
  * **kernel-upgrade-required:** Livepatch cannot install a patch to fix the vulnerability



Make a note, installing a kernel patch is different from upgrading/installing a new kernel on system. If you have installed new kernel then you have to reboot the system to activate the new kernel.

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/enable-canonical-kernel-livepatch-service-on-ubuntu-lts-system/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://wiki.ubuntu.com/Kernel/Livepatch
[2]: https://auth.livepatch.canonical.com/
[3]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[4]: https://www.2daygeek.com/wp-content/uploads/2019/07/enable-canonical-livepatch-service-on-ubuntu-lts-system-1.jpg
[5]: https://www.2daygeek.com/wp-content/uploads/2019/07/enable-canonical-livepatch-service-on-ubuntu-lts-system-2.jpg

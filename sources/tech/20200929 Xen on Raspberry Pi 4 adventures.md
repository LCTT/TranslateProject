[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Xen on Raspberry Pi 4 adventures)
[#]: via: (https://www.linux.com/featured/xen-on-raspberry-pi-4-adventures/)
[#]: author: (Linux.com Editorial Staff https://www.linux.com/author/linuxdotcom/)

Xen on Raspberry Pi 4 adventures
======

Written by [Stefano Stabellini][1] and [Roman Shaposhnik][2]

![][3]

Raspberry Pi (RPi) has been a key enabling device for the Arm community for years, given the low price and widespread adoption. According to the RPi Foundation, over 35 million have been sold, with 44% of these sold into industry. We have always been eager to get the Xen hypervisor running on it, but technical differences between RPi and other Arm platforms made it impractical for the longest time. Specifically, a non-standard interrupt controller without virtualization support.

Then the Raspberry Pi 4 came along, together with a regular GIC-400 interrupt controller that Xen supports out of the box. Finally, we could run Xen on an RPi device. Soon Roman Shaposhnik of Project EVE and a few other community members started asking about it on the **xen-devel** mailing list. _“It should be easy,”_ we answered. _“It might even work out of the box,”_ we wrote in our reply. We were utterly oblivious that we were about to embark on an adventure deep in the belly of the Xen memory allocator and Linux address translation layers.

The first hurdle was the availability of low memory addresses. RPi4 has devices that can only access the first 1GB of RAM. The amount of memory below 1GB in **Dom0** was not enough. Julien Grall solved this problem with a simple one-line fix to increase the memory allocation below 1GB for **Dom0** on RPi4. The patch is now present in Xen 4.14.

_“This lower-than-1GB limitation is uncommon, but now that it is fixed, it is just going to work.”_ We were wrong again. The Xen subsystem in Linux uses _virt_to_phys_ to convert virtual addresses to physical addresses, which works for most virtual addresses but not all. It turns out that the RPi4 Linux kernel would sometimes pass virtual addresses that cannot be translated to physical addresses using _virt_to_phys_, and doing so would result in serious errors. The fix was to use a different address translation function when appropriate. The patch is now present in Linux’s master branch.

We felt confident that we finally reached the end of the line. _“Memory allocations – check. Memory translations — check. We are good to go!”_ No, not yet. It turns out that the most significant issue was yet to be discovered. The Linux kernel has always had the concept of physical addresses and DMA addresses, where DMA addresses are used to program devices and could be different from physical addresses. In practice, none of the x86, ARM, and ARM64 platforms where Xen could run had DMA addresses different from physical addresses. The Xen subsystem in Linux is exploiting the DMA/physical address duality for its own address translations. It uses it to convert physical addresses, as seen by the guest, to physical addresses, as seen by Xen.

To our surprise and astonishment, the Raspberry Pi 4 was the very first platform to have physical addresses different from DMA addresses, causing the Xen subsystem in Linux to break. It wasn’t easy to narrow down the issue. Once we understood the problem, a dozen patches later, we had full support for handling DMA/physical address conversions in Linux. The Linux patches are in master and will be available in Linux 5.9.

Solving the address translation issue was the end of our fun hacking adventure. With the Xen and Linux patches applied, Xen and Dom0 work flawlessly. Once Linux 5.9 is out, we will have Xen working on RPi4 out of the box.

We will show you how to run Xen on RPi4, the real Xen hacker way, and as part of a downstream distribution for a much easier end-user experience.

## **Hacking Xen on Raspberry Pi 4**

If you intend to hack on Xen on ARM and would like to use the RPi4 to do it, here is what you need to do to get Xen up and running using UBoot and TFTP. I like to use TFTP because it makes it extremely fast to update any binary during development.  See [this tutorial][4] on how to set up and configure a TFTP server. You also need a UART connection to get early output from Xen and Linux; please refer to [this article][5].

Use the [rpi-imager][6] to format an SD card with the regular default Raspberry Pi OS. Mount the first SD card partition and edit **config.txt**. Make sure to add the following:

```
kernel=u-boot.bin

enable_uart=1

arm_64bit=1
```

Download a suitable UBoot binary for RPi4 (u-boot.bin) from any distro, for instance [OpenSUSE][7]. Download the JeOS image, then open it and save **u-boot.bin**:

```
xz -d openSUSE-Tumbleweed-ARM-JeOS-raspberrypi4.aarch64.raw.xz

kpartx -a ./openSUSE-Tumbleweed-ARM-JeOS-raspberrypi4.aarch64.raw

mount /dev/mapper/loop0p1 /mnt

cp /mnt/u-boot.bin /tmp
```

Place u-boot.bin in the first SD card partition together with config.txt. Next time the system boots, you will get a UBoot prompt that allows you to load Xen, the Linux kernel for **Dom0**, the **Dom0 rootfs**, and the device tree from a TFTP server over the network. I automated the loading steps by placing a UBoot **boot.scr** script on the SD card:

```
setenv serverip 192.168.0.1

setenv ipaddr 192.168.0.2

tftpb 0xC00000 boot2.scr

source 0xC00000
```

Where:

```
- serverip is the IP of your TFTP server

- ipaddr is the IP of the RPi4
```

Use mkimage to generate boot.scr and place it next to config.txt and u-boot.bin:

```
mkimage -T script -A arm64 -C none -a 0x2400000 -e 0x2400000 -d boot.source boot.scr
```

Where:

```
- boot.source is the input

- boot.scr is the output
```

UBoot will automatically execute the provided boot.scr, which sets up the network and fetches a second script (boot2.scr) from the TFTP server. boot2.scr should come with all the instructions to load Xen and the other required binaries. You can generate boot2.scr using [ImageBuilder][8].

Make sure to use Xen 4.14 or later. The Linux kernel should be master (or 5.9 when it is out, 5.4-rc4 works.) The Linux ARM64 default config works fine as kernel config. Any 64-bit rootfs should work for Dom0. Use the device tree that comes with upstream Linux for RPi4 (**arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b.dtb**). RPi4 has two UARTs; the default is **bcm2835-aux-uart** at address **0x7e215040**. It is specified as “serial1” in the device tree instead of serial0. You can tell Xen to use serial1 by specifying on the Xen command line:

```
console=dtuart dtuart=serial1 sync_console
```

 The Xen command line is provided by the **boot2.scr** script generated by ImageBuilder as “**xen,xen-bootargs**“. After editing **boot2.source** you can regenerate **boot2.scr** with **mkimage**:

```
mkimage -A arm64 -T script -C none -a 0xC00000 -e 0xC00000 -d boot2.source boot2.scr
```

## **Xen on Raspberry Pi 4: an easy button**

Getting your hands dirty by building and booting Xen on Raspberry Pi 4 from scratch can be not only deeply satisfying but can also give you a lot of insight into how everything fits together on ARM. Sometimes, however, you just want to get a quick taste for what it would feel to have Xen on this board. This is typically not a problem for Xen, since pretty much every Linux distribution provides Xen packages and having a fully functional Xen running on your system is a mere “apt” or “zypper” invocation away. However, given that Raspberry Pi 4 support is only a few months old, the integration work hasn’t been done yet. The only operating system with fully integrated and tested support for Xen on Raspberry Pi 4 is [LF Edge’s Project EVE][9].

Project EVE is a secure-by-design operating system that supports running Edge Containers on compute devices deployed in the field. These devices can be IoT gateways, Industrial PCs, or general-purpose ruggedized computers. All applications running on EVE are represented as Edge Containers and are subject to container orchestration policies driven by k3s. Edge containers themselves can encapsulate Virtual Machines, Containers, or Unikernels. 

You can find more about EVE on the project’s website at <http://projecteve.dev> and its GitHub repo <https://github.com/lf-edge/eve/blob/master/docs/README.md>. The latest instructions for creating a bootable media for Raspberry Pi 4 are also available at: 

<https://github.com/lf-edge/eve/blob/master/docs/README.md>

Because EVE publishes fully baked downloadable binaries, using it to give Xen on Raspberry Pi 4 a try is as simple as:

```
$ docker pull lfedge/eve:5.9.0-rpi-xen-arm64 # you can pick a different 5.x.y release if you like

$ docker run lfedge/eve:5.9.0-rpi-xen-arm64 live > live.raw
```

This is followed by flashing the resulting **live.raw** binary onto an SD card using your favorite tool. 

Once those steps are done, you can insert the card into your Raspberry Pi 4, connect the keyboard and the monitor and enjoy a minimalistic Linux distribution (based on Alpine Linux and Linuxkit) that is Project EVE running as **Dom0** under Xen.

As far as Linux distributions go, EVE presents a somewhat novel design for an operating system, but at the same time, it is heavily inspired by ideas from Qubes OS, ChromeOS, Core OS, and Smart OS. If you want to take it beyond simple console tasks and explore how to run user domains on it, we recommend heading over to EVE’s sister project Eden: <https://github.com/lf-edge/eden#raspberry-pi-4-support> and following a short tutorial over there.

If anything goes wrong, you can always find an active community of EVE and Eden users on LF Edge’s Slack channels starting with #eve over at <http://lfedge.slack.com/> — we’d love to hear your feedback.

In the meantime – happy hacking!

--------------------------------------------------------------------------------

via: https://www.linux.com/featured/xen-on-raspberry-pi-4-adventures/

作者：[Linux.com Editorial Staff][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/author/linuxdotcom/
[b]: https://github.com/lujun9972
[1]: https://twitter.com/stabellinist?lang=en
[2]: https://twitter.com/rhatr?lang=en
[3]: https://www.linux.com/wp-content/uploads/2020/09/xen_project_logo.jpg
[4]: https://help.ubuntu.com/community/TFTP
[5]: https://lancesimms.com/RaspberryPi/HackingRaspberryPi4WithYocto_Part1.html
[6]: https://www.raspberrypi.org/documentation/installation/installing-images/#:~:text=Using%20Raspberry%20Pi%20Imager,Pi%20Imager%20and%20install%20it
[7]: https://en.opensuse.org/HCL:Raspberry_Pi4
[8]: https://wiki.xenproject.org/wiki/ImageBuilder
[9]: https://www.lfedge.org/projects/eve/

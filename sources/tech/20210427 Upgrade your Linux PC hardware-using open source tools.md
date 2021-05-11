[#]: subject: (Upgrade your Linux PC hardware using open source tools)
[#]: via: (https://opensource.com/article/21/4/upgrade-linux-hardware)
[#]: author: (Howard Fosdick https://opensource.com/users/howtech)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Upgrade your Linux PC hardware using open source tools
======
Get more performance from your PC with the hardware upgrades that will
give you the biggest payback.
![Business woman on laptop sitting in front of window][1]

In my article on [identifying Linux performance bottlenecks using open source tools][2], I explained some simple ways to monitor Linux performance using open source graphical user interface (GUI) tools. I focused on identifying _performance bottlenecks_, situations where a hardware resource reaches its limits and holds back your PC's performance.

How can you address a performance bottleneck? You could tune the applications or system software. Or you could run more efficient apps. You could even alter your behavior using your computer, for example, by scheduling background programs for off-hours.

You can also improve your PC's performance through a hardware upgrade. This article focuses on the upgrades that give you the biggest payback.

Open source tools are the key. GUI tools help you monitor your system to predict which hardware improvements will be effective. Otherwise, you might buy hardware and find that it doesn't improve performance. After an upgrade, these tools also help verify that the upgrade produced the benefits you expected.

This article outlines a simple approach to PC hardware upgrades. The "secret sauce" is open source GUI tools.

### How to upgrade memory

Years ago, memory upgrades were a no-brainer. Adding memory nearly always improved performance.

Today, that's no longer the case. PCs come with much more memory, and Linux uses it very efficiently. If you buy memory your system doesn't need, you've wasted money.

So you'll want to spend some time monitoring your computer to see if a memory upgrade will help its performance. For example, watch memory use while you go about your typical day. And be sure to check what happens during memory-intensive workloads.

A wide variety of open source tools can help with this monitoring, but I'll use the [GNOME System Monitor][3]. It's available in most Linux repositories.

When you start up the System Monitor, its **Resources** panel displays this output:

![Monitoring memory with GNOME System Monitor][4]

Fig. 1. Monitoring memory with GNOME System Monitor (Howard Fosdick, [CC BY-SA 4.0][5])

The middle of the screen shows memory use. [Swap][6] is disk space that Linux uses when it runs low on memory. Linux effectively increases memory by using swap as a slower extension to memory.

Since swap is slower than memory, if swap activity becomes significant, adding memory will improve your computer's performance. How much improvement you'll get depends on the amount of swap activity and the speed of your swap device.

If a lot of swap space is used, you'll get a bigger performance improvement by adding memory than if only a small amount of swap is used.

And if swap resides on a slow mechanical hard drive, you'll see a greater improvement by adding memory than you will if swap resides on the fastest available solid-state disk.

Here's an example of when to add memory. This computer shows increased swap activity after memory utilization hits 80%. It becomes unresponsive as memory use surpasses 90%:

![System Monitor - Out Of Memory Condition][7]

Fig. 2. A memory upgrade will help (Howard Fosdick, [CC BY-SA 4.0][5])

#### How to perform a memory upgrade

Before you upgrade, you need to determine how many memory slots you have, how many are open, the kinds of memory sticks they require, and your motherboard's maximum allowable memory.

You can read your computer's documentation to get those answers. Or, you can just enter these Linux line commands:

_What are the characteristics of the installed memory sticks?_ | `sudo lshw -short -C memory`
---|---
_What is the maximum allowable memory for this computer?_ | `sudo dmidecode -t memory | grep -i max`
_How many memory slots are open?_ (A null response means none are available) | `sudo lshw -short -C memory | grep -i empty`

As with all hardware upgrades, unplug the computer beforehand. Ground yourself before you touch your hardware—even the tiniest shock can damage circuitry. Fully seat the memory sticks into the motherboard slots.

After the upgrade, start System Monitor. Run the same programs that overloaded your memory before.

System Monitor should show your expanded memory, and you should see better performance.

### How to upgrade storage

We're in an era of rapid storage improvements. Even computers that are only a few years old can benefit from disk upgrades. But first, you'll want to make sure an upgrade makes sense for your computer and workload.

Start by finding out what disk you have. Many open source tools will tell you. [Hardinfo][8] or [GNOME Disks][9] are good options because both are widely available, and their output is easy to understand. These apps will tell you your disk's make, model, and other details.

Next, determine your disk's performance by benchmarking it. GNOME Disks makes this easy. Just start the tool and click on its **Benchmark Disk** option. This gives you disk read and write rates and the average disk access time:

![GNOME Disks benchmark][10]

Fig. 3. GNOME Disks benchmark output (Howard Fosdick, [CC BY-SA 4.0][5])

With this information, you can compare your disk to others at benchmarking websites like [PassMark Software][11] and [UserBenchmark][12]. Those provide performance statistics, speed rankings, and even price and performance numbers. You can get an idea of how your disk compares to possible replacements.

Here's an example of some of the detailed disk info you'll find at UserBenchmark:

![Disk comparisons at UserBenchmark][13]

Fig. 4. Disk comparisons at [UserBenchmark][14]

#### Monitor disk utilization

Just as you did with memory, monitor your disk in real time to see if a replacement would improve performance. The [`atop` line command][15] tells you how busy a disk is.

In its output below, you can see that device `sdb` is `busy 101%`. And one of the processors is waiting on that disk to do its work 85% of the time (`cpu001 w 85%`):

![atop command shows disk utilization][16]

Fig. 5. atop command shows disk utilization (Howard Fosdick, [CC BY-SA 4.0][5])

Clearly, you could improve performance with a faster disk.

You'll also want to know which program(s) are causing all that disk usage. Just start up the System Monitor and click on its **Processes** tab.

Now you know how busy your disk is and what program(s) are using it, so you can make an educated judgment whether a faster disk would be worth the expense.

#### Buying the disk

You'll encounter three major technologies when buying a new internal disk:

  * Mechanical hard drives (HDDs)
  * SATA-connected solid-state disks (SSDs)
  * PCIe-connected NVMe solid-state disks (NVMe SSDs)



What are their speed differences? You'll see varying numbers all over the web. Here's a typical example:

![Relative disk speeds][17]

Fig. 6. Relative speeds of internal disk technologies ([Unihost][18])

  * **Red bar:** Mechanical hard disks offer the cheapest bulk storage. But in terms of performance, they're slowest by far.
  * **Green bar:** SSDs are faster than mechanical hard drives. But if an SSD uses a SATA interface, that limits its performance. This is because the SATA interface was designed over a decade ago for mechanical hard drives.
  * **Blue bar:** The fastest technology for internal disks is the new [PCIe-connected NVMe solid-state disk][19]. These can be roughly five times faster than SATA-connected SSDs and 20 times faster than mechanical hard disks.



For external SSDs, you'll find that the [latest Thunderbolt and USB interfaces][20] are the fastest.

#### How to install an internal disk

Before purchasing any disk, verify that your computer can support the necessary physical interface.

For example, many NVMe SSDs use the popular new M.2 (2280) form factor. That requires either a tailor-made motherboard slot, a PCIe adapter card, or an external USB adapter. Your choice could affect your new disk's performance.

Always back up your data and operating system before installing a new disk. Then copy them to the new disk. Open source [tools][21] like Clonezilla, Mondo Rescue, or GParted can do the job. Or you could use Linux line commands like `dd` or `cp`.

Be sure to use your fast new disk in situations where it will have the most impact. Employ it as a boot drive, for storing your operating system and apps, for swap space, and for your most frequently processed data.

After the upgrade, run GNOME Disks to benchmark your new disk. This helps you verify that you got the performance boost you expected. You can verify real-time operation with the `atop` command.

### How to upgrade USB ports

Like disk storage, USB performance has shown great strides in the past several years. Many computers only a few years old could get a big performance boost simply by adding a cheap USB port card.

Whether the upgrade is worthwhile depends on how frequently you use your ports. Use them rarely, and it doesn't matter if they're slow. Use them frequently, and an upgrade might really impact your work.

Here's how dramatically maximum USB data rates vary across port standards: 

![USB speeds][22]

Fig. 7. USB speeds vary greatly (Howard Fosdick, [CC BY-SA 4.0][5], based on data from [Tripplite][23] and [Wikipedia][24])

To see the actual USB speeds you're getting, start GNOME Disks. GNOME Disks can benchmark a USB-connected device just like it can an internal disk. Select its **Benchmark Disk** option.

The device you plug in and the USB port together determine the speed you'll get. If the port and device are mismatched, you'll experience the slower speed of the two.

For example, connect a device that supports USB 3.1 speeds to a 2.0 port, and you'll get the 2.0 data rate. (And your system won't tell you this unless you investigate with a tool like GNOME Disks.) Conversely, connect a 2.0 device to a 3.1 port, and you'll also get the 2.0 speed. So for best results, always match your port and device speeds.

To monitor a USB-connected device in real time, use the `atop` command and System Monitor together, the same way you did to monitor an internal disk. This helps you see if you're bumping into your current setup's limit and could benefit by upgrading.

Upgrading your ports is easy. Just buy a USB card that fits into an open PCIe slot.

USB 3.0 cards are only about $25. Newer, more expensive cards offer USB 3.1 and 3.2 ports. Nearly all USB cards are plug-and-play, so Linux automatically recognizes them. (But always verify before you buy.)

Be sure to run GNOME Disks after the upgrade to verify the new speeds.

### How to upgrade your internet connection

Upgrading your internet bandwidth is easy. Just write a check to your ISP.

The question is: should you?

System Monitor shows your bandwidth use (see Figure 1). If you consistently bump against the limit you pay your ISP for, you'll benefit from buying a higher limit.

But first, verify that you don't have a problem you could fix yourself. I've seen many cases where someone thinks they need to buy more bandwidth from their ISP when they actually just have a connection problem they could fix themselves.

Start by testing your maximum internet speed at websites like [Speedtest][25] or [Fast.com][26]. For accurate results, close all programs and run _only_ the speed test; turn off your VPN; run tests at different times of day; and compare the results from several testing sites. If you use WiFi, test with it and without it (by directly cabling your laptop to the modem).

If you have a separate router, test with and without it. That will tell you if your router is a bottleneck. Sometimes just repositioning the router in your home or updating its firmware will improve connection speed.

These tests will verify that you're getting the speeds you're paying your ISP for. They'll also expose any local WiFi or router problem you could fix yourself.

Only after you've done these tests should you conclude that you need to purchase more internet bandwidth.

### Should you upgrade your CPU or GPU?

What about upgrading your CPU (central processing unit) or GPU (graphics processing unit)?

Laptop owners typically can't upgrade either because they're soldered to the motherboard.

Most desktop motherboards support a range of CPUs and are upgradeable—assuming you're not already using the topmost processor in the series.

Use System Monitor to watch your CPU and determine if an upgrade would help. Its **Resources** panel will show your CPU load. If all your logical processors consistently stay above 80% or 90%, you could benefit from more CPU power.

It's a fun project to upgrade your CPU. Anyone can do it if they're careful.

Unfortunately, it's rarely cost-effective. Most sellers charge a premium for an individual CPU chip versus the deal they'll give you on a new system unit. So for many people, a CPU upgrade doesn't make economic sense.

If you plug your display monitor directly into your desktop's motherboard, you might benefit by upgrading your graphics processing. Just add a video card.

The trick is to achieve a balanced workload between the new video card and your CPU. This [online tool][27] identifies exactly which video cards will best work with your CPU. [This article][28] provides a detailed explanation of how to go about upgrading your graphics processing.

### Gather data before you upgrade

Personal computer users sometimes upgrade their Linux hardware based on gut feel. A better way is to monitor performance and gather some data first. Open source GUI tools make this easy. They help predict whether a hardware upgrade will be worth your time and money. Then, after your upgrade, you can use them to verify that your changes had the intended effect.

These are the most popular hardware upgrades. With a little effort and the right open source tools, any Linux user can cost-effectively upgrade a PC.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/upgrade-linux-hardware

作者：[Howard Fosdick][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/howtech
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-concentration-focus-windows-office.png?itok=-8E2ihcF (Woman using laptop concentrating)
[2]: https://opensource.com/article/21/3/linux-performance-bottlenecks
[3]: https://vitux.com/how-to-install-and-use-task-manager-system-monitor-in-ubuntu/
[4]: https://opensource.com/sites/default/files/uploads/system_monitor_-_resources_panel_0.jpg (Monitoring memory with GNOME System Monitor)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://opensource.com/article/18/9/swap-space-linux-systems
[7]: https://opensource.com/sites/default/files/uploads/system_monitor_-_out_of_memory_0.jpg (System Monitor - Out Of Memory Condition)
[8]: https://itsfoss.com/hardinfo/
[9]: https://en.wikipedia.org/wiki/GNOME_Disks
[10]: https://opensource.com/sites/default/files/uploads/gnome_disks_-_benchmark_0.jpg (GNOME Disks benchmark)
[11]: https://www.harddrivebenchmark.net/
[12]: https://www.userbenchmark.com/
[13]: https://opensource.com/sites/default/files/uploads/userbenchmark_disk_comparisons_0.jpg (Disk comparisons at UserBenchmark)
[14]: https://ssd.userbenchmark.com/
[15]: https://opensource.com/life/16/2/open-source-tools-system-monitoring
[16]: https://opensource.com/sites/default/files/uploads/atop_-_storage_bottleneck_0.jpg (atop command shows disk utilization)
[17]: https://opensource.com/sites/default/files/uploads/hdd_vs_ssd_vs_nvme_speeds_0.jpg (Relative disk speeds)
[18]: https://unihost.com/help/nvme-vs-ssd-vs-hdd-overview-and-comparison/
[19]: https://www.trentonsystems.com/blog/pcie-gen4-vs-gen3-slots-speeds
[20]: https://www.howtogeek.com/449991/thunderbolt-3-vs.-usb-c-whats-the-difference/
[21]: https://www.linuxlinks.com/diskcloning/
[22]: https://opensource.com/sites/default/files/uploads/usb_standards_-_speeds_0.jpg (USB speeds)
[23]: https://www.tripplite.com/products/usb-connectivity-types-standards
[24]: https://en.wikipedia.org/wiki/USB
[25]: https://www.speedtest.net/
[26]: https://fast.com/
[27]: https://www.gpucheck.com/gpu-benchmark-comparison
[28]: https://helpdeskgeek.com/how-to/see-how-much-your-cpu-bottlenecks-your-gpu-before-you-buy-it/

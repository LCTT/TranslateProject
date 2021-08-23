[#]: subject: "How to set up your printer on Linux"
[#]: via: "https://opensource.com/article/21/8/add-printer-linux"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "fisherue "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to set up your printer on Linux
======
In the event that your printer isn't auto-detected, this article teaches
you how to add a printer on Linux manually.
![printing on Linux][1]

Even though it's the future now and we're all supposed to be using e-ink and AR, there are still times when a printer is useful. Printer manufacturers have yet to standardize how their peripherals communicate with computers, so there's a necessary maze of printer drivers out there, regardless of what platform you're on. The IEEE-ISTO Printer Working Group (PWG) and the OpenPrinting.org site are working tirelessly to make printing as easy as possible, though. Today, many printers are autodetected with no interaction from the user.

In the event that your printer isn't auto-detected, this article teaches you how to add a printer on Linux manually. This article assumes you're on the GNOME desktop, but the basic workflow is the same for KDE and most other desktops.

### Printer drivers

Before attempting to interface with a printer from Linux, you should first verify that you have updated printer drivers.

There are three varieties of printer drivers:

  * Open source [Gutenprint drivers][2] bundled with Linux and as an installable package
  * Drivers provided by the printer manufacturer
  * Drivers created by a third party



It's worth installing the open source drivers because there are over 700 of them, so having them available increases the chance of attaching a printer and having it automatically configured for you.

### Installing open source drivers

Your Linux distribution probably already has these installed, but if not, you can install them with your package manager. For example, on Fedora, CentOS, Mageia, and similar:


```
`$ sudo dnf install gutenprint`
```

For HP printers, also install Hewlett-Packard's Linux Imaging and Printing (HPLIP) project. For example, on Debian, Linux Mint, and similar:


```
`$ sudo apt install hplip`
```

### Installing vendor drivers

Sometimes a printer manufacturer uses non-standard protocols, so the open source drivers don't work. Other times, the open source drivers work but may lack special vendor-only features. When that happens, you must visit the manufacturer's website and search for a Linux driver for your printer model. The install process varies, so read the install instructions carefully.

In the event that your printer isn't supported at all by the vendor, there are [third-party driver authors][3] that may support your printer. These drivers aren't open source, but neither are most vendor drivers. It's frustrating to have to spend an extra $45 to get support for a printer, but the alternative is to throw the printer into the rubbish, and now you know at least one brand to avoid when you purchase your next printer!

### Common Unix Printing System (CUPS)

The Common Unix Printing System (CUPS) was developed in 1997 by Easy Software Products, and purchased by Apple in 2007. It's the open source basis for printing on Linux, but most modern distributions provide a customized interface for it. Thanks to CUPS, your computer can find printers attached to it by a USB cable and even a shared printer over a network.

Once you've gotten the necessary drivers installed, you can add your printer manually. First, attach your printer to your computer and power them both on. Then open the **Printers** application from the **Activities** screen or application menu.

![printer settings][4]

CC BY-SA Opensource.com

There's a possibility that your printer is autodetected by Linux, by way of the drivers you've installed, and that no further configuration is required.

![printer settings][5]

CC BY-SA Opensource.com

Provided that you see your printer listed, you're all set, and you can already print from Linux!

If you see that you need to add a printer, click the **Unlock** button in the top right corner of the **Printers** window. Enter your administrative password and the button transforms into an **Add** button.

Click the **Add** button.

Your computer searches for attached printers (also called a _local_ printer). To have your computer look for a shared network printer, enter the IP address of the printer or its host.

![searching for a printer][6]

CC BY-SA Opensource.com

Select the printer you want to add to your system and click the **Add** button.

### Print from Linux

Printing from Linux is as easy as printing can be, whether you're using a local or networked printer. If you're looking for a printer to purchase, then check the [OpenPrinting.org database][7] to confirm that a printer has an open source driver before you spend your money. If you already have a printer, you now know how to use it on your Linux computer.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/add-printer-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[fisherue](https://github.com/fisherue)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/happy-printer.png?itok=9J44YaDs (printing on Linux)
[2]: http://gimp-print.sourceforge.net/
[3]: https://www.turboprint.info/
[4]: https://opensource.com/sites/default/files/system-settings-printer_0.png (printer settings)
[5]: https://opensource.com/sites/default/files/settings-printer.png (printer settings)
[6]: https://opensource.com/sites/default/files/printer-search.png (searching for a printer)
[7]: http://www.openprinting.org/printers/

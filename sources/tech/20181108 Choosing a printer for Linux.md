translating---geekpi

Choosing a printer for Linux
======
Linux offers widespread support for printers. Learn how to take advantage of it.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/email_paper_envelope_document.png?itok=uPj_kouJ)

We've made significant strides toward the long-rumored paperless society, but we still need to print hard copies of documents from time to time. If you're a Linux user and have a printer without a Linux installation disk or you're in the market for a new device, you're in luck. That's because most Linux distributions (as well as MacOS) use the Common Unix Printing System ([CUPS][1]), which contains drivers for most printers available today. This means Linux offers much wider support than Windows for printers.

### Selecting a printer

If you're buying a new printer, the best way to find out if it supports Linux is to check the documentation on the box or the manufacturer's website. You can also search the [Open Printing][2] database. It's a great resource for checking various printers' compatibility with Linux.

Here are some Open Printing results for Linux-compatible Canon printers.
![](https://opensource.com/sites/default/files/uploads/linux-printer_2-openprinting.png)

The screenshot below is Open Printing's results for a Hewlett-Packard LaserJet 4050—according to the database, it should work "perfectly." The recommended driver is listed along with generic instructions letting me know it works with CUPS, Line Printing Daemon (LPD), LPRng, and more.
![](https://opensource.com/sites/default/files/uploads/linux-printer_3-hplaserjet.png)

In all cases, it's best to check the manufacturer's website and ask other Linux users before buying a printer.

### Checking your connection

There are several ways to connect a printer to a computer. If your printer is connected through USB, it's easy to check the connection by issuing **lsusb** at the Bash prompt.

```
$ lsusb
```

The command returns **Bus 002 Device 004: ID 03f0:ad2a Hewlett-Packard** —it's not much information, but I can tell the printer is connected. I can get more information about the printer by entering the following command:

```
$ dmesg | grep -i usb
```

The results are much more verbose.
![](https://opensource.com/sites/default/files/uploads/linux-printer_1-dmesg.png)

If you're trying to connect your printer to a parallel port (assuming your computer has a parallel port—they're rare these days), you can check the connection with this command:

```
$ dmesg | grep -i parport
```

The information returned can help me select the right driver for my printer. I have found that if I stick to popular, name-brand printers, most of the time I get good results.

### Setting up your printer software

Both Fedora Linux and Ubuntu Linux contain easy printer setup tools. [Fedora][3] maintains an excellent wiki for answers to printing issues. The tools are easily launched from Settings in the GUI or by invoking **system-config-printer** on the command line.

![](https://opensource.com/sites/default/files/uploads/linux-printer_4-printersetup.png)

Hewlett-Packard's [HP Linux Imaging and Printing][4] (HPLIP) software, which supports Linux printing, is probably already installed on your Linux system; if not, you can [download][5] the latest version for your distribution. Printer manufacturers [Epson][6] and [Brother][7] also have web pages with Linux printer drivers and information.

What's your favorite Linux printer? Please share your opinion in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/11/choosing-printer-linux

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://www.cups.org/
[2]: http://www.openprinting.org/printers
[3]: https://fedoraproject.org/wiki/Printing
[4]: https://developers.hp.com/hp-linux-imaging-and-printing
[5]: https://developers.hp.com/hp-linux-imaging-and-printing/gethplip
[6]: https://epson.com/Support/wa00821
[7]: https://support.brother.com/g/s/id/linux/en/index.html?c=us_ot&lang=en&comple=on&redirect=on

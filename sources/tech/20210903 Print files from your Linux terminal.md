[#]: subject: "Print files from your Linux terminal"
[#]: via: "https://opensource.com/article/21/9/print-files-linux"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Print files from your Linux terminal
======
To print a file from your terminal, use the lpr command.
![Typewriter with hands][1]

[Printing on Linux is easy][2], but sometimes it feels like a lot of work to launch an application, open a file, find the **Print** selection in the menu, click a confirmation button, and so on. When you're a Linux terminal user, you often want to perform complex actions with simple triggers. Printing is complex, and there's little as simple as the `lpr` command.

### Print using the lpr command

To print a file from your terminal, use the `lpr` command:


```
`$ lpr myfile.odt`
```

Should that fail, you need to set a default printer or specify a printer manually.

### Setting a default printer

According to my well-worn copy of a Berkeley 4.2 manual printed in 1984, the `lpr` command paginated and sent a file to a printer spool, which streamed data to something called a _line printer_.

![book page displaying lpr command information][3]

The lpr command.

These days, the actual `lpr` command is insufficient because modern computers are likely to have access to several printers, and certainly to printers a lot more complex than a dot-matrix line printer. Now there's a subsystem, called the Common Unix Printing System (CUPS), to keep track of all the printers that you want your computer to access, which driver your computer should use to communicate with each printer, which printer to use by default, and so on. The `lpr.cups` or `lpr-cups` commands, bundled with CUPS and usually symlinked to `lpr`, allow you to print from a terminal by referencing your Common Unix Printing System (CUPS) configuration first.

To print a file with `lpr`, you should first set a default printer. You can set a default printer in your system's printer settings:

![dialog box to set default printer][4]

Set a default printer.

Alternately, you can mark a printer as the default with the `lpadmin` command:


```
$ sudo lpadmin -d HP_LaserJet_P2015_Series
$ lpstat -v
device for HP_LaserJet_P2015_Series: ipp://10.0.1.222:631/printers/HP_LaserJet_P2015_Series
```

### Setting a default destination with environment variables

You aren't permitted to set your own default printer on systems you don't have an admin account on because changing print destinations is considered a privileged task. Before `lpr` references CUPS for a destination, it queries your system for the **PRINTER** [environment variable][5].

In this example, `HP_LaserJet_P2015_Series` is the human-readable name given to the printer. Set **PRINTER** to that value:


```
$ PRINTER=HP_LaserJet_P2015_Series
$ export PRINTER
```

Once the **PRINTER** variable has been set, you can print:


```
`$ lpr myfile.pdf`
```

### Get a list of attached printers

You can see all the printers that are accepting print jobs and that are attached to your system with the `lpstat` command:


```
$ lpstat -a
HP_LaserJet_P2015_Series accepting requests since Sun 1 Aug 2021 10:11:02 PM NZST
r1060 accepting requests since Wed 18 Aug 2021 04:43:57 PM NZST
```

### Printing to an arbitrary printer

Once you have added printers to your system, and now that you know how to identify them, you can print to any one of them, whether you have a default destination set or not:


```
`$ lpr -P HP_LaserJet_P2015_Series myfile.txt`
```

### How printers are defined

CUPS has a user-friendly front-end accessible through a web browser such as Firefox. Even though it uses a web browser as its user interface, it's actually a service running locally on your computer (a location called **localhost**) on port 631. CUPS manages printers attached to your computer, and it stores its configuration in `/etc/cups/printers.conf`.

The `printers.conf` file consists of definitions detailing the printing devices your computer can access. You're not meant to edit it directly, but if you do, then you must stop the `cupsd` daemon first.

A typical entry looks something like this:


```
&lt;Printer r1060&gt;
  Info Ricoh 1060
  Location Downstairs
  MakeModel Ricoh Aficio 1060 - CUPS+Gutenprint v5.2.6
  DeviceURI lpd://192.168.4.8
  State Idle
  StateTime 1316011347
  Type 12308
  Filter application/vnd.cups-raw 0 -
  Filter application/vnd.cups-raster 100 rastertogutenprint.5.2
  Accepting Yes
  Shared No
  JobSheets none none
  QuotaPeriod 0
  PageLimit 0
  KLimit 0
  OpPolicy default
  ErrorPolicy stop-printer
&lt;/Printer&gt;
```

In this example, the printer's name is `r1060`, a human-readable identifier for a Ricoh Aficio 1060.

The _MakeModel_ attribute is pulled from the `lpinfo` command, which lists all available printer drivers on your system. Assuming you know that you have a Ricoh Aficio 1060 that you want to print to, then you would issue this command:


```
$ lpinfo -m | grep 1060
gutenprint.5.2://brother-hl-1060/expert Brother HL-1060 - CUPS+Gutenprint v5.2.11
gutenprint.5.2://ricoh-afc_1060/expert Ricoh Aficio 1060 - CUPS+Gutenprint v5.2.11
```

This command lists the relevant drivers you have installed.

The _MakeModel_ is the last half of the result. In this example, that's `Ricoh Aficio 1060 - CUPS+Gutenprint v5.2.11`.

The _DeviceURI_ attribute identifies where the printer is found on the network (or physical location, such as the USB port). In this example, the _DeviceURI_ is `lpd://192.168.4.8` because I'm using the `lpd` (line printer daemon) protocol to send data to a networked printer. On a different system, I have an HP LaserJet attached by a USB cable, so the _DeviceURI_ is DeviceURI `hp:/usb/HP_LaserJet_P2015_Series?serial=00CNCJM26429`.

### Printing from the terminal

Sending a job to a printer is an easy process, as long as you understand the devices attached to your system and how to identify them. Printing from the terminal is fast, efficient, and easily scripted or done as a batch job. Try it out!

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/print-files-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/typewriter-hands.jpg?itok=oPugBzgv (Typewriter with hands)
[2]: https://opensource.com/article/21/8/setup-your-printer-linux
[3]: https://opensource.com/sites/default/files/berkeley-1984-lpr.jpeg
[4]: https://opensource.com/sites/default/files/printer-default.jpeg
[5]: https://opensource.com/article/19/8/what-are-environment-variables

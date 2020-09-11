[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Printing from the Linux command line)
[#]: via: (https://www.networkworld.com/article/3373502/printing-from-the-linux-command-line.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Printing from the Linux command line
======

There's a lot more to printing from the Linux command line than the lp command. Check out some of the many available options.

![Sherry \(CC BY 2.0\)][1]

Printing from the Linux command line is easy. You use the **lp** command to request a print, and **lpq** to see what print jobs are in the queue, but things get a little more complicated when you want to print double-sided or use portrait mode. And there are lots of other things you might want to do — such as printing multiple copies of a document or canceling a print job. Let's check out some options for getting your printouts to look just the way you want them to when you're printing from the command line.

### Displaying printer settings

To view your printer settings from the command line, use the **lpoptions** command. The output should look something like this:

```
$ lpoptions
copies=1 device-uri=dnssd://HP%20Color%20LaserJet%20CP2025dn%20(F47468)._pdl-datastream._tcp.local/ finishings=3 job-cancel-after=10800 job-hold-until=no-hold job-priority=50 job-sheets=none,none marker-change-time=1553023232 marker-colors=#000000,#00FFFF,#FF00FF,#FFFF00 marker-levels=18,62,62,63 marker-names='Black\ Cartridge\ HP\ CC530A,Cyan\ Cartridge\ HP\ CC531A,Magenta\ Cartridge\ HP\ CC533A,Yellow\ Cartridge\ HP\ CC532A' marker-types=toner,toner,toner,toner number-up=1 printer-commands=none printer-info='HP Color LaserJet CP2025dn (F47468)' printer-is-accepting-jobs=true printer-is-shared=true printer-is-temporary=false printer-location printer-make-and-model='HP Color LaserJet cp2025dn pcl3, hpcups 3.18.7' printer-state=3 printer-state-change-time=1553023232 printer-state-reasons=none printer-type=167964 printer-uri-supported=ipp://localhost/printers/Color-LaserJet-CP2025dn sides=one-sided
```

This output is likely to be a little more human-friendly if you turn its blanks into carriage returns. Notice how many settings are listed.

NOTE: In the output below, some lines have been reconnected to make this output more readable.

```
$ lpoptions | tr " " '\n'
copies=1
device-uri=dnssd://HP%20Color%20LaserJet%20CP2025dn%20(F47468)._pdl-datastream._tcp.local/
finishings=3
job-cancel-after=10800
job-hold-until=no-hold
job-priority=50
job-sheets=none,none
marker-change-time=1553023232
marker-colors=#000000,#00FFFF,#FF00FF,#FFFF00
marker-levels=18,62,62,63
marker-names='Black\ Cartridge\ HP\ CC530A,
Cyan\ Cartridge\ HP\ CC531A,
Magenta\ Cartridge\ HP\ CC533A,
Yellow\ Cartridge\ HP\ CC532A'
marker-types=toner,toner,toner,toner
number-up=1
printer-commands=none
printer-info='HP Color LaserJet CP2025dn (F47468)'
printer-is-accepting-jobs=true
printer-is-shared=true
printer-is-temporary=false
printer-location
printer-make-and-model='HP Color LaserJet cp2025dn pcl3, hpcups 3.18.7'
printer-state=3
printer-state-change-time=1553023232
printer-state-reasons=none
printer-type=167964
printer-uri-supported=ipp://localhost/printers/Color-LaserJet-CP2025dn
sides=one-sided
```

With the **-v** option, the **lpinfo** command will list drivers and related information.

```
$ lpinfo -v
network ipp
network https
network socket
network beh
direct hp
network lpd
file cups-brf:/
network ipps
network http
direct hpfax
network dnssd://HP%20Color%20LaserJet%20CP2025dn%20(F47468)._pdl-datastream._tcp.local/ <== printer
network socket://192.168.0.23 <== printer IP
```

The lpoptions command will show the settings of your default printer. Use the **-p** option to specify one of a number of available printers.

```
$ lpoptions -p LaserJet
```

The **lpstat -p** command displays the status of a printer while **lpstat -p -d** also lists available printers.

```
$ lpstat -p -d
printer Color-LaserJet-CP2025dn is idle. enabled since Tue 19 Mar 2019 05:07:45 PM EDT
system default destination: Color-LaserJet-CP2025dn
```

### Useful commands

To print a document on the default printer, just use the **lp** command followed by the name of the file you want to print. If the filename includes blanks (rare on Linux systems), either put the name in quotes or start entering the file name and press the tab key to invoke file completion (as shown in the second example below).

```
$ lp "never leave home angry"
$ lp never\ leave\ home\ angry
```

The **lpq** command displays the print queue.

```
$ lpq
Color-LaserJet-CP2025dn is ready and printing
Rank Owner Job File(s) Total Size
active shs 234 agenda 2048 bytes
```

With the **-n** option, the lp command allows you to specify the number of copies of a printout you want.

```
$ lp -n 11 agenda
```

To cancel a print job, you can use the **cancel** or **lprm** command. If you don't act quickly, you might see this:

```
$ cancel 229
cancel: cancel-job failed: Job #229 is already completed - can't cancel.
```

### Two-sided printing

To print in two-sided mode, you can issue your lp command with a **sides** option that says both to print on both sides of the paper and which edge to turn the paper on. This setting represents the normal way that you would expect two-sided portrait documents to look.

```
$ lp -o sides=two-sided-long-edge Notes.pdf
```

If you want all of your documents to print in two-side mode, you can change your lp settings by using the **lpoptions** command to change the setting for **sides**.

```
$ lpoptions -o sides=two-sided-short-edge
```

To revert to single-sided printing, you would use a command like this one:

```
$ lpoptions -o sides=one-sided
```

#### Printing in landscape mode

To print in landscape mode, you would use the **landscape** option with the lp command.

```
$ lp -o landscape penguin.jpg
```

### CUPS

The print system used on Linux systems is the standards-based, open source printing system called CUPS, originally standing for **Common Unix Printing System**. It allows a computer to act as a print server.

Join the Network World communities on [Facebook][2] and [LinkedIn][3] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3373502/printing-from-the-linux-command-line.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/03/printouts-paper-100791390-large.jpg
[2]: https://www.facebook.com/NetworkWorld/
[3]: https://www.linkedin.com/company/network-world

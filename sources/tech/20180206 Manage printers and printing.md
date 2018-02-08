Manage printers and printing
======


### Printing in Linux

Although much of our communication today is electronic and paperless, we still have considerable need to print material from our computers. Bank statements, utility bills, financial and other reports, and benefits statements are just some of the items that we still print. This tutorial introduces you to printing in Linux using CUPS.

CUPS, formerly an acronym for Common UNIX Printing System, is the printer and print job manager for Linux. Early computer printers typically printed lines of text in a particular character set and font size. Today's graphical printers are capable of printing both graphics and text in a variety of sizes and fonts. Nevertheless, some of the commands you use today have their history in the older line printer daemon (LPD) technology.

This tutorial helps you prepare for Objective 108.4 in Topic 108 of the Linux Server Professional (LPIC-1) exam 102. The objective has a weight of 2.

#### Prerequisites

To get the most from the tutorials in this series, you need a basic knowledge of Linux and a working Linux system on which you can practice the commands covered in this tutorial. You should be familiar with GNU and UNIX® commands. Sometimes different versions of a program format output differently, so your results might not always look exactly like the listings shown here.

In this tutorial, I use Fedora 27 for examples.

### Some printing history

This small history is not part of the LPI objectives but may help you with context for this objective.

Early computers mostly used line printers. These were impact printers that printed a line of text at a time using fixed-pitch characters and a single font. To speed up overall system performance, early mainframe computers interleaved work for slow peripherals such as card readers, card punches, and line printers with other work. Thus was born Simultaneous Peripheral Operation On Line or spooling, a term that is still commonly used when talking about computer printing.

In UNIX and Linux systems, printing initially used the Berkeley Software Distribution (BSD) printing subsystem, consisting of a line printer daemon (lpd) running as a server, and client commands such as `lpr` to submit jobs for printing. This protocol was later standardized by the IETF as RFC 1179, **Line Printer Daemon Protocol**.

System also had a printing daemon. It was functionally similar to the Berkeley LPD, but had a different command set. You will frequently see two commands with different options that accomplish the same task. For example, `lpr` from the Berkeley implementation and `lp` from the System V implementation each print files.

Advances in printer technology made it possible to mix different fonts on a page and to print images as well as words. Variable pitch fonts, and more advanced printing techniques such as kerning and ligatures, are now standard. Several improvements to the basic lpd/lpr approach to printing were devised, such as LPRng, the next generation LPR, and CUPS.

Many printers capable of graphical printing initially used the Adobe PostScript language. A PostScript printer has an engine that interprets the commands in a print job and produces finished pages from these commands. PostScript is often used as an intermediate form between an original file, such as a text or an image file, and a final form suitable for a particular printer that does not have PostScript capability. Conversion of a print job, such as an ASCII text file or a JPEG image to PostScript, and conversion from PostScript to the final raster form required for a non-PostScript printer is done using filters.

Today, Portable Document Format (PDF), which is based on PostScript, has largely replaced raw PostScript. PDF is designed to be independent of hardware and software and to encapsulate a full description of the pages to be printed. You can view PDF files as well as print them.

### Manage print queues

Users direct print jobs to a logical entity called a print queue. In single-user systems, a print queue and a printer are usually equivalent. However, CUPS allows a system without an attached printer to queue print jobs for eventual printing on a remote system, and, through the use of classes to allow a print job directed to a class to be printed on the first available printer of that class.

You can inspect and manipulate print queues. Some of the commands to do so are new for CUPS. Others are compatibility commands that have their roots in LPD commands, although the current options are usually a limited subset of the original LPD printing system options.

You can check the queues known to the system using the CUPS `lpstat` command. Some common options are shown in Table 1.

###### Table 1. Options for lpstat
| Option | Purpose                                                                                                                                                   |
| -a     | Display accepting status of printers.                                                                                                                     |
| -c     | Display print classes.                                                                                                                                    |
| -p     | Display print status: enabled or disabled.                                                                                                                |
| -s     | Display default printer, printers, and classes. Equivalent to -d -c -v. Note that multiple options must be separated as values can be specified for many. |
| -s     | Display printers and their devices.                                                                                                                       |


You may also use the LPD `lpc` command, found in /usr/sbin, with the `status` option. If you do not specify a printer name, all queues are listed. Listing 1 shows some examples of both commands.

###### Listing 1. Displaying available print queues
```
[ian@atticf27 ~]$ lpstat -d
system default destination: HL-2280DW
[ian@atticf27 ~]$ lpstat -v HL-2280DW
device for HL-2280DW: dnssd://Brother%20HL-2280DW._pdl-datastream._tcp.local/
[ian@atticf27 ~]$ lpstat -s
system default destination: HL-2280DW
members of class anyprint:
    HL-2280DW
    XP-610
device for anyprint: ///dev/null
device for HL-2280DW: dnssd://Brother%20HL-2280DW._pdl-datastream._tcp.local/
device for XP-610: dnssd://EPSON%20XP-610%20Series._ipp._tcp.local/?uuid=cfe92100-67c4-11d4-a45f-ac18266c48aa
[ian@atticf27 ~]$ lpstat -a XP-610
XP-610 accepting requests since Thu 27 Apr 2017 05:53:59 PM EDT
[ian@atticf27 ~]$ /usr/sbin/lpc status HL-2280DW
HL-2280DW:
    printer is on device 'dnssd' speed -1
    queuing is disabled
    printing is enabled
    no entries
    daemon present

```

This example shows two printers, HL-2280DW and XP-610, and a class, `anyprint`, which allows print jobs to be directed to the first available of these two printers.

In this example, queuing of print jobs to HL-2280DW is currently disabled, although printing is enabled, as might be done in order to drain the queue before taking the printer offline for maintenance. Whether queuing is enabled or disabled is controlled by the `cupsaccept` and `cupsreject` commands. Formerly, these were `accept` and `reject`, but you will probably find these commands in /usr/sbin are now just links to the newer commands. Similarly, whether printing is enabled or disabled is controlled by the `cupsenable` and `cupsdisable` commands. In earlier versions of CUPS, these were called `enable` and `disable`, which allowed confusion with the builtin bash shell `enable`. Listing 2 shows how to enable queuing on printer HL-2280DW while disabling printing. Several of the CUPS commands support a `-r` option to give a reason for the action. This reason is displayed when you use `lpstat`, but not if you use `lpc`.

###### Listing 2. Enabling queuing and disabling printing
```
[ian@atticf27 ~]$ lpstat -a -p HL-2280DW
anyprint accepting requests since Mon 29 Jan 2018 01:17:09 PM EST
HL-2280DW not accepting requests since Thu 27 Apr 2017 05:52:27 PM EDT -
    Maintenance scheduled
XP-610 accepting requests since Thu 27 Apr 2017 05:53:59 PM EDT
printer HL-2280DW is idle. enabled since Thu 27 Apr 2017 05:52:27 PM EDT
    Maintenance scheduled
[ian@atticf27 ~]$ accept HL-2280DW
[ian@atticf27 ~]$ cupsdisable -r "waiting for toner delivery" HL-2280DW
[ian@atticf27 ~]$ lpstat -p -a
printer anyprint is idle. enabled since Mon 29 Jan 2018 01:17:09 PM EST
printer HL-2280DW disabled since Mon 29 Jan 2018 04:03:50 PM EST -
    waiting for toner delivery
printer XP-610 is idle. enabled since Thu 27 Apr 2017 05:53:59 PM EDT
anyprint accepting requests since Mon 29 Jan 2018 01:17:09 PM EST
HL-2280DW accepting requests since Mon 29 Jan 2018 04:03:50 PM EST
XP-610 accepting requests since Thu 27 Apr 2017 05:53:59 PM EDT

```

Note that an authorized user must perform these tasks. This may be root or another authorized user. See the SystemGroup entry in /etc/cups/cups-files.conf and the man page for cups-files.conf for more information on authorizing user groups.

### Manage user print jobs

Now that you have seen a little of how to check on print queues and classes, I will show you how to manage jobs on printer queues. The first thing you might want to do is find out whether any jobs are queued for a particular printer or for all printers. You do this with the `lpq` command. If no option is specified, `lpq` displays the queue for the default printer. Use the `-P` option with a printer name to specify a particular printer or the `-a` option to specify all printers, as shown in Listing 3.

###### Listing 3. Checking print queues with lpq
```
[pat@atticf27 ~]$ # As user pat (non-administrator)
[pat@atticf27 ~]$ lpq
HL-2280DW is not ready
Rank Owner Job File(s) Total Size
1st unknown 4 unknown 6144 bytes
2nd pat 6 bitlib.h 6144 bytes
3rd pat 7 bitlib.C 6144 bytes
4th unknown 8 unknown 1024 bytes
5th unknown 9 unknown 1024 bytes

[ian@atticf27 ~]$ # As user ian (administrator)
[ian@atticf27 ~]$ lpq -P xp-610
xp-610 is ready
no entries
[ian@atticf27 ~]$ lpq -a
Rank Owner Job File(s) Total Size
1st ian 4 permutation.C 6144 bytes
2nd pat 6 bitlib.h 6144 bytes
3rd pat 7 bitlib.C 6144 bytes
4th ian 8 .bashrc 1024 bytes
5th ian 9 .bashrc 1024 bytes

```

In this example, five jobs, 4, 6, 7, 8, and 9, are queued for the printer named HL-2280DW and none for XP-610. Using the `-P` option in this case simply shows that the printer is ready but has no queued hobs. Note that CUPS printer names are not case-sensitive. Note also that user ian submitted a job twice, a common user action when a job does not print the first time.

In general, you can view or manipulate your own print jobs, but root or another authorized user is usually required to manipulate the jobs of others. Most CUPS commands also encrypted communication between the CUPS client command and CUPS server using a `-E` option

Use the `lprm` command to remove one of the .bashrc jobs from the queue. With no options, the current job is removed. With the `-` option, all jobs are removed. Otherwise, specify a list of jobs to be removed as shown in Listing 4.

###### Listing 4. Deleting print jobs with lprm
```
[[pat@atticf27 ~]$ # As user pat (non-administrator)
[pat@atticf27 ~]$ lprm
lprm: Forbidden

[ian@atticf27 ~]$ # As user ian (administrator)
[ian@atticf27 ~]$ lprm 8
[ian@atticf27 ~]$ lpq
HL-2280DW is not ready
Rank Owner Job File(s) Total Size
1st ian 4 permutation.C 6144 bytes
2nd pat 6 bitlib.h 6144 bytes
3rd pat 7 bitlib.C 6144 bytes
4th ian 9 .bashrc 1024 bytes

```

Note that user pat was not able to remove the first job on the queue, because it was for user ian. However, ian was able to remove his own job number 8.

Another command that will help you manipulate jobs on print queues is the `lp` command. Use it to alter attributes of jobs, such as priority or number of copies. Let us assume user ian wants his job 9 to print before those of user pat, and he really did want two copies of it. The job priority ranges from a lowest priority of 1 to a highest priority of 100 with a default of 50. User ian could use the `-i`, `-n`, and `-q` options to specify a job to alter and a new number of copies and priority as shown in Listing 5. Note the use of the `-l` option of the `lpq` command, which provides more verbose output.

###### Listing 5. Changing the number of copies and priority with lp
```
[ian@atticf27 ~]$ lpq
HL-2280DW is not ready
Rank Owner Job File(s) Total Size
1st ian 4 permutation.C 6144 bytes
2nd pat 6 bitlib.h 6144 bytes
3rd pat 7 bitlib.C 6144 bytes
4th ian 9 .bashrc 1024 bytes
[ian@atticf27 ~]$ lp -i 9 -q 60 -n 2
[ian@atticf27 ~]$ lpq
HL-2280DW is not ready
Rank Owner Job File(s) Total Size
1st ian 9 .bashrc 1024 bytes
2nd ian 4 permutation.C 6144 bytes
3rd pat 6 bitlib.h 6144 bytes
4th pat 7 bitlib.C 6144 bytes

```

Finally, the `lpmove` command allows jobs to be moved from one queue to another. For example, we might want to do this because printer HL-2280DW is not currently printing. You can specify just a hob number, such as 9, or you can qualify it with the queue name and a hyphen, such as HL-2280DW-0. The `lpmove` command requires an authorized user. Listing 6 shows how to move these jobs to another queue, specifying first by printer and job ID, then all jobs for a given printer. By the time we check the queues again, one of the jobs is already printing.

###### Listing 6. Moving jobs to another print queue with lpmove
```
[ian@atticf27 ~]$ lpmove HL-2280DW-9 anyprint
[ian@atticf27 ~]$ lpmove HL-2280DW xp-610
[ian@atticf27 ~]$ lpq -a
Rank Owner Job File(s) Total Size
active ian 9 .bashrc 1024 bytes
1st ian 4 permutation.C 6144 bytes
2nd pat 6 bitlib.h 6144 bytes
3rd pat 7 bitlib.C 6144 bytes
[ian@atticf27 ~]$ # A few minutes later
[ian@atticf27 ~]$ lpq -a
Rank Owner Job File(s) Total Size
active pat 6 bitlib.h 6144 bytes
1st pat 7 bitlib.C 6144 bytes

```

If you happen to use a print server that is not CUPS, such as LPD or LPRng, many of the queue administration functions are handled as subcommands of the `lpc` command. For example, you might use `lpc topq` to move a job to the top of a queue. Other `lpc` subcommands include `disable`, `down`, `enable`, `hold`, `move`, `redirect`, `release`, and `start`. These subcommands are not implemented in the CUPS `lpc` compatibility command.

#### Printing files

How are print jobs erected? Many graphical programs provide a method of printing, usually under the **File** menu option. These programs provide graphical tools for choosing a printer, margin sizes, color or black-and-white printing, number of copies, selecting 2-up printing (which is 2 pages per sheet, often used for handouts), and so on. Here I show you the command-line tools for controlling such features, and then a graphical implementation for comparison.

The simplest way to print any file is to use the `lpr` command and provide the file name. This prints the file on the default printer. The `lp` command can print files as well as modify print jobs. Listing 7 shows a simple example using both commands. Note that `lpr` quietly spools the job, but `lp` displays the job number of the spooled job.

###### Listing 7. Printing with lpr and lp
```
[ian@atticf27 ~]$ echo "Print this text" > printexample.txt
[ian@atticf27 ~]$ lpr printexample.txt
[ian@atticf27 ~]$ lp printexample.txt
request id is HL-2280DW-12 (1 file(s))

```

Table 2 shows some options that you may use with `lpr`. Note that `lp` has similar options to `lpr`, but names may differ; for example, `-#` on `lpr` is equivalent to `-n` on `lp`. Check the man pages for more information.

###### Table 2. Options for lpr

| Option        | Purpose                                                                                          |
| -C, -J, or -T | Set a job name.                                                                                  |
| -P            | Select a particular printer.                                                                     |
| -#            | Specify number of copies. Note this is different from the -n option you saw with the lp command. |
| -m            | Send email upon job completion.                                                                  |
| -l            | Indicate that the print file is already formatted for printing. Equivalent to -o raw.            |
| -o            | Set a job option.                                                                                |
| -p            | Format a text file with a shaded header. Equivalent to -o prettyprint.                           |
| -q            | Hold (or queue) the job for later printing.                                                      |
| -r            | Remove the file after it has been spooled for printing.                                          |

Listing 8 shows some of these options in action. I request an email confirmation after printing, that the job be held and that the file be deleted after printing.

###### Listing 8. Printing with lpr
```
[ian@atticf27 ~]$ lpr -P HL-2280DW -J "Ian's text file" -#2 -m -p -q -r printexample.txt
[[ian@atticf27 ~]$ lpq -l
HL-2280DW is ready


ian: 1st [job 13 localhost]
 2 copies of Ian's text file 1024 bytes
[ian@atticf27 ~]$ ls printexample.txt
ls: cannot access 'printexample.txt': No such file or directory

```

I now have a held job in the HL-2280DW print queue. What to do? The `lp` command has options to hold and release jobs, using various values with the `-H` option. Listing 9 shows how to release the held job. Check the `lp` man page for information on other options.

###### Listing 9. Resuming printing of a held print job
```
[ian@atticf27 ~]$ lp -i 13 -H resume

```

Not all of the vast array of available printers support the same set of options. Use the `lpoptions` command to see the general options that are set for a printer. Add the `-l` option to display printer-specific options. Listing 10 shows two examples. Many common options relate to portrait/landscape printing, page dimensions, and placement of the output on the pages. See the man pages for details.

###### Listing 10. Checking printer options
```
[ian@atticf27 ~]$ lpoptions -p HL-2280DW
copies=1 device-uri=dnssd://Brother%20HL-2280DW._pdl-datastream._tcp.local/
finishings=3 job-cancel-after=10800 job-hold-until=no-hold job-priority=50
job-sheets=none,none marker-change-time=1517325288 marker-colors=#000000,#000000
marker-levels=-1,92 marker-names='Black\ Toner\ Cartridge,Drum\ Unit'
marker-types=toner,opc number-up=1 printer-commands=none
printer-info='Brother HL-2280DW' printer-is-accepting-jobs=true
printer-is-shared=true printer-is-temporary=false printer-location
printer-make-and-model='Brother HL-2250DN - CUPS+Gutenprint v5.2.13 Simplified'
printer-state=3 printer-state-change-time=1517325288 printer-state-reasons=none
printer-type=135188 printer-uri-supported=ipp://localhost/printers/HL-2280DW
sides=one-sided

[ian@atticf27 ~]$ lpoptions -l -p xp-610
PageSize/Media Size: *Letter Legal Executive Statement A4
ColorModel/Color Model: *Gray Black
InputSlot/Media Source: *Standard ManualAdj Manual MultiPurposeAdj MultiPurpose
UpperAdj Upper LowerAdj Lower LargeCapacityAdj LargeCapacity
StpQuality/Print Quality: None Draft *Standard High
Resolution/Resolution: *301x300dpi 150dpi 300dpi 600dpi
Duplex/2-Sided Printing: *None DuplexNoTumble DuplexTumble
StpiShrinkOutput/Shrink Page If Necessary to Fit Borders: *Shrink Crop Expand
StpColorCorrection/Color Correction: *None Accurate Bright Hue Uncorrected
Desaturated Threshold Density Raw Predithered
StpBrightness/Brightness: 0 100 200 300 400 500 600 700 800 900 *None 1100
1200 1300 1400 1500 1600 1700 1800 1900 2000 Custom.REAL
StpContrast/Contrast: 0 100 200 300 400 500 600 700 800 900 *None 1100 1200
1300 1400 1500 1600 1700 1800 1900 2000 2100 2200 2300 2400 2500 2600 2700
2800 2900 3000 3100 3200 3300 3400 3500 3600 3700 3800 3900 4000 Custom.REAL
StpImageType/Image Type: None Text Graphics *TextGraphics Photo LineArt

```

Most GUI applications have a print dialog, often using the **File >Print** menu choice. Figure 1 shows an example in GIMP, an image manipulation program.

###### Figure 1. Printing from the GIMP

![Printing from the GIMP][3]

So far, all our commands have been implicitly directed to the local CUPS print server. You can also direct most commands to the server on another system, by specifying the `-h` option along with a port number if it is not the CUPS default of 631.

### CUPS and the CUPS server

At the heart of the CUPS printing system is the `cupsd` print server which runs as a daemon process. The CUPS configuration file is normally located in /etc/cups/cupsd.conf. The /etc/cups directory also contains other configuration files related to CUPS. CUPS is usually started during system initialization, but may be controlled by the CUPS script located in /etc/rc.d/init.d or /etc/init.d, according to your distribution. For newer systems using systemd initialization, the CUPS service script is likely in /usr/lib/systemd/system/cups.service. As with most such scripts, you can stop, start, or restart the daemon. See our tutorial [Learn Linux, 101: Runlevels, boot targets, shutdown, and reboot][4] for more information on using initialization scripts.

The configuration file, /etc/cups/cupsd.conf, contains parameters that control things such as access to the printing system, whether remote printing is allowed, the location of spool files, and so on. On some systems, a second part describes individual print queues and is usually generated automatically by configuration tools. Listing 11 shows some entries for a default cupsd.conf file. Note that comments start with a # character. Defaults are usually shown as comments and entries that are changed from the default have the leading # character removed.

###### Listing 11. Parts of a default /etc/cups/cupsd.conf file
```
# Only listen for connections from the local machine.
Listen localhost:631
Listen /var/run/cups/cups.sock

# Show shared printers on the local network.
Browsing On
BrowseLocalProtocols dnssd

# Default authentication type, when authentication is required...
DefaultAuthType Basic

# Web interface setting...
WebInterface Yes

# Set the default printer/job policies...
<Policy default>
 # Job/subscription privacy...
 JobPrivateAccess default
 JobPrivateValues default
 SubscriptionPrivateAccess default
 SubscriptionPrivateValues default

 # Job-related operations must be done by the owner or an administrator...
 <Limit Create-Job Print-Job Print-URI Validate-Job>
 Order deny,allow
 </Limit>

```

File, directory, and user configuration directives that used to be allowed in cupsd.conf are now stored in cups-files.conf instead. This is to prevent certain types of privilege escalation attacks. Listing 12 shows some entries from cups-files.conf. Note that spool files are stored by default in the /var/spool file system as you would expect from the Filesystem Hierarchy Standard (FHS). See the man pages for cupsd.conf and cups-files.conf for more details on these configuration files.

###### Listing 12. Parts of a default /etc/cups/cups-files.conf
```
# Location of the file listing all of the local printers...
#Printcap /etc/printcap

# Format of the Printcap file...
#PrintcapFormat bsd
#PrintcapFormat plist
#PrintcapFormat solaris

# Location of all spool files...
#RequestRoot /var/spool/cups

# Location of helper programs...
#ServerBin /usr/lib/cups

# SSL/TLS keychain for the scheduler...
#ServerKeychain ssl

# Location of other configuration files...
#ServerRoot /etc/cups

```

Listing 12 refers to the /etc/printcap file. This was the name of the configuration file for LPD print servers, and some applications still use it to determine available printers and their properties. It is usually generated automatically in a CUPS system, so you will probably not modify it yourself. However, you may need to check it if you are diagnosing user printing problems. Listing 13 shows an example.

###### Listing 13. Automatically generated /etc/printcap
```
# This file was automatically generated by cupsd(8) from the
# /etc/cups/printers.conf file. All changes to this file
# will be lost.
HL-2280DW|Brother HL-2280DW:rm=atticf27:rp=HL-2280DW:
anyprint|Any available printer:rm=atticf27:rp=anyprint:
XP-610|EPSON XP-610 Series:rm=atticf27:rp=XP-610:

```

Each line here has a printer name and printer description as well as the name of the remote machine (rm) and remote printer (rp) on that machine. Older /etc/printcap file also described the printer capabilities.

#### File conversion filters

You can print many types of files using CUPS, including plain text, PDF, PostScript, and a variety of image formats without needing to tell the `lpr` or `lp` command anything more than the file name. This magic feat is accomplished through the use of filters. Indeed, a popular filter for many years was named magicfilter.

CUPS uses Multipurpose Internet Mail Extensions (MIME) types to determine the appropriate conversion filter when printing a file. Other printing packages might use the magic number mechanism as used by the `file` command. See the man pages for `file` or `magic` for more details.

Input files are converted to an intermediate raster or PostScript format using filters. Job information such as number of copies is added. The data is finally sent through a beckend to the destination printer. There are some filters (such as `a2ps` or `dvips`) that you can use to manually filter input. You might do this to obtain special formatting results, or to handle a file format that CUPS does not support natively.

#### Adding printers

CUPS supports a variety of printers, including:

  * Locally attached parallel and USB printers
  * Internet Printing Protocol (IPP) printers
  * Remote LPD printers
  * Microsoft® Windows® printers using SAMBA
  * Novell printers using NCP
  * HP Jetdirect attached printers



Most systems today attempt to autodetect and autoconfigure local hardware when the system starts or when the device is attached. Similarly, many network printers can be autodetected. Use the CUPS web administration tool ((<http://localhost:631> or <http://127.0.0.1:631>) to search for or add printers. Many distributions include their own configuration tools, for example YaST on SUSE systems. Figure 2 shows the CUPS interface using localhost:631 and Figure 3 shows the GNOME printer settings dialog on Fedora 27.

###### Figure 2. Using the CUPS web interface


![Using the CUPS web interface][5]

###### Figure 3. Using printer settings on Fedora 27


![Using printer settings on Fedora 27][6]

You can also configure printers from a command line. Before you configure a printer, you need some basic information about the printer and about how it is connected. If a remote system needs a user ID or password, you will also need that information.

You need to know what driver to use for your printer. Not all printers are fully supported on Linux and some may not work at all, or only with limitations. Check at OpenPrinting.org (see Related topics) to see if there is a driver for your particular printer. The `lpinfo` command can also help you identify the available device types and drivers. Use the `-v` option to list supported devices and the `-m` option to list drivers, as shown in Listing 14.

###### Listing 14. Available printer drivers
```
[ian@atticf27 ~]$ lpinfo -m | grep -i xp-610
lsb/usr/Epson/epson-inkjet-printer-escpr/Epson-XP-610_Series-epson-escpr-en.ppd.gz
EPSON XP-610 Series, Epson Inkjet Printer Driver (ESC/P-R) for Linux
[ian@atticf27 ~]$ locate "Epson-XP-610_Series-epson-escpr-en.ppd.gz"
/usr/share/ppd/Epson/epson-inkjet-printer-escpr/Epson-XP-610_Series-epson-escpr-en.ppd.gz
[ian@atticf27 ~]$ lpinfo -v
network socket
network ipps
network lpd
network beh
network ipp
network http
network https
direct hp
serial serial:/dev/ttyS0?baud=115200
direct parallel:/dev/lp0
network smb
direct hpfax
network dnssd://Brother%20HL-2280DW._pdl-datastream._tcp.local/
network dnssd://EPSON%20XP-610%20Series._ipp._tcp.local/?uuid=cfe92100-67c4-11d4-a45f-ac18266c48aa
network lpd://BRN001BA98A1891/BINARY_P1
network lpd://192.168.1.38:515/PASSTHRU

```

The Epson-XP-610_Series-epson-escpr-en.ppd.gz driver is located in the /usr/share/ppd/Epson/epson-inkjet-printer-escpr/ directory on my system.

Is you don't find a driver, check the printer manufacturer's website in case a proprietary driver is available. For example, at the time of writing Brother has a driver for my HL-2280DW printer, but this driver is not listed at OpenPrinting.org.

Once you have the basic information, you can configure a printer using the `lpadmin` command as shown in Listing 15. For this purpose, I will create another instance of my HL-2280DW printer for duplex printing.

###### Listing 15. Configuring a printer
```
[ian@atticf27 ~]$ lpinfo -m | grep -i "hl.*2280"
HL2280DW.ppd Brother HL2280DW for CUPS
lsb/usr/HL2280DW.ppd Brother HL2280DW for CUPS
[ian@atticf27 ~]$ lpadmin -p HL-2280DW-duplex -E -m HL2280DW.ppd \
> -v dnssd://Brother%20HL-2280DW._pdl-datastream._tcp.local/ \
> -D "Brother 1" -o sides=two-sided-long-edge
[ian@atticf27 ~]$ lpstat -a
anyprint accepting requests since Mon 29 Jan 2018 01:17:09 PM EST
HL-2280DW accepting requests since Tue 30 Jan 2018 10:56:10 AM EST
HL-2280DW-duplex accepting requests since Wed 31 Jan 2018 11:41:16 AM EST
HXP-610 accepting requests since Mon 29 Jan 2018 10:34:49 PM EST

```

Rather than creating a copy of the printer for duplex printing, you can just create a new class for duplex printing using `lpadmin` with the `-c` option .

If you need to remove a printer, use `lpadmin` with the `-x` option.

Listing 16 shows how to remove the printer and create a class instead.

###### Listing 16. Removing a printer and creating a class
```
[ian@atticf27 ~]$ lpadmin -x HL-2280DW-duplex
[ian@atticf27 ~]$ lpadmin -p HL-2280DW -c duplex -E -D "Duplex printing" -o sides=two-sided-long-edge
[ian@atticf27 ~]$ cupsenable duplex
[ian@atticf27 ~]$ cupsaccept duplex
[ian@atticf27 ~]$ lpstat -a
anyprint accepting requests since Mon 29 Jan 2018 01:17:09 PM EST
duplex accepting requests since Wed 31 Jan 2018 12:12:05 PM EST
HL-2280DW accepting requests since Wed 31 Jan 2018 11:51:16 AM EST
XP-610 accepting requests since Mon 29 Jan 2018 10:34:49 PM EST

```

You can also set various printer options using the `lpadmin` or `lpoptions` commands. See the man pages for more details.

### Troubleshooting

If you are having trouble printing, try these tips:

  * Ensure that the CUPS server is running. You can use the `lpstat` command, which will report an error if it is unable to connect to the cupsd daemon. Alternatively, you might use the `ps -ef` command and check for cupsd in the output.
  * If you try to queue a job for printing and get an error message indicating that the printer is not accepting jobs results, use `lpstat -a` or `lpc status` to check that the printer is accepting jobs.
  * If a queued job does not print, use `lpstat -p` or `lpc status` to check that the printer is accepting jobs. You may need to move the job to another printer as discussed earlier.
  * If the printer is remote, check that it still exists on the remote system and that it is operational.
  * Check the configuration file to ensure that a particular user or remote system is allowed to print on the printer.
  * Ensure that your firewall allows remote printing requests, either from another system to your system, or from your system to another, as appropriate.
  * Verify that you have the right driver.



As you can see, printing involves the correct functioning of several components of your system and possibly network. In a tutorial of this length, we can only give you starting points for diagnosis. Most CUPS systems also have a graphical interface to the command-line functions that we discuss here. Generally, this interface is accessible from the local host using a browser pointed to port 631 (<http://localhost:631> or <http://127.0.0.1:631>), as shown earlier in Figure 2.

You can debug CUPS by running it in the foreground rather than as a daemon process. You can also test alternate configuration files if necessary. Run `cupsd -h` for more information, or see the man pages.

CUPS also maintains an access log and an error log. You can change the level of logging using the LogLevel statement in cupsd.conf. By default, logs are stored in the /var/log/cups directory. They may be viewed from the **Administration** tab on the browser interface (<http://localhost:631>). Use the `cupsctl` command without any options to display logging options. Either edit cupsd.conf, or use `cupsctl` to adjust various logging parameters. See the `cupsctl` man page for more details.

The Ubuntu Wiki also has a good page on [Debugging Printing Problems][7].

This concludes your introduction to printing and CUPS.


--------------------------------------------------------------------------------

via: https://www.ibm.com/developerworks/library/l-lpic1-108-4/index.html

作者：[Ian Shields][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ibm.com
[1]:http://www.lpi.org
[2]:https://www.ibm.com/developerworks/library/l-lpic1-map/
[3]:https://www.ibm.com/developerworks/library/l-lpic1-108-4/gimp-print.jpg
[4]:https://www.ibm.com/developerworks/library/l-lpic1-101-3/
[5]:https://www.ibm.com/developerworks/library/l-lpic1-108-4/fig-cups-web.jpg
[6]:https://www.ibm.com/developerworks/library/l-lpic1-108-4/fig-settings.jpg
[7]:https://wiki.ubuntu.com/DebuggingPrintingProblems

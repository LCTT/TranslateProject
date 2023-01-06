[#]: subject: "Manage your APC battery backup system with this Linux command"
[#]: via: "https://opensource.com/article/21/12/linux-apcupsd"
[#]: author: "David Both https://opensource.com/users/dboth"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Manage your APC battery backup system with this Linux command
======
Protect yourself from power incidents by running a simple utility:
apcupsd.
![Light bulb][1]

Back in the early days of personal computers, I wrote the IBM training course for the original IBM PC. To complete the course in time for the IBM, ComputerLand, and Sears training, IBM gave me a PC to take home so I could work over evenings and weekends—arguably the first instance of anyone having an IBM PC in their home.

I did this work in Boca Raton, Florida, where the small, local power company was commonly known as "Florida Flicker and Flash," with good reason. The short but frequent power outages caused me to lose my work more than once. Unfortunately, there were no Uninterruptible Power Supply (UPS) systems to keep my PC up and running through these annoying and sometimes destructive incidents.

A UPS keeps a computer running long enough to last through minor power events, such as outages and surges of a few seconds up to as much as 20 or 30 minutes. In the case of these longer outages, the function of the modern UPS is to notify the computer to power down before the UPS runs out of battery power. Otherwise, the sudden loss of power can lead to loss of data.

The computer and UPS communicate through a serial or USB cable. A system service manages the communications and sends appropriate commands to both the UPS and the computer. Windows computers generally use a free version of the software provided by the UPS vendor. However, the apcupsd utility supports Linux, Windows, BSD, Solaris, and macOS, providing consistency across operating systems.

This set of tools supports APC UPS systems and provides varying degrees of support for UPS systems produced by Tripp-Lite, CyberPower, and others. I currently have UPS systems from all three of these manufacturers running on networks for which I have responsibility. I have not found a list of supported UPS systems. Nor is the [apcupsd documentation][2] helpful on this, and I have seen nothing definitive in any web searches.

Be aware that the "APC" portion of the names of these tools indicates that they were designed for APC UPS systems. Their efficacy on other UPS vendors' systems depends on how closely they follow the APC management interface.

### Install apcupsd on Linux

Because it is available from the Fedora repository, installation of apcupsd is simple. Issue the following command as root to install apcupsd:

`# dnf -y install apcupsd`

The following commands start and enable apcupsd so that it will restart after reboots.

`# systemctl start apcupsd ; systemctl enable apcupsd`

Other distributions also have apcupsd in their repositories.

### Basic usage

At this point, the apcupsd daemon has been started, so you can interact with it using the `apcaccess` command. This command without any options generates a status report describing the current state of the UPS.


```


[root@test ~]# apcaccess
APC      : 001,033,0831
DATE     : 2021-11-30 21:08:10 -0500  
HOSTNAME : test.both.org
VERSION  : 3.14.14 (31 May 2016) redhat
UPSNAME  : test.both.org
CABLE    : USB Cable
DRIVER   : USB UPS Driver
UPSMODE  : Stand Alone
STARTTIME: 2021-11-27 13:08:58 -0500  
MODEL    : CP1500PFCLCDa
STATUS   : ONLINE
LINEV    : 120.0 Volts
LOADPCT  : 32.0 Percent
BCHARGE  : 100.0 Percent
TIMELEFT : 22.5 Minutes
MBATTCHG : 5 Percent
MINTIMEL : 3 Minutes
MAXTIME  : 0 Seconds
OUTPUTV  : 120.0 Volts
DWAKE    : -1 Seconds
LOTRANS  : 100.0 Volts
HITRANS  : 139.0 Volts
ALARMDEL : 30 Seconds
NUMXFERS : 2
XONBATT  : 2021-11-30 13:46:03 -0500  
TONBATT  : 0 Seconds
CUMONBATT: 5 Seconds
XOFFBATT : 2021-11-30 13:46:06 -0500  
SELFTEST : NO
STATFLAG : 0x05000008
SERIALNO : CXXLT2001977
NOMINV   : 120 Volts
NOMPOWER : 1000 Watts
END APC  : 2021-11-30 21:08:17 -0500  
[root@test ~]#

```

In the output above, there are three fields of particular interest for managing battery backup. The load percentage (LOADPCT) indicates how much load is being placed on the UPS. When the unit is plugged in and power is applied, the battery charge (BCHARGE) should be 100%, but it will be lower when external power is removed. The TIMELEFT is the field of most concern. In this example, if power fails, the UPS can run at the current load for 22.5 minutes.

Other items to look at include the CUMONBATT line, which is the cumulative time the UPS has been running on battery. This field accumulates all of the power outage times over multiple events. The TONBATT line is the time for a current ongoing power loss event.

The man page for apcaccess describes the rest of the data items in this output. The displayed data can differ according to the UPS model.

### Managing the UPS

In the output from the `apcaccess` command above, the SELFTEST line says `NO`. This response means that a self-test has not been performed on this UPS since acpupsd was last started. Usually, that would be the time of the last system boot. Self-tests are performed once every seven days on most UPS systems, but you can initiate one using the `apctest` command.

Unfortunately, the `apctest` command conflicts with the apcupsd daemon, so you need to stop apcupsd temporarily. Then you can launch apctest, which uses a menu-based interface.


```


[root@myserver ~]# systemctl stop apcupsd
[root@myserver ~]# apctest

2021-12-01 06:36:47 apctest 3.14.14 (31 May 2016) redhat
Checking configuration ...
sharenet.type = Network &amp; ShareUPS Disabled
cable.type = USB Cable
mode.type = USB UPS Driver
Setting up the port ...
Doing prep_device() ...

You are using a USB cable type, so I'm entering USB test mode.
Hello, this is the apcupsd Cable Test program.
This part of apctest is for testing USB UPSes.

Getting UPS capabilities...SUCCESS

Please select the function you want to perform.

1)  Test kill UPS power
2)  Perform self-test
3)  Read last self-test result
4)  View/Change battery date
5)  View manufacturing date
6)  View/Change alarm behavior
7)  View/Change sensitivity
8)  View/Change low transfer voltage
9)  View/Change high transfer voltage
10) Perform battery calibration
11) Test alarm
12) View/Change self-test interval
Q) Quit

Select function number:

```

_**Warning:**_ be careful not to accidentally choose item 1 because that will turn off the UPS and, therefore, the computer.

Enter 2 and press Enter to run a UPS self-test. Note that the menu is displayed again before the self-test has had enough time to complete, so the result is `IN PROGRESS`. This result is from the CyberPower UPS. The program waited for the self-test to complete on an APC UPS before returning to the menu.


```


&lt;snip&gt;
Select function number: 2

This test instructs the UPS to perform a self-test
operation and reports the result when the test completes.

Clearing previous self test result...CLEARED
Initiating self test...INITIATED
Waiting for test to complete...COMPLETED
Result of last self test: IN PROGRESS

1)  Test kill UPS power
2)  Perform self-test
3)  Read last self-test result
4)  View/Change battery date
5)  View manufacturing date
6)  View/Change alarm behavior
7)  View/Change sensitivity
8)  View/Change low transfer voltage
9)  View/Change high transfer voltage
10) Perform battery calibration
11) Test alarm
12) View/Change self-test interval
 Q) Quit

```

The UPS beeps to indicate that the self-test has finished. The specific beep pattern may differ depending upon the UPS vendor and model. My CyberPower CP1500PFCLCDa gives two short beeps. The alarm will not sound if it has been manually silenced.

After the self-test has completed, use menu item 3 to read the result. In this case, my UPS has passed the self-test.


```


Select function number: 3

Result of last self test: PASSED

1)  Test kill UPS power
2)  Perform self-test
3)  Read last self-test result
4)  View/Change battery date
5)  View manufacturing date
6)  View/Change alarm behavior
7)  View/Change sensitivity
8)  View/Change low transfer voltage
9)  View/Change high transfer voltage
10) Perform battery calibration
11) Test alarm
12) View/Change self-test interval
 Q) Quit

Select function number:

```

Most of these other menu options do not work on my CyberPower devices, but they do work on APC UPS devices, as expected.

Battery calibration can be used on supported UPS systems if the UPS's estimate of the remaining run time is incorrect. This option disconnects the UPS from main power and runs the computer on battery until it drains to about 10% of its maximum charge. This method enables a more accurate estimate of on-battery run time.

Be sure to restart apcupsd after exiting from the apctest menu.

### Final thoughts

The apcupsd suite of programs provides easy tools to monitor and manage APC UPS systems, and it works with other vendors' UPS systems to varying degrees. It provides intelligent power incident protection and a managed shutdown if an outage lasts to the edge of the battery charge.

The apcupsd background daemon works with most modern UPS systems and can initiate a power-off sequence on the computer when the UPS battery gets too low. I have found this to be the case for all three vendors for which I have UPS systems. Other functions, those accessible using the apctest program, are problematic. Some of those functions may work, and some may not. It depends upon the make and model of your UPS system.

The most important consideration for me is that the apcupsd software can communicate with the UPS enough to initiate a power-off command to the computer when the UPS battery gets low. The second thing I care about is the information available from the `apcaccess` command. The rest is simply nice to have.

For those who prefer a GUI interface, both CGI web and GUI interfaces are available in the Fedora repository.

The apcupsd software is mature and stable. Development is limited to fixing bugs. It would be nice to have better support for UPS systems from vendors other than APC. That would require the vendors to cooperate and support the full APC software communications interface.

Support is available on the project's [SourceForge page][3] via the mailing lists.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/12/linux-apcupsd

作者：[David Both][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bulb-light-energy-power-idea.png?itok=zTEEmTZB (Light bulb)
[2]: http://www.apcupsd.com/
[3]: https://sourceforge.net/projects/apcupsd/

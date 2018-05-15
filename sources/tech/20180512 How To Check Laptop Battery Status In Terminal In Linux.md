FSSlc translating

How To Check Laptop Battery Status In Terminal In Linux
======
![](https://www.ostechnix.com/wp-content/uploads/2016/12/Check-Laptop-Battery-Status-In-Terminal-In-Linux-720x340.png)
Finding your Laptop battery status in GUI mode is easy. You could easily tell the battery level by hovering the mouse pointer over the battery indicator icon in the task bar. But, how about from the command line? Not everyone know this. The other day a friend of mine asked how to check his Laptop battery level from Terminal in his Ubuntu desktop – hence this post. Here I have included three simple methods which will help you to check Laptop battery status in Terminal in any Linux distribution.

### Check Laptop Battery Status In Terminal In Linux

We can find the Laptop battery status from command line in three methods.

##### Method 1 – Using “Upower” command

The **Upower** command comes preinstalled with most Linux distributions. To display the battery status using Upower, open up the Terminal and run:
```
$ upower -i /org/freedesktop/UPower/devices/battery_BAT0

```

**Sample output:**
```
native-path: BAT0
 vendor: Samsung SDI
 model: DELL 7XFJJA2
 serial: 4448
 power supply: yes
 updated: Sat 12 May 2018 06:48:48 PM IST (41 seconds ago)
 has history: yes
 has statistics: yes
 battery
 present: yes
 rechargeable: yes
 state: charging
 warning-level: none
 energy: 43.3011 Wh
 energy-empty: 0 Wh
 energy-full: 44.5443 Wh
 energy-full-design: 48.84 Wh
 energy-rate: 9.8679 W
 voltage: 12.548 V
 time to full: 7.6 minutes
 percentage: 97%
 capacity: 91.2045%
 technology: lithium-ion
 icon-name: 'battery-full-charging-symbolic'
 History (charge):
 1526131128 97.000 charging
 History (rate):
 1526131128 9.868 charging

```

As you see above, my battery is in charging mode now and the battery level is 97%.

If the above command doesn’t work for any reason, try the following command instead:
```
$ upower -i `upower -e | grep 'BAT'`

```

**Sample output:**
```
native-path: BAT0
 vendor: Samsung SDI
 model: DELL 7XFJJA2
 serial: 4448
 power supply: yes
 updated: Sat 12 May 2018 06:50:49 PM IST (22 seconds ago)
 has history: yes
 has statistics: yes
 battery
 present: yes
 rechargeable: yes
 state: charging
 warning-level: none
 energy: 43.6119 Wh
 energy-empty: 0 Wh
 energy-full: 44.5443 Wh
 energy-full-design: 48.84 Wh
 energy-rate: 8.88 W
 voltage: 12.552 V
 time to full: 6.3 minutes
 percentage: 97%
 capacity: 91.2045%
 technology: lithium-ion
 icon-name: 'battery-full-charging-symbolic'
 History (rate):
 1526131249 8.880 charging

```

Upower not just display the battery status, but also the complete details of the installed battery such as model, vendor name, serial no, state, voltage etc.

However, you can only display the status of the battery by with combination of upower and [**grep**][1] commands as shown below.
```
$ upower -i $(upower -e | grep BAT) | grep --color=never -E "state|to\ full|to\ empty|percentage"

```

**Sample output:**
```
state: fully-charged
percentage: 100%

```

![][3]

As you see in the above output, my Laptop battery has been fully charged.

For more details, refer man pages.
```
$ man upower

```

##### Method 2 – Using “acpi” command

The **acpi** command shows battery status and other ACPI information in your Linux distribution.

You might need to install **acpi** command in some Linux distributions.

To install acpi on Debian, Ubuntu and its derivatives:
```
$ sudo apt-get install acpi

```

On RHEL, CentOS, Fedora:
```
$ sudo yum install acpi

```

Or,
```
$ sudo dnf install acpi

```

On Arch Linux and its derivatives:
```
$ sudo pacman -S acpi

```

Once acpi installed, run the following command:
```
$ acpi -V

```

**Note:** Here, “V” is capital letter.

**Sample output:**
```
Battery 0: Charging, 99%, 00:02:09 until charged
Battery 0: design capacity 4400 mAh, last full capacity 4013 mAh = 91%
Battery 1: Discharging, 0%, rate information unavailable
Adapter 0: on-line
Thermal 0: ok, 77.5 degrees C
Thermal 0: trip point 0 switches to mode critical at temperature 84.0 degrees C
Cooling 0: Processor 0 of 3
Cooling 1: Processor 0 of 3
Cooling 2: LCD 0 of 15
Cooling 3: Processor 0 of 3
Cooling 4: Processor 0 of 3
Cooling 5: intel_powerclamp no state information available
Cooling 6: x86_pkg_temp no state information available

```

Let us only check the state of the charge of battery. To do so, run:
```
$ acpi

```

**Sample output:**
```
Battery 0: Charging, 99%, 00:01:41 until charged
Battery 1: Discharging, 0%, rate information unavailable

```

Let us check the battery temperature:
```
$ acpi -t

```

**Sample output:**
```
Thermal 0: ok, 63.5 degrees C

```

Let us view the above output in Fahrenheit:
```
$ acpi -t -f

```

**Sample output:**
```
Thermal 0: ok, 144.5 degrees F

```

Want to know whether the AC power is connected or not? Run:
```
$ acpi -a

```

**Sample output:**
```
Adapter 0: on-line

```

If the AC power is not available, you would the see the following instead:
```
Adapter 0: off-line

```

For more details, check the man pages.
```
$ man acpi

```

##### Method 3: Using “Batstat” Program

The **batstat** is a small ncurses-based CLI utility to display your Laptop battery status in Unix-like systems. It will display the following details:

  * Current battery level
  * Current Energy
  * Full charge energy
  * Time elapsed from the start of the program, without tracking the sleep time of the machine.
  * Battery level history



Installing batstat is a piece of cake. Git clone the latest version using command:
```
$ git clone https://github.com/Juve45/batstat.git

```

The above command will pull the latest batstat version and save it’s contents in a folder named “batstat”.

CD to batstat/bin/ directory:
```
$ cd batstat/bin/

```

Copy “batstat” binary file to your PATH, for example /usr/local/bin/.
```
$ sudo cp batstat /usr/local/bin/

```

Make it executable using command:
```
$ sudo chmod +x /usr/local/bin/batstat

```

Finally, run the following command to view your battery status.
```
$ batstat

```

Sample output:

![][4]

As you see in the above screenshot, my battery is in charging mode.

This utility has some limitations though. As of writing this guide, batstat will support only one battery. And, it gathers information only from this folder – **“/sys/class/power_supply/”**. If your machine contains the battery information on a different folder, this program will not work.

For more details, check batstat github page.

And, that’s all for today folks. There might be many commands and programs out there to check the laptop battery status in Terminal in Linux. As far as I know, the above given methods have worked just fine as expected. If you know some other commands to find out the battery status, let me know in the comment section below. I will update commands in the article if they works.

And, that’s all for now. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-check-laptop-battery-status-in-terminal-in-linux/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/the-grep-command-tutorial-with-examples-for-beginners/
[2]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]:http://www.ostechnix.com/wp-content/uploads/2016/12/sk@sk_006-1.png
[4]:http://www.ostechnix.com/wp-content/uploads/2016/12/batstat-1.png

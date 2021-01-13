[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to get Battery status notification when a battery is full or low)
[#]: via: (https://www.2daygeek.com/linux-low-full-charging-discharging-battery-notification/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

How to get Battery status notification when a battery is full or low
======

Linux laptops are good for Nix users, but it often drains the battery.

I tried many Linux operating systems, but did not have a long battery life like Windows.

Charging a battery for a longer duration will damage your battery, so unplug the power cable when it is 100% charged.

There is no default application to notify when the battery charged or discharged, and you need to install a third-party application to notify you.

For this, I usually install the **[Battery Monitor][1]** app, but it was deprecated, so I created a shell script to get the notification.

Laptop battery charging and discharging status can be identified using the following two commands.

Using acpi command.

```
$ acpi -b
Battery 0: Discharging, 71%, 00:58:39 remaining
```

Using upower command.

```
$ upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -w 'state|percentage' | awk '{print $2}'
discharging
64%
```

### Method-1: Shell script to send an alert when the battery level is above 95% or below 20%

This **[shell script][2]** runs in the background on startup and checks the battery status every minute and then sends a notification when the battery level is charged above 95% or discharged less than 20%.

The alert will not go off until your battery is over 20% or less than 95% charged.

```
$ sudo vi /opt/scripts/battery-status.sh

#!/bin/bash
while true
do
  battery_level=`acpi -b | grep -P -o '[0-9]+(?=%)'`
   if [ $battery_level -ge 95 ]; then
      notify-send "Battery Full" "Level: ${battery_level}%"
      paplay /usr/share/sounds/freedesktop/stereo/suspend-error.oga
    elif [ $battery_level -le 20 ]; then
      notify-send --urgency=CRITICAL "Battery Low" "Level: ${battery_level}%"
      paplay /usr/share/sounds/freedesktop/stereo/suspend-error.oga
  fi
 sleep 60
done
```

Once the script is ready, set the executable permission.

```
$ sudo chmod +x /opt/scripts/battery-status.sh
```

Finally, add the script to the bottom of the user profile file. For system-wide, you need to add the script on the /etc/profile file. This allows the system to **[kick the script when the system starts][3]**.

```
$ vi /home/magi/.profile

/opt/scripts/battery-status.sh &
```

**[Reboot your Linux system][4]** to check this.

```
$ sudo reboot
```

### Method-2: Shell script to send a notification when the battery level is charged (above 95%) or discharged (below 20%)

This script is similar to the above script, but it is responsible with the AC adapter.

If your AC adapter is plugged in and the battery is charged above 95%, it will send a notification with a sound, but the notification will not stop until you unplug the AC adapter.

![][5]

If you unplug the AC adapter, you will never see the notification again until your battery charge drops to 20%.

![][5]

```
$ sudo vi /opt/scripts/battery-status-1.sh

#!/bin/bash
   while true
    do
       export DISPLAY=:0.0
       battery_level=`acpi -b | grep -P -o '[0-9]+(?=%)'`
       if on_ac_power; then
           if [ $battery_level -ge 95 ]; then
              notify-send "Battery Full" "Level: ${battery_level}% "
              paplay /usr/share/sounds/freedesktop/stereo/suspend-error.oga
           fi
       else
           if [ $battery_level -le 20 ]; then
              notify-send --urgency=CRITICAL "Battery Low" "Level: ${battery_level}%"
              paplay /usr/share/sounds/freedesktop/stereo/suspend-error.oga
           fi
       fi
     sleep 60
done
```

Once the script is ready, set the permission to execute.

```
$ sudo chmod +x /opt/scripts/battery-status-1.sh
```

Finally add the script to the bottom of the user **profile** file. For system-wide, you need to add the script on /etc/profile file.

```
$ vi /home/magi/.profile

/opt/scripts/battery-status-1.sh &
```

Restart your system to check this.

```
$ sudo reboot
```

**Ref:** [stackexchange][6]

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-low-full-charging-discharging-battery-notification/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/category/battery-monitor/
[2]: https://www.2daygeek.com/category/shell-script/
[3]: https://www.2daygeek.com/execute-run-linux-scripts-command-at-reboot-startup/
[4]: https://www.2daygeek.com/6-commands-to-shutdown-halt-poweroff-reboot-the-linux-system/
[5]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[6]: https://unix.stackexchange.com/questions/60778/how-can-i-get-an-alert-when-my-battery-is-about-to-die-in-linux-mint

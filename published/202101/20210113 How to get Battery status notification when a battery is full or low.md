[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13036-1.html)
[#]: subject: (How to get Battery status notification when a battery is full or low)
[#]: via: (https://www.2daygeek.com/linux-low-full-charge-discharge-battery-notification/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

如何在电池充满或低电量时获得电池状态通知
======

![](https://img.linux.net.cn/data/attachment/album/202101/20/231310avo3kzv67vkm3tz7.jpg)

对于类 Unix 用户来说，Linux 笔记本是不错的选择，但它经常会耗尽电池。我试过很多 Linux 操作系统，但没有像 Windows 那样电池寿命长。

充电时间长了会对电池造成损害，所以在电池 100% 充满时要拔掉电源线。电池充电或放电时没有默认的应用程序来通知，需要安装第三方应用来通知你。

为此，我通常会安装 [Battery Monitor][1]，但它已经被废弃，所以我创建了一个 shell 脚本来获取通知。

笔记本电池充放电状态可以通过以下两个命令来识别。

使用 `acpi` 命令。

```
$ acpi -b
Battery 0: Discharging, 71%, 00:58:39 remaining
```

使用 `upower` 命令。

```
$ upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -w 'state|percentage' | awk '{print $2}'
discharging
64%
```

### 方法 1：当电池电量高于 95% 或低于 20% 时，用 Shell 脚本发送警报

这个脚本在启动时在后台运行，每分钟检查一次电池状态，然后在电池电量超过 95% 或放电时电量低于 20% 时发送通知。

警报会直到你的电池电量超过 20% 或低于 95% 时才会停止。

```
$ sudo vi /opt/scripts/battery-status.sh
```

```
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

脚本完成后，设置可执行权限：

```
$ sudo chmod +x /opt/scripts/battery-status.sh
```

最后，将该脚本添加到用户配置文件的底部。对于全局范围来说，你需要在 `/etc/profile` 文件中添加该脚本。

```
$ vi /home/magi/.profile

/opt/scripts/battery-status.sh &
```

[重启你的 Linux 系统][2]来检查这点。

```
$ sudo reboot
```

### 方法 2：当电池充电（高于 95%）或放电（低于 20%）时发送通知的 Shell 脚本

这个脚本与上面的脚本类似，但它是由交流适配器负责。

如果你插上了交流适配器，而且电池的电量超过 95%，它就会发出一个带有声音的通知，但是这个通知不会停止，直到你拔掉交流适配器。

![][3]

如果你拔掉交流适配器，你将永远不会再看到通知，直到你的电池电量下降到 20%。

![][5]

```
$ sudo vi /opt/scripts/battery-status-1.sh
```

```
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

脚本完成后，设置执行权限：

```
$ sudo chmod +x /opt/scripts/battery-status-1.sh
```

最后将脚本添加到用户配置文件的底部。对于全局范围来说，你需要在 `/etc/profile` 文件中添加该脚本。

```
$ vi /home/magi/.profile

/opt/scripts/battery-status-1.sh &
```

重启系统来检查：

```
$ sudo reboot
```

参考： [stackexchange][4]

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-low-full-charge-discharge-battery-notification/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/category/battery-monitor/
[2]: https://www.2daygeek.com/6-commands-to-shutdown-halt-poweroff-reboot-the-linux-system/
[3]: https://i0.wp.com/www.2daygeek.com/wp-content/uploads/2021/01/linux-low-full-battery-notification-2.png?w=1046&ssl=1
[4]: https://unix.stackexchange.com/questions/60778/how-can-i-get-an-alert-when-my-battery-is-about-to-die-in-linux-mint
[5]: https://i1.wp.com/www.2daygeek.com/wp-content/uploads/2021/01/linux-low-full-battery-notification-3.png?w=1029&ssl=1
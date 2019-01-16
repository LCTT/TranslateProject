[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (s-tui: A Terminal Tool To Monitor CPU Temperature, Frequency, Power And Utilization In Linux)
[#]: via: (https://www.2daygeek.com/s-tui-stress-terminal-ui-monitor-linux-cpu-temperature-frequency/)
[#]: author: (Prakash Subramanian https://www.2daygeek.com/author/prakash/)

s-tui: A Terminal Tool To Monitor CPU Temperature, Frequency, Power And Utilization In Linux
======

By default every Linux administrator would go with **[lm_sensors to monitor CPU temperature][1]**.

lm_sensors (Linux monitoring sensors) is a free and open-source application that provides tools and drivers for monitoring temperatures, voltage, and fans.

It’s a CLI utility and if you are looking for alternative tools.

I would suggest you to go for s-tui.

It’s a Stress Terminal UI which helps administrator to view CPU temperature with colors.

### What is s-tui

s-tui is a terminal UI for monitoring your computer. s-tui allows to monitor CPU temperature, frequency, power and utilization in a graphical way from the terminal.

Also, shows performance dips caused by thermal throttling, it requires minimal resources and doesn’t requires X-server. It was written in Python and requires root privilege to use this.

s-tui is a self-contained application which can run out-of-the-box and doesn’t need config files to drive its core features.

s-tui uses psutil to probe some of your hardware information. If your hardware is not supported, you might not see all the information.

Running s-tui as root gives access to the maximum Turbo Boost frequency available to your CPU when stressing all cores.

It uses Stress utility in the background to check the temperature of its components do not exceed their acceptable range by imposes certain types of compute stress on your system.

Running an overclocked PC is fine as long as it is stable and that the temperature of its components do not exceed their acceptable range.

There are several programs available to assess system stability through stress testing the system and thereby the overclock level.

### How to Install s-tui In Linux

It was written in Python and pip installation is a recommended method to install s-tui on Linux. Make sure you should have installed python-pip package on your system. If no, use the following command to install it.

For Debian/Ubuntu users, use **[Apt Command][2]** or **[Apt-Get Command][3]** to install pip package.

```
$ sudo apt install python-pip stress
```

For Archlinux users, use **[Pacman Command][4]** to install pip package.

```
$ sudo pacman -S python-pip stress
```

For Fedora users, use **[DNF Command][5]** to install pip package.

```
$ sudo dnf install python-pip stress
```

For CentOS/RHEL users, use **[YUM Command][6]** to install pip package.

```
$ sudo yum install python-pip stress
```

For openSUSE users, use **[Zypper Command][7]** to install pip package.

```
$ sudo zypper install python-pip stress
```

Finally run the following **[pip command][8]** to install s-tui tool in Linux.

For Python 2.x:

```
$ sudo pip install s-tui
```

For Python 3.x:

```
$ sudo pip3 install s-tui
```

### How to Access s-tui

As i told in the beginning of the article. It requires root privilege to get all the information from your system. Just run the following command to launch s-tui.

```
$ sudo s-tui
```

![][10]

By default it enable hardware monitoring and select the “Stress” option to do the stress test on your system.
![][11]

To check other options, navigate to help page.

```
$ s-tui --help
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/s-tui-stress-terminal-ui-monitor-linux-cpu-temperature-frequency/

作者：[Prakash Subramanian][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/prakash/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/view-check-cpu-hard-disk-temperature-linux/
[2]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[3]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[4]: https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[5]: https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[6]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[7]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
[8]: https://www.2daygeek.com/install-pip-manage-python-packages-linux/
[9]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[10]: https://www.2daygeek.com/wp-content/uploads/2018/12/s-tui-stress-terminal-ui-monitor-linux-cpu-temperature-frequency-1.jpg
[11]: https://www.2daygeek.com/wp-content/uploads/2018/12/s-tui-stress-terminal-ui-monitor-linux-cpu-temperature-frequency-2.jpg

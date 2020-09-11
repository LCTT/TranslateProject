[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Connect to WiFi from the Terminal in Ubuntu Linux)
[#]: via: (https://itsfoss.com/connect-wifi-terminal-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

How to Connect to WiFi from the Terminal in Ubuntu Linux
======

_**In this tutorial, you’ll learn how to connect to wireless network from the terminal in Ubuntu. This is particularly helpful if you are using Ubuntu server where you don’t have access to the regular [desktop environment][1].**_

I primarily use desktop Linux on my home computers. I also have multiple Linux servers for hosting It’s FOSS and related websites and open source software like [Nextcloud][2], [Discourse][3], Ghost, Rocket Chat etc.

I use [Linode][4] for quickly deploying Linux servers in cloud in minutes. But recently, I installed [Ubuntu server on my Raspberry Pi][5]. This is the first time I installed a server on a physical device and I had to do extra stuff to connect Ubuntu server to WiFi via command line.

In this tutorial, I’ll show the steps to connect to WiFi using terminal in Ubuntu Linux. You should

  * not be afraid of using terminal to edit files
  * know the wifi access point name (SSID) and the password



### Connect to WiFi from terminal in Ubuntu

![][6]

It is easy when you are using Ubuntu desktop because you have the GUI to easily do that. It’s not the same when you are using Ubuntu server and restricted to the command line.

Ubuntu uses [Netplan][7] utility for easily configuring networking. In Netplan, you create YAML file with the description of network interface and with the help of the netplan command line tool, you generate all the required configuration.

Let’s see how to connect to wireless networking from the terminal using Netplan.

#### Step 1: Identify your wireless network interface name

There are several ways to identify your network interface name. You can use the ip command, the deprecated ipconfig command or check this file:

```
ls /sys/class/net
```

This should give you all the available networking interface (Ethernet, wifi and loopback). The wireless network interface name starts with ‘w’ and it is usually named similar to wlanX, wlpxyz.

```
[email protected]:~$ ls /sys/class/net
eth0 lo wlan0
```

Take a note of this interface name. You’ll use it in the next step.

#### Step 2: Edit the Netplan configuration file with the wifi interface details

The Netplan configuration file resides in /etc/netplan directory. If you check the contents of this directory, you should see files like 01-network-manager-all.yml or 50-cloud-init.yaml.

If it is Ubuntu server, you should have cloud-init file. For desktops, it should be network-manager file.

The Network Manager on the Linux desktop allows you to choose a wireless network. You may hard code the wifi access point in its configuration. This could help you in some cases (like suspend) where connection drops automatically.

Whichever file it is, open it for editing. I hope you are a tad bit [familiar with Nano editor][8] because Ubuntu comes pre-installed with it.

```
sudo nano /etc/netplan/50-cloud-init.yaml
```

YAML files are very sensitive about spaces, indention and alignment. Don’t use tabs, use 4 (or 2, whichever is already used in the YAML file) spaces instead where you see an indention.

Basically, you’ll have to add the following lines with the access point name (SSID) and its password (usually) in quotes:

```
wifis:
    wlan0:
        dhcp4: true
        optional: true
        access-points:
            "SSID_name":
                password: "WiFi_password"
```

Again, keep the alignment as I have shown or else YAML file won’t be parsed and it will throw an error.

Your complete configuration file may look like this:

```
# This file is generated from information provided by the datasource. Changes
# to it will not persist across an instance reboot. To disable cloud-init's
# network configuration capabilities, write a file
# /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg with the following:
# network: {config: disabled}
network:
    ethernets:
        eth0:
            dhcp4: true
            optional: true
    version: 2
    wifis:
        wlan0:
            dhcp4: true
            optional: true
            access-points:
                "SSID_name":
                    password: "WiFi_password"
```

I find it strange that despite the message that changes will not persist across an instance reboot, it still works.

Anyway, generate the configuration using this command:

```
sudo netplan generate
```

And now apply this:

```
sudo netplan apply
```

If you are lucky, you should have network connected. Try to ping a website or run apt update command.

However, things may not go as smooth and you may see some errors. Try some extra steps if that’s the case.

#### Possible troubleshooting

It is possible that when you use the netplan apply command, you see an error in the output that reads something like this:

```
Failed to start netplan-wpa-wlan0.service: Unit netplan-wpa-wlan0.service not found.
Traceback (most recent call last):
  File "/usr/sbin/netplan", line 23, in <module>
    netplan.main()
  File "/usr/share/netplan/netplan/cli/core.py", line 50, in main
    self.run_command()
  File "/usr/share/netplan/netplan/cli/utils.py", line 179, in run_command
    self.func()
  File "/usr/share/netplan/netplan/cli/commands/apply.py", line 46, in run
    self.run_command()
  File "/usr/share/netplan/netplan/cli/utils.py", line 179, in run_command
    self.func()
  File "/usr/share/netplan/netplan/cli/commands/apply.py", line 173, in command_apply
    utils.systemctl_networkd('start', sync=sync, extra_services=netplan_wpa)
  File "/usr/share/netplan/netplan/cli/utils.py", line 86, in systemctl_networkd
    subprocess.check_call(command)
  File "/usr/lib/python3.8/subprocess.py", line 364, in check_call
    raise CalledProcessError(retcode, cmd)
subprocess.CalledProcessError: Command '['systemctl', 'start', '--no-block', 'systemd-networkd.service', 'netplan-wpa-wlan0.service']' returned non-zero exit status 5.
```

It is possible that wpa_supplicant service is not running. Run this command:

```
sudo systemctl start wpa_supplicant
```

Run netplan apply once again. If it fixes the issue well and good. Otherwise, [shutdown your Ubuntu system][9] using:

```
shutdown now
```

Start your Ubuntu system again, log in and generate and apply netplan once again:

```
sudo netplan generate
sudo netplan apply
```

It may show warning (instead of error) now. It is warning and not an error. I checked the [running systemd services][10] and found that netplan-wpa-wlan0.service was already running. Probably it showed the warning because it was already running and ‘netplan apply’ updated the config file (even without any changes).

```
Warning: The unit file, source configuration file or drop-ins of netplan-wpa-wlan0.service changed on disk. Run 'systemctl daemon-reload' to reload units.
```

It is not crtical and you may check that the internet is probably working already by running apt update.

I hope you were able to connect to wifi using the command line in Ubuntu with the help of this tutorial. If you are still facing trouble with it, do let me know in the comment section.

--------------------------------------------------------------------------------

via: https://itsfoss.com/connect-wifi-terminal-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/what-is-desktop-environment/
[2]: https://itsfoss.com/nextcloud/
[3]: https://www.discourse.org/
[4]: https://itsfoss.com/recommends/linode/
[5]: https://itsfoss.com/install-ubuntu-server-raspberry-pi/
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/09/connect-to-wifi-from-terminal-ubuntu.png?resize=800%2C450&ssl=1
[7]: https://netplan.io/
[8]: https://itsfoss.com/nano-editor-guide/
[9]: https://itsfoss.com/schedule-shutdown-ubuntu/
[10]: https://linuxhandbook.com/systemd-list-services/

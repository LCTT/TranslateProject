Cleaning Up Your Linux Startup Process
============================================================

![Linux cleanup](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/banner-cleanup-startup.png?itok=dCcKwdoP "Clean up your startup process")
Learn how to clean up your Linux startup process.[Used with permission][1]

The average general-purpose Linux distribution launches all kinds of stuff at startup, including a lot of services that don't need to be running. Bluetooth, Avahi, ModemManager, ppp-dns… What are these things, and who needs them?

Systemd provides a lot of good tools for seeing what happens during your system startup, and controlling what starts at boot. In this article, I’ll show how to turn off startup cruft on Systemd distributions.

### View Boot Services

In the olden days, you could easily see which services were set to launch at boot by looking in /etc/init.d. Systemd does things differently. You can use the following incantation to list enabled boot services:

```
systemctl list-unit-files --type=service | grep enabled
accounts-daemon.service                    enabled 
anacron-resume.service                     enabled 
anacron.service                            enabled 
bluetooth.service                          enabled 
brltty.service                             enabled
[...]
```

And, there near the top is my personal nemesis: Bluetooth. I don't use it on my PC, and I don't need it running. The following commands stop it and then disable it from starting at boot:

```
$ sudo systemctl stop bluetooth.service
$ sudo systemctl disable bluetooth.service
```

You can confirm by checking the status:

```
$ systemctl status bluetooth.service
 bluetooth.service - Bluetooth service
  Loaded: loaded (/lib/systemd/system/bluetooth.service; disabled; vendor preset: enabled)
  Active: inactive (dead)
    Docs: man:bluetoothd(8)
```

A disabled service can be started by another service. If you really want it dead, without uninstalling it, then you can mask it to prevent it from starting under any circumstances:

```
$ sudo systemctl mask bluetooth.service
 Created symlink from /etc/systemd/system/bluetooth.service to /dev/null.
```

Once you are satisfied that disabling a service has no bad side effects, you may elect to uninstall it.

You can generate a list of all services:

```
$ systemctl list-unit-files --type=service                       
UNIT FILE                                  STATE   
accounts-daemon.service                    enabled 
acpid.service                              disabled
alsa-restore.service                       static    
alsa-utils.service                         masked 
```

You cannot enable or disable static services, because these are dependencies of other systemd services and are not meant to run by themselves.

### Can I Get Rid of These Services?

How do you know what you need, and what you can safely disable? As always, that depends on your particular setup.

Here is a sampling of services and what they are for. Many services are distro-specific, so have your distribution documentation handy (i.e., Google and Stack Overflow).

*   **accounts-daemon.service** is a potential security risk. It is part of AccountsService, which allows programs to get and manipulate user account information. I can't think of a good reason to allow this kind of behind-my-back operations, so I mask it.

*   **avahi-daemon.service** is supposed to provide zero-configuration network discovery, and make it super-easy to find printers and other hosts on your network. I always disable it and don't miss it.

*   **brltty.service** provides Braille device support, for example, Braille displays.

*   **debug-shell.service** opens a giant security hole and should never be enabled except when you are using it. This provides a password-less root shell to help with debugging systemd problems.

*   **ModemManager.service** is a DBus-activated daemon that controls mobile broadband (2G/3G/4G) interfaces. If you don't have a mobile broadband interface -- built-in, paired with a mobile phone via Bluetooth, or USB dongle -- you don't need this.

*   **pppd-dns.service** is a relic of the dim past. If you use dial-up Internet, keep it. Otherwise, you don't need it.

*   **rtkit-daemon.service** sounds scary, like rootkit, but you need it because it is the real-time kernel scheduler.

*   **whoopsie.service** is the Ubuntu error reporting service. It collects crash reports and sends them to [https://daisy.ubuntu.com][2]. You may safely disable it, or you can remove it permanently by uninstalling apport.

*   **wpa_supplicant.service** is necessary only if you use a Wi-Fi network interface.

### What Happens During Bootup

Systemd has some commands to help debug boot issues. This command replays all of your boot messages:

```
$ journalctl -b

-- Logs begin at Mon 2016-05-09 06:18:11 PDT, 
end at Mon 2016-05-09 10:17:01 PDT. --
May 16 06:18:11 studio systemd-journal[289]: 
Runtime journal (/run/log/journal/) is currently using 8.0M.
Maximum allowed usage is set to 157.2M.
Leaving at least 235.9M free (of currently available 1.5G of space).
Enforced usage limit is thus 157.2M.
[...]
```

You can review previous boots with **journalctl -b -1**, which displays the previous startup;**journalctl -b -2** shows two boots ago, and so on.

This spits out a giant amount of output, which is interesting but maybe not all that useful. It has several filters to help you find what you want. Let's look at PID 1, which is the parent process for all other processes:

```
$ journalctl _PID=1

May 08 06:18:17 studio systemd[1]: Starting LSB: Raise network interfaces....
May 08 06:18:17 studio systemd[1]: Started LSB: Raise network interfaces..
May 08 06:18:17 studio systemd[1]: Reached target System Initialization.
May 08 06:18:17 studio systemd[1]: Started CUPS Scheduler.
May 08 06:18:17 studio systemd[1]: Listening on D-Bus System Message Bus Socket
May 08 06:18:17 studio systemd[1]: Listening on CUPS Scheduler.
[...]
```

This shows what was started -- or attempted to start.

One of the most useful tools is **systemd-analyze blame**, which shows which services are taking the longest to start up.

```
$ systemd-analyze blame
         8.708s gpu-manager.service
         8.002s NetworkManager-wait-online.service
         5.791s mysql.service
         2.975s dev-sda3.device
         1.810s alsa-restore.service
         1.806s systemd-logind.service
         1.803s irqbalance.service
         1.800s lm-sensors.service
         1.800s grub-common.service
```

This particular example doesn't show anything unusual, but if there is startup bottleneck, this command will find it.

You may also find these previous Systemd how-tos useful:

*   [Understanding and Using Systemd][3]

*   [Intro to Systemd Runlevels and Service Management Commands][4]

*   [Here We Go Again, Another Linux Init: Intro to systemd][5]

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/cleaning-your-linux-startup-process

作者：[CARLA SCHRODER ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/cschroder
[1]:https://www.linux.com/licenses/category/used-permission
[2]:https://daisy.ubuntu.com/
[3]:https://www.linux.com/learn/understanding-and-using-systemd
[4]:https://www.linux.com/learn/intro-systemd-runlevels-and-service-management-commands
[5]:https://www.linux.com/learn/here-we-go-again-another-linux-init-intro-systemd
[6]:https://www.linux.com/files/images/banner-cleanup-startuppng

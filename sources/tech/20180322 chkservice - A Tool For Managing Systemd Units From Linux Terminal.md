chkservice – A Tool For Managing Systemd Units From Linux Terminal
======
systemd stand for system daemon is a new init system and system manager which is become very popular and widely adapted new standard init system by most of Linux distributions.

Systemctl is a systemd utility which is help us to manage systemd daemons. It control system startup and services, uses parallelization, socket and D-Bus activation for starting services, offers on-demand starting of daemons, keeps track of processes using Linux control groups, maintains mount and automount points.

Also it offers logging daemon, utilities to control basic system configuration like the hostname, date, locale, maintain a list of logged-in users and running containers and virtual machines, system accounts, runtime directories and settings, and daemons to manage simple network configuration, network time synchronization, log forwarding, and name resolution.

### What Is chkservice

[chkservice][1] is an ncurses-based tool for managing systemd units from the terminal. It provides the user with a comprehensive view of all systemd services and allows them to be changed easily.

It requires super user privileges to make changes into unit states or sysv scripts.

### How To Install chkservice In Linux

We can install chkservice in two ways, either package or manual method.

For **`Debian/Ubuntu`** , use [APT-GET Command][2] or [APT Command][3]to install chkservice.
```
$ sudo add-apt-repository ppa:linuxenko/chkservice
$ sudo apt-get update
$ sudo apt-get install chkservice

```

For **`Arch Linux`** based systems, use [Yaourt Command][4] or [Packer Command][5] to install chkservice from AUR repository.
```
$ yaourt -S chkservice
or
$ packer -S chkservice

```

For **`Fedora`** , use [DNF Command][6] to install chkservice.
```
$ sudo dnf copr enable srakitnican/default
$ sudo dnf install chkservice

```

For **`Debian Based Systems`** , use [DPKG Command][7] to install chkservice.
```
$ wget https://github.com/linuxenko/chkservice/releases/download/0.1/chkservice_0.1.0-amd64.deb
$ sudo dpkg -i chkservice_0.1.0-amd64.deb

```

For **`RPM Based Systems`** , use [DNF Command][8] to install chkservice.
```
$ sudo yum install https://github.com/linuxenko/chkservice/releases/download/0.1/chkservice_0.1.0-amd64.rpm

```

### How To Use chkservice

Just fire the following command to launch the chkservice tool. The output is split to four parts.

  * **`First Part:`** This part shows about daemons status like, enabled [X] or disabled [] or static [s] or masked -m-
  * **`Second Part:`** This part shows daemons status like, started [ >] or stopped [=]
  * **`Third Part:`** This part shows the unit name
  * **`Fourth Part:`** This part showing the unit short description


```
$ sudo chkservice

```

![][10]

To view help page, hit `?` button. This will shows you available options to manage the systemd services.
![][11]

Select the units, which you want to enable or disable then hit `Space Bar` button.
![][12]

Select the units, which you want to start or stop then hit `s` button.
![][13]

Select the units, which you want to reload then hit `r` button. After hit `r` key, you can see the `updated` message at the top.
![][14]

Hit `q` button to quit the utility.

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/chkservice-a-tool-for-managing-systemd-units-from-linux-terminal/

作者：[Ramya Nuvvula][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/ramya/
[1]:https://github.com/linuxenko/chkservice
[2]:https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[3]:https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[4]:https://www.2daygeek.com/install-yaourt-aur-helper-on-arch-linux/
[5]:https://www.2daygeek.com/install-packer-aur-helper-on-arch-linux/
[6]:https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[7]:https://www.2daygeek.com/dpkg-command-to-manage-packages-on-debian-ubuntu-linux-mint-systems/
[8]:https://www.2daygeek.com/rpm-command-examples/
[9]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[10]:https://www.2daygeek.com/wp-content/uploads/2018/03/chkservice-to-manage-systemd-units-1.png
[11]:https://www.2daygeek.com/wp-content/uploads/2018/03/chkservice-to-manage-systemd-units-2.png
[12]:https://www.2daygeek.com/wp-content/uploads/2018/03/chkservice-to-manage-systemd-units-3.png
[13]:https://www.2daygeek.com/wp-content/uploads/2018/03/chkservice-to-manage-systemd-units-4.png
[14]:https://www.2daygeek.com/wp-content/uploads/2018/03/chkservice-to-manage-systemd-units-5.png

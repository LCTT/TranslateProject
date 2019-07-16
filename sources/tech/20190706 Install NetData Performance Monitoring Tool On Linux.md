[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Install NetData Performance Monitoring Tool On Linux)
[#]: via: (https://www.ostechnix.com/netdata-real-time-performance-monitoring-tool-linux/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

Install NetData Performance Monitoring Tool On Linux
======

![][1]

**NetData** is a distributed, real-time, performance and health monitoring tool for systems and applications. It provides unparalleled insights of everything happening on a system in real-time. You can view the results in a highly interactive web-dashboard. Using Netdata, you can get a clear idea of what is happening now, and what happened before in your systems and applications. You don’t need to be an expert to deploy this tool in your Linux systems. NetData just works fine out of the box with zero configuration, and zero dependencies. Just install this utility and sit back, NetData will take care of the rest.

It has its own built-in webserver to display the result in graphical format. NetData is quite fast and efficient, and it will immediately start to analyze the performance of your system in no time after installing it. It is written using **C** programming language, so it is extremely light weight. It consumes less than 3% of a single core CPU usage and a 10-15MB of RAM. We can easily embed the charts on any existing web pages, and also it has a plugin API, so that you can monitor any application.

Here is the list of things that will be monitored by NetData utility in your Linux system.

  * CPU usage,
  * RAM Usage,
  * Swap memory usage,
  * Kernel memory usage,
  * Hard disks and its usage,
  * Network interfaces,
  * IPtables,
  * Netfilter,
  * DDoS protection,
  * Processes,
  * Applications,
  * NFS server,
  * Web server (Apache & Nginx),
  * Database servers (MySQL),
  * DHCP server,
  * DNS server,
  * Email serve,r
  * Proxy server,
  * Tomcat,
  * PHP,
  * SNP devices,
  * And many more.



NetData is free, open source tool and it supports Linux, FreeBSD and Mac OS.

### Install NetData On Linux

Netdata can be installed on any Linux distributions that have **Bash** installed.

The easiest way to install Netdata is to run the following one-liner command from the Terminal:

```
$ bash <(curl -Ss https://my-netdata.io/kickstart-static64.sh)
```

This will download and install everything needed to up and run Netdata.

Some users may not want to inject something directly into Bash without investigating it. If you don’t like this method, you can follow the steps below to install it on your system.

**On Arch Linux:**

The latest version is available in the Arch Linux default repositories. So, we can install it with [**pacman**][2] using command:

```
$ sudo pacman -S netdata
```

**On DEB and RPM-based systems**

NetData is not available in the default repositories of DEB based (Ubuntu / Debian) or RPM based (RHEL / CentOS / Fedora) systems. We need to install NetData manually from its Git repository.

First install the required dependencies:

```
# Debian / Ubuntu
$ sudo apt-get install zlib1g-dev uuid-dev libuv1-dev liblz4-dev libjudy-dev libssl-dev libmnl-dev gcc make git autoconf autoconf-archive autogen automake pkg-config curl

# Fedora
$ sudo dnf install zlib-devel libuuid-devel libuv-devel lz4-devel Judy-devel openssl-devel libmnl-devel gcc make git autoconf autoconf-archive autogen automake pkgconfig curl findutils

# CentOS / Red Hat Enterprise Linux
$ sudo yum install epel-release
$ sudo yum install autoconf automake curl gcc git libmnl-devel libuuid-devel openssl-devel libuv-devel lz4-devel Judy-devel lm_sensors make MySQL-python nc pkgconfig python python-psycopg2 PyYAML zlib-devel

# openSUSE
$ sudo zypper install zlib-devel libuuid-devel libuv-devel liblz4-devel judy-devel openssl-devel libmnl-devel gcc make git autoconf autoconf-archive autogen automake pkgconfig curl findutils
```

After installing the required dependencies, install NetData on DEB or RPM based systems as shown below.

Git clone the NetData repository:

```
$ git clone https://github.com/netdata/netdata.git --depth=100
```

The above command will create a directory called **‘netdata’** in the current working directory.

Change to the ‘netdata’ directory:

```
$ cd netdata/
```

Finally, install and start NetData using command:

```
$ sudo ./netdata-installer.sh
```

**Sample output:**

```
Welcome to netdata!
Nice to see you are giving it a try!

You are about to build and install netdata to your system.

It will be installed at these locations:

- the daemon at /usr/sbin/netdata
 - config files at /etc/netdata
 - web files at /usr/share/netdata
 - plugins at /usr/libexec/netdata
 - cache files at /var/cache/netdata
 - db files at /var/lib/netdata
 - log files at /var/log/netdata
 - pid file at /var/run

This installer allows you to change the installation path.
Press Control-C and run the same command with --help for help.

Press ENTER to build and install netdata to your system > ## Press ENTER key
```

After installing NetData, you will see the following output at the end:

```
-------------------------------------------------------------------------------

OK. NetData is installed and it is running (listening to *:19999).

-------------------------------------------------------------------------------

INFO: Command line options changed. -pidfile, -nd and -ch are deprecated.
If you use custom startup scripts, please run netdata -h to see the
corresponding options and update your scripts.

Hit http://localhost:19999/ from your browser.

To stop netdata, just kill it, with:

killall netdata

To start it, just run it:

/usr/sbin/netdata


Enjoy!

Uninstall script generated: ./netdata-uninstaller.sh
```

![][3]

Install NetData

NetData has been installed and started.

To install Netdata on other Linux distributions, refer the [**official installation instructions page**][4].

##### Allow NetData default port via Firewall or Router

If your system stays behind any firewall or router, you must allow the default port **19999** to access the NetData web interface from any remote systems on the network,.

**On Ubuntu / Debian:**

```
$ sudo ufw allow 19999
```

**On CentOS / RHEL / Fedora:**

```
$ sudo firewall-cmd --permanent --add-port=19999/tcp

$ sudo firewall-cmd --reload
```

### Starting / Stopping NetData

To enable and start Netdata service on systems that use **Systemd** , run:

```
$ sudo systemctl enable netdata

$ sudo systemctl start netdata
```

To stop:

```
$ sudo systemctl stop netdata
```

To enable and start Netdata service on systems that use **Init** , run:

```
$ sudo service netdata start

$ sudo chkconfig netdata on
```

To stop it:

```
$ sudo service netdata stop
```

### Access NetData via Web browser

Open your web browser, and navigate to **<http://127.0.0.1:19999>** or **<http://localhost:19999/>** or **<http://ip-address:19999>**. You should see a screen something like below.

![][5]

Netdata dashboard

From the dashboard, you will find the complete statistics of your Linux system. Scroll down to view each section.

You can download and/or view NetData default configuration file at any time by simply navigating to **<http://localhost:19999/netdata.conf>**.

![][6]

Netdata configuration file

### Updating NetData

In Arch Linux, just run the following command to update NetData. If the updated version is available in the repository, it will be automatically installed.

```
$ sudo pacman -Syyu
```

In DEB or RPM based systems, just go to the directory where you have cloned it (In our case it’s netdata).

```
$ cd netdata
```

Pull the latest update:

```
$ git pull
```

Then, rebuild and update it using command:

```
$ sudo ./netdata-installer.sh
```

### Uninstalling NetData

Go to the location where you have cloned NetData.

```
$ cd netdata
```

Then, uninstall it using command:

```
$ sudo ./netdata-uninstaller.sh --force
```

In Arch Linux, the following command will uninstall it.

```
$ sudo pacman -Rns netdata
```

**Resources:**

  * [**NetData website**][7]
  * [**NetData GitHub page**][8]



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/netdata-real-time-performance-monitoring-tool-linux/

作者：[sk][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2016/06/Install-netdata-720x340.png
[2]: https://www.ostechnix.com/getting-started-pacman/
[3]: https://www.ostechnix.com/wp-content/uploads/2016/06/Deepin-Terminal_002-6.png
[4]: https://docs.netdata.cloud/packaging/installer/
[5]: https://www.ostechnix.com/wp-content/uploads/2016/06/Netdata-dashboard.png
[6]: https://www.ostechnix.com/wp-content/uploads/2016/06/Netdata-config-file.png
[7]: http://netdata.firehol.org/
[8]: https://github.com/firehol/netdata

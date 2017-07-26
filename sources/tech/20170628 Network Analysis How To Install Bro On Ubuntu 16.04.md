Network Analysis: How To Install Bro On Ubuntu 16.04
============================================================


 [![Bro Network Analysis Logo](https://www.unixmen.com/wp-content/uploads/2017/07/brologo-696x696.jpg "brologo")][4] 

### Introduction: Bro Network Analysis Framework

Bro is an open source network analysis framework with a focus on network security monitoring. It is the result of 15 years of research, widely used by major universities, research labs, supercomputing centers and many open-science communities. It is developed mainly at the International Computer Science Institute, in Berkeley, and the National Center for Supercomputing Applications, in Urbana-Champaign.

Bro has various features, including the following:

*   Bro’s scripting language enables site-specific monitoring policies

*   Targeting of high-performance networks

*   Analyzers for many protocols, enabling high-level semantic analysis at the application level

*   It keeps extensive application-layer stats about the network it monitors.

*   Bro interfaces with other applications for real-time exchange of information

*   It comprehensively logs everything and provides a high-level archive of a network’s activity.

This tutorial explains how to build from source and install Bro on an Ubuntu 16.04 Server.

### Prerequisites

Bro has many dependencies:

*   Libpcap ([http://www.tcpdump.org][2])

*   OpenSSL libraries ([http://www.openssl.org][3])

*   BIND8 library

*   Libz

*   Bash (required for BroControl)

*   Python 2.6+ (required for BroControl)

Building from source requires also:

*   CMake 2.8+

*   Make

*   GCC 4.8+ or Clang 3.3+

*   SWIG

*   GNU Bison

*   Flex

*   Libpcap headers

*   OpenSSL headers

*   zlib headers

### Getting Started

First of all, install all the required dependencies, by executing the following command:

```
# apt-get install cmake make gcc g++ flex bison libpcap-dev libssl-dev python-dev swig zlib1g-dev
```

#### Install GeoIP Database for IP Geolocation

Bro depends on GeoIP for address geolocation. Install both the IPv4 and IPv6 versions:

```
$ wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz
$wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/GeoLiteCityv6.dat.gz
```

Decompress both archives:

```
$ gzip -d GeoLiteCity.dat.gz
$ gzip -d GeoLiteCityv6.dat.gz
```

Move the decompressed files to `/usr/share/GeoIP` directory:

```
# mvGeoLiteCity.dat /usr/share/GeoIP/GeoIPCity.dat
# mv GeoLiteCityv6.dat /usr/share/GeoIP/GeoIPCityv6.dat
```

Now, it’s possible to build Bro from source.

### Build Bro

The latest Bro development version can be obtained through `git` repositories. Execute the following command:

```
$ git clone --recursive git://git.bro.org/bro
```

Go to the cloned directory and simply build Bro with the following commands:

```
$ cd bro
$ ./configure
$ make
```

The make command will require some time to build everything. The exact amount of time, of course, depends on the server performances.

The `configure` script can be executed with some argument to specify what dependencies you want build to, in particular the `--with-*` options.

### Install Bro

Inside the cloned `bro` directory, execute:

```
# make install
```

The default installation path is `/usr/local/bro`.

### Configure Bro

Bro configuration files are located in the `/usr/local/bro/etc` directory. There are three files:

*   `node.cfg`, used to configure which node (or nodes) to monitor.

*   `broctl.cfg`, the BroControl configuration file.

*   `networks.cgf`, containing a list of networks in CIDR notation.

#### Configure Mail Settings

Open the `broctl.cfg` configuration file:

```
# $EDITOR /usr/local/bro/etc/broctl.cfg
```

Look for the **Mail Options** section, and edit the `MailTo` line as follow:

```
# Recipient address for emails sent out by Bro and BroControl
MailTo = admin@example.com
```

Save and close. There are many other options, but in most cases the defaults are good enough.

#### Choose Nodes To Monitor

Out of the box, Bro is configured to operate in the standalone mode. In this tutorial we are doing a standalone installation, so it’s not necessary to change very much. However, look at the `node.cfg` configuration file:

```
# $EDITOR /usr/local/bro/etc/node.cfg
```

In the `[bro]` section, you should see something like this:

```
[bro]
type=standalone
host=localhost
interface=eth0
```

Make sure that the interface matches the public interface of the Ubuntu 16.04 server.

Save and exit.

### Configure Node’s Networks

The last file to edit is `network.cfg`. Open it with a text editor:

```
# $EDITOR /usr/local/bro/etc/networks.cfg
```

By default, you should see the following content:

```
# List of local networks in CIDR notation, optionally followed by a
# descriptive tag.
# For example, "10.0.0.0/8" or "fe80::/64" are valid prefixes.

10.0.0.0/8          Private IP space
172.16.0.0/12       Private IP space
192.168.0.0/16      Private IP space
```

Delete the three entries (which are just example for how to use this file), and enter the public and private IP space of your server, in the format:

```
X.X.X.X/X        Public IP space
X.X.X.X/X        Private IP space
```

Save and exit.

### Manage Bro Installation with BroControl

Managing Bro requires using BroControl, which comes in form of an interactive shell and a command line tool. Start the shell with:

```
# /usr/local/bro/bin/broctl
```

To use as a command line tool, just pass an argument to the previous command, for example:

```
# /usr/local/bro/bin/broctl status
```

This will check Bro’s status, by showing output like:

```
Name         Type       Host          Status    Pid    Started
bro          standalone localhost     running   6807   20 Jul 12:30:50
```

### Conclusion

This concludes the Bro’s installation tutorial. We used the source based installation because it is the most efficient way to obtain the latest version available, however this network analysis framework can also be downloaded in pre-built binary format.

See you next time!

--------------------------------------------------------------------------------

via: https://www.unixmen.com/how-to-install-bro-ubuntu-1604/

作者：[ Giuseppe Molica][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.unixmen.com/author/tutan/
[1]:https://www.unixmen.com/author/tutan/
[2]:http://www.tcpdump.org/
[3]:http://www.openssl.org/
[4]:https://www.unixmen.com/wp-content/uploads/2017/07/brologo.jpg

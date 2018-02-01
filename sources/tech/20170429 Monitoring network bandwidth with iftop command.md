translating---geekpi

Monitoring network bandwidth with iftop command
======
System Admins are required to monitor IT infrastructure to make sure that everything is up & running. We have to monitor performance of hardware i.e memory, hdds & CPUs etc & so does we have to monitor our network. We need to make sure that our network is not being over utilised or our applications, websites might not work. In this tutorial, we are going to learn to use IFTOP utility.

( **Recommended read** :[ **Resource monitoring using Nagios**][1], [**Tools for checking system info**,][2] [**Important logs to monitor**][3])

Iftop is network monitoring utility that provides real time real time bandwidth monitoring. Iftop measures total data moving in & out of the individual socket connections i.e. it captures packets moving in and out via network adapter & than sums those up to find the bandwidth being utilized.

## Installation on Debian/Ubuntu

Iftop is available with default repositories of Debian/Ubuntu & can be simply installed using the command below,

```
$ sudo apt-get install iftop
```

## Installation on RHEL/Centos using yum

For installing iftop on CentOS or RHEL, we need to enable EPEL repository. To enable repository, run the following on your terminal,

### RHEL/CentOS 7

```
$ rpm -Uvh https://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-10.noarch.rpm
```

### RHEL/CentOS 6 (64 Bit)

```
$ rpm -Uvh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
```

### RHEL/CentOS 6 (32 Bit)

```
$ rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
```

After epel repository has been installed, we can now install iftop by running,

```
$ yum install iftop
```

This will install iftop utility on your system. We will now use it to monitor our network,

## Using IFTOP

You can start using iftop by opening your terminal windown & type,

```
$ iftop
```

![network monitoring][5]

You will now be presented with network activity happening on your machine. You can also use

```
$ iftop -n
```

Which will present the network information on your screen but with '-n' , you will not be presented with the names related to IP addresses but only ip addresses. This option allows for some bandwidth to be saved, which goes into resolving IP addresses to names.

Now we can also see all the commands that can be used with iftop. Once you have ran iftop, press 'h' button on the keyboard to see all the commands that can be used with iftop.

![network monitoring][7]

To monitor a particular network interface, we can mention interface with iftop,

```
$ iftop -I enp0s3
```

You can check further options that are used with iftop using help, as mentioned above. But these mentioned examples are only what you might to monitor network.


--------------------------------------------------------------------------------

via: http://linuxtechlab.com/monitoring-network-bandwidth-iftop-command/

作者：[SHUSAIN][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/
[1]:http://linuxtechlab.com/installing-configuring-nagios-server/
[2]:http://linuxtechlab.com/commands-system-hardware-info/
[3]:http://linuxtechlab.com/important-logs-monitor-identify-issues/
[4]:https://i1.wp.com/linuxtechlab.com/wp-content/plugins/a3-lazy-load/assets/images/lazy_placeholder.gif?resize=661%2C424
[5]:https://i0.wp.com/linuxtechlab.com/wp-content/uploads/2017/04/iftop-1.jpg?resize=661%2C424
[6]:https://i1.wp.com/linuxtechlab.com/wp-content/plugins/a3-lazy-load/assets/images/lazy_placeholder.gif?resize=663%2C416
[7]:https://i0.wp.com/linuxtechlab.com/wp-content/uploads/2017/04/iftop-help.jpg?resize=663%2C416

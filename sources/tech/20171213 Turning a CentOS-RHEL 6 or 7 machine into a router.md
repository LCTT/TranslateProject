Translate by lujun9972
Turning a CentOS/RHEL 6 or 7 machine into a router
======
In this tutorial we are going to learn to convert RHEL/CentOS 6 & 7 machines into a router by using NATting. Router as we know is layer 3 networking device that is used to connect 2 or more networks i.e. either connecting LAN to WAN or LAN to LAN etc. Router devices are quite expensive & especially for small organizations, that might be a reason for concern. So rather than using a dedicated Hardware, we can use any Linux machine & convert it into a router.
We will be discussing process for both RHEL/CentOS 6 & 7\. But before we do that, let's discuss the things we will be needing for our setup.

### Prerequisite

**1-** A machine with either RHEL/CentOS 6 or 7 installed
**2-** Two NICs to assign local IP address  & WAN IP address respectively

We must assign IP address to both network interface cards, one IP should be for local area network (information regarding it will be provided by our Network administrator) & other IP should be to access internet, information for WAN IP will be provided by ISP. For example

 **Ifcfg-en0s3 192.168.1.1** (LAN IP address)
**Ifcfg-en0s5 10.1.1.1 ** (WAN IP address)

 **Note** - Change the interface name according to Linux distro being used.

Now that we have what we need, we will move onto the setup

### Step 1 Enabling IP forwarding

Firstly we will enable IP forwarding on the machine. Process of doing same is same in both RHEL/CentOS 6 & 7\. To enable IP forwarding, run

```
$ sysctl -w net.ipv4.ip_forward=1
```

But this will not persist on system reboot. To make it survive a system reboot, open

```
$ vi /etc/sysctl.conf
```

& enter the following to the file,

```
net.ipv4.ip_forward = 1
```

Save file & exit. IP forwarding has now been enabled on the system.

### Step 2 Configuring IPtables/Firewalld rules

Next we need to start services of IPtables/firewalld on our systems to configure the NATting rule,

```
$ systemctl start firewalld (For Centos/RHEL 7)
$ service iptables start  (For Centos/RHEL 6)
```

Next step is to configure the NATting rule on the firewall. Run the following command,

```
CentOS/RHEL 6
$ iptables -t nat -A POSTROUTING -o XXXX -j MASQUERADE
$ service iptables restart CentOS/RHEL 7
$ firewall-cmd  -permanent -direct -passthrough ipv4 -t nat -I POSTROUTING -o XXXX -j MASQUERADE -s 192.168.1.0/24
$ systemctl restart firewalld
```

Here, **XXXX** is the name of the network interface with the WAN IP address. This completes configuration of Linux machine as router, next we will test our router after configuring a client machine.

### Step 3 Configuring the client machine

To test the router, we need to assign the internal (LAN) IP address as gateway on our client machine, its 192.168.1.1 in our case. So whether using a Windows machine or linux machine as client, make sure that we have 192.168.1.1 as our gateway. Once that's done, open terminal/CMD run a ping test against a website to make sure that internet is accessible on client machine,

 **$ ping google.com
**

We can also check by browsing websites via our web browser.


--------------------------------------------------------------------------------

via: http://linuxtechlab.com/turning-centosrhel-6-7-machine-router/

作者：[][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com
[1]:https://www.facebook.com/linuxtechlab/
[2]:https://twitter.com/LinuxTechLab
[3]:https://plus.google.com/+linuxtechlab

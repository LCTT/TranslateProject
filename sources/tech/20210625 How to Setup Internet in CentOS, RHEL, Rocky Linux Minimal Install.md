[#]: subject: (How to Setup Internet in CentOS, RHEL, Rocky Linux Minimal Install)
[#]: via: (https://www.debugpoint.com/2021/06/setup-internet-minimal-install-server/)
[#]: author: (Arindam https://www.debugpoint.com/author/admin1/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How to Setup Internet in CentOS, RHEL, Rocky Linux Minimal Install
======
Setting up the internet or network is super easy in minimal server
installations. In this guide, we will explain how you can setup internet
or network in CentOS, RHEL, Rocky Linux minimal install.
Once you install the minimal install of any server distributions, you would not have any GUI or desktop environment to set up your network or internet. Hence it is important to know how you can set up internet when you only have access to the terminal. The NetworkManager utility provides necessary tools armed with systemd services to get the job done. Here’s how.

### Setup Internet in CentOS, RHEL, Rocky Linux Minimal Install

  * After you have completed the installation, boot into the server terminal. Ideally, you should be prompted with a terminal. Login using root or admin account.


  * Then first, try to check the state of the network interface and details using nmcli. The nmcli is a command-line tool for controlling the NetworkManager service. Use the following command to check.



```
nmcli device status
```

This would display the device name, status etc.

![nmcli device status][1]

  * Run the tool `nmtui` to configure the network interface. The [nmtui][2] is part of the NetworkManager tool which gives you a nice UI to configure the network. This is part of the package NetworkManager-tui and should be installed by default when you have completed the installation of the minimal server.



```
nmtui
```

  * Click on Edit a connection in the nmtui window.



![nmtui – Select options][3]

  * Select the interface name



![Select Interface to Edit][4]

  * In the Edit Connection window, choose Automatic for IPv4 and IPv6. And select Automatically Connect. Press ok once done.



![nmtui – Edit Connection][5]

  * Restart the NetworkManager service via the [systemd systemctl][6] using the following command.



```
systemctl restart NetworkManager
```

  * If all goes well, you should be connected to the network and internet in the minimal installation of CentOS, RHEL, Rocky Linux server. Provided your network has internet connectivity. You can use ping to verify whether it is working.



![setup internet minimal server – CentOS Rocky Linux RHEL][7]

### Additional Tip: Set up Static IP in minimal server

When you set the network configuration as automatic, the interface dynamically assigns the IP when you connected to the internet. In some situations where you are setting up a local area network (LAN), you may want to assign static IP to your network interface. It’s super easy.

Open the network configuration script for your network. Change the highlighted part for your own device.

```
vi /etc/sysconfig/network-scripts/ifcfg-ens3
```

In the above file, add the IP address you desire with property IPADDR. Save the file.

```
IPADDR=192.168.0.55
```

Add the gateway for your network in `/etc/sysconfig/network`.

```
NETWORKING=yes
HOSTNAME=debugpoint
GATEWAY=10.1.1.1
```

Add any public DNS server in resolv.conf located at `/etc/resolv.conf`.

nameserver 8.8.8.8
nameserver 8.8.4.4

And restart the network service.

```
systemctl restart NetworkManager
```

This will complete the setup of the static IP. You can also check the IP details using `ip addr` command.

I hope this guide helps you to set up the network, internet, and static IP in your minimal server. Let me know in the comment section, if you may have any questions.

* * *

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2021/06/setup-internet-minimal-install-server/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/blog/wp-content/uploads/2021/06/nmcli-device-status.jpg
[2]: https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/networking_guide/sec-configuring_ip_networking_with_nmtui
[3]: https://www.debugpoint.com/blog/wp-content/uploads/2021/06/nmtui-Select-options.jpg
[4]: https://www.debugpoint.com/blog/wp-content/uploads/2021/06/Select-Interface-to-Edit.jpg
[5]: https://www.debugpoint.com/blog/wp-content/uploads/2021/06/nmtui-Edit-Connection.jpg
[6]: https://www.debugpoint.com/2020/12/systemd-systemctl-service/
[7]: https://www.debugpoint.com/blog/wp-content/uploads/2021/06/setup-internet-minimal-server-CentOS-Rocky-Linux-RHEL.jpg

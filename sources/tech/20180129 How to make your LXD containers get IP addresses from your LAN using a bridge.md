How to make your LXD containers get IP addresses from your LAN using a bridge
======
**Background** : LXD is a hypervisor that manages machine containers on Linux distributions. You install LXD on your Linux distribution and then you can launch machine containers into your distribution running all sort of (other) Linux distributions.

In the previous post, we saw how to get our LXD container to receive an IP address from the local network (instead of getting the default private IP address), using **macvlan**.

In this post, we are going to see how to use a **bridge** to make our containers get an IP address from the local network. Specifically, we are going to see how to do this using NetworkManager. If you have several public IP addresses, you can use this method (or the other with the **macvlan** ) in order to expose your LXD containers directly to the Internet.

### Creating the bridge with NetworkManager

See this post [How to configure a Linux bridge with Network Manager on Ubuntu][1] on how to create the bridge with NetworkManager. It explains that you

  1. Use **NetworkManager** to **Add a New Connection** , a **Bridge**.
  2. When configuring the **Bridge** , you specify the real network connection (the device, like **eth0** or **enp3s12** ) that will be **the slave of the bridge**. You can verify the device of the network connection if you run **ip route list 0.0.0.0/0**.
  3. Then, you can remove the old network connection and just keep the slave. The slave device ( **bridge0** ) will now be the device that gets you your LAN IP address.



At this point you would have again network connectivity. Here is the new device, **bridge0**.
```
$ ifconfig bridge0
bridge0 Link encap:Ethernet HWaddr 00:e0:4b:e0:a8:c2
 inet addr:192.168.1.64 Bcast:192.168.1.255 Mask:255.255.255.0
 inet6 addr: fe80::d3ca:7a11:f34:fc76/64 Scope:Link
 UP BROADCAST RUNNING MULTICAST MTU:1500 Metric:1
 RX packets:9143 errors:0 dropped:0 overruns:0 frame:0
 TX packets:7711 errors:0 dropped:0 overruns:0 carrier:0
 collisions:0 txqueuelen:1000
 RX bytes:7982653 (7.9 MB) TX bytes:1056263 (1.0 MB)
```

### Creating a new profile in LXD for bridge networking

In LXD, there is a default profile and then you can create additional profile that either are independent from the default (like in the **macvlan** post), or can be chained with the default profile. Now we see the latter.

First, create a new and empty LXD profile, called **bridgeprofile**.
```
$ lxc create profile bridgeprofile
```

Here is the fragment to add to the new profile. The **eth0** is the interface name in the container, so for the Ubuntu containers it does not change. Then, **bridge0** is the interface that was created by NetworkManager. If you created that bridge by some other way, add here the appropriate interface name. The **EOF** at the end is just a marker when we copy and past to the profile.
```
description: Bridged networking LXD profile
devices:
 eth0:
 name: eth0
 nictype: bridged
 parent: bridge0
 type: nic
**EOF**
```

Paste the fragment to the new profile.
```
$ cat <<EOF | lxc profile edit bridgeprofile
(paste here the full fragment from earlier)
```

The end result should look like the following.
```
$ lxc profile show bridgeprofile
config: {}
description: Bridged networking LXD profile
devices:
 eth0:
 name: eth0
 nictype: bridged
 parent: bridge0
 type: nic
name: bridgeprofile
used_by:
```

If it got messed up, delete the profile and start over again. Here is the command.
```
$ lxc profile delete profile_name_to_delete
```

### Creating containers with the bridge profile

Now we are ready to create a new container that will use the bridge. We need to specify first the default profile, then the new profile. This is because the new profile will overwrite the network settings of the default profile.
```
$ lxc launch -p default -p bridgeprofile ubuntu:x mybridge
Creating mybridgeStarting mybridge
```

Here is the result.
```
$ lxc list
+-------------|---------|---------------------|------+
| mytest | RUNNING | 192.168.1.72 (eth0) | |
+-------------|---------|---------------------|------+
| ... | ... |
```

The container **mybridge** is accessible from the local network.

### Changing existing containers to use the bridge profile

Suppose we have an existing container that was created with the default profile, and got the LXD NAT network. Can we switch it to use the bridge profile?

Here is the existing container.
```
$ lxc launch ubuntu:x mycontainer
Creating mycontainerStarting mycontainer
```

Let's assign **mycontainer** to use the new profile,  " **default,bridgeprofile "**.
```
$ lxc profile assign mycontainer default,bridgeprofile
```

Now we just need to restart the networking in the container.
```
$ lxc exec mycontainer -- systemctl restart networking.service
```

This can take quite some time, 10 to 20 seconds. Be patient. Obviously, we could simply restart the container. However, since it can take quite some time to get the IP address, it is more practical to know exactly when you get the new IP address.

Let's see how it looks!
```
$ lxc list ^mycontainer$
+----------------|-------------|---------------------|------+
| NAME           | STATE       | IPV4                | IPV6 |
+----------------|-------------|---------------------|------+
| mycontainer    | RUNNING | 192.168.1.76 (eth0) |      |
+----------------|-------------|---------------------|------+
```

It is great! It got a LAN IP address! In the **lxc list** command, we used the filter **^mycontainer$** , which means to show only the container with the exact name **mycontainer**. By default, **lxc list** does a substring search when it tries to match a container name. Those **^** and **$** characters are related to Linux/Unix in general, where **^** means **start** , and **$** means **end**. Therefore, **^mycontainer$** means the exact string **mycontainer**!

### Changing bridged containers to use the LXD NAT

Let's switch back from using the bridge, to using the LXD NAT network. We stop the container, then assign just the **default** profile and finally start the container.
```
$ lxc stop mycontainer
$ lxc profile assign mycontainer default
Profiles default applied to mycontainer
$ lxc start mycontainer
```

Let's have a look at it,
```
$ lxc list ^mycontainer$
+-------------|---------|----------------------|--------------------------------+
| NAME | STATE | IPV4 | IPV6 |
+-------------|---------|----------------------|--------------------------------+
| mycontainer | RUNNING | 10.52.252.101 (eth0) | fd42:cba6:...:fe10:3f14 (eth0) |
+-------------|---------|----------------------|--------------------------------+
```

**NOTE** : I tried to assign the **default** profile while the container was running in bridged mode. It made a mess with the networking and the container could not get an IPv4 IP address anymore. It could get an IPv6 address though. Therefore, use as a rule of thumb to stop a container before assigning a different profile.

**NOTE #2** : If your container has a LAN IP address, it is important to stop the container so that your router's DHCP server gets the notification to remove the DHCP lease. Most routers remember the MAC address of a new computer, and a new container gets a new random MAC address. Therefore, do not delete or kill containers that have a LAN IP address but rather stop them first. Your router's DHCP lease table is only that big.

### Conclusion

In this post we saw how to selectively get ours containers to receive a LAN IP address. This requires to set the host network interface to be the slave of the bridge. It is a bit invasive compared to [using a **macvlan**][2], but offers the ability for the containers and the host to communicate with each other over the LAN.


--------------------------------------------------------------------------------

via: https://blog.simos.info/how-to-make-your-lxd-containers-get-ip-addresses-from-your-lan-using-a-bridge/

作者：[Simos Xenitellis][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://blog.simos.info/author/simos/
[1]:http://ask.xmodulo.com/configure-linux-bridge-network-manager-ubuntu.html (Permalink to How to configure a Linux bridge with Network Manager on Ubuntu)
[2]:https://blog.simos.info/how-to-make-your-lxd-container-get-ip-addresses-from-your-lan/

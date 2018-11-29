[#]: collector: (lujun9972)
[#]: translator: (chenxinlong)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: subject: (How To Configure IP Address In Ubuntu 18.04 LTS)
[#]: via: (https://www.ostechnix.com/how-to-configure-ip-address-in-ubuntu-18-04-lts/)
[#]: author: (SK https://www.ostechnix.com/author/sk/)
[#]: url: ( )

翻译中 ... 

How To Configure IP Address In Ubuntu 18.04 LTS
======

![](https://www.ostechnix.com/wp-content/uploads/2018/11/configure-ip-address-720x340.jpg)

The method of configuring IP address on Ubuntu 18.04 LTS is significantly different than the older methods. Unlike the previous versions, the Ubuntu 18.04 uses **Netplan** , a new command line network configuration utility, to configure IP address. Netplan has been introduced by Ubuntu developers in Ubuntu 17.10. In this new approach, we no longer use **/etc/network/interfaces** file to configure IP address rather we use a YAML file. The default configuration files of Netplan are found under **/etc/netplan/** directory. In this brief tutorial, we are going to learn to configure static and dynamic IP address in **Ubuntu 18.04 LTS** minimal server.

### Configure Static IP Address In Ubuntu 18.04 LTS

Let us find out the default network configuration file:

```
$ ls /etc/netplan/
50-cloud-init.yaml
```

As you can see, the default network configuration file is **50-cloud-init.yaml** and it is obviously a YAML file.

Now, let check the contents of this file:

```
$ cat /etc/netplan/50-cloud-init.yaml
```

I have configured my network card to obtain IP address from the DHCP server when I am installing Ubuntu 18.04, so here is my network configuration details:

![](https://www.ostechnix.com/wp-content/uploads/2018/11/configure-network.png)

As you can see, I have two network cards, namely **enp0s3** and **enp0s8** , and both are configured to accept IPs from the DHCP server.

Let us now configure static IP addresses to both network cards.

To do so, open the default network configuration file in any editor of your choice.

```
$ sudo nano /etc/netplan/50-cloud-init.yaml
```

Now, update the file by adding the IP address, netmask, gateway and DNS server. For the purpose of this file, I have used **192.168.225.50** as my IP for **enp0s3** and **192.168.225.51** for **enp0s8** , **192.168.225.1** as gateway, **255.255.255.0** as netwmask and **8.8.8.8** , **8.8.4.4** as DNS servers.

![](https://www.ostechnix.com/wp-content/uploads/2018/11/configure-static-ip.png)

Please mind the space between the lines. Don’t use **TAB** to align the lines as it will not work in Ubuntu 18.04. Instead, just use SPACEBAR key to make them in a consistent order as shown in the above picture.

Also, we don’t use a separate line to define netmask (255.255.255.0) in Ubuntu 18.04. For instance, in older Ubuntu versions, we configure IP and netmask like below:

```
address = 192.168.225.50
netmask = 255.255.255.0
```

However, with netplan, we combine those two lines with a single line as shown below:

```
addresses : [192.168.225.50/24]
```

Once you’re done, Save and close the file.

Apply the network configuration using command:

```
$ sudo netplan apply
```

If there are any issues, run the following command to investigate and check what is the problem in the configuration.

```
$ sudo netplan --debug apply
```

Output:

```
** (generate:1556): DEBUG: 09:14:47.220: Processing input file //etc/netplan/50-cloud-init.yaml..
** (generate:1556): DEBUG: 09:14:47.221: starting new processing pass
** (generate:1556): DEBUG: 09:14:47.221: enp0s8: setting default backend to 1
** (generate:1556): DEBUG: 09:14:47.222: enp0s3: setting default backend to 1
** (generate:1556): DEBUG: 09:14:47.222: Generating output files..
** (generate:1556): DEBUG: 09:14:47.223: NetworkManager: definition enp0s8 is not for us (backend 1)
** (generate:1556): DEBUG: 09:14:47.223: NetworkManager: definition enp0s3 is not for us (backend 1)
DEBUG:netplan generated networkd configuration exists, restarting networkd
DEBUG:no netplan generated NM configuration exists
DEBUG:device enp0s3 operstate is up, not replugging
DEBUG:netplan triggering .link rules for enp0s3
DEBUG:device lo operstate is unknown, not replugging
DEBUG:netplan triggering .link rules for lo
DEBUG:device enp0s8 operstate is up, not replugging
DEBUG:netplan triggering .link rules for enp0s8
```

Now, let us check the Ip address using command:

```
$ ip addr
```

Sample output from my Ubuntu 18.04 LTS:
![](https://www.ostechnix.com/wp-content/uploads/2018/11/Check-IP-address.png)

Congratulations! We have successfully configured static IP address in Ubuntu 18.04 LTS with Netplan configuration tool.

For more details, refer the Netplan man pages.

```
$ man netplan
```

### Configure Dynamic IP Address In Ubuntu 18.04 LTS

To configure dynamic address, just leave the default configuration file as the way it is. If you already have configured static IP address, just remove the newly added lines and make the YAML file look like exactly as shown in the **figure 1** in the previous section.

That’s all. You know now how to configure static and dynamic IP in Ubuntu 18.04 LTS server. Personally, I don’t like this new method. The old method is much easier and better. How about you? Did you find it easy or hard? Let me know in the comment section below.

More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-configure-ip-address-in-ubuntu-18-04-lts/

作者：[SK][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972

[#]: subject: "From ifcfg to keyfiles: modernizing NetworkManager configuration in Fedora Linux 36"
[#]: via: "https://fedoramagazine.org/converting-networkmanager-from-ifcfg-to-keyfiles/"
[#]: author: "Lubomir Rintel https://fedoramagazine.org/author/lkundrak/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

From ifcfg to keyfiles: modernizing NetworkManager configuration in Fedora Linux 36
======

![][1]

Photo by [Compare Fibre][2] on [Unsplash][3]

One of the changes in Fedora Linux 36 is that new installations will [no longer support the ifcfg files to configure networking][4]. What are those and what replaces them?

### A bit of history

In the good old days, connecting a Linux box to a network was easy. For each of the interface cards connected to a network, the system administrator would drop a configuration file into the _/etc_ directory. That configuration file would describe the addressing configuration for a particular network. On Fedora Linux, the configuration file would actually be a shell script snippet like this:

```

    $ cat /etc/sysconfig/network-scripts/ifcfg-eth0
    TYPE=Ethernet
    DEVICE=eth0
    BOOTPROTO=dhcp

```

A shell script executed on startup would read the file and apply the configuration. Simple.

Towards the end of 2004, however, a change was in the air. Quite literally — the Wi-Fi has become ubiquitous. The portable computers of the day could rapidly connect to new networks and the USB bus allowed even the wired network adapters to come and go while the system was up and running. The network configuration became more dynamic than ever before, rendering the existing network configuration tooling impractical. To the rescue came [NetworkManager][5]. On a Fedora Linux system, NetworkManager uses configuration like this:

```

    $ cat /etc/sysconfig/network-scripts/ifcfg-eth0
    TYPE=Ethernet
    DEVICE=eth0
    BOOTPROTO=dhcp

```

Looks familiar? It should. From the beginning, NetworkManager was intended to work with the existing configuration formats. In fact, it ended up with plugins which would seamlessly convert between NetworkManager’s internal configuration model and the distribution’s native format. On Fedora, it would be the aforementioned _ifcfg_ files.

Let’s take a closer look at them.

### Ifcfg files

The legacy network service, now part of the _network-scripts_ package, originally defined the _ifcfg_ file format. Along with the package comes a file called [sysconfig.txt][6] that, quite helpfully, documents the format.

As NetworkManager gained traction it often found itself in need of expressing a configuration that was not supported by the old fashioned network service. Given the nature of configuring things with shell scripts, adding new settings is no big deal. The unknown ones are generally just silently ignored. The NetworkManager’s idea of what ifcfg files should look like is described in the [nm-settings-ifcfg-rh(5)][7] manual.

In general, NetworkManager tries hard to write _ifcfg_ files that work well with the legacy network service. Nevertheless, sometimes it is just not possible. These days, the number of network connection types that NetworkManager supports vastly outnumber what the legacy network service can configure. . A new format is now used to express what the legacy format can not. This includes VPN connections, broadband modems and more.

### Keyfiles

The new format closely resembled the NetworkManager’s native configuration model:

```

    $ cat /etc/NetworkManager/system-connections/VPN.ovpn
    [connection]
    id=My VPN
    uuid=c85a7cdb-973b-491f-998d-b09a590af10e
    type=vpn

    [vpn]
    ca=/etc/pki/tls/certs/vpn-ca.pem
    connection-type=password
    remote=vpn.example.com
    username=lkundrak
    service-type=org.freedesktop.NetworkManager.openvpn

    [ipv6]
    method=auto
    never-default=true

```

The actual format should be instantly familiar to everyone familiar with Linux systems. It’s the “ini file” or “keyfile” — a bunch of plain text key-value pairs, much like the ifcfg files use, grouped into sections. The [nm-settings-ifcfg-keyfile(5)][8] manual documents the format thoroughly.

The main advantage of using this format is that it closely resembles NetworkManager’s idea of how to express network configuration, used both internally and on the D-Bus API. It’s easier to extend without taking into consideration the quirks of the mechanism that was designed in without the benefit of foresight back when the world was young. This means less code, less surprises and less bugs.

In fact there’s nothing the _keyfile_ format can’t express that _ifcfg_ files can. It can express the simple wired connections just as well as the VPNs or modems.

### Migrating to keyfiles

The legacy network service served us well for many years, but its days are now long over. Fedora Linux dropped it many releases ago and without it there is seemingly little reason to use the ifcfg files. That is, for new configurations. While Fedora Linux still supports the _ifcfg_ files, it has defaulted to writing _keyfiles_ for quite some time.

Starting with Fedora Linux 36, the ifcfg support will no longer be present in new installations. If you’re still using _ifcfg_ files, do not worry — the existing systems will keep it on upgrades. Nevertheless, you can still decide to uninstall it and carry your configuration over to _keyfiles_. Keep on reading to learn how.

If you’re like me, you installed your system years ago and you have a mixture of _keyfiles_ and _ifcfg_ files. Here’s how can you check:

```

    $ nmcli -f TYPE,FILENAME,NAME conn
    TYPE      FILENAME                                         NAME
    ethernet  /etc/sysconfig/network-scripts/ifcfg-eth0        eth0
    wifi      /etc/sysconfig/network-scripts/ifcfg-Guest       Guest
    wifi      /etc/NetworkManager/system-connections/Base48    Base48
    vpn       /etc/NetworkManager/system-connections/VPN.ovpn  My VPN

```

This example shows a VPN connection that must have always used a keyfile and a Wi-Fi connection presumably created after Fedora Linux switched to writing _keyfiles_ by default. There’s also an Ethernet connection and Wi-Fi one from back in the day that use the _ifcfg_ plugin. Let’s see how we can convert those to keyfiles.

The NetworkManager’s command line utility, [nmcli(1)][9], acquired a new _connection migrate_ command, that can change the configuration backend used by a connection profile.

It’s a good idea to make a backup of _/etc/sysconfig/network-scripts/ifcfg-*_ files, in case anything goes wrong. Once you have the backup you can try migrating a single connection to a different configuration backend (_keyfile_ by default):

```

    $ nmcli connection migrate eth0
    Connection 'eth0' (336aba93-1cd7-4cf4-8e90-e2009db3d4d0) successfully migrated.

```

Did it work?

```

    $ nmcli -f TYPE,FILENAME,NAME conn
    TYPE      FILENAME                                         NAME
    ethernet  /etc/NetworkManager/system-connections/eth0.nmc  eth0
    wifi      /etc/sysconfig/network-scripts/ifcfg-Guest       Guest
    wifi      /etc/NetworkManager/system-connections/Base48    Base48
    vpn       /etc/NetworkManager/system-connections/VPN.ovpn  My VPN

```

Cool. Can I migrate it back, for no good reason?

```

    $ nmcli conn migrate --plugin ifcfg-rh eth0
    Connection 'eth0' (336aba93-1cd7-4cf4-8e90-e2009db3d4d0) successfully migrated.

```

Excellent. Without specifying more options, the “connection migrate” command ensures all connections use the keyfile backend:

```

    $ nmcli conn migrate
    Connection '336aba93-1cd7-4cf4-8e90-e2009db3d4d0' (eth0) successfully migrated.
    Connection '3802a9bc-6ca5-4a17-9d0b-346f7212f2d3' (Red Hat Guest) successfully migrated.
    Connection 'a082d5a0-5e29-4c67-8b6b-09af1b8d55a0' (Base48) successfully migrated.
    Connection 'c85a7cdb-973b-491f-998d-b09a590af10e' (Oh My VPN) successfully migrated.

```

And that’s all. Now that your system has no _ifcfg_ files, the configuration backend that supports them is of no use and you can remove it:

```

    # dnf remove NetworkManager-initscripts-ifcfg-rh
    …

```

Your system now works the same as it did before, but you can rejoice, for it is now modern.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/converting-networkmanager-from-ifcfg-to-keyfiles/

作者：[Lubomir Rintel][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/lkundrak/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2022/04/ifcfg_to_keyfiles-816x345.jpg
[2]: https://unsplash.com/@comparefibre?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/network-cable?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://fedoraproject.org/wiki/Releases/36/ChangeSet#No_ifcfg_by_default
[5]: https://networkmanager.dev/
[6]: https://github.com/fedora-sysv/initscripts/blob/master/doc/sysconfig.txt#L416
[7]: https://networkmanager.dev/docs/api/latest/nm-settings-ifcfg-rh.html
[8]: https://networkmanager.dev/docs/api/latest/nm-settings-ifcfg-keyfile.html
[9]: https://networkmanager.dev/docs/api/latest/nmcli.html

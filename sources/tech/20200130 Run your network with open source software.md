[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Run your network with open source software)
[#]: via: (https://opensource.com/article/20/1/open-source-networking)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Run your network with open source software
======
VyOS is an easy-to-install open source router and firewall solution
![Multi-colored and directional network computer cables][1]

Way back in 2005, a company called Vyatta was founded by Allan Leinwand. It offered the first commercially supported, open source router and firewall solution. Named after the ancient Sanskrit for "open," the company's goal of bringing open source networking products to the market was so successful that it was purchased by competitor Brocade. This effectively killed Vyatta, but because Vyatta's product was open source, it didn't stop it. As it turns out, Vyatta's software-defined networking capabilities have been continued and developed as [VyOS][2].

The VyOS distribution is based on Debian Linux, with source code available from a [Git repository][3] and a [rolling release ISO][4]. For mission-critical applications, there are [long-term support releases and support contracts][5].

### Building a network

Networking has changed since 2005, and thanks to the VyOS project, so has the software that drives it. After learning that VyOS was continuing the work of Vyatta, I downloaded the ISO to try it out. The installation process was easier for me than the normal Debian install, which is a simple task. VyOS doesn't boot into a graphical interface, but to a text console. It's just you and a bunch of configuration files, just like you might expect from a serious router.

The default install of VyOS provides no default configuration. It's entirely up to you to build the network you want to run. Depending on your point of view, that's either refreshing or frustrating, but it gives you an idea of the intended audience: VyOS is built for network engineers who've mapped out their desired topography and are capable of creating it with some subnet calculations and text definitions.

### The VyOS configure command

That said, VyOS isn't just a re-branded Debian release. One of its key features is its **configure** command, an interactive tool for defining network definitions that are applied only after you commit them. In addition to feeling familiar to users accustomed to IOS and similar toolchains, this allows you to configure your network even as the router continues its normal operations. Nothing is final until you type **commit**.

Once you've tested a committed network change, you can use the **save** command to permanently store your configuration files for backup or migration to other VyOS machines.

You enter configuration mode with the **configure** command. There are too many possible network configurations to go over **configure** or basic networking tasks here, but the syntax is generally intuitive and predictable. For instance, to enable SSH management over port 22212 of your router:


```
`# set service ssh port '22212'`
```

To set the network interface card (NIC) **eth1** to an internal IP address and to create a description identifying it as the default gateway:


```
# set interfaces ethernet eth1 address '10.1.0.1/24'
# set interfaces ethernet eth1 description 'INSIDE'
```

To set the public IP of NIC **eth0** and describe it as the world-facing interface:


```
# set interfaces ethernet eth0 address dhcp
# set interfaces ethernet eth0 description 'OUTSIDE'
```

To activate network address translation (NAT), it's the same structure:


```
set nat source rule 100 outbound-interface 'eth0'
set nat source rule 100 source address '10.1.0.0/24'
set nat source rule 100 translation address masquerade
```

Assuming those are the only tasks you have for now, commit and save:


```
# commit
# save &amp;&amp; exit
Saving configuration to '/config/config.boot'...
Done
$
```

Although that's probably not everything you need to do in real life, it gives you an idea of the direct simplicity that VyOS provides. You don't have to deal with "reverse engineering" confusing graphical interfaces nor scrubbing through verbose configuration files for a poorly named key. You have a unified interface for every task, whether it's setting up a firewall, implementing DHCP, DNS, quality of service, VPN gateways, IPv6, or whatever else.

### Professional networking appliance

VyOS might not be a beginner-level router distribution, but it's a great tool to have on hand even if you're just starting out. There's no better way to learn the basics of networking than to have an open source router available for manipulation and testing. It's the 21st century, after all; you can set up a computer lab consisting of virtual clients networked to one another through a virtual VyOS instance entirely within [GNOME Boxes][6] for $0. You can learn advanced networking concepts and solutions armed with little more than a Linux computer and the excellent [VyOS documentation][7].

If you're already a networking professional, then take a look at VyOS. You'll find its philosophy on configuration simple and its configure tool efficient.

Connecting your Linux computer to a network is pretty straightforward, except when it is not. In...

Jay Turner gives tips for attracting and maintaining an open source community around networking.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/open-source-networking

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/connections_wires_sysadmin_cable.png?itok=d5WqHmnJ (Multi-colored and directional network computer cables)
[2]: http://vyos.io
[3]: https://github.com/vyos/
[4]: https://www.vyos.io/rolling-release/
[5]: https://vyos.io/subscriptions/
[6]: https://opensource.com/article/19/5/getting-started-gnome-boxes-virtualization
[7]: https://vyos.readthedocs.io/en/latest/index.html

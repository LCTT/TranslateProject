[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to manage network services with firewall-cmd)
[#]: via: (https://fedoramagazine.org/how-to-manage-network-services-with-firewall-cmd/)
[#]: author: (dan01 https://fedoramagazine.org/author/dan01/)

How to manage network services with firewall-cmd
======

![][1]

In a previous article, you explored how to [control the firewall at the command line][2] in Fedora.

Now you are going to see how to see how _add_, _remove_, and _list_ _services_, _protocols_ and _ports_ in order to _block_ or _allow_ them.

### A short recap

First, it’s a good idea to check the _status_ of your firewall, see if it’s running or not. You do this, as we previously learned, by using the state option (_firewall-cmd_ ‐‐_state_).

The next step is to get the zone for the desired network interface. For example, I use a desktop that has two network interfaces: a _physical_ interface (_enp0s3_), representing my actual _network card_ and a _virtual_ interface (_virbr0_) used by virtualization software like _KVM_. To see what zones are active, run _firewall-cmd ‐‐get-active-zones_.

Now that you know what zone you’re interested in, you can list the rules for the zone with _firewall-cmd ‐‐info-zone=FedoraWorkstation_.

### Reading zone information

To display information for a particular _zone_, run _firewall-cmd ‐‐zone=ZoneName ‐‐list-all_, or simply display information for the default zone with:

```
[dan@localhost ~]$ firewall-cmd --list-all
FedoraWorkstation (active)
target: default
icmp-block-inversion: no
interfaces: enp0s3
sources:
services: dhcpv6-client mdns samba-client ssh
ports: 1025-65535/udp 1025-65535/tcp
protocols:
masquerade: no
forward-ports:
source-ports:
icmp-blocks:
rich rules:
```

Now, let’s explore the output. The first line is showing which _zone_ the following information applies to and if that zone is currently in use.

The _target_ : _default_ simply tells us this is the default zone. This can be set or retrieved via the _‐‐set-default-zone=ZoneName_ and _‐‐get-default-zone_.

_icmp-block-inversion_, indicates if [ICMP][3] requests are blocked. For example if the machine responds to _ping_ requests from other machines on the network. The _interfaces_ field shows all interfaces that adopt this zone.

### Handling services, ports, and protocols

Now focus on the _services_, _ports_, and _protocols_ rows. By default, the firewall will block all ports, services and protocols. Only the listed ones will be allowed.

You can see the allowed services are very basic client services in this case. For example, accessing a shared folder on the network (_samba-client_), to talk to a _DNS_ server or connect to a machine via SSH (the _ssh_ service). You can think of a _service_ as a protocol in combination to a port, for instance the ssh service is using the SSH protocol and, by convention, port 22. By allowing the ssh service, what you’re really doing is allowing incoming connections that use the ssh protocol at default port 22.

Notice, services that have the _client_ word in their name, as a rule of thumb, refer to outgoing connections, i.e. _connections_ that you make with your IP as source going to the outside, as opposed to the SSH **service, for example, that will accept incoming connections (listening to connection coming from outside at you).

You can look up services in the file _/etc/services_. For example if you wish to know what port and protocol these service uses:

```
[dan@localhost ~]$ cat /etc/services | grep ssh
ssh 22/tcp # The Secure Shell (SSH) Protocol
ssh 22/udp # The Secure Shell (SSH) Protocol
```

You can see SSH uses both TCP and UDP port 22. Also, if you wish to see all available services, just use _firewall-cmd ‐‐get-services_.

#### Opening a port

If you want to block a port, service, or protocol, all you have to do if make sure it’s not listed here. By extension, if you want to allow a service, you need add it to your list.

Let’s say you want to open the port _5000_ for _TCP_ ****connection. To do this, run:

```
sudo firewall-cmd --zone=FedorwaWorkstation --permanent --add-port=5000/tcp
```

Notice that you need to specify the zone for which the rule applies. When you add the rule, you also need to specify if it is a _TCP_ or _UDP_ port via as indicated above. The _permanent_ parameter sets the rule to persist even after a system reboot.

Look at the information for your zone again:

```
[dan@localhost ~]$ firewall-cmd --list-all
FedoraWorkstation (active)
target: default
icmp-block-inversion: no
interfaces: enp0s3
sources:
services: dhcpv6-client mdns samba-client ssh
ports: 1025-65535/udp 1025-65535/tcp 5000/tcp
protocols:
masquerade: no
forward-ports:
source-ports:
icmp-blocks:
rich rules:
```

Similarly, if you wish to remove this port from the list, run:

```
sudo firewall-cmd --zone=FedorwaWorkstation --permanent --remove-port=5000/tcp
```

The very same _remove_ (_‐‐remove-protocol_, _‐‐remove-service_) and _add_ (_‐‐add-protocol_, _‐‐add-service_) options are also available for _services_ and _protocols_.

* * *

_Photo by [T. Kaiser][4] on [Unsplash][5]_.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/how-to-manage-network-services-with-firewall-cmd/

作者：[dan01][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/dan01/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/05/services-firewall-cmd-816x345.jpg
[2]: https://fedoramagazine.org/control-the-firewall-at-the-command-line/
[3]: https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol
[4]: https://unsplash.com/@tkaiser?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[5]: https://unsplash.com/s/photos/poke-hole?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText

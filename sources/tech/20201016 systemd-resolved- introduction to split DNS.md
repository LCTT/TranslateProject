[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (systemd-resolved: introduction to split DNS)
[#]: via: (https://fedoramagazine.org/systemd-resolved-introduction-to-split-dns/)
[#]: author: (zbyszek https://fedoramagazine.org/author/zbyszek/)

systemd-resolved: introduction to split DNS
======

![][1]

Photo by [Ruvim Noga][2] on [Unsplash][3]

Fedora 33 switches the default DNS resolver to [systemd-resolved][4]. In simple terms, this means that systemd-resolved will run as a daemon. All programs wanting to translate domain names to network addresses will talk to it. This replaces the current default lookup mechanism where each program individually talks to remote servers and there is no shared cache.

If necessary, systemd-resolved will contact remote DNS servers. systemd-resolved is a “stub resolver”—it doesn’t resolve all names itself (by starting at the root of the DNS hierarchy and going down label by label), but forwards the queries to a remote server.

A single daemon handling name lookups provides significant benefits. The daemon caches answers, which speeds answers for frequently used names. The daemon remembers which servers are non-responsive, while previously each program would have to figure this out on its own after a timeout. Individual programs only talk to the daemon over a local transport and are more isolated from the network. The daemon supports fancy rules which specify which name servers should be used for which domain names—in fact, the rest of this article is about those rules.

### Split DNS

Consider the scenario of a machine that is connected to two semi-trusted networks (wifi and ethernet), and also has a VPN connection to your employer. Each of those three connections has its own network interface in the kernel. And there are multiple name servers: one from a DHCP lease from the wifi hotspot, two specified by the VPN and controlled by your employer, plus some additional manually-configured name servers. _Routing_ is the process of deciding which servers to ask for a given domain name. Do not mistake this with the process of deciding where to send network packets, which is called routing too.

The network interface is king in systemd-resolved. systemd-resolved first picks one or more interfaces which are appropriate for a given name, and then queries one of the name servers attached to that interface. This is known as “split DNS”.

There are two flavors of domains attached to a network interface: _routing domains_ and _search domains_. They both specify that the given domain and any subdomains are appropriate for that interface. Search domains have the additional function that single-label names are suffixed with that search domain before being resolved. For example, a lookup for “server” is treated as a lookup for “server.example.com” if the search domain is “example.com.” In systemd-resolved config files, routing domains are prefixed with the tilde (~) character.

#### Specific example

Now consider a specific example: your VPN interface _tun0_ has a search domain _private.company.com_ and a routing domain _~company.com_. If you ask for _mail.private.company.com_, it is matched by both domains, so this name would be routed to _tun0_.

A request for _[www.company.com][5]_ is matched by the second domain and would also go to _tun0_. If you ask for _www_, (in other words, if you specify a single-label name without any dots), the difference between routing and search domains comes into play. systemd-resolved attempts to combine the single-label name with the search domain and tries to resolve _[www.private.company.com][6]_ on _tun0_.

If you have multiple interfaces with search domains, single-label names are suffixed with all search domains and resolved in parallel. For multi-label names, no suffixing is done; search and routing domains are are used to route the name to the appropriate interface. The longest match wins. When there are multiple matches of the same length on different interfaces, they are resolved in parallel.

A special case is when an interface has a routing domain _~._ (a tilde for a routing domain and a dot for the root DNS label). Such an interface always matches any names, but with the shortest possible length. Any interface with a matching search or routing domain has higher priority, but the interface with _~._ is used for all other names. Finally, if no routing or search domains matched, the name is routed to all interfaces that have at least one name server attached.

### Lookup routing in systemd-resolved

#### Domain routing

This seems fairly complex, partially because of the historic names which are confusing. In actual practice it’s not as complicated as it seems.

To introspect a running system, use the _resolvectl domain_ command. For example:

```
$ resolvectl domain
Global:
Link 4 (wlp4s0): ~.
Link 18 (hub0):
Link 26 (tun0): redhat.com
```

You can see that _www_ would resolve as _[www.redhat.com][7]_. over _tun0_. Anything ending with _redhat.com_ resolves over _tun0_. Everything else would resolve over _wlp4s0_ (the wireless interface). In particular, a multi-label name like _[www.foobar][8]_ would resolve over _wlp4s0_, and most likely fail because there is no _foobar_ top-level domain (yet).

#### Server routing

Now that you know which _interface_ or interfaces should be queried, the _server_ or servers to query are easy to determine. Each interface has one or more name servers configured. systemd-resolved will send queries to the first of those. If the server is offline and the request times out or if the server sends a syntactically-invalid answer (which shouldn’t happen with “normal” queries, but often becomes an issue when DNSSEC is enabled), systemd-resolved switches to the next server on the list. It will use that second server as long as it keeps responding. All servers are used in a round-robin rotation.

To introspect a running system, use the _resolvectl dns_ command:

```
$ resolvectl dns
Global:
Link 4 (wlp4s0): 192.168.1.1 8.8.4.4 8.8.8.8
Link 18 (hub0):
Link 26 (tun0): 10.45.248.15 10.38.5.26
```

When combined with the previous listing, you know that for _[www.redhat.com][7]_, systemd-resolved will query 10.45.248.15, and—if it doesn’t respond—10.38.5.26. For _[www.google.com][9]_, systemd-resolved will query 192.168.1.1 or the two Google servers 8.8.4.4 and 8.8.8.8.

### Differences from nss-dns

Before going further detail, you may ask how this differs from the previous default implementation (nss-dns). With nss-dns there is just one global list of up to three name servers and a global list of search domains (specified as _nameserver_ and _search_ in _/etc/resolv.conf_).

Each name to query is sent to the first name server. If it doesn’t respond, the same query is sent to the second name server, and so on. systemd-resolved implements split-DNS and remembers which servers are currently considered active.

For single-label names, the query is performed with each of the the search domains suffixed. This is the same with systemd-resolved. For multi-label names, a query for the unsuffixed name is performed first, and if that fails, a query for the name suffixed by each of the search domains in turn is performed. systemd-resolved doesn’t do that last step; it only suffixes single-label names.

A second difference is that with _nss-dns_, this module is loaded into each process. The process itself communicates with remote servers and implements the full DNS stack internally. With systemd-resolved, the _nss-resolve_ module is loaded into the process, but it only forwards the query to systemd-resolved over a local transport (D-Bus) and doesn’t do any work itself. The systemd-resolved process is heavily sandboxed using systemd service features.

The third difference is that with systemd-resolved all state is dynamic and can be queried and updated using D-Bus calls. This allows very strong integration with other daemons or graphical interfaces.

### Configuring systemd-resolved

So far, this article talked about servers and the routing of domains without explaining how to configure them. systemd-resolved has a configuration file (_/etc/systemd/resolv.conf_) where you specify name servers with _DNS=_ and routing or search domains with _Domains=_ (routing domains with _~_, search domains without). This corresponds to the _Global:_ lists in the two listings above.

In this article’s examples, both lists are empty. Most of the time configuration is attached to specific interfaces, and “global” configuration is not very useful. Interfaces come and go and it isn’t terribly smart to contact servers on an interface which is down. As soon as you create a VPN connection, you want to use the servers configured for that connection to resolve names, and as soon as the connection goes down, you want to stop.

How does then systemd-resolved acquire the configuration for each interface? This happens dynamically, with the network management service pushing this configuration over D-Bus into systemd-resolved. The default in Fedora is NetworkManager and it has very good integration with systemd-resolved. Alternatives like systemd’s own systemd-networkd implement similar functionality. But the [interface is open][10] and other programs can do the appropriate D-Bus calls.

Alternatively, _resolvectl_ can be used for this (it is just a wrapper around the D-Bus API). Finally, _resolvconf_ provides similar functionality in a form compatible with a tool in Debian with the same name.

#### Scenario: Local connection more trusted than VPN

The important thing is that in the common scenario, systemd-resolved follows the configuration specified by other tools, in particular NetworkManager. So to understand how systemd-resolved names, you need to see what NetworkManager tells it to do. Normally NM will tell systemd-resolved to use the name servers and search domains received in a DHCP lease on some interface. For example, look at the source of configuration for the two listings shown above:

![][11]![][12]

There are two connections: “Parkinson” wifi and “Brno (BRQ)” VPN. In the first panel _DNS:Automatic_ is enabled, which means that the DNS server received as part of the DHCP lease (192.168.1.1) is passed to systemd-resolved. Additionally. 8.8.4.4 and 8.8.8.8 are listed as alternative name servers. This configuration is useful if you want to resolve the names of other machines in the local network, which 192.168.1.1 provides. Unfortunately the hotspot DNS server occasionally gets stuck, and the other two servers provide backup when that happens.

The second panel is similar, but doesn’t provide any special configuration. NetworkManager combines routing domains for a given connection from DHCP, SLAAC RDNSS, and VPN, and finally manual configuration and forward this to systemd-resolved. This is the source of the search domain _redhat.com_ in the listing above.

There is an important difference between the two interfaces though: in the second panel, “Use this connection only for resources on its network” is **checked**. This tells NetworkManager to tell systemd-resolved to only use this interface for names under the search domain received as part of the lease (_Link 26 (tun0): redhat.com_ in the first listing above). In the first panel, this checkbox is **unchecked**, and NetworkManager tells systemd-resolved to use this interface for all other names (_Link 4 (wlp4s0): ~._). This effectively means that the wireless connection is more trusted.

#### Scenario: VPN more trusted than local network

In a different scenario, a VPN would be more trusted than the local network and the domain routing configuration reversed. If a VPN without “Use this connection only for resources on its network” is active, NetworkManager tells systemd-resolved to attach the default routing domain to this interface. After unchecking the checkbox and restarting the VPN connection:

```
$ resolvectl domain
Global:
Link 4 (wlp4s0):
Link 18 (hub0):
Link 28 (tun0): ~. redhat.com
$ resolvectl dns
Global:
Link 4 (wlp4s0):
Link 18 (hub0):
Link 28 (tun0): 10.45.248.15 10.38.5.26
```

Now all domain names are routed to the VPN. The network management daemon controls systemd-resolved and the user controls the network management daemon.

### Additional systemd-resolved functionality

As mentioned before, systemd-resolved provides a common name lookup mechanism for all programs running on the machine. Right now the effect is limited: shared resolver and cache and split DNS (the lookup routing logic described above). systemd-resolved provides additional resolution mechanisms beyond the traditional unicast DNS. These are the local resolution protocols MulticastDNS and LLMNR, and an additional remote transport DNS-over-TLS.

Fedora 33 does not enable MulticastDNS and DNS-over-TLS in systemd-resolved. MulticastDNS is implemented by _nss-mdns4_minimal_ and Avahi. Future Fedora releases may enable these as the upstream project improves support.

Implementing this all in a single daemon which has runtime state allows smart behaviour: DNS-over-TLS may be enabled in opportunistic mode, with automatic fallback to classic DNS if the remote server does not support it. Without the daemon which can contain complex logic and runtime state this would be much harder. When enabled, those additional features will apply to all programs on the system.

There is more to systemd-resolved: in particular LLMNR and DNSSEC, which only received brief mention here. A future article will explore those subjects.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/systemd-resolved-introduction-to-split-dns/

作者：[zbyszek][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/zbyszek/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/10/systemd-resolved2-816x345.jpg
[2]: https://unsplash.com/@ruvimnogaphoto?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/colors?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://www.freedesktop.org/software/systemd/man/systemd-resolved.service.html
[5]: http://www.company.com
[6]: http://www.private.company.com
[7]: http://www.redhat.com
[8]: http://www.foobar
[9]: http://www.google.com
[10]: https://www.freedesktop.org/software/systemd/man/org.freedesktop.resolve1.html
[11]: https://fedoramagazine.org/wp-content/uploads/2020/10/nm-default-network-with-additional-servers.png
[12]: https://fedoramagazine.org/wp-content/uploads/2020/10/nm-vpn-brno.png

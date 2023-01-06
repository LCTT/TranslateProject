[#]: subject: "Portmaster: A GlassWire Alternative for Linux to Monitor & Secure Network Connections"
[#]: via: "https://itsfoss.com/portmaster/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Portmaster: A GlassWire Alternative for Linux to Monitor & Secure Network Connections
======
GlassWire is a popular network monitoring app (with no support for Linux) that helps you track data usage, unusual network activity, malicious access to the network, and more.

I wish it supports Linux, but for now, it only works on Windows and Android.

For Linux, we do not have a full-fledged GUI-based application that helps us [monitor the network in Linux][1].

However, I recently stumbled upon “Portmaster”, an open-source network monitor available for Linux and other platforms. Interestingly, it offers some of the same abilities as seen with Glasswire, with some extras.

Note that it is not exactly a replacement for “GlassWire” but a potential alternative in the making.

Here, I shall share more details about it.

Note

> Safing Portmaster (or simply ‘Portmaster’) is in its early stages of development (Alpha). We feature it here, considering it aims to offer something new to Linux users.
>
> While it worked fine in our quick tests, you can expect issues with it.

### Portmaster: Open-Source App to Monitor Computer’s Network Connection

![portmaster][2]

Portmaster by [Safing][3] is an open-source GUI program available for Windows and Linux.

You can track every connection being made through the applications and services used in your Linux distribution.

It is an entirely free and open-source software that aims to make money using its paid VPN service (**SPN**), which uses onion-encryption (inspired by Tor) to route your connections from through destinations keeping your identity private.

The paid VPN is a part of the tool, but it is also in the alpha testing stage.

Even if you download things from your terminal, it tracks them and provides you the detailed information regarding the domain, IP, encryption status, protocol, and the option to block future connections if needed.

![portmaster network monitor][4]

You also get several abilities to manage the network connections, add filter lists, rules, and some other advanced options.

Portmaster gives you an overview of all the connections per application/service and also lets you view the data associated with an individual application.

![portmaster connection details][5]

It supports numerous useful features that include real-time network monitoring.

### Features of Portmaster

![portmaster firewall network][6]

Portmaster is not just a simple network connection monitor, it also gives you great control to enforce a secure DNS, and filter your network connections for best security.

Some key features include:

* Network monitor overview to sum up connections from the entire system.
* Provide debug information for every app connection history.
* Ability to block a domain from the connection list.
* Retain connection history offline.
* Manage P2P connections.
* Ability to block incoming connections.
* Option to add outgoing rules to manage the network connections easily.
* Add a filter list to easily block connections that you do not want. For instance, preventing NSFW domains to load on your network.
* Choose from different secure DNS servers (Cloudflare as the preferred default)
* Stats about network connections, destinations connected, countries involved, allowed, and blocked connections.

In addition to the mentioned features, you will find fine-grained controls to get prompts for network connections (block/allow), customize your privacy filter, choose a different DNS, inspect DNS requests for the connections made, and so much more.

### Install Portmaster on Linux

Portmaster is officially supported for Ubuntu and Fedora with .deb and .rpm packages available.

You can download the package from its [official website][7] to try on a supported Linux distribution.

The [installation documentation][8] gives you more details about the steps for Arch Linux and other Linux distributions.

You can also explore more about it in its [GitHub page][9].

### Wrapping Up

Portmaster is certainly an interesting addition to the Linux and open-source world. It could become the one tool that everyone uses to monitor, and secure networks while enhancing their online privacy.

The feature set is promising, but whether it can replace proprietary network monitors like “GlassWire” is another story to be unraveled in the future.

*What do you think about Portmaster? Please let me know your thoughts in the comments below.*

--------------------------------------------------------------------------------

via: https://itsfoss.com/portmaster/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/network-speed-monitor-linux/
[2]: https://itsfoss.com/wp-content/uploads/2022/05/portmaster.jpg
[3]: https://safing.io/
[4]: https://itsfoss.com/wp-content/uploads/2022/05/portmaster-network-monitor.jpg
[5]: https://itsfoss.com/wp-content/uploads/2022/05/portmaster-connection-details.jpg
[6]: https://itsfoss.com/wp-content/uploads/2022/05/portmaster-firewall-network.jpg
[7]: https://safing.io/portmaster/#download
[8]: https://docs.safing.io/portmaster/install/linux
[9]: https://github.com/safing/portmaster/

SSH PORT
============================================================

The [SSH][4] (Secure Shell) port is 22\. It is not a co-incidence. This is a story I (Tatu Ylonen) haven't told before.

### THE STORY OF GETTING SSH PORT 22

I wrote the initial version of SSH in Spring 1995\. It was a time when [telnet][5] and [FTP][6] were widely used.

Anyway, I designed SSH to replace both `telnet` (port 23) and `ftp` (port 21). Port 22 was free. It was conveniently between the ports for `telnet` and `ftp`. I figured having that port number might be one of those small things that would give some aura of credibility. But how could I get that port number? I had never allocated one, but I knew somebody who had allocated a port.

The basic process for port allocation was fairly simple at that time. Internet was smaller and we were in very early stages of the Internet boom. Port numbers were allocated by IANA (Internet Assigned Numbers Authority). At the time, that meant an esteemed Internet pioneer called [Jon Postel][7] and [Joyce K. Reynolds][8]. Among other things, Jon had been the editor of such minor protocol standards as IP (RFC 791), ICMP (RFC 792), and TCP (RFC 793). Some of you may have heard of them.

To me Jon felt outright scary, having authored all the main Internet RFCs!

Anyway, just before announcing `ssh-1.0` in July 1995, I sent this e-mail to IANA:

```
From ylo Mon Jul 10 11:45:48 +0300 1995
From: Tatu Ylonen <ylo@cs.hut.fi>
To: Internet Assigned Numbers Authority <iana@isi.edu>
Subject: request for port number
Organization: Helsinki University of Technology, Finland

Dear Sir,

I have written a program to securely log from one machine into another
over an insecure network.  It provides major improvements in security
and functionality over existing telnet and rlogin protocols and
implementations.  In particular, it prevents IP, DNS and routing
spoofing.  My plan is to distribute the software freely on the
Internet and to get it into as wide use as possible.

I would like to get a registered privileged port number for the
software.  The number should preferably be in the range 1-255 so that
it can be used in the WKS field in name servers.

I'll enclose the draft RFC for the protocol below.  The software has
been in local use for several months, and is ready for publication
except for the port number.  If the port number assignment can be
arranged in time, I'd like to publish the software already this week.
I am currently using port number 22 in the beta test.  It would be
great if this number could be used (it is currently shown as
Unassigned in the lists).

The service name for the software is "ssh" (for Secure Shell).

Yours sincerely,

Tatu Ylonen <ylo@cs.hut.fi>

... followed by protocol specification for ssh-1.0
```

The next day, I had an e-mail from Joyce waiting in my mailbox:

```
Date: Mon, 10 Jul 1995 15:35:33 -0700
From: jkrey@ISI.EDU
To: ylo@cs.hut.fi
Subject: Re: request for port number
Cc: iana@ISI.EDU

Tatu,

We have assigned port number 22 to ssh, with you as the point of
contact.

Joyce
```

There we were! SSH port was 22!!!

On July 12, 1995, at 2:32am, I announced a final beta version to my beta testers at Helsinki University of Technology. At 5:23pm I announced ssh-1.0.0 packages to my beta testers. At 5:51pm on July 12, 1995, I sent an announcement about SSH (Secure Shell) to the `cypherpunks@toad.com` mailing list. I also posted it in a few newsgroups, mailing lists, and directly to selected people who had discussed related topics on the Internet.

### CHANGING THE SSH PORT IN THE SERVER

By default, the SSH server still runs in port 22\. However, there are occasions when it is run in a different port. Testing use is one reason. Running multiple configurations on the same host is another. Rarely, it may also be run without root privileges, in which case it must be run in a non-privileged port (i.e., port number >= 1024).

The port number can be configured by changing the `Port 22` directive in [/etc/ssh/sshd_config][9]. It can also be specified using the `-p <port>` option to [sshd][10]. The SSH client and [sftp][11] programs also support the `-p <port>` option.

### CONFIGURING SSH THROUGH FIREWALLS

SSH is one of the few protocols that are frequently permitted through firewalls. Unrestricted outbound SSH is very common, especially in smaller and more technical organizations. Inbound SSH is usually restricted to one or very few servers.

### OUTBOUND SSH

Configuring outbound SSH in a firewall is very easy. If there are restrictions on outgoing traffic at all, just create a rule that allows TCP port 22 to go out. That is all. If you want to restrict the destination addresses, you can also limit the rule to only permit access to your organization's external servers in the cloud, or to a [jump server][12] that guards cloud access.

### BACK-TUNNELING IS A RISK

Unrestricted outbound SSH can, however, be risky. The SSH protocol supports [tunneling][13]. The basic idea is that it is possible to have the SSH server on an external server listen to connections from anywhere, forward those back into the organization, and then make a connection to some Internal server.

This can be very convenient in some environments. Developers and system administrators frequently use it to open a tunnel that they can use to gain remote access from their home or from their laptop when they are travelling.

However, it generally violates policy, takes control away from firewall administrators and the security team, and it violates policy. It can, for example, violate [PCI][14], [HIPAA][15], or [NIST SP 800-53][16]. It can be used by hackers and foreign intelligence agencies to leave backdoors into organizations.

[CryptoAuditor][17] is a product that can control tunneling at a firewall or at the entry point to a group of cloud servers. It works together with [Universal SSH Key Manager][18] to gain access to [host keys][19] and is able to use them to decrypt the SSH sessions at a firewall and block unauthorized forwarding.

### INBOUND SSH ACCESS

For inbound access, there are a few practical alternatives:

*   Configure firewall to forward all connections to port 22 to a particular IP address on the internal network or [DMZ][1]. Run [CryptoAuditor][2] or a jump server at that IP address to control and audit further access into the organization.
*   Use different ports on the firewall to access different servers.
*   Only allow SSH access after you have logged in using a VPN (Virtual Private Network), typically using the [IPsec][3] protocol.

### ENABLING SSH ACCESS VIA IPTABLES

[Iptables][20] is a host firewall built into the Linux kernel. It is typically configured to protect the server by preventing access to any ports that have not been expressly opened.

If `iptables` is enabled on the server, the following commands can be used to permit incoming SSH access. They must be run as root.

```
iptables -A INPUT -p tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --sport 22 -m conntrack --ctstate ESTABLISHED -j ACCEPT
```

If you want to save the rules permanently, on some systems that can be done with the command:

```
service iptables save
```

 ![SSH port at firewall can permit tunneling to banks](https://www.ssh.com/s/ssh-port-firewall-access-banks-950x333-s+ZpRviP.png)

--------------------------------------------------------------------------------

via: https://www.ssh.com/ssh/port

作者：[Tatu Ylonen ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ssh.com/ssh/port
[1]:https://en.wikipedia.org/wiki/DMZ_(computing)
[2]:https://www.ssh.com/products/cryptoauditor/
[3]:https://www.ssh.com/network/ipsec/
[4]:https://www.ssh.com/ssh/
[5]:https://www.ssh.com/ssh/telnet
[6]:https://www.ssh.com/ssh/ftp/
[7]:https://en.wikipedia.org/wiki/Jon_Postel
[8]:https://en.wikipedia.org/wiki/Joyce_K._Reynolds
[9]:https://www.ssh.com/ssh/sshd_config/
[10]:https://www.ssh.com/ssh/sshd/
[11]:https://www.ssh.com/ssh/sftp/
[12]:https://www.ssh.com/iam/jump-server
[13]:https://www.ssh.com/ssh/tunneling/
[14]:https://www.ssh.com/compliance/pci/
[15]:https://www.ssh.com/compliance/hipaa/security-rule
[16]:https://www.ssh.com/compliance/nist-800-53/
[17]:https://www.ssh.com/products/cryptoauditor/
[18]:https://www.ssh.com/products/universal-ssh-key-manager/
[19]:https://www.ssh.com/ssh/host-key
[20]:https://en.wikipedia.org/wiki/Iptables

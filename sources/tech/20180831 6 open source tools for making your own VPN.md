heguangzhi Translating

6 open source tools for making your own VPN
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/vpn_scrabble_networking.jpg?itok=pdsUHw5N)

If you want to try your hand at building your own VPN but aren’t sure where to start, you’ve come to the right place. I’ll compare six of the best free and open source tools to set up and use a VPN on your own server. These VPNs work whether you want to set up a site-to-site VPN for your business or just create a remote access proxy to unblock websites and hide your internet traffic from ISPs.

Which is best depends on your needs and limitations, so take into consideration your own technical expertise, environment, and what you want to achieve with your VPN. In particular, consider the following factors:

  * VPN protocol
  * Number of clients and types of devices
  * Server distro compatibility
  * Technical expertise required



### Algo

[Algo][1] was designed from the bottom up to create VPNs for corporate travelers who need a secure proxy to the internet. It “includes only the minimal software you need,” meaning you sacrifice extensibility for simplicity. Algo is based on StrongSwan but cuts out all the things that you don’t need, which has the added benefit of removing security holes that a novice might otherwise not notice.

As an added bonus, it even blocks ads!

Algo supports only the IKEv2 protocol and Wireguard. Because IKEv2 support is built into most devices these days, it doesn’t require a client app like OpenVPN. Algo can be deployed using Ansible on Ubuntu (the preferred option), Windows, RedHat, CentOS, and FreeBSD. Setup is automated using Ansible, which configures the server based on your answers to a short set of questions. It’s also very easy to tear down and re-deploy on demand.

Algo is probably the easiest and fastest VPN to set up and deploy on this list. It’s extremely tidy and well thought out. If you don’t need any of the more advanced features offered by other tools and just need a secure proxy, it’s a great option. Note that Algo explicitly states it’s not meant for geo-unblocking or evading censorship, and was primarily designed for confidentiality.

### Streisand

[Streisand][2] can be installed on any Ubuntu 16.04 server using a single command; the process takes about 10 minutes. It supports L2TP, OpenConnect, OpenSSH, OpenVPN, Shadowsocks, Stunnel, Tor bridge, and WireGuard. Depending on which protocol you choose, you may need to install a client app.

In many ways, Streisand is similar to Algo, but it offers more protocols and customization. This takes a bit more effort to manage and secure but is also more flexible. Note Streisand does not support IKEv2. I would say Streisand is more effective for bypassing censorship in places like China and Turkey due to its versatility, but Algo is easier and faster to set up.

The setup is automated using Ansible, so there’s not much technical expertise required. You can easily add more users by sending them custom-generated connection instructions, which include an embedded copy of the server’s SSL certificate.

Tearing down Streisand is a quick and painless process, and you can re-deploy on demand.

### OpenVPN

[OpenVPN][3] requires both client and server applications to set up VPN connections using the protocol of the same name. OpenVPN can be tweaked and customized to fit your needs, but it also requires the most technical expertise of the tools covered here. Both remote access and site-to-site configurations are supported; the former is what you’ll need if you plan on using your VPN as a proxy to the internet. Because client apps are required to use OpenVPN on most devices, the end user must keep them updated.

Server-side, you can opt to deploy in the cloud or on your Linux server. Compatible distros include CentOS, Ubuntu, Debian, and openSUSE. Client apps are available for Windows, MacOS, iOS, and Android, and there are unofficial apps for other devices. Enterprises can opt to set up an OpenVPN Access Server, but that’s probably overkill for individuals, who will want the Community Edition.

OpenVPN is relatively easy to configure with static key encryption, but it isn’t all that secure. Instead, I recommend setting it up with [easy-rsa][4], a key management package you can use to set up a public key infrastructure. This allows you to connect multiple devices at a time and protect them with perfect forward secrecy, among other benefits. OpenVPN uses SSL/TLS for encryption, and you can specify DNS servers in your configuration.

OpenVPN can traverse firewalls and NAT firewalls, which means you can use it to bypass gateways and firewalls that might otherwise block the connection. It supports both TCP and UDP transports.

### StrongSwan

You might have come across a few different VPN tools with “Swan” in the name. FreeS/WAN, OpenSwan, LibreSwan, and [strongSwan][5] are all forks of the same project, and the lattermost is my personal favorite. Server-side, strongSwan runs on Linux 2.6, 3.x, and 4x kernels, Android, FreeBSD, macOS, iOS, and Windows.

StrongSwan uses the IKEv2 protocol and IPSec. Compared to OpenVPN, IKEv2 connects much faster while offering comparable speed and security. This is useful if you prefer a protocol that doesn’t require installing an additional app on the client, as most newer devices manufactured today natively support IKEv2, including Windows, MacOS, iOS, and Android.

StrongSwan is not particularly easy to use, and despite decent documentation, it uses a different vocabulary than most other tools, which can be confusing. Its modular design makes it great for enterprises, but that also means it’s not the most streamlined. It’s certainly not as straightforward as Algo or Streisand.

Access control can be based on group memberships using X.509 attribute certificates, a feature unique to strongSwan. It supports EAP authentication methods for integration into other environments like Windows Active Directory. StrongSwan can traverse NAT firewalls.

### SoftEther

[SoftEther][6] started out as a project by a graduate student at the University of Tsukuba in Japan. SoftEther VPN Server and VPN Bridge run on Windows, Linux, OSX, FreeBSD, and Solaris, while the client app works on Windows, Linux, and MacOS. VPN Bridge is mainly for enterprises that need to set up site-to-site VPNs, so individual users will just need the server and client programs to set up remote access.

SoftEther supports the OpenVPN, L2TP, SSTP, and EtherIP protocols, but its own SoftEther protocol claims to be able to be immunized against deep packet inspection thanks to “Ethernet over HTTPS” camouflage. SoftEther also makes a few tweaks to reduce latency and increase throughput. Additionally, SoftEther includes a clone function that allows you to easily transition from OpenVPN to SoftEther.

SoftEther can traverse NAT firewalls and bypass firewalls. On restricted networks that permit only ICMP and DNS packets, you can utilize SoftEther’s VPN over ICMP or VPN over DNS options to penetrate the firewall. SoftEther works with both IPv4 and IPv6.

SoftEther is easier to set up than OpenVPN and strongSwan but is a bit more complicated than Streisand and Algo.

### WireGuard

[WireGuard][7] is the newest tool on this list; it's so new that it’s not even finished yet. That being said, it offers a fast and easy way to deploy a VPN. It aims to improve on IPSec by making it simpler and leaner like SSH.

Like OpenVPN, WireGuard is both a protocol and a software tool used to deploy a VPN that uses said protocol. A key feature is “crypto key routing,” which associates public keys with a list of IP addresses allowed inside the tunnel.

WireGuard is available for Ubuntu, Debian, Fedora, CentOS, MacOS, Windows, and Android. WireGuard works on both IPv4 and IPv6.

WireGuard is much lighter than most other VPN protocols, and it transmits packets only when data needs to be sent.

The developers say WireGuard should not yet be trusted because it hasn’t been fully audited yet, but you’re welcome to give it a spin. It could be the next big thing!

### Homemade VPN vs. commercial VPN

Making your own VPN adds a layer of privacy and security to your internet connection, but if you’re the only one using it, then it would be relatively easy for a well-equipped third party, such as a government agency, to trace activity back to you.

Furthermore, if you plan to use your VPN to unblock geo-locked content, a homemade VPN may not be the best option. Since you’ll only be connecting from a single IP address, your VPN server is fairly easy to block.

Good commercial VPNs don’t have these issues. With a provider like [ExpressVPN][8], you share the server’s IP address with dozens or even hundreds of other users, making it nigh-impossible to track a single user’s activity. You also get a huge range of hundreds or thousands of servers to choose from, so if one has been blacklisted, you can just switch to another.

The tradeoff of a commercial VPN, however, is that you must trust the provider not to snoop on your internet traffic. Be sure to choose a reputable provider with a clear no-logs policy.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/open-source-tools-vpn

作者：[Paul Bischoff][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: 
[1]: https://blog.trailofbits.com/2016/12/12/meet-algo-the-vpn-that-works/
[2]: https://github.com/StreisandEffect/streisand
[3]: https://openvpn.net/
[4]: https://github.com/OpenVPN/easy-rsa
[5]: https://www.strongswan.org/
[6]: https://www.softether.org/
[7]: https://www.wireguard.com/
[8]: https://www.comparitech.com/vpn/reviews/expressvpn/

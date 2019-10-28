[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Build a virtual private network with Wireguard)
[#]: via: (https://fedoramagazine.org/build-a-virtual-private-network-with-wireguard/)
[#]: author: (Peter Maynard https://fedoramagazine.org/author/pmaynard/)

Build a virtual private network with Wireguard
======

![][1]

Wireguard is a new VPN designed as a replacement for IPSec and OpenVPN. Its design goal is to be simple and secure, and it takes advantage of recent technologies such as the [Noise Protocol Framework][2]. Some consider Wireguard’s ease of configuration akin to OpenSSH. This article shows you how to deploy and use it.

It is currently in active development, so it might not be the best for production machines. However, Wireguard is under consideration to be included into the Linux kernel. The design has been [formally verified][3],* and proven to be secure against a number of threats.

When deploying Wireguard, keep your Fedora Linux system updated to the most recent version, since Wireguard does not have a stable release cadence.

### Set the timezone

To check and set your timezone, first display current time information:

```
timedatectl
```

Then if needed, set the correct timezone, for example to Europe/London.

```
timedatectl set-timezone Europe/London
```

Note that your system’s real time clock (RTC) may continue to be set to UTC or another timezone.

### Install Wireguard

To install, enable the COPR repository for the project and then install with _dnf_, [using][4] _[sudo][4]_:

```
$ sudo dnf copr enable jdoss/wireguard
$ sudo dnf install wireguard-dkms wireguard-tools
```

Once installed, two new commands become available, along with support for systemd:

  * **wg**: Configuration of wireguard interfaces
  * **wg-quick** Bringing up the VPN tunnels



Create the configuration directory for Wireguard, and apply a umask of 077. A umask of 077 allows read, write, and execute permission for the file’s owner (root), but prohibits read, write, and execute permission for everyone else.

```
mkdir /etc/wireguard
cd /etc/wireguard
umask 077
```

### Generate Key Pairs

Generate the private key, then derive the public key from it.

```
$ wg genkey > /etc/wireguard/privkey
$ wg pubkey < /etc/wireguard/privkey > /etc/wireguard/publickey
```

Alternatively, this can be done in one go:

```
wg genkey | tee /etc/wireguard/privatekey | wg pubkey > /etc/wireguard/publickey
```

There is a [vanity address generator][5], which might be of interest to some. You can also generate a pre-shared key to provide a level of quantum protection:

```
wg genpsk > psk
```

This will be the same value for both the server and client, so you only need to run the command once.

### Configure Wireguard server and client

Both the client and server have an _[Interface]_ option to specify the IP address assigned to the interface, along with the private keys.

Each peer (server and client) has a _[Peer]_ section containing its respective _PublicKey_, along with the _PresharedKey_. Additionally, this block can list allowed IP addresses which can use the tunnel.

#### Server

A firewall rule is added when the interface is brought up, along with enabling masquerading. Make sure to note the _/24_ IPv4 address range within Interface, which differs from the client. Edit the _/etc/wireguard/wg0.conf_ file as follows, using the IP address for your server for _Address_, and the client IP address in _AllowedIPs_.

```
[Interface]
Address    = 192.168.2.1/24, fd00:7::1/48
PrivateKey = <SERVER_PRIVATE_KEY>
PostUp     = firewall-cmd --zone=public --add-port 51820/udp && firewall-cmd --zone=public --add-masquerade
PostDown   = firewall-cmd --zone=public --remove-port 51820/udp && firewall-cmd --zone=public --remove-masquerade
ListenPort = 51820

[Peer]
PublicKey    = <CLIENT_PUBLIC_KEY>
PresharedKey = LpI+UivLx1ZqbzjyRaWR2rWN20tbBsOroNdNnjKLMQ=
AllowedIPs   = 192.168.2.2/32, fd00:7::2/48
```

Allow forwarding of IP packets by adding the following to _/etc/sysctl.conf_:

```
net.ipv4.ip_forward=1
net.ipv6.conf.all.forwarding=1
```

Load the new settings:

```
$ sysctl -p
```

Forwarding will be preserved after a reboot.

#### Client

The client is very similar to the server config, but has an optional additional entry of _PersistentKeepalive_ set to 30 seconds. This is to prevent NAT from causing issues, and depending on your setup might not be needed. Setting AllowedIPs to 0.0.0.0/0 will forward all traffic over the tunnel. Edit the client’s _/etc/wireguard/wg0.conf_ file as follows, using your client’s IP address for _Address_ and the server IP address at the _Endpoint_.

```
[Interface]
Address    = 192.168.2.2/32, fd00:7::2/48
PrivateKey = <CLIENT_PRIVATE_KEY>

[Peer]
PublicKey    = <SERVER_PUBLIC_KEY>
PresharedKey = LpI+UivLx1ZqbzjyRaWR2rWN20tbBsOroNdNnjWKLM=
AllowedIPs   = 0.0.0.0/0, ::/0

Endpoint     = <SERVER_IP>:51820
PersistentKeepalive = 30
```

### Test Wireguard

Start and check the status of the tunnel on both the server and client:

```
$ systemctl start wg-quick@wg0
$ systemctl status wg-quick@wg0
```

To test the connections, try the following:

```
ping google.com
ping6 ipv6.google.com
```

Then check external IP addresses:

```
dig +short myip.opendns.com @resolver1.opendns.com
dig +short -6 myip.opendns.com aaaa @resolver1.ipv6-sandbox.opendns.com
```

* * *

* _“Formally verified,” in this sense, means that the design has been proved to have mathematically correct messages and key secrecy, forward secrecy, mutual authentication, session uniqueness, channel binding, and resistance against replay, key compromise impersonation, and denial of server attacks._

* * *

_Photo by _[_Black Zheng_][6]_ on [Unsplash][6]_.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/build-a-virtual-private-network-with-wireguard/

作者：[Peter Maynard][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/pmaynard/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/10/wireguard-816x345.jpg
[2]: http://www.noiseprotocol.org/
[3]: https://hal.inria.fr/hal-02100345
[4]: https://fedoramagazine.org/howto-use-sudo/
[5]: https://github.com/warner/wireguard-vanity-address
[6]: https://unsplash.com/@blackzheng?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText

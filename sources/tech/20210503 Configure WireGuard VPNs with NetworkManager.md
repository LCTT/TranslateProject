[#]: subject: (Configure WireGuard VPNs with NetworkManager)
[#]: via: (https://fedoramagazine.org/configure-wireguard-vpns-with-networkmanager/)
[#]: author: (Maurizio Garcia https://fedoramagazine.org/author/malgnuz/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Configure WireGuard VPNs with NetworkManager
======

![wireguard][1]

Photo excerpted from [Thin Ethernet Ramble (TS 10:38)][2] by [High Treason][3]

Virtual Private Networks (VPNs) are used extensively. Nowadays there are different solutions available which allow users access to any kind of resource while maintaining their confidentiality and privacy.

Lately, one of the most commonly used VPN protocols is WireGuard because of its simplicity, speed and the security it offers. WireGuard’s implementation started in the Linux kernel but currently it is available in other platforms such as iOS and Android among others.

WireGuard uses UDP as its transport protocol and it bases the communication between peers upon Critokey Routing (CKR). Each peer, either server or client, has a pair of keys (public and private) and there is a link between public keys and allowed IPs to communicate with. For further information about WireGuard please visit its [page][4].

This article describes how to set up WireGuard between two peers: PeerA and PeerB. Both nodes are running Fedora Linux and both are using NetworkManager for a persistent configuration.

## **WireGuard set up and networking configuration**

You are only three steps away from having a persistent VPN connection between PeerA and PeerB:

  1. Install the required packages.
  2. Generate key pairs.
  3. Configure the WireGuard interfaces.



### **Installation**

Install the _wireguard-tools_ package on both peers (PeerA and PeerB):

```
$ sudo -i
# dnf -y install wireguard-tools
```

This package is available in the Fedora Linux updates repository. It creates a configuration directory at _/etc/wireguard/_. This is where you will create the keys and the interface configuration file.

### **Generate the key pairs**

Next, use the _wg_ utility to generate both public and private keys on each node:

```
# cd /etc/wireguard
# wg genkey | tee privatekey | wg pubkey > publickey
```

### **Configure the WireGuard interface on PeerA**

WireGuard interfaces use the names: _wg0_, _wg1_ and so on. Create the configuration for the WireGuard interface. For this, you need the following items:

  * The IP address and MASK you want to configure in the PeerA node.
  * The UDP port where this peer listens.
  * PeerA’s private key.



```
# cat << EOF > /etc/wireguard/wg0.conf
[Interface]
Address = 172.16.1.254/24
SaveConfig = true
ListenPort = 60001
PrivateKey = mAoO2RxlqRvCZZoHhUDiW3+zAazcZoELrYbgl+TpPEc=

[Peer]
PublicKey = IOePXA9igeRqzCSzw4dhpl4+6l/NiQvkDSAnj5LtShw=
AllowedIPs = 172.16.1.2/32
EOF
```

Allow UDP traffic through the port on which this peer will listen:

```
# firewall-cmd --add-port=60001/udp --permanent --zone=public
# firewall-cmd --reload
success
```

Finally, import the interface profile into NetworkManager. As a result, the WireGuard interface will persist after reboots.

```
# nmcli con import type wireguard file /etc/wireguard/wg0.conf
Connection 'wg0' (21d939af-9e55-4df2-bacf-a13a4a488377) successfully added.
```

Verify the status of device _wg0_:

```
# wg
interface: wg0
  public key: FEPcisOjLaZsJbYSxb0CI5pvbXwIB3BCjMUPxuaLrH8=
  private key: (hidden)
  listening port: 60001

peer: IOePXA9igeRqzCSzw4dhpl4+6l/NiQvkDSAnj5LtShw=
  allowed ips: 172.16.1.2/32

# nmcli -p device show wg0

===============================================================================
                             Device details (wg0)
===============================================================================
GENERAL.DEVICE:                         wg0
-------------------------------------------------------------------------------
GENERAL.TYPE:                           wireguard
-------------------------------------------------------------------------------
GENERAL.HWADDR:                         (unknown)
-------------------------------------------------------------------------------
GENERAL.MTU:                            1420
-------------------------------------------------------------------------------
GENERAL.STATE:                          100 (connected)
-------------------------------------------------------------------------------
GENERAL.CONNECTION:                     wg0
-------------------------------------------------------------------------------
GENERAL.CON-PATH:                       /org/freedesktop/NetworkManager/ActiveC>
-------------------------------------------------------------------------------
IP4.ADDRESS[1]:                         172.16.1.254/24
IP4.GATEWAY:                            --
IP4.ROUTE[1]:                           dst = 172.16.1.0/24, nh = 0.0.0.0, mt =>
-------------------------------------------------------------------------------
IP6.GATEWAY:                            --
-------------------------------------------------------------------------------
```

The above output shows that interface _wg0_ is connected. It is now able to communicate with one peer whose VPN IP address is 172.16.1.2.

### Configure the WireGuard interface in PeerB

It is time to create the configuration file for the _wg0_ interface on the second peer. Make sure you have the following:

  * The IP address and MASK to set on PeerB.
  * The PeerB’s private key.
  * The PeerA’s public key.
  * The PeerA’s IP address or hostname and the UDP port on which it is listening for WireGuard traffic.



```
# cat << EOF > /etc/wireguard/wg0.conf
[Interface]
Address = 172.16.1.2
SaveConfig = true
PrivateKey = UBiF85o7937fBK84c2qLFQwEr6eDhLSJsb5SAq1lF3c=

[Peer]
PublicKey = FEPcisOjLaZsJbYSxb0CI5pvbXwIB3BCjMUPxuaLrH8=
AllowedIPs = 172.16.1.254/32
Endpoint = peera.example.com:60001
EOF
```

The last step is about importing the interface profile into NetworkManager. As I mentioned before, this allows the WireGuard interface to have a persistent configuration after reboots.

```
# nmcli con import type wireguard file /etc/wireguard/wg0.conf
Connection 'wg0' (39bdaba7-8d91-4334-bc8f-85fa978777d8) successfully added.
```

Verify the status of device _wg0_:

```
# wg
interface: wg0
  public key: IOePXA9igeRqzCSzw4dhpl4+6l/NiQvkDSAnj5LtShw=
  private key: (hidden)
  listening port: 47749

peer: FEPcisOjLaZsJbYSxb0CI5pvbXwIB3BCjMUPxuaLrH8=
  endpoint: 192.168.124.230:60001
  allowed ips: 172.16.1.254/32

# nmcli -p device show wg0

===============================================================================
                             Device details (wg0)
===============================================================================
GENERAL.DEVICE:                         wg0
-------------------------------------------------------------------------------
GENERAL.TYPE:                           wireguard
-------------------------------------------------------------------------------
GENERAL.HWADDR:                         (unknown)
-------------------------------------------------------------------------------
GENERAL.MTU:                            1420
-------------------------------------------------------------------------------
GENERAL.STATE:                          100 (connected)
-------------------------------------------------------------------------------
GENERAL.CONNECTION:                     wg0
-------------------------------------------------------------------------------
GENERAL.CON-PATH:                       /org/freedesktop/NetworkManager/ActiveC>
-------------------------------------------------------------------------------
IP4.ADDRESS[1]:                         172.16.1.2/32
IP4.GATEWAY:                            --
-------------------------------------------------------------------------------
IP6.GATEWAY:                            --
-------------------------------------------------------------------------------
```

The above output shows that interface _wg0_ is connected. It is now able to communicate with one peer whose VPN IP address is 172.16.1.254.

### **Verify connectivity between peers**

After executing the procedure described earlier both peers can communicate to each other through the VPN connection as demonstrated in the following ICMP test:

```
[root@peerb ~]# ping 172.16.1.254 -c 4
PING 172.16.1.254 (172.16.1.254) 56(84) bytes of data.
64 bytes from 172.16.1.254: icmp_seq=1 ttl=64 time=0.566 ms
64 bytes from 172.16.1.254: icmp_seq=2 ttl=64 time=1.33 ms
64 bytes from 172.16.1.254: icmp_seq=3 ttl=64 time=1.67 ms
64 bytes from 172.16.1.254: icmp_seq=4 ttl=64 time=1.47 ms
```

In this scenario, if you capture UDP traffic on port 60001 on PeerA you will see the communication relying on WireGuard protocol and the encrypted data:

![Capture of UDP traffic between peers relying on WireGuard protocol][5]

## Conclusion

Virtual Private Networks (VPNs) are very common. Among a wide variety of protocols and tools for deploying a VPN, WireGuard is a simple, lightweight and secure choice. It allows secure point-to-point connections between peers based on CryptoKey routing and the procedure is very straight-forward. In addition, NetworkManager supports WireGuard interfaces allowing persistent configurations after reboots.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/configure-wireguard-vpns-with-networkmanager/

作者：[Maurizio Garcia][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/malgnuz/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/05/wireguard-nm-816x345.jpg
[2]: https://youtu.be/0eiXMGfZc60?t=633
[3]: https://www.youtube.com/c/HighTreason610/featured
[4]: https://www.wireguard.com/
[5]: https://fedoramagazine.org/wp-content/uploads/2021/04/capture-1024x601.png

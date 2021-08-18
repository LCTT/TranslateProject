[#]: subject: "Install OpenVPN on your Linux PC"
[#]: via: "https://opensource.com/article/21/7/openvpn-router"
[#]: author: "D. Greg Scott https://opensource.com/users/greg-scott"
[#]: collector: "lujun9972"
[#]: translator: "perfiffer"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Install OpenVPN on your Linux PC
======
After setting up a VPN server, the next step is installing and
configuring OpenVPN.
![Open ethernet cords.][1]

OpenVPN creates an encrypted tunnel between two points, preventing a third party from accessing your network traffic. By setting up your virtual private network (VPN) server, you become your own VPN provider. Many popular VPN services already use [OpenVPN][2], so why tie your connection to a specific provider when you can have complete control?

The [first article][3] in this series demonstrated how to set up and configure a Linux PC to serve as your OpenVPN server. It also discussed how to configure your router so that you can reach your VPN server from an outside network.

This second article demonstrates how to install the OpenVPN server software using steps customized from the [OpenVPN wiki][4].

### Install OpenVPN

First, install OpenVPN and the `easy-rsa` application (to help you set up authentication on your server) using your package manager. This example uses Fedora Linux; if you've chosen something different, use the appropriate command for your distribution:


```
`$ sudo dnf install openvpn easy-rsa`
```

This creates some empty directories:

  * `/etc/openvpn`
  * `/etc/openvpn/client`
  * `/etc/openvpn/server`



If these aren't created during installation, create them manually.

### Set up authentication

OpenVPN depends on the `easy-rsa` scripts and should have its own copy of them. Copy the `easy-rsa` scripts and files:


```
$ sudo mkdir /etc/openvpn/easy-rsa
$ sudo cp -rai /usr/share/easy-rsa/3/* \
/etc/openvpn/easy-rsa/
```

Authentication is important, and OpenVPN takes it very seriously. The theory is that if Alice needs to access private information inside Bob's company, it's vital that Bob makes sure Alice really is Alice. Likewise, Alice must make sure that Bob is really Bob. We call this mutual authentication.

Today's best practice checks an attribute from two of three possible factors:

  * Something you have
  * Something you know
  * Something you are



There are lots of choices. This OpenVPN setup uses:

  * **Certificates:** Something both the client and server have
  * **Certificate password:** Something the people know



Alice and Bob need help to mutually authenticate. Since they both trust Cathy, Cathy takes on a role called **certificate authority** (CA). Cathy attests that Alice and Bob both are who they claim to be. Because Alice and Bob both trust Cathy, now they also trust each other.

But what convinces Cathy that Alice and Bob really are Alice and Bob? Cathy's reputation in the community depends on getting this right, and so if she wants Danielle, Evan, Fiona, Greg, and others to also trust her, she will rigorously test Alice and Bob's claims. After Alice and Bob convince Cathy that they really are Alice and Bob, Cathy signs certificates for them to share with each other and the world.

How do Alice and Bob know Cathy—and not somebody impersonating her—signed the certificates? They use a technology called **public key cryptography:**

  * Find a cryptography algorithm that encrypts with one key and decrypts with another.
  * Declare one key private and share the other key with the public.
  * Cathy shares her public key and a clear-text copy of her signature with the world.
  * Cathy encrypts her signature with her private key. Anyone can decrypt it with her public key.
  * If Cathy's decrypted signature matches the clear-text copy, Alice and Bob can trust Cathy really did sign it.



You use this same technology every time you buy goods and services online.

### Implement authentication

OpenVPN's [documentation][5] suggests setting up a CA on a separate system or at least a separate directory on the OpenVPN server. The documentation also suggests generating server and client certificates from the server and clients. Because this is a simple setup, you can use the OpenVPN server as its own CA and put the certificates and keys into specified directories on the server.

Generate certificates from the server and copy them to each client as part of client setup.

This implementation uses self-signed certificates. This works because the server trusts itself, and clients trust the server. Therefore, the server is the best CA to sign certificates.

From the OpenVPN server, set up the CA:


```
$ sudo mkdir /etc/openvpn/ca
$ cd /etc/openvpn/ca
$ sudo /etc/openvpn/easy-rsa/easyrsa init-pki
$ sudo /etc/openvpn/easy-rsa/easyrsa build-ca
```

Use an easy-to-remember but hard-to-guess passphrase.

Set up the server key pair and certificate request:


```
$ cd /etc/openvpn/server
$ sudo /etc/openvpn/easy-rsa/easyrsa init-pki
$ sudo /etc/openvpn/easy-rsa/easyrsa gen-req OVPNserver2020 nopass
```

In this example, `OVPNServer2020` is whatever hostname you assigned your OpenVPN server in the first article in this series.

### Generate and sign certs

Now you must send a server request to the CA and generate and sign the server certificate.

This step essentially copies the request file from `/etc/openvpn/server/pki/reqs/OVPNserver2020.req` to `/etc/openvpn/ca/pki/reqs/OVPNserver2020.req` to prepare it for review and signing:


```
$ cd /etc/openvpn/ca
$ sudo /etc/openvpn/easy-rsa/easyrsa \
import-req /etc/openvpn/server/pki/reqs/OVPNserver2020.req OVPNserver2020
```

### Review and sign the request

You've generated a request, so now you must review and sign the certs:


```
$ cd /etc/openvpn/ca
$ sudo /etc/openvpn/easy-rsa/easyrsa \
show-req OVPNserver2020
```

Sign as the server:


```
$ cd /etc/openvpn/ca
$ sudo /etc/openvpn/easy-rsa/easyrsa \
sign-req server OVPNserver2020
```

Put a copy of the server and CA certificates where they belong for the config file to pick them up:


```
$ sudo cp /etc/openvpn/ca/pki/issued/OVPNserver2020.crt \
/etc/openvpn/server/pki/
$ sudo cp /etc/openvpn/ca/pki/ca.crt \
/etc/openvpn/server/pki/
```

Next, generate [Diffie-Hellman][6] parameters so that clients and the server can exchange session keys:


```
$ cd /etc/openvpn/server
$ sudo /etc/openvpn/easy-rsa/easyrsa gen-dh
```

### Almost there

The next article in this series will demonstrate how to configure and start the OpenVPN server you just built.

* * *

_This article is based on D. Greg Scott's [blog][7] and is reused with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/openvpn-router

作者：[D. Greg Scott][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/greg-scott
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/openwires_fromRHT_520_0612LL.png?itok=PqZi55Ab (Open ethernet cords.)
[2]: https://openvpn.net/
[3]: https://opensource.com/article/21/7/vpn-openvpn-part-1
[4]: https://community.openvpn.net/openvpn/wiki
[5]: https://openvpn.net/community-resources/
[6]: https://en.wikipedia.org/wiki/Diffie%E2%80%93Hellman_key_exchange
[7]: https://www.dgregscott.com/how-to-build-a-vpn-in-four-easy-steps-without-spending-one-penny/

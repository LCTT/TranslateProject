Install Strongswan - A Tool to Setup IPsec Based VPN in Linux
================================================================================
IPsec is a standard which provides the security at network layer. It consist of authentication header (AH) and encapsulating security payload (ESP) components. AH provides the packet Integrity and confidentiality is provided by ESP component . IPsec ensures the following security features at network layer.

- Confidentiality
- Integrity of packet
- Source Non. Repudiation
- Replay attack protection

[Strongswan][1] is an open source implementation of IPsec protocol and Strongswan stands for Strong Secure WAN (StrongS/WAN). It supports the both version of automatic keying exchange in IPsec VPN (Internet keying Exchange (IKE) V1 & V2).

Strongswan basically provides the automatic keying sharing between two nodes/gateway of the VPN and after that it uses the Linux Kernel implementation of IPsec (AH & ESP). Key shared using IKE mechanism is further used in the ESP for the encryption of data. In IKE phase, strongswan uses the encryption algorithms (AES,SHA etc) of OpenSSL and other crypto libraries. However, ESP component of IPsec uses the security algorithm which are implemented in the Linux Kernel. The main features of Strongswan are given below.

- 509 certificates or pre-shared keys based Authentication
- Support of IKEv1 and IKEv2 key exchange protocols
- Optional built-in integrity and crypto tests for plugins and libraries
- Support of elliptic curve DH groups and ECDSA certificates
- Storage of RSA private keys and certificates on a smartcard.

It can be used in the client / server (road warrior) and gateway to gateway scenarios.

### How to Install ###

Almost all Linux distro’s, supports the binary package of Strongswan. In this tutorial, we will install the strongswan from binary package and also the compilation of strongswan source code with desirable features.

### Using binary package ###

Strongswan can be installed using following command on Ubuntu 14.04 LTS .

    $sudo aptitude install strongswan

![Installation of strongswan](http://blog.linoxide.com/wp-content/uploads/2014/12/strongswan-binary.png)

The global configuration (strongswan.conf) file and ipsec configuration (ipsec.conf/ipsec.secrets) files of strongswan are under /etc/ directory.

### Pre-requisite for strongswan source compilation & installation ###

- GMP (Mathematical/Precision Library used by strongswan)
- OpenSSL (Crypto Algorithms from this library)
- PKCS (1,7,8,11,12)(Certificate encoding and smart card integration with Strongswan )

#### Procedure ####

**1)** Go to /usr/src/ directory using following command in the terminal.

    $cd /usr/src

**2)** Download the source code from strongswan site suing following command

     $sudo wget http://download.strongswan.org/strongswan-5.2.1.tar.gz

(strongswan-5.2.1.tar.gz is the latest version.)

![Downloading software](http://blog.linoxide.com/wp-content/uploads/2014/12/download_strongswan.png)

**3)** Extract the downloaded software and go inside it using following command.

    $sudo tar –xvzf strongswan-5.2.1.tar.gz; cd strongswan-5.2.1

**4)** Configure the strongswan as per desired options using configure command.

    ./configure --prefix=/usr/local -–enable-pkcs11 -–enable-openssl

![checking packages for strongswan](http://blog.linoxide.com/wp-content/uploads/2014/12/strongswan-configure.png)

If GMP library is not installed, then configure script will generate following error.

![GMP library error](http://blog.linoxide.com/wp-content/uploads/2014/12/gmp-error.png)

Therefore, first of all, install the GMP library using following command and then run the configure script.

![gmp installation](http://blog.linoxide.com/wp-content/uploads/2014/12/gmp-installation1.png)

However, if GMP is already installed and still above error exists then create soft link of libgmp.so library at /usr/lib , /lib/, /usr/lib/x86_64-linux-gnu/ paths in Ubuntu using following command.

    $ sudo ln -s /usr/lib/x86_64-linux-gnu/libgmp.so.10.1.3 /usr/lib/x86_64-linux-gnu/libgmp.so

![softlink of libgmp.so library](http://blog.linoxide.com/wp-content/uploads/2014/12/softlink.png)

After the creation of libgmp.so softlink, again run the ./configure script and it may find the gmp library. However, it may generate another error of gmp header file which is shown the following figure.

![GMP header file issu](http://blog.linoxide.com/wp-content/uploads/2014/12/gmp-header.png)

Install the libgmp-dev package using following command for the solution of above error.

    $sudo aptitude install libgmp-dev

![Installation of Development library of GMP](http://blog.linoxide.com/wp-content/uploads/2014/12/gmp-dev.png)

After installation of development package of gmp library, again run the configure script and if it does not produce any error, then the following output will be displayed.

![Output of Configure scirpt](http://blog.linoxide.com/wp-content/uploads/2014/12/successful-run.png)

Type the following commands for the compilation and installation of strongswan.

    $ sudo make ; sudo make install 

After the installation of strongswan , the Global configuration (strongswan.conf) and ipsec policy/secret configuration files (ipsec.conf/ipsec.secretes) are placed in **/usr/local/etc** directory.

Strongswan can be used as tunnel or transport mode depends on our security need. It provides well known site-2-site and road warrior VPNs. It can be use easily with Cisco,Juniper devices.

--------------------------------------------------------------------------------

via: http://linoxide.com/security/install-strongswan/

作者：[nido][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/naveeda/
[1]:https://www.strongswan.org/
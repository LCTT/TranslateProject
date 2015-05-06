Linux FAQs with Answers--How to install Shrew Soft IPsec VPN client on Linux
================================================================================
> **Question**: I need to connect to an IPSec VPN gateway. For that, I'm trying to use Shrew Soft VPN client, which is available for free. How can I install Shrew Soft VPN client on [insert your Linux distro]? 

There are many commercial VPN gateways available, which come with their own proprietary VPN client software. While there are also open-source VPN server/client alternatives, they are typically lacking in sophisticated IPsec support, such as Internet Key Exchange (IKE) which is a standard IPsec protocol used to secure VPN key exchange and authentication. Shrew Soft VPN is a free IPsec VPN client supporting a number of authentication methods, key exchange, encryption and firewall traversal options.

Here is how you can install Shrew Soft VPN client on Linux platforms.

First, download its source code from the [official website][1].

### Install Shrew VPN Client on Debian, Ubuntu or Linux Mint ###

Shrew Soft VPN client GUI requires Qt 4.x. So you will need to install its development files as part of dependencies.

    $ sudo apt-get install cmake libqt4-core libqt4-dev libqt4-gui libedit-dev libssl-dev checkinstall flex bison
    $ wget https://www.shrew.net/download/ike/ike-2.2.1-release.tbz2
    $ tar xvfvj ike-2.2.1-release.tbz2
    $ cd ike
    $ cmake -DCMAKE_INSTALL_PREFIX=/usr -DQTGUI=YES -DETCDIR=/etc -DNATT=YES .
    $ make
    $ sudo make install
    $ cd /etc/
    $ sudo mv iked.conf.sample iked.conf 

### Install Shrew VPN Client on CentOS, Fedora or RHEL ###

Similar to Debian based systems, you will need to install a number of dependencies including Qt4 before compiling it.

    $ sudo yum install qt-devel cmake gcc-c++ openssl-devel libedit-devel flex bison
    $ wget https://www.shrew.net/download/ike/ike-2.2.1-release.tbz2
    $ tar xvfvj ike-2.2.1-release.tbz2
    $ cd ike
    $ cmake -DCMAKE_INSTALL_PREFIX=/usr -DQTGUI=YES -DETCDIR=/etc -DNATT=YES .
    $ make
    $ sudo make install
    $ cd /etc/
    $ sudo mv iked.conf.sample iked.conf 

On Red Hat based systems, one last step is to open /etc/ld.so.conf with a text editor, and add the following line.

    $ sudo vi /etc/ld.so.conf

----------

    include /usr/lib/

Reload run-time bindings of shared libraries to incorporate newly installed shared libraries:

    $ sudo ldconfig 

### Launch Shrew VPN Client ###

First launch IKE daemon (iked). This daemon speaks the IKE protocol to communicate with a remote host over IPSec as a VPN client.

    $ sudo iked 

![](https://farm9.staticflickr.com/8685/17175688940_59c2db64c9_b.jpg)

Now start qikea which is an IPsec VPN client front end. This GUI application allows you to manage remote site configurations and to initiate VPN connections.

![](https://farm8.staticflickr.com/7750/16742992713_eed7f97939_b.jpg)

To create a new VPN configuration, click on "Add" button, and fill out VPN site configuration. Once you create a configuration, you can initiate a VPN connection simply by clicking on the configuration.

![](https://farm8.staticflickr.com/7725/17337297056_3d38dc2180_b.jpg)

### Troubleshooting ###

1. I am getting the following error while running iked.

    iked: error while loading shared libraries: libss_ike.so.2.2.1: cannot open shared object file: No such file or directory

To solve this problem, you need to update the dynamic linker to incorporate libss_ike library. For that, add to /etc/ld.so.conf the path where the library is located (e.g., /usr/lib), and then run ldconfig command.

    $ sudo ldconfig

Verify that libss_ike is added to the library path:

    $ ldconfig -p | grep ike 

----------

    libss_ike.so.2.2.1 (libc6,x86-64) => /lib/libss_ike.so.2.2.1
	libss_ike.so (libc6,x86-64) => /lib/libss_ike.so

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/install-shrew-soft-ipsec-vpn-client-linux.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
[1]:https://www.shrew.net/download/ike
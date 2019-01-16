[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Turn a Raspberry Pi 3B+ into a PriTunl VPN)
[#]: via: (https://opensource.com/article/19/1/pritunl-vpn-raspberry-pi)
[#]: author: (Stephen Bancroft https://opensource.com/users/stevereaver)

Turn a Raspberry Pi 3B+ into a PriTunl VPN
======
PriTunl is a VPN solution for small businesses and individuals who want private access to their network.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/life-raspberrypi_0.png?itok=Kczz87J2)

[PriTunl][1] is a fantastic VPN terminator solution that's perfect for small businesses and individuals who want a quick and simple way to access their network privately. It's open source, and the basic free version is more than enough to get you started and cover most simple use cases. There is also a paid enterprise version with advanced features like Active Directory integration.

### Special considerations on Raspberry Pi 3B+

PriTunl is generally simple to install, but this project—turning a Raspberry Pi 3B+ into a PriTunl VPN appliance—adds some complexity. For one thing, PriTunl is supplied only as AMD64 and i386 binaries, but the 3B+ uses ARM architecture. This means you must compile your own binaries from source. That's nothing to be afraid of; it can be as simple as copying and pasting a few commands and watching the terminal for a short while.

Another problem: PriTunl seems to require 64-bit architecture. I found this out when I got errors when I tried to compile PriTunl on my Raspberry Pi's 32-bit operating system. Fortunately, Ubuntu's beta version of 18.04 for ARM64 boots on the Raspberry Pi 3B+.

Also, the Raspberry Pi 3B+ uses a different bootloader from other Raspberry Pi models. This required a complicated set of steps to install and update the necessary files to get a Raspberry Pi 3B+ to boot.

### Installing PriTunl

You can overcome these problems by installing a 64-bit operating system on the Raspberry Pi 3B+ before installing PriTunl. I'll assume you have basic knowledge of how to get around the Linux command line and a Raspberry Pi.

Start by opening a terminal and downloading the Ubuntu 18.04 ARM64 beta release by entering:

```
$ wget http://cdimage.ubuntu.com/releases/18.04/beta/ubuntu-18.04-beta-preinstalled-server-arm64+raspi3.img.xz
```

Unpack the download:

```
$ xz -d ubuntu-18.04-beta-preinstalled-server-arm64+raspi3.xz
```

Insert the SD card you'll use with your Raspberry Pi into your desktop or laptop computer. Your computer will assign the SD card a drive letter—something like **/dev/sda** or **/dev/sdb**. Enter the **dmesg** command and examine the last lines of the output to find out the card's drive assignment.

**Be VERY CAREFUL with the next step! I can't stress that enough; if you get the drive assignment wrong, you could destroy your system.**

Write the image to your SD card with the following command, changing **< DRIVE>** to your SD card's drive assignment (obtained in the previous step):

```
$ dd if=ubuntu-18.04-beta-preinstalled-server-arm64+raspi3.img of=<DRIVE> bs=8M
```

After it finishes, insert the SD card into your Pi and power it up. Make sure the Pi is connected to your network, then log in with username/password combination ubuntu/ubuntu.

Enter the following commands on your Pi to install a few things to prepare to compile PriTunl:

```
$ sudo apt-get -y install build-essential git bzr python python-dev python-pip net-tools openvpn bridge-utils psmisc golang-go libffi-dev mongodb
```

There are a few changes from the standard PriTunl source [installation instructions on GitHub][2]. Make sure you are logged into your Pi and **sudo** to root:

```
$ sudo su -
```

This should leave you in root's home directory. To install PriTunl version 1.29.1914.98, enter (per GitHub):

```
export VERSION=1.29.1914.98
tee -a ~/.bashrc << EOF
export GOPATH=\$HOME/go
export PATH=/usr/local/go/bin:\$PATH
EOF
source ~/.bashrc
mkdir pritunl && cd pritunl
go get -u github.com/pritunl/pritunl-dns
go get -u github.com/pritunl/pritunl-web
sudo ln -s ~/go/bin/pritunl-dns /usr/bin/pritunl-dns
sudo ln -s ~/go/bin/pritunl-web /usr/bin/pritunl-web
wget https://github.com/pritunl/pritunl/archive/$VERSION.tar.gz
tar -xf $VERSION.tar.gz
cd pritunl-$VERSION
python2 setup.py build
pip install -r requirements.txt
python2 setup.py install --prefix=/usr/local
```

Now the MongoDB and PriTunl systemd units should be ready to start up. Assuming you're still logged in as root, enter:

```
systemctl daemon-reload
systemctl start mongodb pritunl
systemctl enable mongodb pritunl
```

That's it! You're ready to hit PriTunl's browser user interface and configure it by following PriTunl's [installation and configuration instructions][3] on its website.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/pritunl-vpn-raspberry-pi

作者：[Stephen Bancroft][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/stevereaver
[b]: https://github.com/lujun9972
[1]: https://pritunl.com/
[2]: https://github.com/pritunl/pritunl
[3]: https://docs.pritunl.com/docs/configuration-5

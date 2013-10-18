VirtualBox 4.3 comes with New Multi-Touch Support, virtual cam and more
================================================================================
Oracle announced [the release of VirtualBox 4.3][1], this is a major release that comes with important new features, devices support and improvements. According to the announcement, “*Oracle VM VirtualBox 4.3 adds a unique virtual multi-touch interface to support touch-based operating systems, and other new virtual devices and utilities, including webcam devices and a session recording facility. This release also builds on previous releases with support for the latest Microsoft, Apple, Linux and Oracle Solaris operating systems, new virtual devices, and improved networking functionality.* “

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/06/VirtualBox.png)

What`s new in VirtualBox 4.3:

- **New operating system platform support**: Oracle VM VirtualBox 4.3 supports the input device features, of the latest platforms such as Windows 8.1, Windows Server 2012 R2 and Mac OS X 10.9 in a virtual environment. For Windows 8.1, the new release can also simulate a 10 point multi-touch device. Additionally, improved 3D acceleration accommodates the translucent effects in the latest Linux distributions from Ubuntu and Fedora, and enhanced multi-monitor support allows users with multiple screens to use them from within the virtual environment.
- **New devices and management utilities**: A new virtual USB webcam device enables video conferencing applications such as Skype or Google Hangouts to run in virtual machines. New recording session capabilities allow users to record part, or all, of a virtual machine session using a new video-capture facility. For easy playback, movies are created in WebM format by a range of movie-players.
- **Networking improvements**: A new Network Address Translation (NAT) option allows virtual machines to talk to each other on the same host, and communicate with the outside world. IPv6 is now offered across Bridged, Host-only, Internal and the new NAT networking modes. In addition, the remote display server built-in to Oracle VM VirtualBox can accommodate RDP connections over IPv4 and IPv6 networks.

## Installation: ##

For Ubuntu, Fedora, LinuxMint, Debian, Open Suse and Mandriva, You can download the new release and the Guest additions pack from [this Link][2] . (You need to download the package related to your distro version)

For Ubuntu via repository:

To start the installation, first open a terminal.

Copy and paste the following in to your command-line. Press Enter to download and install key from Oracle. Type user password and press Enter to continue:

    $ wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -

After Oracle’s Public Key has been downloaded and installed successfully you will see an OK message in the terminal.

Now run this command to add VirtualBox to your repository:

    $ sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian raring contrib" >> /etc/apt/sources.list.d/virtualbox.list'

When prompted, input password and press Enter.

Lastly, run the combined command below to update your system and install VirtualBox.

    $ sudo apt-get update && sudo apt-get install virtualbox-4.3

--------------------------------------------------------------------------------

via: http://www.unixmen.com/virtualbox-4-3-released/

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

[1]:http://www.oracle.com/us/corporate/press/2033376?rssid=rss_ocom_pr
[2]:http://www.oracle.com/technetwork/server-storage/virtualbox/downloads/index.html?ssSourceSiteId=ocomen#vboxhttp://
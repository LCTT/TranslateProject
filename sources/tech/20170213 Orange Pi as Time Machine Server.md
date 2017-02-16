Orange Pi as Time Machine Server
============================================================

 ![Orange Pi as Time Machine Server](https://i1.wp.com/piboards.com/wp-content/uploads/2017/02/OPiTM.png?resize=960%2C450) 

One of my projects has been to organize automated backups of the various computers in the house.  This includes a couple Macs with some precious data on them.  So, I decided to put my inexpensive [Orange Pi][3] with [Armbian][4] Linux to the test, with the goal of getting [Time Machine][5] working over the network to a USB drive attached to the pi board.  That being the case, I discovered and successfully installed Netatalk.

[Netatalk][6] is open source software that acts as an Apple file server.  With a combination of [Avahi][7] and Netatalk running, your Mac can discover your pi board on the network and will even consider it to be a “Mac” type device.  This enables you to connect manually to the network drive but more importantly it enables Time Machine to find and use the remote drive.  The below guidance may help if you if you wish to set up a similar backup capability for your Macs.

### Preparations

To set up the USB drive, I first experimented with an HFS+ formatted file system.  Unfortunately, I could never get write permissions working.  So, I opted instead to create an EXT4 filesystem and ensured that my user “pi” had read/write permissions.  There are many ways to format a drive but my preferred (and recommended) method is to use [gparted][8] whenever possible.  Since gparted is included with the Armbian desktop, that I what I used.

I wanted this drive to be automatically mounted to the same location every time the pi board boots or the USB drive is connected.  So, I created a location for it to be mounted, made a “tm” directory for the actual backups, and changed the ownership of “tm” to user pi:

```
cd /mnt
sudo mkdir timemachine
cd timemachine
sudo mkdir tm
sudo chown pi:pi tm
```

Then I opened a terminal and edited /etc/fstab…

```
sudo nano /etc/fstab
```

…and added a line at the end for the device  (in my case, is it sdc2):

```
/dev/sdc2 /mnt/timemachine ext4 rw,user,exec 0 0
```

You will need to install some prerequisites packages via command line, some of which may already be installed on your system:

```
sudo apt-get install build-essential libevent-dev libssl-dev libgcrypt11-dev libkrb5-dev libpam0g-dev libwrap0-dev libdb-dev libtdb-dev libmysqlclient-dev avahi-daemon libavahi-client-dev libacl1-dev libldap2-dev libcrack2-dev systemtap-sdt-dev libdbus-1-dev libdbus-glib-1-dev libglib2.0-dev libio-socket-inet6-perl tracker libtracker-sparql-1.0-dev libtracker-miner-1.0-dev hfsprogs hfsutils avahi-daemon
```

### Install & Configure Netatalk

The next action is to download Netatalk, extract the downloaded archive file, and navigate to the Netatalk software directory:

```
wget https://sourceforge.net/projects/netatalk/files/netatalk/3.1.10/netatalk-3.1.10.tar.bz2
tar xvf netatalk-3.1.10.tar.bz2
cd netatalk-3.1.10
```

Now you need to configure, make, and make install the software.  In the netatalk-3.1.10 directory, run the following configure command and be prepared for it to take a bit of time:

```
./configure --with-init-style=debian-systemd --without-libevent --without-tdb --with-cracklib --enable-krbV-uam --with-pam-confdir=/etc/pam.d --with-dbus-daemon=/usr/bin/dbus-daemon --with-dbus-sysconf-dir=/etc/dbus-1/system.d --with-tracker-pkgconfig-version=1.0
```

When that finishes, run:

```
make
```

Be prepared for this to take a rather long time to complete.  Seriously, grab a cup of coffee or something.  When that is finally done, run the following command:

```
sudo make install
```

That should complete in a brief moment.  Now you can verify installation and also find the location of configuration files with the following two commands:

```
sudo netatalk -V
sudo afpd -V
```

You will need to edit your afp.conf file so that your time machine backup location is defined, your user account has access to it, and to specify whether or not you want [Spotlight][9] to index your backups.

```
sudo nano /usr/local/etc/afp.conf
```

As an example, my afp.conf includes the following:

```
[My Time Machine Volume]
path = /mnt/timemachine/tm
valid users = pi
time machine = yes
spotlight = no
```

Finally, enable and start up Avahi and Netatalk:

```
sudo systemctl enable avahi-daemon
sudo systemctl enable netatalk
sudo systemctl start avahi-daemon
sudo systemctl start netatalk
```

### Connecting to the Network Drive

At this point, your Mac may have already discovered your pi board and network drive. Open Finder on the Mac and see if you have something like this:

 ![](https://i2.wp.com/piboards.com/wp-content/uploads/2017/02/TM_drive.png?resize=241%2C89) 

You can also connect to the server by host name or IP address, for example:

```
afp://192.168.1.25
```

### Time Machine Backup

And at last…open Time Machine on the Mac, and select disk, and choose your Orange Pi.

 ![](https://i1.wp.com/piboards.com/wp-content/uploads/2017/02/OPiTM.png?resize=579%2C381) 

This set up will definitely work and the Orange Pi handles the process like a champ, but keep in mind this may not be the fastest of backups.  But it is easy, inexpensive, and ‘just works’ like it should.  If you have success or improvements for this type of set up, please comment below or send me a note.

 ![](https://i0.wp.com/piboards.com/wp-content/uploads/2017/02/backup_complete.png?resize=300%2C71) 

Orange Pi boards are available at Amazon (affiliate links):

--------------------------------------------------------------------------------

via: http://piboards.com/2017/02/13/orange-pi-as-time-machine-server/

作者：[MIKE WILMOTH][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://piboards.com/author/piguy/
[1]:http://piboards.com/author/piguy/
[2]:http://piboards.com/2017/02/13/orange-pi-as-time-machine-server/
[3]:https://www.amazon.com/gp/product/B018W6OTIM/ref=as_li_tl?ie=UTF8&tag=piboards-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=B018W6OTIM&linkId=08bd6573c99ddb8a79746c8590776c39
[4]:https://www.armbian.com/
[5]:https://support.apple.com/kb/PH25710?locale=en_US
[6]:http://netatalk.sourceforge.net/
[7]:https://en.wikipedia.org/wiki/Avahi_(software)
[8]:http://gparted.org/
[9]:https://support.apple.com/en-us/HT204014

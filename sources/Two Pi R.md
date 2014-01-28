Two Pi R
================================================================================
Although many people are excited about the hardware-hacking possibilities with the Raspberry Pi, one of the things that interests me most is the fact that it is essentially a small low-power Linux server I can use to replace other Linux servers I already have around the house. In previous columns, I've talked about using the Raspberry Pi to replace the server that controls my beer fridge and colocating a Raspberry Pi in Austria. After I colocated a Raspberry Pi in Austria, I started thinking about the advantages and disadvantages of using something with so many single points of failure as a server I relied on, so I started thinking about ways to handle that single point of failure. When you see "Two Pi R", you probably think the R stands for the radius for a circle. To me, it stands for redundancy. I came to the conclusion that although one Pi isn't redundant, two Pi are.

So, in this article, I'm building the foundation for setting up redundant services with a pair of Raspberry Pis. I start with setting up a basic clustered network filesystem using GlusterFS. In later articles, I'll follow up with how to take advantage of this shared storage to set up other redundant services. Of course, although I'm using a Raspberry Pi for this article, these same steps should work with other hardware as well.

### Configure the Raspberry Pis ###

To begin, I got two SD cards and loaded them with the latest version of the default Raspberry Pi distribution from the official Raspberry Pi downloads page, the Debian-based Raspbian. I followed the documentation to set up the image and then booted in to both Raspberry Pis while they were connected to a TV to make sure that the OS booted and that SSH was set to start by default (it should be). You probably also will want to use the raspi-config tool to expand the root partition to fill the SD card, since you will want all that extra space for your redundant storage. After I confirmed I could access the Raspberry Pis remotely, I moved them away from the TV and over to a switch and rebooted them without a display connected.

By default, Raspbian will get its network information via DHCP; however, if you want to set up redundant services, you will want your Raspberry Pis to keep the same IP every time they boot. In my case, I updated my DHCP server so that it handed out the same IP to my Raspberry Pis every time they booted, but you also could edit the /etc/network/interfaces file on your Raspberry Pi and change: 

    iface eth0 inet dhcp

to: 

    auto eth0
    iface eth0 inet static
      address 192.168.0.121
      netmask 255.255.255.0
      gateway 192.168.0.1

Of course, modify the networking information to match your personal network, and make sure that each Raspberry Pi uses a different IP. I also changed the hostnames of each Raspberry Pi, so I could tell them apart when I logged in. To do this, just edit /etc/hostname as root and change the hostname to what you want. Then, reboot to make sure that each Raspberry Pi comes up with the proper network settings and hostname.

### Configure the GlusterFS Server ###

GlusterFS is a userspace clustered filesystem that I chose for this project because of how simple it makes configuring shared network filesystems. To start, choose a Raspberry Pi that will act as your master. What little initial setup you need to do will be done from the master node, even though once things are set up, nodes should fail over automatically. Here is the information about my environment: 

    Master hostname: pi1
    Master IP: 192.168.0.121
    Master brick path: /srv/gv0
    Secondary hostname: pi2
    Secondary IP: 192.168.0.122
    Secondary brick path: /srv/gv0

Before you do anything else, log in to each Raspberry Pi, and install the glusterfs-server package: 

    $ sudo apt-get install glusterfs-server

GlusterFS stores its files in what it calls bricks. A brick is a directory path on the server that you set aside for gluster to use. GlusterFS then combines bricks to create volumes that are accessible to clients. GlusterFS potentially can stripe data for a volume across bricks, so although a brick may look like a standard directory full of files, once you start using it with GlusterFS, you will want to modify it only via clients, not directly on the filesystem itself. In the case of the Raspberry Pi, I decided just to create a new directory called /srv/gv0 for my first brick on both Raspberry Pis: 

    $ sudo mkdir /srv/gv0

In this case, I will be sharing my standard SD card root filesystem, but in your case, you may want more storage. In that situation, connect a USB hard drive to each Raspberry Pi, make sure the disks are formatted, and then mount them under /srv/gv0. Just make sure that you update /etc/fstab so that it mounts your external drive at boot time. It's not required that the bricks are on the same directory path or have the same name, but the consistency doesn't hurt. 

After the brick directory is available on each Raspberry Pi and the glusterfs-server package has been installed, make sure both Raspberry Pis are powered on. Then, log in to whatever node you consider the master, and use the `gluster peer probe` command to tell the master to trust the IP or hostname that you pass it as a member of the cluster. In this case, I will use the IP of my secondary node, but if you are fancy and have DNS set up you also could use its hostname instead: 

    pi@pi1 ~ $ sudo gluster peer probe 192.168.0.122
    Probe successful

Now that my pi1 server (192.168.0.121) trusts pi2 (192.168.0.122), I can create my first volume, which I will call gv0. To do this, I run the `gluster volume create` command from the master node: 

    pi@pi1 ~ $ sudo gluster volume create gv0 replica 2 
     ↪192.168.0.121:/srv/gv0 192.168.0.122:/srv/gv0
    Creation of volume gv0 has been successful. Please start 
    the volume to access data.

Let's break this command down a bit. The first part, `gluster volume create`, tells the gluster command I'm going to create a new volume. The next argument, `gv0` is the name I want to assign the volume. That name is what clients will use to refer to the volume later on. After that, the `replica 2` argument configures this volume to use replication instead of striping data between bricks. In this case, it will make sure any data is replicated across two bricks. Finally, I define the two individual bricks I want to use for this volume: the /srv/gv0 directory on 192.168.0.121 and the /srv/gv0 directory on 192.168.0.122. 

Now that the volume has been created, I just need to start it:

    pi@pi1 ~ $ sudo gluster volume start gv0
    Starting volume gv0 has been successful

Once the volume has been started, I can use the `volume info` command on either node to see its status: 

    $ sudo gluster volume info

    Volume Name: gv0
    Type: Replicate
    Status: Started
    Number of Bricks: 2
    Transport-type: tcp
    Bricks:
    Brick1: 192.168.0.121:/srv/gv0
    Brick2: 192.168.0.122:/srv/gv0

### onfigure the GlusterFS Client ###

Now that the volume is started, I can mount it as a GlusterFS type filesystem from any client that has GlusterFS support. First though, I will want to mount it from my two Raspberry Pis as I want them to be able to write to the volume themselves. To do this, I will create a new mountpoint on my filesystem on each Raspberry Pi and use the mount command to mount the volume on it: 

    $ sudo mkdir -p /mnt/gluster1
    $ sudo mount -t glusterfs 192.168.0.121:/gv0 /mnt/gluster1
    $ df
    Filesystem         1K-blocks    Used Available Use% Mounted on
    rootfs               1804128 1496464    216016  88% /
    /dev/root            1804128 1496464    216016  88% /
    devtmpfs               86184       0     86184   0% /dev
    tmpfs                  18888     216     18672   2% /run
    tmpfs                   5120       0      5120   0% /run/lock
    tmpfs                  37760       0     37760   0% /run/shm
    /dev/mmcblk0p1         57288   18960     38328  34% /boot
    192.168.0.121:/gv0   1804032 1496448    215936  88% /mnt/gluster1

The more pedantic readers among you may be saying to yourselves, "Wait a minute, if I am specifying a specific IP address here, what happens when 192.168.0.121 goes down?" It turns out that this IP address is used only to pull down the complete list of bricks used in the volume, and from that point on, the redundant list of bricks is what will be used when accessing the volume.

Once you mount the filesystem, play around with creating files and then looking into /srv/gv0. You should be able to see (but again, don't touch) files that you've created from /mnt/gluster1 on the /srv/gv0 bricks on both nodes in your cluster: 

    pi@pi1 ~ $ sudo touch /mnt/gluster1/test1
    pi@pi1 ~ $ ls /mnt/gluster1/test1
    /mnt/gluster1/test1
    pi@pi1 ~ $ ls /srv/gv0
    test1
    pi@pi2 ~ $ ls /srv/gv0
    test1

After you are satisfied that you can mount the volume, make it permanent by adding an entry like the following to the /etc/fstab file on your Raspberry Pis: 

    192.168.0.121:/gv0  /mnt/gluster1  glusterfs  defaults,_netdev  0  0

Note that if you also want to access this GlusterFS volume from other clients on your network, just install the GlusterFS client package for your distribution (for Debian-based distributions, it's called glusterfs-client), and then create a mountpoint and perform the same mount command as I listed above.

### Test Redundancy ###

Now that I have a redundant filesystem in place, let's test it. Since I want to make sure that I could take down either of the two nodes and still have access to the files, I configured a separate client to mount this GlusterFS volume. Then I created a simple script called glustertest inside the volume: 

    #!/bin/bash

    while [ 1 ]
    do
      date > /mnt/gluster1/test1
      cat /mnt/gluster1/test1
      sleep 1
    done

This script runs in an infinite loop and just copies the current date into a file inside the GlusterFS volume and then cats it back to the screen. Once I make the file executable and run it, I should see a new date pop up about every second:

    # chmod a+x /mnt/gluster1/glustertest
    root@moses:~# /mnt/gluster1/glustertest
    Sat Mar  9 13:19:02 PST 2013
    Sat Mar  9 13:19:04 PST 2013
    Sat Mar  9 13:19:05 PST 2013
    Sat Mar  9 13:19:06 PST 2013
    Sat Mar  9 13:19:07 PST 2013
    Sat Mar  9 13:19:08 PST 2013

I noticed every now and then that the output would skip a second, but in this case, I think it was just a function of the date command not being executed exactly one second apart every time, so every now and then that extra sub-second it would take to run a loop would add up.

After I started the script, I then logged in to the first Raspberry Pi and typed `sudo reboot` to reboot it. The script kept on running just fine, and if there were any hiccups along the way, I couldn't tell it apart from the occasional skipping of a second that I saw beforehand. Once the first Raspberry Pi came back up, I repeated the reboot on the second one, just to confirm that I could lose either node and still be fine. This kind of redundancy is not bad considering this took only a couple commands.

There you have it. Now you have the foundation set with a redundant file store across two Raspberry Pis. In my next column, I will build on top of the foundation by adding a new redundant service that takes advantage of the shared storage. 

--------------------------------------------------------------------------------

via: http://www.linuxjournal.com/content/two-pi-r

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
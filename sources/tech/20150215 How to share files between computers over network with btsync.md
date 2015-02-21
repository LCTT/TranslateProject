translating by martin.

How to share files between computers over network with btsync
================================================================================
If you are the type of person who uses several devices to work online, I'm sure you must be using, or at least wishing to use, a method for syncing files and directories among those devices.

BitTorrent Sync, also known as btsync for short, is a cross-platform sync tool (freeware) which is powered by BitTorrent, the famous protocol for peer-to-peer (P2P) file sharing. Unlike classic BitTorrent clients, however, btsync encrypts traffic and grants access to shared files based on auto-generated keys across different operating system and device types.

More specifically, when you add files or folder to btsync as shareable, corresponding read/write keys (so-called secret codes) are created. These keys are then shared among different devices via HTTPS links, emails, QR codes, etc. Once two devices are paired via a key, the linked content can be synced directly between them. There is no file size limit, and transfer speeds are never throttled unless you explicitly say so. You will be able to create accounts inside btsync, under which you can create and manage keys and files to share via web interface.

BitTorrent Sync is available on multiple operating systems including Linux, MacOS X, Windows, as well as [Android][1] and [iOS][2]. In this tutorial, I will show you how to use BitTorrent Sync to sync files between a Linux box (a home server), and a Windows machine (a work laptop).

### Installing Btsync on Linux ###

BitTorrent Sync is available for download from the [project's website][3]. I assume that the Windows version of BiTorrent Sync is installed on a Windows laptop, which can be done very easily. I will focus on installing and configuring it on the Linux server.

In the download page, choose your architecture, right click on the corresponding link, choose Copy link location (or similar, depending on your browser), and paste the link to wget in your terminal, as follows:

**For 64-bit Linux:**

    # wget http://download.getsyncapp.com/endpoint/btsync/os/linux-x64/track/stable 

**For 32-bit Linux:**

    # wget http://download.getsyncapp.com/endpoint/btsync/os/linux-i386/track/stable 

![](https://farm9.staticflickr.com/8635/15895277773_8acf317e3c_c.jpg)

Once the download has completed, extract the contents of the tarball into a directory specially created for that purpose:

    # cd /usr/local/bin
    # mkdir btsync
    # tar xzf stable -C btsync 

![](https://farm8.staticflickr.com/7306/16329173869_7dc8b64a39_b.jpg)

You can now either add /usr/local/bin/btsync to your PATH environment variable.

    export PATH=$PATH:/usr/local/bin/btsync

or run the btsync binary right from that folder. We'll go with the first option as it requires less typing and is easier to remember.

### Configuring Btsync ###

Btsync comes with a built-in web server which is used as the management interface for BitTorrent Sync. To be able to access the web interface, you need to create a configuration file. You can do that with the following command:

    # btsync --dump-sample-config > btsync.config 

Then edit the btsync.config file (webui section) with your preferred text editor, as follows:

    "listen" : "0.0.0.0:8888",
    "login" : "yourusername",
    "password" : "yourpassword"

You can choose any username and password.

![](https://farm9.staticflickr.com/8599/15895277793_da63841433_b.jpg)

![](Feel free to check the README file in /usr/local/bin/btsync directory if you want to tweak the configuration further, but this will do for now.)

### Running Btsync for the First Time ###

As system administrators we believe in logs! So before we launch btsync, we will create a log file for btsync.

    # touch /var/log/btsync.log 

Finally it's time to start btsync:

    # btsync --config /usr/local/bin/btsync/btsync.config --log /var/log/btsync.log 

![](https://farm8.staticflickr.com/7288/16327720298_ccf2cbedea_c.jpg)

Now point your web browser to the IP address of the Linux server and the port where btsync is listening on (192.168.0.15:8888 in my case), and agree to the privacy policies, terms, and EULA:

![](https://farm9.staticflickr.com/8597/16327720318_d52551fc44_b.jpg)

and you will be taken to the home page of your btsync installation:

![](https://farm8.staticflickr.com/7412/16329544687_9a174527d8_c.jpg)

Click on Add a folder, and choose a directory in your file system that you want to share. In our example, we will use /btsync:

![](https://farm8.staticflickr.com/7407/16515452485_e25ded559f_b.jpg)

That's enough by now. Please install BitTorrent Sync on your Windows machine (or another Linux box, if you want) before proceeding.

### Sharing Files with Btsync ###

The following screencast shows how to sync an existing folder in a Windows 8 machine [192.168.0.106]. After adding the desired folder, get its key, and add it in your Linux installation via the "Enter a key or link" menu (as shown in the previous image), and the sync will start:

注释：youtube视频
<iframe width="615" height="346" frameborder="0" allowfullscreen="" src="http://www.youtube.com/embed/f7kLM0lAqF4?feature=oembed"></iframe>

Now repeat the process for other computers or devices; selecting a folder or files to share, and importing the corresponding key(s) in your "central" btsync installation via the web interface on your Linux server.

### Auto-start Btsync as a Normal User ###

You will notice that the synced files in the screencast were created in the /btsync directory belonging to user and group 'root'. That is because we launched BitTorrent Sync manually as the superuser. However, under normal circumstances, you will want to have BitTorrent Sync start on boot and running as a non-privileged user (www-data or other special account created for that purpose, btsync user for example).

To do so, create a user called btsync, and add the following stanza to the /etc/rc.local file (before the exit 0 line):

    sudo -u btsync /usr/local/bin/btsync/btsync --config /usr/local/bin/btsync/btsync.config --log /var/log/btsync.log

Finally, create the pid file:

    # touch /usr/local/bin/btsync/.sync//sync.pid 

and change the ownership of /usr/local/bin/btsync recursively:

    # chown -R btsync:root /usr/local/bin/btsync 

Now reboot and verify that btsync is running as the intended user:

![](https://farm9.staticflickr.com/8647/16327988660_644f6d4505_c.jpg)

Based on your chosen distribution, you may find other ways to enable btsync to start on boot. In this tutorial I chose the rc.local approach since it's distribution-agnostic.

### Final Remarks ###

As you can see, BitTorrent Sync is almost like server-less Dropbox for you. I said "almost" because of this: When you sync between devices on the same local network, sync happens directly between two devices. However, if you try to sync across different networks, and the devices to be paired are behind restrictive firewalls, there is a chance that the sync traffic goes through a third-party relay server operated by BitTorrent. While they claim that the traffic is [AES-encrypted][4], you may still not want this to happen. For your privacy, be sure to turn off relay/tracker server options in every folder that you are sharing.

Hope it helps! Happy syncing!

--------------------------------------------------------------------------------

via: http://xmodulo.com/share-files-between-computers-over-network.html

作者：[Gabriel Cánepa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/gabriel
[1]:https://play.google.com/store/apps/details?id=com.bittorrent.sync
[2]:https://itunes.apple.com/us/app/bittorrent-sync/id665156116
[3]:http://www.getsync.com/
[4]:http://www.getsync.com/tech-specs

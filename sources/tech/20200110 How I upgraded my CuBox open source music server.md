[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How I upgraded my CuBox open source music server)
[#]: via: (https://opensource.com/article/20/1/upgrade-cubox-open-source-music-server)
[#]: author: (Chris Hermansen https://opensource.com/users/clhermansen)

How I upgraded my CuBox open source music server
======
Our resident audiophile explains how he updated his CuBox music server
after more than five years of excellent use.
![open source music with piano keys background][1]

Back in early 2014, I purchased my first [ARM-based computer][2], a [SolidRun CuBox-i4][3]. My goal for the CuBox was to have a headless device (e.g., no display) that takes up minimal space in the audio equipment shelf, makes minimal noise, and serves music files to my digital-to-analog converter (DAC) and thus to the rest of the stereo. On paper, the CuBox was a perfect fit. It is fanless, works with various Linux distros, provides a separate [eSATA interface][4] for a locally mounted hard drive and therefore leaves the USB ports free for other stuff, provides a [TOSLINK port][5] for digital audio, uses a [MicroSD card][6] (by default, anyway) for the system installation and boot drive, and comes with 2GB of RAM and a reasonably fast [i.MX6q quad-core processor][7], all in an unobtrusive 5x5x5cm black plastic box.

And as luck would (sometimes) have it, those promises have mostly been kept. The box still runs and provides my family with a great deal of musical enjoyment. The attached hard drive contains about 275GB of music files—a bit over 7,500 FLAC files with some 300 or so MP3 files thrown in.

As our home music server, the CuBox runs a barebones Linux server distro with Music Player Daemon ([MPD][8]) as the music-serving software, sending digital data to the DAC via the [ALSA][9] with no software mixing, up- or down-sampling, or volume control on the server. Lately, I've found it convenient to run [lighttpd][10], a lightweight, simple-to-configure HTTP server, to provide cover images to the various MPD clients that we run in the house. (But now MPD provides that capability, so that convenience may soon go away.) For the user interfaces to play music, we use [Cantata][11] on the desktop and [MPD Remote][12] (caution: it may not be open source) on our Android phones to browse, select, and play music.

In 2017, I wrote about [my experiences using the CuBox][13]. I had tried [Voyage Linux][14], [Volumio][15], and [Archphile Linux][16], and had just moved to [Armbian][17], which at that time was based on Ubuntu 16.04 LTS (long term support). This fall, I decided it was time to upgrade the server, get the latest version of MPD, and deal with a few other bothersome details along the way.

### The upgrade

Given my generally great experience with Armbian, I decided to go there again for upgrade materials. There are two supported options: a Debian Buster-based server configuration and an Ubuntu 18.04 desktop configuration. Bearing in mind my desire to keep the system display-free and minimalist, I selected the Debian version.

![Armbian versions][18]

The download was trouble-free, and I soon had an install image in my Downloads folder. As before, I was impressed with the quality and "to the point" nature of the [Armbian documentation][19], which notes:

> Images shall only be written with Etcher on all platforms since, unlike other tools, Etcher validates burning results **saving you from corrupted SD card contents**.

This was my first experience using [Etcher][20], and I was duly impressed with its usability (yet another wonderful reason to use open source software). I inserted the resulting MicroSD card into the CuBox, connected the Ethernet cable, DAC, and eSATA drive, and powered it on. Soon, I could SSH into the CuBox to configure it. Talk about a painless experience! Here's what I see when I log into that machine using SSH:

![CuBox login][21]

In terms of configuration, I had the following objectives:

  * Finish the initial configuration
  * Configure static IP addressing for the wired networking connection
  * Get the installed system up to date
  * Disable the wireless
  * Install and configure MPD
  * Install and configure lighttpd
  * Listen to some music!



I used the excellent [Armbian Config program][22] to carry out a bunch of these initial configuration tasks.

![Armbian-Config screen][23]

Choosing System presents this menu:

![Armbian-Config settings][24]

I used this to disable root login over SSH and enable password and public key authentication.

In the Network subsystem, I set static IP addressing (to conform to my home router settings), and in the Personal subsystem, I changed the time zone and hostname. I probably could have used the Software subsystem to run the initial update, but I chose to exit to the shell and use apt to finish up this initial configuration with:


```
sudo apt update
sudo apt upgrade
```

I also used apt to install MPD and lighttpd with:


```
`sudo apt install mpd lighttpd`
```

I had my previous MPD configuration file (**/etc/mpd.conf**); generally, I prefer to use these types of older files as guides to configure a new one, rather than just plunking the old one on top of the new. In the end, there weren't many changes to make; here are the differences between the old and new files:


```
clh@stereo:/etc$ diff mpd.conf.orig mpd.conf
85c85,86
&lt; bind_to_address               "localhost"
\---
&gt; #bind_to_address              "localhost"
&gt; bind_to_address               "192.168.1.21"
241c242,249
&lt;       name            "My ALSA Device"
\---
&gt;       name            "Drop Airist R2R"
&gt;       device          "hw:CARD=U20,DEV=0"
&gt;       mixer_type      "none"
&gt;       replay_gain_handler      "none"
&gt; #     name            "Schit Bifrost 4490"
&gt; #     device          "hw:CARD=S2,DEV=0"
&gt; #     mixer_type      "none"
&gt; #     replay_gain_handler      "none"
clh@stereo:/etc$
```

You can see that I have two DACs (just because), and the second is commented out (and not connected). Also, I had to change **bind_to_address** so that MPD will listen over the local area network.

As for lighttpd, I only had to change the **document-root**:


```
clh@stereo:/etc/lighttpd$ diff lighttpd.conf.orig lighttpd.conf
8c8,13
&lt; server.document-root        = "/var/www/html"
\---
&gt; # Used this config documentation
&gt; #<https://github.com/abarisain/dmix/wiki/Album-Art-on-your-LAN>
&gt; # which wasn't good - wrong user name, didn't need to add
&gt; # the mime config
&gt; # in the end just changed the document root.
&gt;
&gt; server.document-root        = "/var/lib/mpd/music/"
clh@stereo:/etc/lighttpd$
```

To get to the music files, I added the following line to **/etc/fstab**:


```
`/dev/sda1 /mnt/eSATA ext4 rw 0 0`
```

and created the mount point with:


```
`sudo mkdir /mnt/eSATA`
```

At this point, I mounted the external hard drive with:


```
`sudo mount /dev/sda1`
```

Finally, I linked MPD's configuration directory to the music with:


```
sudo rmdir /var/lib/mpd/music
sudo ln -s /mnt/eSATA/Music /var/lib/mpd/music
```

I used this approach because I'd rather not futz around with MPD's configuration more than I have to.

It's a good idea to check that the music files are owned by the correct MPD user ID. Do this with:


```
clh@stereo:~$ ls -ld /var/lib/mpd/music/* | head
drwxrwxrwx   5 mpd audio  4096 Jan 22  2017 /var/lib/mpd/music/Academy of St. Martin-in-the-Fields
drwxrwxrwx   3 mpd audio  4096 Jan 22  2017 /var/lib/mpd/music/Acantus
drwxrwxrwx   3 mpd audio  4096 Dec 13  2014 /var/lib/mpd/music/Afrikan_Sciences
drwxrwxrwx   5 mpd audio  4096 Sep 25  2016 /var/lib/mpd/music/Afro Celt Sound System
drwxrwxrwx   3 mpd audio  4096 Mar 11  2014 /var/lib/mpd/music/Agnes Obel
drwxrwxrwx   3 mpd audio  4096 Oct  9  2013 /var/lib/mpd/music/Alexander Malter, Dietmar Schwalke, Vladimir Spiakov, Sergej Bezrodny
drwxrwxrwx   3 mpd audio  4096 Oct  8  2013 /var/lib/mpd/music/Ali Farka Toure &amp; Toumani Diabate
drwxrwxrwx   3 mpd audio  4096 Oct  8  2013 /var/lib/mpd/music/Ali Farka Touré with Ry Cooder
drwxrwxrwx   5 mpd audio  4096 Jan  1  2018 /var/lib/mpd/music/Amadou et Mariam
drwxrwxrwx   3 mpd audio  4096 Jul 11  2017 /var/lib/mpd/music/American Authors
clh@stereo:~$
```

This looks fine (user ID **mpd**, group ID **audio**).

Finally, to disable the wireless, I entered:


```
`sudo nmcli radio wifi off`
```

And I'm done! Time for a reboot:


```
`sudo systemctl reboot`
```

Once it rebooted, I used Cantata to force MPD to refresh its database. Here's what it looks like when that's done, and I'm listening to [Frameworks' latest album, _Imagine Gold_][25]:

![Frameworks "Imagine Gold" in Cantata][26]

Just to the left of the track listings, you can see the cover images that lighttpd serves.

### And speaking of music

I really do like Frameworks' latest album. It's quite similar to his previous work, and he always has the greatest hooks with very dance-able stuff and just that great bit of "yearning." It's nice to buy his stuff on Bandcamp, as usual (see link above, where you can also listen).

Lately, I've also been buying stuff in that other great open source format, vinyl records. In particular, two fine recent albums from the [Erased Tapes][27] label, [Anne Müller's _Heliopause_][28], which is a beautiful record of her own solo cello and supporting instruments and sounds, "focusing on novel approaches to classical instrumentation," and [Penguin Cafe's _Handfuls of Night_][29], which "began life after Greenpeace commissioned [Arthur] Jeffes [of Penguin Cafe] to write four pieces of music corresponding to four breeds of penguins to help raise awareness for the endangered Antarctic seas." How could a Linux user not have music about penguins by Penguin Cafe?

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/upgrade-cubox-open-source-music-server

作者：[Chris Hermansen][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_LIFE_music_520x292_0411_ma.png?itok=v_ARy1ZT (open source music with piano keys background)
[2]: https://en.wikipedia.org/wiki/ARM_architecture
[3]: https://www.solid-run.com/nxp-family/cubox-i/
[4]: https://en.wikipedia.org/wiki/Serial_ATA
[5]: https://en.wikipedia.org/wiki/TOSLINK
[6]: https://www.makeuseof.com/tag/5-mistakes-avoid-buying-next-microsd-card/
[7]: https://www.nxp.com/products/processors-and-microcontrollers/arm-processors/i.mx-applications-processors/i.mx-6-processors/i.mx-6quad-processors-high-performance-3d-graphics-hd-video-arm-cortex-a9-core:i.MX6Q?&cid=ps_PRG100148_CAM262037_EETECH&gclid=CjwKCAiA27LvBRB0EiwAPc8XWfLpyKIpi4OPNrPLdmXpSynIaDP0FG2jQ9PPZ1q49ENp1CbQU2fKxxoCKtMQAvD_BwE
[8]: https://www.musicpd.org/
[9]: https://en.wikipedia.org/wiki/Advanced_Linux_Sound_Architecture
[10]: https://www.lighttpd.net/
[11]: https://opensource.com/article/17/8/cantata-music-linux
[12]: https://play.google.com/store/apps/details?id=net.prezz.mpr&hl=en_CA
[13]: https://opensource.com/article/17/6/armbian-cubox-i4pro
[14]: https://wiki.debian.org/Derivatives/Census/VoyageLinux
[15]: https://volumio.org/
[16]: https://archphile.org/
[17]: https://www.armbian.com/
[18]: https://opensource.com/sites/default/files/uploads/armbianversions.png (Armbian versions)
[19]: https://docs.armbian.com/
[20]: https://www.etcher.io/
[21]: https://opensource.com/sites/default/files/uploads/cuboxlogin.png (CuBox login)
[22]: https://docs.armbian.com/User-Guide_Armbian-Config/
[23]: https://opensource.com/sites/default/files/uploads/armbian-config.png (Armbian-config screen)
[24]: https://opensource.com/sites/default/files/uploads/armbian-config_settings.png (Armbian-config settings)
[25]: https://frameworksuk.bandcamp.com/album/imagine-gold
[26]: https://opensource.com/sites/default/files/uploads/frameworks-imaginegold.png (Frameworks "Imagine Gold" in Cantata)
[27]: https://www.erasedtapes.com/
[28]: https://www.erasedtapes.com/release/eratp128-anne-mueller-heliopause
[29]: https://www.erasedtapes.com/release/eratp127-penguin-cafe-handfuls-of-night

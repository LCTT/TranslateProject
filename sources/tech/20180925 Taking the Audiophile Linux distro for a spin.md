Taking the Audiophile Linux distro for a spin
======

This lightweight open source audio OS offers a rich feature set and high-quality digital sound.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/LIFE_givingmusic.jpg?itok=xVKF1dlb)

I recently stumbled on the [Audiophile Linux project][1], one of a number of special-purpose music-oriented Linux distributions. Audiophile Linux:

  1. is based on [ArchLinux][2]

  2. provides a real-time Linux kernel customized for playing music

  3. uses the lightweight [Fluxbox][3] window manager

  4. avoids unnecessary daemons and services

  5. allows playback of DSF and supports the usual PCM formats

  6. supports various music players, including one of my favorite combos: MPD + Cantata




The Audiophile Linux site hasn’t shown a lot of activity since April 2017, but it does contain some updates and commentary from this year. Given its orientation and feature set, I decided to take it for a spin on my old Toshiba laptop.

### Installing Audiophile Linux

The site provides [a clear set of install instructions][4] that require the use of the terminal. The first step after downloading the .iso is burning it to a USB stick. I used the GNOME Disks utility’s Restore Disk Image for this purpose. Once I had the USB set up and ready to go, I plugged it into the Toshiba and booted it. When the splash screen came up, I set the boot device to the USB stick and a minute or so later, the Arch Grub menu was displayed. I booted Linux from that menu, which put me in a root shell session, where I could carry out the install to the hard drive:

![](https://opensource.com/sites/default/files/uploads/root_shell_session.jpg)

I was willing to sacrifice the 320-GB hard drive in the Toshiba for this test, so I was able to use the previous Linux partitioning (from the last experiment). I then proceeded as follows:

```
fdisk -l              # find the disk / partition, in my case /dev/sda and /dev/sda1
mkfs.ext4 /dev/sda1   # build the ext4 filesystem in the root partition
mount /dev/sda1 /mnt  # mount the new file system
time cp -ax / /mnt    # copy over the OS
        # reported back cp -ax / /mnt 1.36s user 136.54s system 88% cpu 2:36.37 total
arch-chroot /mnt /bin/bash # run in the new system root
cd /etc/apl-files
./runme.sh            # do the rest of the install
grub-install --target=i386-pc /dev/sda # make the new OS bootable part 1
grub-mkconfig -o /boot/grub/grub.cfg   # part 2
passwd root           # set root’s password
ln -s /usr/share/zoneinfo/America/Vancouver /etc/localtime # set my time zone
hwclock --systohc --utc # update the hardware clock
./autologin.sh        # set the system up so that it automatically logs in
exit                  # done with the chroot session
genfstab -U /mnt >> /mnt/etc/fstab # create the fstab for the new system
```

At that point, I was ready to boot the new operating system, so I did—and voilà, up came the system!

![](https://opensource.com/sites/default/files/uploads/audiophile_linux.jpg)

### Finishing the configuration

Once Audiophile Linux was up and running, I needed to [finish the configuration][4] and load some music. Grabbing the application menu by right-clicking on the screen background, I started **X-terminal** and entered the remaining configuration commands:

```
ping 8.8.8.8 # check connectivity (works fine)
su # become root
pacman-key –init # create pacman’s encryption data part 1
pacman-key --populate archlinux # part 2
pacman -Sy # part 3
pacman -S archlinux-keyring # part 4
```

At this point, the install instructions note that there is a problem with updating software with the `pacman -Suy` command, and that first the **libxfont** package must be removed using `pacman -Rc libxfont`. I followed this instruction, but the second run of `pacman -Suy` led to another dependency error, this time with the **x265** package. I looked further down the page in the install instructions and saw this recommendation:

_Again there is an error in upstream repo of Arch packages. Try to remove conflicting packages with “pacman -R ffmpeg2.8” and then do pacman -Suy later._

I chose to use `pacman -Rc ffmpeg2.8`, and then reran `pacman -Suy`. (As an aside, typing all these **pacman** commands made me realize how familiar I am with **apt** , and how much this whole process made me feel like I was trying to write an email in some language I don’t know using an online translator.)

To be clear, here was my sequence of operations:

```
pacman -Suy # failed
pacman -Rc libxfont
pacman -Suy # failed, again
pacman -Rc ffmpeg2.8 # uninstalled Cantata, have to fix that later!
pacman -Suy # worked!
```

Now back to the rest of the instructions:

```
pacman -S terminus-font
pacman -S xorg-server
pacman -S firefox # the docs suggested installing chromium but I prefer FF
reboot
```

And the last little bit, fiddling `/etc/fstab` to avoid access time modifications. I also thought I’d try installing [Cantata][5] once more using `pacman -S cantata`, and it worked just fine (no `ffmpeg2.8` problems).

I found the `DAC Setup > List cards` on the application menu, which showed the built-in Intel sound hardware plus my USB DAC that I had plugged in earlier. Then I selected `DAC Setup > Edit mpd.conf` and adjusted the output stanza of `mpd.conf`. I used `scp` to copy an album over from my main music server into **~/Music**. And finally, I used the application menu `DAC Setup > Restart mpd`. And… nothing… the **conky** info on the screen indicated “MPD not responding”. So I scanned again through the comments at the bottom of the installation instructions and spotted this:

_After every update of mpd, you have to do:
1. Become root
```
$su
```
2. run this commands
```
# cat /etc/apl-files/mpd.service  > /usr/lib/systemd/system/mpd.service
# systemctl daemon-reload
# systemctl restart mpd.service_
```
_And this will be fixed._

![](https://opensource.com/sites/default/files/uploads/library.png)

And it works! Right now I’m enjoying [Nils Frahm’s "All Melody"][6] from the album of the same name, playing over my [Schiit Fulla 2][7] in glorious high-resolution sound. Time to copy in some more music so I can give it a better listen.

So… does it sound better than the same DAC connected to my regular work laptop and playing back through [Guayadeque][8] or [GogglesMM][9]? I’m going to see if I can detect a difference at some point, but right now all I can say is it sounds just wonderful; plus [I like the Cantata / mpd combo a lot][10], and I really enjoy having the heads-up display in the upper right of the screen.

### As for the music...

The other day I was reorganizing my work hard drive a bit and I decided to check to make sure that 1) all the music on it was also on the house music servers and 2) _vice versa_ (gotta set up `rsync` for that purpose one day soon). In doing so, I found some music I hadn’t enjoyed for a while, which is kind of like buying a brand-new album, except it costs much less.

[Six Degrees Records][11] has long been one of my favorite purveyors of unusual music. A great example is the group [Zuco 103][12]'s album [Whaa!][13], whose CD version I purchased from Six Degrees’ online store some years ago. Check out [this fun documentary about the group][14].

<https://youtu.be/ncaqD92cjQ8>

For a completely different experience, take a look at the [Ragazze Quartet’s performance of Terry Riley’s "Four Four Three."][15] I picked up ahigh-resolutionn version of this fascinating music from [Channel Classics][16], which operates a Linux-friendly download store (no bloatware to install on your computer).

And finally, I was saddened to hear of the recent passing of [Rachid Taha][17], whose wonderful blend of North African and French musical traditions, along with his frank confrontation of the challenges of being North African and living in Europe, has made some powerful—and fun—music. Check out [Taha’s version of "Rock the Casbah."][18] I have a few of his songs scattered around various compilation albums, and some time ago bought the CD version of [Rachid Taha: The Definitive Collection][19], which I’ve been enjoying again recently.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/9/audiophile-linux-distro

作者：[Chris Hermansen][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[1]: https://www.ap-linux.com/
[2]: https://www.archlinux.org/
[3]: http://fluxbox.org/
[4]: https://www.ap-linux.com/documentation/ap-linux-v4-install-instructions/
[5]: https://github.com/CDrummond/cantata
[6]: https://www.youtube.com/watch?v=1PTj1qIqcWM
[7]: https://www.audiostream.com/content/listening-session-history-lesson-bw-schiit-and-shinola-together-last
[8]: http://www.guayadeque.org/
[9]: https://gogglesmm.github.io/
[10]: https://opensource.com/article/17/8/cantata-music-linux
[11]: https://www.sixdegreesrecords.com/
[12]: https://www.sixdegreesrecords.com/?s=zuco+103
[13]: https://www.musicomh.com/reviews/albums/zuco-103-whaa
[14]: https://www.youtube.com/watch?v=ncaqD92cjQ8
[15]: https://www.youtube.com/watch?v=DwMaO7bMVD4
[16]: https://www.channelclassics.com/catalogue/37816-Riley-Four-Four-Three/
[17]: https://en.wikipedia.org/wiki/Rachid_Taha
[18]: https://www.youtube.com/watch?v=n1p_dkJo6Y8
[19]: http://www.bbc.co.uk/music/reviews/26rg/

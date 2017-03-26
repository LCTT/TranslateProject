fuowang 翻译中

5 ways to change GRUB background in Kali Linux
============================================================


This is a simple guide on how to change GRUB background in Kali Linux (i.e. it’s actually Kali Linux GRUB splash image). Kali dev team did few things that seems almost too much work, so in this article I will explain one of two things about GRUB and somewhat make this post little unnecessarily long and boring cause I like to write! So here goes …

[
 ![Change GRUB background in Kali Linux - blackMORE OPs -10](http://www.blackmoreops.com/wp-content/uploads/2015/11/Change-GRUB-background-in-Kali-Linux-blackMORE-OPs-10.jpg) 
][10]

### Finding GRUB settings

This is usually the first issue everyone faces, where do I look? There’s a many ways to find GRUB settings. Users might have their own opinion but I always found that `update-grub` is the easiest way. If you run `update-grub` in a VMWare/VirtualBox, you will see something like this:

```
root@kali:~# update-grub
Generating grub configuration file ...
Found background image: /usr/share/images/desktop-base/desktop-grub.png
Found linux image: /boot/vmlinuz-4.0.0-kali1-amd64
Found initrd image: /boot/initrd.img-4.0.0-kali1-amd64
  No volume groups found
done
root@kali:~#
```

If you’re using a Dual Boot, Triple Boot then you will see GRUB goes in and finds other OS’es as well. However, the part we’re interested is the background image part, in my case this is what I see (you will see exactly the same thing):

```
Found background image: /usr/share/images/desktop-base/desktop-grub.png
```

### GRUB splash image search order

In grub-2.02, it will search for the splash image in the following order for a Debian based system:

1.  GRUB_BACKGROUND line in `/etc/default/grub`
2.  First image found in `/boot/grub/` ( more images found, it will be taken alphanumerically )
3.  The image specified in `/usr/share/desktop-base/grub_background.sh`
4.  The file listed in the WALLPAPER line in `/etc/grub.d/05_debian_theme`

Now hang onto this info and we will soon revisit it.

### Kali Linux GRUB splash image

As I use Kali Linux (cause I like do stuff), we found that Kali is using a background  image from here: `/usr/share/images/desktop-base/desktop-grub.png`

Just to be sure, let’s check that `.png` file and it’s properties.

```
root@kali:~# 
root@kali:~# ls -l /usr/share/images/desktop-base/desktop-grub.png
lrwxrwxrwx 1 root root 30 Oct  8 00:31 /usr/share/images/desktop-base/desktop-grub.png -> /etc/alternatives/desktop-grub
root@kali:~#
```

[
 ![Change GRUB background in Kali Linux - blackMORE OPs -1](http://www.blackmoreops.com/wp-content/uploads/2015/11/Change-GRUB-background-in-Kali-Linux-blackMORE-OPs-1.jpg) 
][11]

What? It’s just a symbolic link to `/etc/alternatives/desktop-grub` file? But `/etc/alternatives/desktop-grub` is not an image file. Looks like I need to check that file and it’s properties as well.

```
root@kali:~# 
root@kali:~# ls -l /etc/alternatives/desktop-grub
lrwxrwxrwx 1 root root 44 Oct  8 00:27 /etc/alternatives/desktop-grub -> /usr/share/images/desktop-base/kali-grub.png
root@kali:~# 
```

[
 ![Change GRUB background in Kali Linux - blackMORE OPs -3](http://www.blackmoreops.com/wp-content/uploads/2015/11/Change-GRUB-background-in-Kali-Linux-blackMORE-OPs-3.jpg) 
][12]

Alright, that’s confusing as! So `/etc/alternatives/desktop-grub` is another symbolic link which points back to
`/usr/share/images/desktop-base/kali-grub.png`
which is in the same folder we started from. doh! That’s all I can say. But at least now we can just replace that file and get it over with.

Before we do that we need to check the properties of this file `/usr/share/images/desktop-base/kali-grub.png` and ensure that we will download same type and dimension file.

```
root@kali:~# 
root@kali:~# file /usr/share/images/desktop-base/kali-grub.png
/usr/share/images/desktop-base/kali-grub.png: PNG image data, 640 x 480, 8-bit/color RGB, non-interlaced
root@kali:~# 
```

So this file is DEFINITELY a PNG image data, 640 x 480 dimension.

### GRUB background image properties

GRUB 2 can use `PNG`, `JPG`/`JPEG` and `TGA` images for the background. The image must meet the following specifications:

*   `JPG`/`JPEG` images must be `8-bit` (`256 color`)
*   Images should be non-indexed, `RGB`

By default, if `desktop-base` package is installed, images conforming to the above specification will be located in `/usr/share/images/desktop-base/` directory. A quick Google search found similar files. Out of those, I picked one.

```
root@kali:~# 
root@kali:~# file Downloads/wallpaper-1.png 
Downloads/wallpaper-1.png: PNG image data, 640 x 480, 8-bit/color RGB, non-interlaced
root@kali:~# 
```

[
 ![Change GRUB background in Kali Linux - blackMORE OPs -6](http://www.blackmoreops.com/wp-content/uploads/2015/11/Change-GRUB-background-in-Kali-Linux-blackMORE-OPs-6.jpg) 
][13]

### Option 1: replace the image

Now we simply need to replace this `/usr/share/images/desktop-base/kali-grub.png` file with our new file. Note that this is the easiest way without mucking around `grub-config` files. If you are familiar with GRUB, then go ahead and simpy modify GRUB default config and run `update-grub`.

As usual, I will make a backup of the original file by renaming it to `kali-grub.png.bkp`

```
root@kali:~# 
root@kali:~# mv /usr/share/images/desktop-base/kali-grub.png /usr/share/images/desktop-base/kali-grub.png.bkp
root@kali:~# 
```

[
 ![Change GRUB background in Kali Linux - blackMORE OPs -4](http://www.blackmoreops.com/wp-content/uploads/2015/11/Change-GRUB-background-in-Kali-Linux-blackMORE-OPs-4.jpg) 
][14]

Now let’s copy our downloaded file and rename that to `kali-grub.png.bkp`.

```
root@kali:~# 
root@kali:~# cp Downloads/wallpaper-1.png /usr/share/images/desktop-base/kali-grub.png
root@kali:~# 
```

[
 ![Change GRUB background in Kali Linux - blackMORE OPs -5](http://www.blackmoreops.com/wp-content/uploads/2015/11/Change-GRUB-background-in-Kali-Linux-blackMORE-OPs-5.jpg) 
][15]

And finally run `update-grub`

```
root@kali:~# update-grub
Generating grub configuration file ...
Found background image: /usr/share/images/desktop-base/desktop-grub.png
Found linux image: /boot/vmlinuz-4.0.0-kali1-amd64
Found initrd image: /boot/initrd.img-4.0.0-kali1-amd64
  No volume groups found
done
root@kali:~#
```

[
 ![Change GRUB background in Kali Linux - blackMORE OPs -7](http://www.blackmoreops.com/wp-content/uploads/2015/11/Change-GRUB-background-in-Kali-Linux-blackMORE-OPs-7.jpg) 
][16]

Next time you restart your Kali Linux, you will see your own image as the GRUB background. (GRUB splash image).

Following is what my new GRUB splash image looks like in Kali Linux now. What about you? Tried this method yet?

[
 ![Change GRUB background in Kali Linux - blackMORE OPs -9](http://www.blackmoreops.com/wp-content/uploads/2015/11/Change-GRUB-background-in-Kali-Linux-blackMORE-OPs-9.jpg) 
][17]

This was the easiest and safest way, if you muck it up the worst, you will see a Blue background in GRUB but will still be able to login and fix things later. Now if you’re confident, lets move to better ways (bit complex) of changing GRUB settings. Next steps are more fun and works with any Linux using GRUB bootloader.

Now remember those 4 places GRUB looks for a background splash image? Here are those again:

1.  GRUB_BACKGROUND line in `/etc/default/grub`
2.  First image found in `/boot/grub/` ( more images found, it will be taken alphanumerically )
3.  The image specified in `/usr/share/desktop-base/grub_background.sh`
4.  The file listed in the `WALLPAPER` line in `/etc/grub.d/05_debian_theme`

So lets again try few of these options in Kali Linux (or any Linux using GRUB2).

### Option 2: Define an image path in GRUB_BACKGROUND

So you can use any of the above in the order of priority to make GRUB display your own images. The following is the content of `/etc/default/grub` file on my system.

```
root@kali:~# vi /etc/default/grub
```

Add a line similar to this: GRUB_BACKGROUND=”/root/World-Map.jpg” where World-Map.jpg is the image file you want to use as GRUB background.

```
# If you change this file, run 'update-grub' afterwards to update
# /boot/grub/grub.cfg.
# For full documentation of the options in this file, see:
#   info -f grub -n 'Simple configuration'

GRUB_DEFAULT=0
GRUB_TIMEOUT=15
GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`
GRUB_CMDLINE_LINUX_DEFAULT="quiet"
GRUB_CMDLINE_LINUX="initrd=/install/gtk/initrd.gz"
GRUB_BACKGROUND="/root/World-Map.jpg"
```

Once changes has been done using any of the above methods, make sure you execute `update-grub` command as shown below.

```
root@kali:~# update-grub
Generating grub configuration file ...
Found background: /root/World-Map.jpg
Found background image: /root/World-Map.jpg
Found linux image: /boot/vmlinuz-4.0.0-kali1-amd64
Found initrd image: /boot/initrd.img-4.0.0-kali1-amd64
  No volume groups found
done
root@kali:~#
```

Now, when you boot your machine, you will see the customized image in GRUB.

### Option 3: Put an image on /boot/grub/ folder

If nothing is specified in `GRUB_BACKGROUND` in `/etc/default/grub` file, GRUB ideally should pick first image found in `/boot/grub/` folder and use that a its background. If GRUB finds more than one image in /boot/grub/ folder, it will use the first alphanumerically image name.

### Option 4: Specify an image path in grub_background.sh

If nothing is specified in `GRUB_BACKGROUND` in `/etc/default/grub` file or there is no image in `/boot/grub/` folder, GRUB will start looking into `/usr/share/desktop-base/grub_background.sh` file and search for the image path specified. For Kali Linux, it was defined in here. Every Linux distro has it’s own take on it.

### Option 5: Define an image in WALLPAPER line in /etc/grub.d/05_debian_theme file

This would be that last part GRUB looking for a Background image. It will search here if everything else failed.

### Conclusion

This post was long, but I wanted to cover a few important basic things. If you’ve followed it carefully, you will understand how to follow symbolic links back and forth in Kali Linux. You will get a VERY good idea on exactly which places you need to search to find GRUB Background image in any Linux. Just read a bit more to understand how the colors in GRUB works and you’re all set.

--------------------------------------------------------------------------------

via: https://www.blackmoreops.com/2015/11/27/change-grub-background-in-kali-linux/

作者：[https://www.blackmoreops.com/][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.blackmoreops.com/2015/11/27/change-grub-background-in-kali-linux/
[1]:http://www.facebook.com/sharer.php?u=https://www.blackmoreops.com/?p=5958
[2]:https://twitter.com/intent/tweet?text=5+ways+to+change+GRUB+background+in+Kali+Linux%20via%20%40blackmoreops&url=https://www.blackmoreops.com/?p=5958
[3]:https://plusone.google.com/_/+1/confirm?hl=en&url=https://www.blackmoreops.com/?p=5958&name=5+ways+to+change+GRUB+background+in+Kali+Linux
[4]:https://www.blackmoreops.com/how-to/
[5]:https://www.blackmoreops.com/kali-linux/
[6]:https://www.blackmoreops.com/kali-linux-2-x-sana/
[7]:https://www.blackmoreops.com/administration/
[8]:https://www.blackmoreops.com/usability/
[9]:https://www.blackmoreops.com/2015/11/27/change-grub-background-in-kali-linux/#comments
[10]:http://www.blackmoreops.com/wp-content/uploads/2015/11/Change-GRUB-background-in-Kali-Linux-blackMORE-OPs-10.jpg
[11]:http://www.blackmoreops.com/2015/11/27/change-grub-background-in-kali-linux/change-grub-background-in-kali-linux-blackmore-ops-1/
[12]:http://www.blackmoreops.com/2015/11/27/change-grub-background-in-kali-linux/change-grub-background-in-kali-linux-blackmore-ops-3/
[13]:http://www.blackmoreops.com/2015/11/27/change-grub-background-in-kali-linux/change-grub-background-in-kali-linux-blackmore-ops-6/
[14]:http://www.blackmoreops.com/2015/11/27/change-grub-background-in-kali-linux/change-grub-background-in-kali-linux-blackmore-ops-4/
[15]:http://www.blackmoreops.com/2015/11/27/change-grub-background-in-kali-linux/change-grub-background-in-kali-linux-blackmore-ops-5/
[16]:http://www.blackmoreops.com/2015/11/27/change-grub-background-in-kali-linux/change-grub-background-in-kali-linux-blackmore-ops-7/
[17]:http://www.blackmoreops.com/wp-content/uploads/2015/11/Change-GRUB-background-in-Kali-Linux-blackMORE-OPs-9.jpg

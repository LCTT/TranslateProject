Cathon is translating...

# openSUSE on Raspberry Pi 3: From Zero to Functional System in a Few Easy Steps


The following article has been contributed by Dmitri Popov, Technical Writer at the SUSE Documentation team.

Deploying [openSUSE][2] on [Raspberry Pi 3][3] is not all that complicated, but there are a few tricks that smooth the process.

First of all, you have several flavors to choose from. If you plan to use your Raspberry Pi 3 as a regular machine, an openSUSE version with a graphical desktop is your best option. And you can choose between several graphical environments: [X11][4], [Enlightenment][5], [Xfce][6], and [LXQT][7]. There is also the JeOS version of openSUSE which provides a bare-bones system ideal for transforming a Raspberry Pi 3 into a headless server. Better still, you can choose between the [Leap][8] and [Tumbleweed ][9]versions of openSUSE.

 ![](https://www.suse.com/communities/blog/files/2017/02/j5dkkbtepng-dmitri-popov-450x300.jpg) 

The first order of business is to download the desired openSUSE image from [https://en.opensuse.org/HCL:Raspberry_Pi3][10]. Next, you need to create a bootable microSD card. While you can write the downloaded image to a microSD card using command-line tools, [ _Etcher_ ][11] makes the process more enjoyable and safe. Grab the utility from the project’s website, extract the downloaded  _.zip_  file and make the resulting  _.AppImage_  file executable using the command:

 _chmod +x Etcher-x.x.x-linux-x64.AppImage_ 

Plug then a microSD card into your machine, launch Etcher by double-clicking on it, select the downloaded  _.raw.xz_  image file, and press Flash!. Connect a display and keyboard to the Raspberry Pi 3, insert the microSD card in it, and boot the little machine. During the first boot, openSUSE automatically expands the file system to make use of all free space on the card. At some point you’ll see the following message:

```
GPT data structures destroyed! You may now partition the disk using 
fdisk or other utilities
```

There is no need to panic, though. Wait a minute or two, and openSUSE will continue to boot normally. When prompted, log in using the default  _root_  user name and  _linux_  password.

If you choose to deploy JeOS on your Raspberry Pi 3, keep in mind that you won’t see any output in the screen during first boot. This means that the screen will remain blank until the system finishes expanding the file system. While you can configure kernel parameters to show output, it’s probably not worth the hassle. Just wait till you see the command-line prompt.

Since openSUSE comes with SSH enabled and configured, you can boot the Raspberry Pi without a display. In this case, you need to connect the Raspberry Pi to your network via Ethernet. Just give the Raspberry Pi enough time to boot and expand the system, and you can then connect to it via SSH from any other machine on the same network using the  _ssh root@linux.local_  command.

By default, you log in to the system as root, and it’s a good idea to create a regular user. The all-mighty YaST configuration tool lets you do that with consummate ease. Run the  _yast2_  command, switch to the Security and Users -> User and Group Management section, and add a new user. While you are at it, you can update the system in the System -> Online Update section. Once you’ve done that, quit YaST, reboot the Raspberry Pi, and log in as the newly created user.

That’s all fine and dandy, but there is one crucial component of the system that doesn’t work right out of the box: the wireless interface. Fortunately, this issue is easy to solve. First, install the nano text editor using the command:

 _sudo zypper in nano_ 

then run:

 _sudo nano/etc/dracut.conf.d/raspberrypi_modules.conf_ 

to open the  _raspberrypi_modules.conf_  file for editing. Remove  _sdhci_iproc_  in the first line and uncomment the last line. Save the changes, run the command:

 _mkinitrd -f_ 

and reboot the Raspberry Pi.

 ![](https://www.suse.com/communities/blog/files/2017/02/figure1-raspi-450x329.png) 

Launch YaST again, switch to the System -> Network Settings section, and you should see the  _BCM43430 WLAN Card_  entry in the list of network interfaces. Select this entry and press Edit. Enable the Dynamic Address DHCP option, press Next, select the desired wireless network, and configure the required connection settings. Press Next and then OK to save the settings. Reboot the Raspberry Pi, and it should automatically connect to the specified Wi-Fi network.

And that’s it !

--------------------------------------------------------------------------------

via: https://www.suse.com/communities/blog/opensuse-raspberry-pi-3-zero-functional-system-easy-steps/

作者：[chabowski][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.suse.com/communities/blog/author/chabowski/
[1]:https://www.suse.com/communities/blog/author/chabowski/
[2]:https://www.opensuse.org/
[3]:https://www.raspberrypi.org/
[4]:https://www.x.org/wiki/
[5]:https://www.enlightenment.org/
[6]:https://www.xfce.org/
[7]:http://lxqt.org/
[8]:https://www.opensuse.org/#Leap
[9]:https://www.opensuse.org/#Tumbleweed
[10]:https://en.opensuse.org/HCL:Raspberry_Pi3
[11]:https://etcher.io/
[12]:https://www.suse.com/communities/blog/opensuse-raspberry-pi-3-zero-functional-system-easy-steps/#
[13]:https://www.suse.com/communities/blog/opensuse-raspberry-pi-3-zero-functional-system-easy-steps/#
[14]:https://www.suse.com/communities/blog/opensuse-raspberry-pi-3-zero-functional-system-easy-steps/#
[15]:https://www.suse.com/communities/blog/opensuse-raspberry-pi-3-zero-functional-system-easy-steps/#
[16]:https://www.suse.com/communities/blog/opensuse-raspberry-pi-3-zero-functional-system-easy-steps/#
[17]:http://www.printfriendly.com/print?url=https%3A%2F%2Fwww.suse.com%2Fcommunities%2Fblog%2Fopensuse-raspberry-pi-3-zero-functional-system-easy-steps%2F
[18]:http://www.printfriendly.com/print?url=https%3A%2F%2Fwww.suse.com%2Fcommunities%2Fblog%2Fopensuse-raspberry-pi-3-zero-functional-system-easy-steps%2F

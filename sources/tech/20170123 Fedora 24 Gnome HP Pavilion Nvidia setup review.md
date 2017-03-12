# Fedora 24 Gnome & HP Pavilion + Nvidia setup review

Recently, you may have come across my [Chapeau][1] review. This experiment prompted me to widen my Fedora family testing, and so I decided to try setting up [Fedora 24 Gnome][2] on my [HP][3] machine, a six-year-old laptop with 4 GB of RAM and an aging Nvidia card. Yes, Fedora 25 has since been released and I had it [tested][4] with delight. But we can still enjoy this little article now can we?

This review should complement - and contrast - my usual crop of testing on the notorious but capable [Lenovo G50][5] machine, purchased in 2015, so we have old versus new, but also the inevitable lack of proper Linux support for the [Realtek][6] network card on the newer box. We will then also check how well Fedora handles the Nvidia stack, test if Nouveau is a valid alternative, and of course, pimp the system to the max, using some of the beauty tricks we have witnessed in the Chapeau review. Should be more than interesting.

 ![Teaser](http://www.dedoimedo.com/images/computers-years/2016-2/fedora-hp-teaser.jpg) 

### Installation

Nothing special to report here. The system has a much simpler setup than the Lenovo laptop. The new machine comes with UEFI, Secure Boot, 1TB disk with a GPT setup partitioned sixteen different ways, with Windows 10 and some 6-7 Linux distros on it. In comparison, the BIOS-fueled Pavilion only dual boots. Prior to this review, it was running Linux Mint 17.3 [Rosa Xfce][7], but it used to have all sorts of Ubuntu children on it, and I had used it quite extensively for arguably funny [video processing][8] and all sorts of games. The home partition dates back to the early setup, and has remained such since, including a lot of legacy config and many desktop environments.

 ![Live desktop](http://www.dedoimedo.com/images/computers-years/2016-2/fedora-hp-desktop-live.jpg) 

I was able to boot from a USB drive, although I did use the Fedora tool to create the live media. I've never had any problems booting on this host, to the best of my memory, a far cry (not the [game][9], just an expression, hi hi) from the Lenovo experience. There, before a BIOS update, Fedora would [not even run][10], and a large number of distros used to [struggle][11] until very recently. All part of my great disappointment adventure with Linux.

Anyhow, this procedure went without any fuss. Fedora 24 took control of the bootloader, managing itself and the resident Windows 7 installation. If you're interested in more details on how to dual-boot, you might want to check these:

[Ubuntu & Windows 7][12] dual-boot guide

[Xubuntu & Windows 7][13] dual-boot guide - same same but different

[CentOS 7 & Windows 7][14] dual-boot guide - fairly similar to our Fedora attempt

[Ubuntu & Windows 8][15] dual-boot guide - this one covers a UEFI setup, too

### It's pimping time!

My Fedora [pimping guide][16] has it all. I setup RPM Fusion Free and Non-Free, then installed about 700 MB worth of media codecs, plugins and extra software, including Steam, Skype, GIMP, VLC, Gnome Tweak Tool, Chrome, several other helper utilities, and more.

On the aesthetics side, I grabbed both Faenza and Moka icons, and configured half a dozen Gnome [extensions][17], including the mandatory [Dash to Dock][18], which really helps transforms this desktop environment into a usable product.

 ![About, with Nouveau](http://www.dedoimedo.com/images/computers-years/2016-2/fedora-hp-about-nouveau.jpg) 

 ![Final looks](http://www.dedoimedo.com/images/computers-years/2016-2/fedora-hp-final.jpg) 

What is that green icon on the right side? 'Tis a spoiler of things to be, that is.

I also had no problems with my smartphones, [Ubuntu Phone][19] or the[iPhone][20]. Both setups worked fine, and this also brings the annoyance with the Apple device on Chapeau 24 into bad spotlight. Rhythmbox would not play from any external media, though. Fail.

 ![Ubuntu Phone](http://www.dedoimedo.com/images/computers-years/2016-2/fedora-hp-ubuntu-phone.jpg) 

 ![Media works fine](http://www.dedoimedo.com/images/computers-years/2016-2/fedora-hp-media-works-nice.jpg) 

This is a teaser, implying wossname Nvidia thingie; well here we go.

### Nvidia setup

This is a tricky one. First, take a look at my generic [tutorial][21] on this topic. Then, take a look at my recent [Fedora 23][22] [experience][23] on this topic. Unlike Ubuntu, Red Hat distros do not quite like the whole pre-compiled setup. However, just to see whether things have changed in any way, I did use a helper tool called easyLife to setup the drivers. I've talked about this utility and Fedy in an OCS-Mag [article][24], and how you can use them to make your Fedora experience more colorful. Bottom line: good for lots of things, not for drivers, though.

 ![easyLife & Nvidia](http://www.dedoimedo.com/images/computers-years/2016-2/fedora-hp-easylife-nvidia.png) 

Yes, this resulted in a broken system. I had to manually installed the drivers - luckily I had installed the kernel sources and headers, as well as other necessary build tools, gcc and make, beforehand, to prepare for this kind of scenario. Be warned, kids. In the end, the official way is the best.

### Nouveau vs Nvidia, which is faster?

I did something you would not really expect. I benchmarked the actual performance of the graphics stack with the Nouveau driver first and then the closed-source blob, using the Unigine Heaven tool. This gives clear results on how the two compare.

 ![Heaven benchmark](http://www.dedoimedo.com/images/computers-years/2016-2/fedora-hp-heaven-benchmark.jpg) 

Remember, this is an ancient laptop, and it does not stack well against modern tools, so you will not be surprised to learn that Heaven reported a staggering 1 FPS for Nouveau, and it took me like 5 minutes before the system actually responded, and I was able to quit the benchmark.

 ![Nouveau benchmark](http://www.dedoimedo.com/images/computers-years/2016-2/fedora-hp-heaven-nouveau.jpg) 

Nvidia gave much better results. To begin with, I was able to use the system while testing, and Heaven responded to mouse clicks and key strokes, all the while reporting a very humble 5-6 FPS, which means it was roughly 500% more efficient than the Nouveau driver. That tells you all you need to know, ladies and gentlemen.

 ![Nvidia installed](http://www.dedoimedo.com/images/computers-years/2016-2/fedora-hp-nvidia-installed.jpg) 

 ![About, Nvidia installed](http://www.dedoimedo.com/images/computers-years/2016-2/fedora-hp-about-nvidia.jpg) 

 ![Heaven, Nvidia installed, main menu](http://www.dedoimedo.com/images/computers-years/2016-2/fedora-hp-heaven-nvidia-menu.jpg) 

 ![Nvidia benchmark 1](http://www.dedoimedo.com/images/computers-years/2016-2/fedora-hp-heaven-nvidia-1.jpg) 

 ![Nvidia benchmark 2](http://www.dedoimedo.com/images/computers-years/2016-2/fedora-hp-heaven-nvidia-2.jpg) 

 ![Steam works](http://www.dedoimedo.com/images/computers-years/2016-2/fedora-hp-steam-works.jpg) 

Also, Steam would not run at all with Nouveau, so there's that to consider, too. Funny how system requirements creep up over time. I used to play, I mean test [Call of Duty][25], a highly mediocre and arcade-like shooter on this box on the highest settings, but that feat feels like a completely different era.

 ![Nouveau & Steam fail](http://www.dedoimedo.com/images/computers-years/2016-2/fedora-hp-steam-nouveau-fail.png) 

### Hardware compatibility

Things were quite all right overall. All of the Fn buttons worked fine, and so did the web camera. Power management also did its thing well, dimming the screen and whatnot, but we cannot really judge the battery life, as the cells are six years old now and quite broken. They only lend about 40 minutes of juice in the best case.

 ![Webcam](http://www.dedoimedo.com/images/computers-years/2016-2/fedora-hp-webcam.jpg) 

 ![Battery, broken](http://www.dedoimedo.com/images/computers-years/2016-2/fedora-hp-battery-broken.jpg) 

Bluetooth did not work at first, but this is because crucial packages are missing.

 ![Bluetooth does not work out of the box](http://www.dedoimedo.com/images/computers-years/2016-2/fedora-hp-bt-no-work.png) 

You can resolve the issue using dnf:

dnf install blueman bluez

 ![Bluetooth works now](http://www.dedoimedo.com/images/computers-years/2016-2/fedora-hp-bt-works.png) 

### Suspend & resume

No issues, even with the Nvidia drivers. The whole sequence was quick and smooth, about 2-3 seconds each direction, into the land of sweet dreams and out of it. I do recall some problems with this in the past, but not any more. Happy sailing.

### Resource utilization

We can again compare Nouveau with Nvidia. But first, I had to sort out the swap partition setup manually, as Fedora refused to activate it. This is a big fail, and this happens consistently. Anyhow, the resource utilization with either one driver was almost identical. Both tolled a hefty 1.2 GB of RAM, and CPU ticked at about 2-3%, which is not really surprising, given the age of this machine. I did not see any big noise or heat difference the way we would witness it in the past, which is a testament to the improvements in the open-source driver, even though it fails on some of the advanced graphics logic required from it. But for normal use, non-gaming use, it behaves fairly well.

 ![Resources, Nouveau](http://www.dedoimedo.com/images/computers-years/2016-2/fedora-hp-resources-nouveau.jpg) 

### Problems

Well, I observed some interesting issues during my testing. SELinux complained about legitimate processes a few times, and this really annoys me. Now to troubleshoot this, all you need to do is expand the alert, check the details, and then vomit. Why would anyone let ordinary users ever see this. Why?

 ![SELinux alerts](http://www.dedoimedo.com/images/computers-years/2016-2/fedora-hp-selinux.png) 

 ![SELinux alerts, more](http://www.dedoimedo.com/images/computers-years/2016-2/fedora-hp-selinux-more.png) 

SELinux is preventing totem-video-thu from write access on the directory gstreamer-1.0.

***** Plugin catchall_labels (83.8 confidence) suggests *****

If you want to allow totem-video-thu to have write access on the gstreamer-1.0 directory
Then you need to change the label on gstreamer-1.0
Do
# semanage fcontext -a -t FILE_TYPE 'gstreamer-1.0'
where FILE_TYPE is one of the following: cache_home_t, gstreamer_home_t, texlive_home_t, thumb_home_t, thumb_tmp_t, thumb_tmpfs_t, tmp_t, tmpfs_t, user_fonts_cache_t, user_home_dir_t, user_tmp_t.
Then execute:
restorecon -v 'gstreamer-1.0'

I want to execute something else, because hey, let us let developers be in charge of how things should be done. They know [best][26], right! This kind of garbage is what makes zombie apocalypses happen, when you miscode the safety lock on a lab confinement.

### Other observations

Exploring the system with gconf-editor and dconf-editor, I found tons of leftover settings from my old Gnome 2, Xfce and Cinnamon setups, and one of the weird things was that Nemo would create, or rather, restore, several desktop icons every time I had it launched, and it did not cooperate with the global settings I configured through the Tweak Tool. In the end, I had to resort to some command line witchcraft:

gsettings set org.nemo.desktop home-icon-visible false
gsettings set org.nemo.desktop trash-icon-visible false
gsettings set org.nemo.desktop computer-icon-visible false

### Gallery

Finally, some sweet screenshots:

 ![Nice desktop 1](http://www.dedoimedo.com/images/computers-years/2016-2/fedora-hp-nice-1.jpg) 

 ![Nice desktop 2](http://www.dedoimedo.com/images/computers-years/2016-2/fedora-hp-nice-2.jpg) 

 ![Nice desktop 3](http://www.dedoimedo.com/images/computers-years/2016-2/fedora-hp-nice-3.jpg) 

 ![Nice desktop 4](http://www.dedoimedo.com/images/computers-years/2016-2/fedora-hp-nice-4.jpg) 

 ![Nice desktop 5](http://www.dedoimedo.com/images/computers-years/2016-2/fedora-hp-nice-5.jpg) 

### Conclusion

This was an interesting ordeal. It took me about four hours to finish the configuration and polish the system, the maniacal Fedora update that always runs in the deep hundreds and sometimes even thousands of packages, the graphics stack setup, and finally, all the gloss and trim needed to have a functional machine.

All in all, it works well. Fedora proved itself to be an adequate choice for the old HP machine, with decent performance and responsiveness, good hardware compatibility, fine aesthetics and functionality, once the extras are added, and only a small number of issues, some related to my laptop usage legacy. Not bad. Sure, the system could be faster, and Gnome isn't the best choice for olden hardware. But then, for something that was born in 2010, the HP laptop handles this desktop environment with grace, and it looks the part. Just proves that Red Hat makes a lot of sense once you release its essential oils and let the fragrance of extra software and codecs sweep you. It is your time to be enthused about this and commence your own testing.

Cheers.

--------------------------------------------------------------------------------

作者简介：

My name is Igor Ljubuncic. I'm more or less 38 of age, married with no known offspring. I am currently working as a Principal Engineer with a cloud technology company, a bold new frontier. Until roughly early 2015, I worked as the OS Architect with an engineering computing team in one of the largest IT companies in the world, developing new Linux-based solutions, optimizing the kernel and hacking the living daylights out of Linux. Before that, I was a tech lead of a team designing new, innovative solutions for high-performance computing environments. Some other fancy titles include Systems Expert and System Programmer and such. All of this used to be my hobby, but since 2008, it's a paying job. What can be more satisfying than that?

From 2004 until 2008, I used to earn my bread by working as a physicist in the medical imaging industry. My work expertise focused on problem solving and algorithm development. To this end, I used Matlab extensively, mainly for signal and image processing. Furthermore, I'm certified in several major engineering methodologies, including MEDIC Six Sigma Green Belt, Design of Experiment, and Statistical Engineering.

I also happen to write books, including high fantasy and technical work on Linux; mutually inclusive.

Please see my full list of open-source projects, publications and patents, just scroll down.

For a complete list of my awards, nominations and IT-related certifications, hop yonder and yonder please.


-------------


via: http://www.dedoimedo.com/computers/hp-pavilion-fedora-24.html

作者：[Igor Ljubuncic][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.dedoimedo.com/faq.html

[1]:http://www.dedoimedo.com/computers/chapeau-24.html
[2]:http://www.dedoimedo.com/computers/fedora-24-gnome.html
[3]:http://www.dedoimedo.com/computers/my-new-new-laptop.html
[4]:http://www.dedoimedo.com/computers/fedora-25-gnome.html
[5]:http://www.dedoimedo.com/computers/lenovo-g50-review.html
[6]:http://www.dedoimedo.com/computers/ubuntu-xerus-realtek-bug.html
[7]:http://www.dedoimedo.com/computers/linux-mint-rosa-xfce.html
[8]:http://www.dedoimedo.com/computers/frankenstein-media.html
[9]:http://www.dedoimedo.com/games/far-cry-4-review.html
[10]:http://www.dedoimedo.com/computers/lenovo-g50-fedora.html
[11]:http://www.dedoimedo.com/computers/lenovo-g50-distros-second-round.html
[12]:http://www.dedoimedo.com/computers/dual-boot-windows-7-ubuntu.html
[13]:http://www.dedoimedo.com/computers/dual-boot-windows-7-xubuntu.html
[14]:http://www.dedoimedo.com/computers/dual-boot-windows-7-centos-7.html
[15]:http://www.dedoimedo.com/computers/dual-boot-windows-8-ubuntu.html
[16]:http://www.dedoimedo.com/computers/fedora-24-pimp.html
[17]:http://www.dedoimedo.com/computers/fedora-23-extensions.html
[18]:http://www.dedoimedo.com/computers/gnome-3-dash.html
[19]:http://www.dedoimedo.com/computers/ubuntu-phone-sep-2016.html
[20]:http://www.dedoimedo.com/computers/iphone-6-after-six-months.html
[21]:http://www.dedoimedo.com/computers/fedora-nvidia-guide.html
[22]:http://www.dedoimedo.com/computers/fedora-23-nvidia.html
[23]:http://www.dedoimedo.com/computers/fedora-23-nvidia-steam.html
[24]:http://www.ocsmag.com/2015/06/22/you-can-leave-your-fedora-on/
[25]:http://www.dedoimedo.com/games/cod-mw2.html
[26]:http://www.ocsmag.com/2016/10/19/systemd-progress-through-complexity/

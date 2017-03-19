# OpenSUSE Leap 42.2 Gnome - Better but not really

Updated: February 6, 2017

It is time to give Leap a second chance. Let me be extra corny. Give leap a chance. Yes. Well, several weeks ago, I reviewed the Plasma edition of the latest [openSUSE][1] release, and while it was busy firing all cannon, like a typical Stormtrooper, most of the beams did not hit the target. It was a fairly mediocre distro, delivering everything but then stopping just short of the goodness mark.

I will now conduct a Gnome experiment. Load the distro with a fresh new desktop environment, and see how it behaves. We did something rather similar with CentOS recently, with some rather surprising results. Hint. Maybe we will get lucky. Let's do it.

 ![Teaser](http://www.dedoimedo.com/images/computers-years/2016-2/opensuse-gnome-teaser.jpg) 

### Gnome it up

You can install new desktop environments by checking the Patterns tab in YaST > Software Management. Specifically, you can install Gnome, Xfce, LXQt, MATE, and others. A very simple procedure worth some 900 MB of disk data. No errors, no woes.

 ![Patterns, Gnome](http://www.dedoimedo.com/images/computers-years/2016-2/opensuse-gnome-patterns.png) 

### Pretty Gnome stuff

I spent a short period of time taming openSUSE. Having had a lot of experience with [Fedora 24][2] doing this exact same stuff, i.e. [pimping][3], the procedure was rather fast and simple. Get some Gnome [extensions][4] first. Keep on low fire for 20 minutes. Stir and serve in clay bowls.

For dessert, launch Gnome Tweak Tool and add the window buttons. Most importantly, install the abso-serious-lutely needed, life-saving [Dash to Dock][5] extension, because then you can finally work like a human being without that maddening lack of efficiency called Activities. Digest, toss in some fresh [icons][6], and Bob's our uncle. All in all, it took me exactly 42 minutes and 12 seconds to get this completed. Get it? 42.2 minutes. OMGZ!

 ![Gnome 1](http://www.dedoimedo.com/images/computers-years/2016-2/opensuse-gnome-1.jpg) 

 ![Gnome 2](http://www.dedoimedo.com/images/computers-years/2016-2/opensuse-gnome-2.jpg) 

### Other customization and tweaks

I actually used Breeze window decorations in Gnome, and this seems to work very well. So much better than trying to customize Plasma. Behold and weep, for the looks were dire and pure!

 ![Gnome 3](http://www.dedoimedo.com/images/computers-years/2016-2/opensuse-gnome-3.jpg) 

 ![Gnome 4](http://www.dedoimedo.com/images/computers-years/2016-2/opensuse-gnome-4.jpg) 

### Smartphone support

So much better than Plasma - both [iPhone][7] and [Ubuntu Phone][8] were correctly identified and mounted. This reminds me of all the discrepancies and inconsistencies in the behavior of the [KDE][9] and [Gnome][10] editions of CentOS 7.2\. So this definitely crosses the boundaries of specific platforms. It has everything to do with the desktop environment.

 ![Ubuntu Phone](http://www.dedoimedo.com/images/computers-years/2016-2/opensuse-gnome-ubuntu-phone.jpg) 

The one outstanding bug is, you need to purge icon cache sometimes, or you will end up with old icons in file
managers. There will be a whole article on this coming soon.

### Multimedia

No luck. Same problems like the Plasma edition. Missing dependencies. Can't have H.264 codecs, meaning you cannot really watch 99% of all the things that you need. That's like saying, no Internet for a month.

 ![Failed codecs setup](http://www.dedoimedo.com/images/computers-years/2016-2/opensuse-gnome-failed-codecs.png) 

### Resource utilization

The Gnome edition is faster than the Plasma one, even with the Compositor turned off, and ignoring the KWin crashes and freezes. The CPU ticks at about 2-3%, and memory hovers around the 900MB mark. Middle of the road results, I say.

 ![Resources](http://www.dedoimedo.com/images/computers-years/2016-2/opensuse-gnome-resources.jpg) 

### Battery usage

Worse than Plasma actually. Not sure why. But even with the brightness adjusted to about 50%, Leap Gnome gave my G50 only about 2.5 hours of electronic love. I did not explore as to where it all gets wasted, but it sure does.

 ![Battery usage](http://www.dedoimedo.com/images/computers-years/2016-2/opensuse-gnome-battery.jpg) 

### Weird issues

There were also some glitches and errors. For instance, the desktop keeps on asking me for the Wireless password, maybe because Gnome does not handle KWallet very well or something. Also, KWin was left running after I logged out of a Plasma session, eating a good solid 100% CPU until I killed it. Such a disgrace.

 ![KWin leftover](http://www.dedoimedo.com/images/computers-years/2016-2/opensuse-gnome-kwin-leftover.jpg) 

### Hardware support

Suspend & resume, alles gut. I did not experience network drops in the Gnome version yet. The webcam works, too. In general, hardware support seems quite decent. Bluetooth works, though. Yay! Maybe we should label this under networking? To wit.

 ![Webcam](http://www.dedoimedo.com/images/computers-years/2016-2/opensuse-gnome-webcam.jpg) 

 ![Bluetooth works](http://www.dedoimedo.com/images/computers-years/2016-2/opensuse-gnome-bt-works.png) 

### Networking

Samba printing? You get that same, lame applet like in [Yakkety Yak][11], which all gets messed up visually. But then it says no print shares, check firewall. Ah whatever. It's no longer 1999\. Being able to print is not a privilege, it's a basic human right. People have staged revolutions over far less. And I cannot take a screenshot of this. That bad.

### The rest of it?

All in all, it was a standard Gnome desktop, with its slightly mentally challenged approach to computing and ergonomics, tamed through the rigorous use of extensions. It is a little friendlier than the Plasma version, and you get better overall results with most of the normal, everyday stuff. Then you get stumped by a silly lack of options that Plasma has in overwhelming abundance. But then you remember your desktop isn't freezing every minute or so, and that's a definite bonus.

### Conclusion

OpenSUSE Leap 42.2 Gnome is a better product than its Plasma counterpart, and no mistake. It is more stable, it is faster, more elegant, more easily customizable, and most of the critical everyday functions actually work. For example, you can print to Samba, if you are inclined to fight the firewall, copy files to Samba without losing timestamps, use Bluetooth, use your Ubuntu Phone, and all this without the crippling effects of constant crashes. The entire stack is just more fully featured and better supported.

However, Leap is still only a reasonable release and nothing more. It struggles in many core areas that other distros do with more panache and elegance, and there are some big, glaring problems in the overall product that are a direct result of bad QA. At the very least, this lack of quality has been an almost consistent element with openSUSE these past few years. Now and then, you get a decent hatchling, but most of them are just average. That's probably the word that best defines openSUSE Leap. Average. You should try and see for yourself. You will most likely not be amazed. Such a shame, because for me, SUSE has a sweet spot, and yet, it stubbornly refuses to rekindle the love. 6/10\. Have a go, play with your emotions.

Cheers.

--------------------------------------------------------------------------------

作者简介：

My name is Igor Ljubuncic. I'm more or less 38 of age, married with no known offspring. I am currently working as a Principal Engineer with a cloud technology company, a bold new frontier. Until roughly early 2015, I worked as the OS Architect with an engineering computing team in one of the largest IT companies in the world, developing new Linux-based solutions, optimizing the kernel and hacking the living daylights out of Linux. Before that, I was a tech lead of a team designing new, innovative solutions for high-performance computing environments. Some other fancy titles include Systems Expert and System Programmer and such. All of this used to be my hobby, but since 2008, it's a paying job. What can be more satisfying than that?

From 2004 until 2008, I used to earn my bread by working as a physicist in the medical imaging industry. My work expertise focused on problem solving and algorithm development. To this end, I used Matlab extensively, mainly for signal and image processing. Furthermore, I'm certified in several major engineering methodologies, including MEDIC Six Sigma Green Belt, Design of Experiment, and Statistical Engineering.

I also happen to write books, including high fantasy and technical work on Linux; mutually inclusive.

Please see my full list of open-source projects, publications and patents, just scroll down.

For a complete list of my awards, nominations and IT-related certifications, hop yonder and yonder please.


-------------


via: http://www.dedoimedo.com/computers/opensuse-42-2-gnome.html

作者：[Igor Ljubuncic][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.dedoimedo.com/faq.html

[1]:http://www.dedoimedo.com/computers/opensuse-42-2.html
[2]:http://www.dedoimedo.com/computers/fedora-24-gnome.html
[3]:http://www.dedoimedo.com/computers/fedora-24-pimp.html
[4]:http://www.dedoimedo.com/computers/fedora-23-extensions.html
[5]:http://www.dedoimedo.com/computers/gnome-3-dash.html
[6]:http://www.dedoimedo.com/computers/fedora-24-pimp-more.html
[7]:http://www.dedoimedo.com/computers/iphone-6-after-six-months.html
[8]:http://www.dedoimedo.com/computers/ubuntu-phone-sep-2016.html
[9]:http://www.dedoimedo.com/computers/lenovo-g50-centos-kde.html
[10]:http://www.dedoimedo.com/computers/lenovo-g50-centos-gnome.html
[11]:http://www.dedoimedo.com/computers/ubuntu-yakkety-yak.html

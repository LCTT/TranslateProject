Fix No Sound In Ubuntu 14.04 As HDMI Enabled BY Default
================================================================================
Sound problem is not new in Ubuntu. I have previously written on various ways to [fix “no sound” issue in Ubuntu][1]. But the soud issue I am going to discuss here is different than those mentioned in the other article.

So I installed Ubuntu 14.04, actually re-installed it. As always, I did all those [things to do after a fresh install of Ubuntu 14.04][2]. And than I realized that the system had no sound. While investigating the issue I found one strange thing. I checked [alsamixer][3] and it was in a weird state:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/06/alsamixer_Set_HDMI_Default.jpeg)

As you can see, **HDMI is set by default in alsamixer**. Which means by default HDMI output has been selected instead of the built in speakers. This is why I get no sound from the built in speakers in my system.

Use the following command to check the state of alsamixer:

    alsamixer

If alsamixer is set by default to HDMI or some other audio output, continue this article to see how can we fix it.

### Fixing no sound in Ubuntu when HDMI is set as default ###

Now to force Ubuntu to use analog output instead of HDMI by default, we need a little information. Open a terminal and use the following command:

    aplay -l

This will list the devices, card number etc. Note down the card and device number for analog output. For me the output was like this:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/07/AlsaMixer_List_Device.jpeg)

Once you have the required card and device number, make a new configuration file like this:

    sudo gedit /etc/asound.conf

The above command will also open the file. Add the following lines to it, replacing with your card and device number of course:

    defaults.pcm.card 1
    defaults.pcm.device 0

Save the file and restart the computer. You should hear the sound now. Just to mention, this will work for all the Linux distributions such as Linux Mint, Elementary OS, Fedora, Arch Linux etc. As I said previously, this “no sound fix” only works with the case where HDMI is set by default. For other cases, you can read [this article about fixing no sound issue in Ubuntu and Linux Mint][4].

Feel free to use the comment section to let me know if it worked or not or if you have some better trick to handle this such issue. Ciao ![](http://itsfoss.itsfoss.netdna-cdn.com/wp-includes/images/smilies/icon_smile.gif)

----------

![](http://1.gravatar.com/avatar/20749c268f5d3e4d2c785499eb6a17c0?s=100&r=pg&d=mm)

About Abhishek

I am Abhishek Prakash, 'creator' of It's F.O.S.S. I have a Masters in Communication System Engineering. I am an avid Linux lover and Open Source enthusiast. I use Ubuntu and believe in sharing knowledge. Apart from Linux, I love classic detective mystery. Huge fan of Agatha Christie work. Feel free to circle me on [Google Plus][g] and Follow [@abhishek_pc][t]

--------------------------------------------------------------------------------

via: http://itsfoss.com/fix-sound-ubuntu-1404/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://itsfoss.com/fix-sound-ubuntu-1304-quick-tip/
[2]:http://itsfoss.com/things-to-do-after-installing-ubuntu-14-04/
[3]:http://en.wikipedia.org/wiki/Alsamixer
[4]:http://itsfoss.com/fix-sound-ubuntu-1304-quick-tip/
[g]:https://plus.google.com/u/0/110180944531110746460
[t]:https://twitter.com/abhishek_pc
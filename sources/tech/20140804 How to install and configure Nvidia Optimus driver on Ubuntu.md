[translating by KayGuoWhu]
How to install and configure Nvidia Optimus driver on Ubuntu
================================================================================
Nvidia Optimus is a hybrid GPU system which utilises what is known as "discrete switching" and has been long associated with headaches and limitations on Linux systems. After years of wait, Ubuntu 14.04 with its shiny new kernel finally shipped with proprietary driver compatibility that can be installed easily. This article will guide you through the installation process after quick background of Nvidia Optimus for the unfamiliar readers. For the seasoned destroyer of Xorg configuration, you can quickly jump to the installation section below.

### Background ###

To those who aren't aware of Nvidia Optimus, it essentially alternates between using the onboard Intel graphics chipset and the more powerful NVIDIA card on demand using a process referred to as "GPU switching". Its purpose is to prolong battery life in notebooks, allowing the Nvidia GPU to switch off when there is no need for it. The benefits are obvious, allowing say 8 hours of battery life if simply typing in a word processor, or 3 hours if watching HD videos. That is if you are using Windows.

![](https://farm6.staticflickr.com/5581/14612159387_2e89a52085_z.jpg)

A couple of years ago I purchased a netbook (Asus VX6), and made the stupid mistake of not checking for Linux driver compatibility because it had never really been an issue before - especially for a netbook sized device. Even if a driver didn't work straight out of the box, I could always get it working one way or another whether installing a proprietary module or using backports. This was a first for me - my device came equipped with an Nvidia ION2 graphics card.

At the time Nvidia's Optimus hybrid GPU hardware was a relatively new thing, and I did not foresee the limitations I encountered running Linux on this machine. If you're reading this, are experienced with Linux systems and have purchased a notebook in the past for years, you might be familiar with this pain also.

The [Bumblebee][1] project was until recently as good as it gets in terms of Linux support for hybrid graphics. It was actually possible if configured correctly to utilise the Nvidia card for a desired application via CLI (i.e. 'optirun vlc'), but getting things like HDMI to work was a different story.

I used the phrase 'if configured correctly' because actually getting it working more often than not just broke your Xorg configuration on first few attempts. If you hadn't used ppa-purge or run 'dpkg-reconfigure -phigh xserver-xorg' before, then I can assure you that tinkering with Bumblebee taught them to you pretty quickly.

[![](https://farm6.staticflickr.com/5588/14798680495_947c38b043_o.png)][2]

It's been a very long wait for Nvidia to release Linux driver support for Optimus, and we still don't have the actual support for discrete switching. However, now with Ubuntu 14.04, nvidia-prime and the nvidia-331 driver, one can choose between the Intel or Nvidia card easily. Unfortunately it is still limited further by requiring restarting X11 (achieved by logout and login) for the change to take effect.

To make this slightly less inconvenient, there is an applet for quick switching, which can I'll get to later, but installation of the driver is a breeze and HDMI works so that's enough to satisfy me.

### Install Nvidia Optimus Driver ###

To run through the process quickly, I'll be assuming you've got a fresh install of Ubuntu 14.04 or Mint 17 ready to go.

Working as a sysadmin, I find 90% of Linux tasks these days quicker via CLI, but this time I recommend simply using the 'Additional Drivers' application that you're probably familiar with for installing proprietary NIC or sound drivers.

![](https://farm4.staticflickr.com/3886/14795564221_753f9e2d99_z.jpg)

**NOTE: All commands shown below preceded by ~# need to be run as root. Be sure to either 'sudo su' before running commands, or run with sudo at beginning of command.**

You can also do it via CLI by installing:

     ~# apt-get install nvidia-331 nvidia-settings nvidia-prime 

followed by a reboot. Make sure you don't have any packages like Bumblebee or other loaded Nvidia drivers, otherwise it'll probably just break your X11. In case you aren't working with a clean install and did previously install Bumblebee etc, run the following before installing nvidia-331 and nvidia-prime:

     ~# apt-get purge libvdpau-va-gl1 bumblebee* nvidia* 

### Switch between Nvidia non-Nvidia Cards ###

You can switch between Nvidia and non-Nvidia (e.g., Intel) cards by pressing Alt+F2 or typing from terminal:

    ~$ nvidia-settings 

#### NOTE: ~$ means do not run as root user. ####

Chose the desired card, then log out and log back in.

![](https://farm4.staticflickr.com/3921/14796320814_de5c9882c2_z.jpg)

You can also use CLI to set which card to use as default:

    ~# prime-select intel (or nvidia)

As well as switch cards using:

    ~# prime-switch intel (or nvidia)

Both commands require restarting X11 to take effect, which can also be achieved by simply logging out and back in. A reboot will also suffice.

For Ubuntu users:

    ~# service lightdm restart

For Mint users:

    ~# service mdm restart

To verify which card is running:

    ~# prime-select query

And lastly you can install the prime-indicator package from ppa:nilarimogard/webupd8 which allows for a quick switch from the tool bar which restarts your Xserver session for you as well. To install it, simply run:

    ~# add-apt-repository ppa:nilarimogard/webupd8
    ~# apt-get update
    ~# apt-get install mesa-utils prime-indicator 

### Summary ###

In conclusion, it's still not ideal, but at least it's nice and simple with proper proprietary support. Many people often still opt for Bumblebee over this setup because they find using the Nvidia driver only runs their battery dead in no time. For my personal usage this setup is the better way to go as I only use the Nvidia card for HDMI out, which implies that I will have it plugged into power. Otherwise Intel suffices for my portable usage as I don't require anything beyond LibreOffice, Chromium and Terminator on the go.

If you would prefer the idea of running Intel as default and specifying to run specific applications utilising Nvidia card, instead direct your reading to the many Bumblebee tutorials out there. I advise in the instance of Bumblebee once you finally get it working properly to document the commands and process used to configure for your device as there is nothing worse than doing a clean install 9 months later and forgetting what was done to get it working last time.

It may also be worthwhile checking out [this script][3] I stumbled across, which serves to easily switch between Bumblebee and Nvidia-Prime, but I must stress that I have not tested it myself.

Finally, I feel it is a massive shame that it's taken this long to get proprietary support for this cards on Linux and still no support for discrete switching, considering that hybrid graphics appear to be the future for portable devices. Normally AMD are associated with dropping the ball for driver support on Linux, but in my eyes Optimus is by far the worse hardware support issue I have encountered.

Regardless of whether this is ideal for your usage, it is the easiest way to go utilising that NVIDIA card. Try running the newest Unity on the Intel card alone and decide for yourself whether 2-3 hours battery life is worthy trade off.

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/08/install-configure-nvidia-optimus-driver-ubuntu.html

作者：[Christopher Ward][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/christopher
[1]:http://bumblebee-project.org/
[2]:http://xkcd.com/963
[3]:https://devtalk.nvidia.com/default/topic/705993/easy-switch-between-bumblebee-and-nvidia-prime/
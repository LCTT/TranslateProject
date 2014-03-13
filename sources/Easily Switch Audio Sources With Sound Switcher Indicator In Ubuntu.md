Translating---------------------geekpi



Easily Switch Audio Sources With Sound Switcher Indicator In Ubuntu
================================================================================
![](http://itsfoss.com/wp-content/uploads/2014/02/Sound_switcher_Indicator.jpeg)

Sound Switcher Indicator is an applet indicator developed by [Dmitry Kann][1]. The purpose of the applet indicator is very simple, it lets you switch between different audio sources such as integrated speakers, headphone and HDMI in two mouse clicks.

Big deal, you may say. After all its no rocket science. You can go to **System Settings-> Sound Settings** and can easily choose the input or output source you want. **Sound Switcher Indicator** does not do something new or something that Ubuntu does not provide, it just simplifies the whole process. This may be one of the reason why it may not be counted as one of the [best indicator applets for Ubuntu][2].

How often do you need to change the audio source? For me, I have to change the audio source each time to [get sound through HDMI in external monitor][3]. And then I have to do it again after disconnecting the HDMI cable. This applet indicator comes handy for people like me who frequently switch between audio source and are lazy![](http://itsfoss.com/wp-includes/images/smilies/icon_razz.gif)

### Install Sound Switcher Indicator in Ubuntu: ###

Open a terminal and use the following commands to install Sound Switcher Indicator in Ubuntu:

    sudo apt-add-repository ppa:yktooo/ppa
    sudo apt-get update
    sudo apt-get install indicator-sound-switcher

#### Important note: ####

Sound Switcher Indicator does not start automatically. To start it automatically, you’ll have to add it to **Startup Applications**. Open **Startup Applications** and click on **Add**. Here, give it a name, Sound Switcher for example and use “indicator-sound-switcher” (without quotes)  in **Command** section. Let me know if you have issues adding it to start up applications.

What you think of Sound Switcher Indicator? Do small applets like these are beneficial for users? Do let us know of your views.

--------------------------------------------------------------------------------

via: http://itsfoss.com/sound-switcher-indicator-ubuntu/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://yktoo.com/about
[2]:http://itsfoss.com/7-best-indicator-applets-for-ubuntu-13-10/
[3]:http://itsfoss.com/how-to-fix-no-sound-through-hdmi-in-external-monitor-in-ubuntu/

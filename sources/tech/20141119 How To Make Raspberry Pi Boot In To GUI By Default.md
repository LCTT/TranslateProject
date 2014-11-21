How To Make Raspberry Pi Boot In To GUI By Default
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/11/raspberry_pi_gui.jpg)

It’s been some times since I bought Raspberry Pi but honestly, I hardly did anything with it. Since my Dell Ultrabook is in Dell service center (for weeks now), I started using Raspberry Pi once again as an alternative.

I have previously written about [how to install Raspbian OS on a SD card in Ubuntu][1]. I did the same once again and installed Raspberry Pi once again. Only thing which I missed at the first run was to set up the GUI. And thus when I booted in Raspberry Pi again, I landed in command line directly. So how to you run Raspbian GUI then?

### Set up Raspbian GUI boot ###

When you install Raspbian for the first time, it indeed present several option to configure for the first use. But since I did not pay attention in a hurry, I just tabbed finish on that screen. If you faced the same situation and end up with just command line in Raspbian OS, no need to despair, it is very easy to set up Raspberry Pi to boot in GUI by default. Let’s see how to do it.

### Step 1: ###

When you are in the command line, log in with default user password (if you did not change it). Default user for Raspbian OS is pi and the default password should be raspberry.

#### Step 2: ####

When you are logged in, run the following command:

    sudo raspi-config

This command will open up the Raspberry Pi configuration, the same which we saw in the first boot.

#### Step 3: ####

In this configuration screen, look for the option of **Enable Boot to Desktop/Scratch**. Select it using a combination of arrow, tab and/or enter keys (I forgot which ones are used).

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/11/Raspbian_Gui_setup.jpg)

#### Step 4: ####

In the next screen, choose **Desktop Login as user ‘Pi’ at the graphical desktop.
**

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/11/Raspbian_Gui_setup_1.jpg)

#### Step 5: ####

You’ll be asked to reboot afterwards.

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/11/Raspbian_Gui_setup_2.jpg)

On the next boot, you will be logged in to LXDE desktop environment. And you can enjoy the GUI experience with Raspberry Pi.

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/11/raspbian-welcome-screen-gui.jpeg)

I hope this tutorial helped you to set up your Raspberry Pi to boot in GUI by default. Feel free to drop your questions and suggestions in the comment box.

--------------------------------------------------------------------------------

via: http://itsfoss.com/raspberry-pi-gui-boot/

作者：[Abhishek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/Abhishek/
[1]:http://itsfoss.com/tutorial-how-to-install-raspberry-pi-os-raspbian-wheezy/
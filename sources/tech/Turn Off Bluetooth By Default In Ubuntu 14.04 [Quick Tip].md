alim0x translating

Turn Off Bluetooth By Default In Ubuntu 14.04 [Quick Tip]
================================================================================
![](http://itsfoss.com/wp-content/uploads/2014/05/Bluetooth_Ubuntu.jpeg)

I recently bought a new Dell Inspiron 7437 and one of the first few things I did was to [dual boot the pre-installed Windows 8 with Ubuntu 14.04][1]. My older laptop did not have Bluetooth, strange but true. This is why I never noticed that **Bluetooth is always on at each boot in Ubuntu**.

This is not good, from both power saving and security purpose. Moreover, I hardly use Bluetooth, so why should I have Bluetooth enabled by default? While one can turn off Bluetooth in one click in Ubuntu, doing it in each session is a repetitive and frustrating task. Simpler solution is to **deactivate Bluetooth at start up in Ubuntu**.

In today’s quick post, I’ll share with you how to disable Bluetooth by default at each start up.

### Turn off Bluetooth by default in Ubuntu 14.04: ###

Open a terminal and use the following command to install [gksu][2], if you dot have it installed it already.

    sudo apt-get install gksu

gksu is used to enter password while running a program as root. Once you have gksu installed, use the command below:

    gksudo gedit /etc/rc.local

It will open the rc.local file. Just add the following line just before exit 0.

    rfkill block bluetooth

Altogether, your rc.local file look like this:

![](http://itsfoss.com/wp-content/uploads/2014/05/rfkill_Bluetooth.png)

That would be it. Restart the computer and you should see that Bluetooth has been disabled. Of course you can turn it on when required by the Bluetooth indicator on the top panel.

### Explanation: ###

This little section is just to give a brief explanation of what we did here. It’s not obligatory to read this section. You can skip to comment section for your suggestions or thanks :)

rc.local file is used to run various shell commands at start up time. These commands are user defined. In a clean install, rc.local has no commands to run. What we did here was to add **rfkill block bluetooth**. [rfkill][3] is a tool to query the state of various switches, buttons and subsytem interfaces. With this command in rc.localm we are basically soft blocking Bluetooth at each start up time. I hope this explains the things a bit.

--------------------------------------------------------------------------------

via: http://itsfoss.com/turn-off-bluetooth-by-default-in-ubuntu-14-04/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://itsfoss.com/install-ubuntu-1404-dual-boot-mode-windows-8-81-uefi/
[2]:https://wiki.gnome.org/action/show/Apps/Attic/gksu?action=show&redirect=gksu
[3]:http://wireless.kernel.org/en/users/Documentation/rfkill

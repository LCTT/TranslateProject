Fix Unity Freezes After Login In Ubuntu 14.04 [Quick Tip]
================================================================================
If you upgraded Ubuntu 13.10 to Ubuntu 14.04, you might end up with **Unity freezing at login time**. You boot in to Ubuntu 14.04, enter your credential and the system just hangs up, freezes. If you are lucky, you might see mouse cursor, background wallpaper but nothing else. **No Unity launcher, no top panel** etc. Basically you will have Ubuntu in an unusable state.

This problem of missing Unity launcher, panel and system freeze can be solved by re-installing Unity. Let’s see how to do that:

### Reinstall Unity in Ubuntu 14.04 to fix system freeze issue ###

Well, since you are stuck with a frozen system, use **Ctrl+Alt+F2** key. This will take you to command line interface (instead of the default graphical user interface). You will be asked to enter your credentials. After you enter your username and password, use the following commands one by one to reinstall Unity desktop.

    sudo apt-get update
    sudo apt-get install –reinstall ubuntu-desktop
    sudo apt-get install unity
    sudo shutdown -r now

The last command will reboot your system. After the reboot, you should have Unity working as normal.

### Fixing Unity freeze issue with Nvidia graphics: ###

I don’t have experience with Nvidia graphics but I found some people mentioning additional steps for system with Nvidia graphics card. While the above trick worked for my system, I cannot verify the one below. People with Nvidia graphics, please confirm that the steps below work for your system:

Press Ctrl+Alt+F2 to use command line. And after entering username and password, use the following commands one by one:

    sudo apt-get update
    sudo apt-get install –reinstall ubuntu-desktop
    sudo apt-get install unity
    sudo apt-get remove –purge nvidia*
    sudo shutdown -r now

Once you have Unity back to normal at next reboot, just reinstall the Nvidia drivers (you had just removed them).

I hope these quick tips help you to recover your Ubuntu 14.04 from a frozen Unity to a working Unity. Any questions or suggestions are always welcomed.

--------------------------------------------------------------------------------

via: http://itsfoss.com/fix-unity-freezes-after-login-ubuntu-14-04/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
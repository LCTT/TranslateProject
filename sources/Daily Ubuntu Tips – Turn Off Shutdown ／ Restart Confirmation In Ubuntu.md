Daily Ubuntu Tips – Turn Off Shutdown / Restart Confirmation In Ubuntu
================================================================================
For those just starting with Ubuntu, there are many new things to learn and many of the Linux tutorials online are not intended for beginners.

Here, we take a different approach. Most if not all of our tutorials are for beginners.

This post is also a beginner’s post and it’s going to show those just leaning Ubuntu how to disable the shutdown, restart and logout confirmation box each time they execute these commands.

You see, Ubuntu is configured to always prompt you with a dialog box when you wish to shutdown, restart or logout of your session.

This is a safeguard and it prevents you from mistakenly shutting down or restarting your computer when you don’t intent to.

Not everyone wants to be asked every time he/she want to turn of Ubuntu. Folks who are in hurry most of the time may accidentally leave their computer running even though they select the shutdown command and not confirming the action when prompted.

This brief tutorial is going to show you how to turn it off so you don’t get prompted each time you want to shutdown your machine.

When this feature is activated, it prompts you with the following screen.

> Are you sure you want to close all programs and shutdown your computer?

Run the commands below to turn it off.

Press **Ctrl – Alt – T** on your keyboard to open the terminal. When it opens, run the commands below on the terminal windows and press Enter.

    gsettings set com.canonical.indicator.session suppress-logout-restart-shutdown true

That’s it! You’ll never be prompted again when you click shutdown, restart or logout of Ubuntu.

To undo the changes and bring back the confirmation, run the commands below

    gsettings set com.canonical.indicator.session suppress-logout-restart-shutdown false

![](http://www.liberiangeek.net/wp-content/uploads/2014/01/shutdownubuntuconfirm.png)

Enjoy!

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2014/01/daily-ubuntu-tips-turn-off-shutdown-restart-confirmation-in-ubuntu/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
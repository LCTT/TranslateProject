Daily Ubuntu Tips – Fix Black Screen In Ubuntu Guest With VirtualBox Screen Capture
================================================================================
VirtualBox is a software that allows users to run multiple guest operating systems on a single host computer. It’s supports Windows, Mac OS X and Linux and is maintained my Oracle.

We’ve written a lot on VirtualBox here. Do a quick search and you’ll see all the articles about VirtualBox.

Now, here’s the story: VirtualBox comes with a feature that allows users to quickly take or capture screen shots of active guest machine sessions. These screenshots can then be shared with the host machine using the clipboard.

The sad thing about it is, it won’t work if certain feature in Ubuntu guest machines is enabled. It had always been a pain until just recently when I stumbled upon the solution.

Without this solution, when you take a screenshot in Ubuntu guest machines, the image will be completely dark and not useful at all.

I dug solutions with no luck until just now.

To enable bidirectional clipboard with Ubuntu guest and the host machine, click on the Ubuntu guest machine and select **Settings**. Then navigate to **General –> Advanced Tab** and enable it.

![](http://www.liberiangeek.net/wp-content/uploads/2014/02/virtualboxsharedclipboard.png)

Now, in theory, when you start the Ubuntu guest machine and press the **Print Screen** key or **Ctrl + Print Screen** keys, the guest machine should take a screenshot of its current desktop session. 

You can then save it to the clipboard and access these images from the host machine.

But if you also enable **3D Acceleration** feature for Ubuntu guests, the images will be completely dark.

To fix that, you must disable 3D acceleration for Ubuntu guest machines.

To disable it, select the Ubuntu guest machine and click **Settings**. Then navigate to **Systems – Display –> Video** tab and disable 3D Acceleration.

![](http://www.liberiangeek.net/wp-content/uploads/2014/02/virtualboxsharedclipboard1.png)

Well, you must disable 3D for Ubuntu guests in order to get this to work. Now launch the guest machine and try taking a screen shot.

Hope this helps.

Enjoy!

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2014/02/daily-ubuntu-tips-fix-black-screen-in-ubuntu-guest-with-virtualbox-screen-capture/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
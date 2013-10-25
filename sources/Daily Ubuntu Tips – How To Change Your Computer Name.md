	翻译中啦，Vic___

Daily Ubuntu Tips – How To Change Your Computer Name
================================================================================
Another blog post that is geared towards new Ubuntu users or newbies. This post shows you how to easily change your computer name when using Ubuntu. Many users will never worry about changing their computer name or hostname in Ubuntu. In most cases, that’s the least of their worries.

Many will use the name that was created or given to the machine during Ubuntu installation. But for those new users who would like to know how to do it, continue below to learn how. This post isn’t for pros, it’s for newbies and users who are just starting out with Ubuntu.

So, why would you want to change your computer name again? If you don’t have a good reason other than to learn how to do it, then don’t. If you want to do it for a good reason or learn how to do it, then do this.

Press **Ctrl – Alt – T** on your keyboard to open the terminal. When it opens, run the commands below to edit the hostname file using gedit.

    sudo gedit /etc/hostname

Next, change whatever in there to be the new computer name. For example, if you want your computer name to be RDOMNU, delete what’s currently in there and type **RDOMNU** and save the file.

Next, run the commands below to open the hosts file.

    sudo gedit /etc/hosts

Then change the value of the second line highlighted below to match your computer name you entered earlier. Save the file when you’re done. 

![](http://www.liberiangeek.net/wp-content/uploads/2013/10/ubuntuhostnamechange.png)

That’s it! Restart your computer and your machine will reflect the new name. This is how one changes the name of a Ubuntu machine.

Enjoy!

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2013/10/daily-ubuntu-tips-change-computer-name/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
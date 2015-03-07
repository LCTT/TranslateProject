translating-----geekpi

How To Fix Windows Updates Stuck At 0%
================================================================================
How do you feel when you log in to Windows after a month, find there are updates to install, you select to install these updates and those **Windows updates stuck at zero percent**?

Why am I talking about Windows updates on a blog dedicated to Linux and Open Source? Because I prefer to [dual boot Windows with Linux][1]. While I use Linux as my main desktop, once in a while I do log in to Windows. The most annoying thing after logging in Windows is the Windows updates. It has happened to me on several occasions that I found **Windows update not working**. I choose to install the updates and Windows updates get stuck at 0 KB and 0%, like this:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/03/Windows_Updates_stuck_at_zero.jpeg)

In this tutorial, we shall see how to make Windows update work again. The tutorial should be applicable for Windows 7, Windows 8 and Windows 8.1.

### Fix Windows updates stuck at zero percent ###

Please mind that Windows updates can be stuck at any percent and the trick which we are going to use would require you to install those updates again. I hope you do not find that too inconvenient. If you are ready, let’s see how to fix this Windows update issue.

#### Step 1: ####

Press Windows+R. This will prompt run dialogue box. In here, type services.msc:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/03/Updates_3.png)

#### Step 2: ####

Now it brings us to all the services installed in Windows. These services are listed in alphabetical order. Scroll down and look for **Windows Update Service**. Right click on it and stop it.

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/03/Windows_Updates_stuck_1.jpeg)

#### Step 3: ####

Now go in **C:\Windows\SoftwareDistribution and delete all of its contents**. Actually, this is the folder where downloaded installation files were stored. But since Windows update suck, they somehow have problem with partially downloaded update files.

#### Step 4: ####

Go back to services again (as mentioned in Step 1) and this time start the Windows Update Service, by right clicking on it. Try to update Windows again. It should be working this time.

So once you have got the updates working, perhaps you will find plenty of updates to install at next reboot. And that moment calls for a meme:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/03/Windows_update_suck.jpg)

Jokes apart, I hope this tip helps you to get rid of Windows updates hanged at 0%. I wish that Linux like updates are also included in the list of [Windows 10 features copied from Linux][2]. I wish.

--------------------------------------------------------------------------------

via: http://itsfoss.com/fix-windows-updates-stuck-0/

作者：[Abhishek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:http://itsfoss.com/install-ubuntu-1404-dual-boot-mode-windows-8-81-uefi/
[2]:http://itsfoss.com/windows-10-inspired-linux/

XLCYun translating.


How To Fix System Program Problem Detected In Ubuntu 14.04
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/07/system_program_Problem_detected.jpeg)

For the last couple of weeks, (almost) every time I was greeted with **system program problem detected on startup in Ubuntu 15.04**. I ignored it for sometime but it was quite annoying after a certain point. You won’t be too happy as well if you are greeted by a pop-up displaying this every time you boot in to the system:

> System program problem detected
> 
> Do you want to report the problem now?
> 
> ![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/07/System_Program_Problem_Detected.png)

I know if you are an Ubuntu user you might have faced this annoying pop-up sometimes for sure. In this post we are going to see what to do with “system program problem detected” report in Ubuntu 14.04 and 15.04.

### What to do with “system program problem detected” error in Ubuntu? ###

#### So what exactly is this notifier all about? ####

Basically, this notifies you of a crash in your system. Don’t panic by the word ‘crash’. It’s not a major issue and your system is very much usable. It just that some program crashed some time in the past and Ubuntu wants you to decide whether or not you want to report this crash report to developers so that they could fix this issue.

#### So, we click on Report problem and it will vanish? ####

No, not really. Even if you click on report problem, you’ll be ultimately greeted with a pop up like this:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/07/Ubuntu_Internal_error.png)

[Sorry, Ubuntu has experienced an internal error][1] is the apport that will further open a web browser and then you can file a bug report by logging or creating an account with [Launchpad][2]. You see, it is a complicated procedure which will take around four steps to complete.

#### But, I want to help developers and let them know of the bugs! ####

That’s very thoughtful of you and the right thing to do. But there are two issues here. First, there are high chances that the bug would have already been reported. Second, even if you take the pain of reporting the crash, it’s not a guarantee that you won’t see it again.

#### So, you suggesting to not report the crash? ####

Yes and no. Report the crash when you see it the first time, if you want. You can see the crashing program under “Show Details” in the above picture. But if you see it repetitively or if you do not want to report the bug, I advise you to get rid of the system crash once and for all.

### Fix “system program problem detected” error in Ubuntu ###

The crash reports are stored in /var/crash directory in Ubuntu. If you look in to this directory, you should see some files ending with crash.

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/07/Crash_reports_Ubuntu.jpeg)

What I suggest is that you delete these crash reports. Open a terminal and use the following command:

    sudo rm /var/crash/*

This will delete all the content of directory /var/crash. This way you won’t be annoyed by the pop up for the programs crash that happened in the past. But if a programs crashes again, you’ll again see system program problem detected error. You can either remove the crash reports again, like we just did, or you can disable the Apport (debug tool) and permanently get rid of the pop-ups.

#### Permanently get rid of system error pop up in Ubuntu ####

If you do this, you’ll never be notified about any program crash that happens in the system. If you ask my view, I would say it’s not that bad a thing unless you are willing to file bug reports. If you have no intention of filing a bug report, the crash notifications and their absence will make no difference.

To disable the Apport and get rid of system crash report completely, open a terminal and use the following command to edit the Apport settings file:

    gksu gedit /etc/default/apport

The content of the file is:

    # set this to 0 to disable apport, or to 1 to enable it
    # you can temporarily override this with
    # sudo service apport start force_start=1
    enabled=1

Change the **enabled=1** to **enabled=0**. Save and close the file. You won’t see any pop up for crash reports after doing this. Obvious to point out that if you want to enable the crash reports again, you just need to change the same file and put enabled as 1 again.

#### Did it work for you? ####

I hope this tutorial helped you to fix system program problem detected in Ubuntu 14.04 and Ubuntu 15.04. Let me know if this tip helped you to get rid of this annoyance.

--------------------------------------------------------------------------------

via: http://itsfoss.com/how-to-fix-system-program-problem-detected-ubuntu/

作者：[Abhishek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:http://itsfoss.com/how-to-solve-sorry-ubuntu-12-04-has-experienced-an-internal-error/
[2]:https://launchpad.net/

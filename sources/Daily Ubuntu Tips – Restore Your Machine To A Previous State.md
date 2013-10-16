Daily Ubuntu Tips – Restore Your Machine To A Previous State
================================================================================
When you compare Windows and Ubuntu, you’ll see that Windows has many advantages over Ubuntu and maybe Ubuntu has few over Windows as well. But one feature that stands out is the ability to restore your machine to a previous state. Windows has had this feature going back to Windows XP and worked great at times and can save your a lot of time when you need to fix issues.

Ubuntu on the other hand don’t have it. You can’t just restore your machine to a previous state in Ubuntu. You may be able to restore individual files and folders but not the entire machine like what Windows does.

Well, thanks to [TimeShift][1], you may just be able to restore your entire Ubuntu machine to a previous state like Windows. TimeShift may not give you all the benefits that you get in Windows, but it’s a step closer.

TimeShift is a open source application that provides the same function as Windows Restore in Windows or Time Machine in Mac OS X. It takes snapshots of you system at scheduled time that can be restore in the event you need to undo changes that were made after a snapshot.

To install TimeShift in Ubuntu, run the command below to add its PPA archive. 

    sudo apt-add-repository -y ppa:teejee2008/ppa

Next, run the commands below to update your system as well as install TimeShift.

    sudo apt-get update && sudo apt-get install timeshift

After installing it, go to Unity Dash and search for TimeShift. Next launch it and set your preferred settings. When it first launch it may take few minutes scanning your machine for available space and files to backup.

![](http://www.liberiangeek.net/wp-content/uploads/2013/10/timeshiftubuntu.png)

If you like the default settings, you can keep. To perform immediate backup, click the Backup button at on the menu. You’ll use the same apps to restore your machine in the event you need to.

Enjoy!

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2013/10/daily-ubuntu-tips-restore-machine-previous-state/

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[Timeszoro](https://github.com/Timeszoro) 校对：[校对者ID](https://github.com/校对者ID)

[1]:http://teejeetech.blogspot.com/2013/10/introducing-timeshift.html
[2]:
[3]:
[4]:
[5]:
[6]:
[7]:
[8]:
[9]:
[10]:

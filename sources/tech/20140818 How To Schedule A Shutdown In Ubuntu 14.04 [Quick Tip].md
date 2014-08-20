[su-kaiyao]翻译中

How To Schedule A Shutdown In Ubuntu 14.04 [Quick Tip]
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/08/Schedule_Shutdown_Ubuntu.jpeg)

Cannot shutdown your computer as some program are running but you cannot leave the computer running for the whole night? You may find yourself in similar position where you would need to schedule a shutdown in Ubuntu or any other Linux for that matter.

In this quick post, we shall see how to schedule a shutdown in Ubuntu with GUI or in CLI.

### Schedule a shutdown in Ubuntu with EasyShutdown ###

EasyShutdown is a tiny application that provides a tiny GUI so that you can easily schedule a shutdown in Ubuntu. You can [download the .deb file from launchpad page of EayShutdown][1]. Just double click on it to install it. By default, it should open with Ubuntu Software Center.

Once installed, run it from Unity Dash. Interface is very simple. You just have to provide the time at which you want to shut down the system. For example, if you want to shutdown the system at 03:30 AM, fill it as following:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/08/Schedule_Shudown_Ubuntu.jpeg)

Note that EasyShutdown doesn’t have a daemon or system tray. So you have to keep it running to make it work. Good thing with EasyShutdown is that it notifies you one minute before the scheduled shutdown, so that you can choose to pause it.

### Schedule a shutdown in Ubuntu in command line ###

Using command line option to **schedule a shutdown in Ubuntu** is equally easy. All you have to do is to use “shutdown” command. For example, to schedule a shutdown at 03:30 AM, you can use the command in following fashion:

    sudo shutdown -h 03:30

Note that you will have to keep running this command. So either keep the terminal open or send the process in background.

I hope these quick tips helps you to schedule a shutdown in Ubuntu or other Linux system such as Linux Mint. Any questions or suggestions are always welcomed.

--------------------------------------------------------------------------------

via: http://itsfoss.com/schedule-shutdown-ubuntu/

作者：[Abhishek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/Abhishek/
[1]:https://launchpad.net/easyshutdown

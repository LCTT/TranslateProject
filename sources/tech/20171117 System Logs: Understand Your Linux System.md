### System Logs: Understand Your Linux System

![chabowski](https://www.suse.com/communities/blog/files/2016/03/chabowski_avatar_1457537819-100x100.jpg)
 By: [chabowski][1]

The following article is part of a series of articles that provide tips and tricks for Linux newbies  – or Desktop users that are not yet experienced with regard to certain topics). This series intends to complement the special edition #30 “[Getting Started with Linux][2]” based on [openSUSE Leap][3], recently published by the [Linux Magazine,][4] with valuable additional information.

This article has been contributed by Romeo S. Romeo is a PDX-based enterprise Linux professional specializing in scalable solutions for innovative corporations looking to disrupt the marketplace.

System logs are incredibly important files in Linux. Special programs that run in the background (usually called daemons or servers) handle most of the tasks on your Linux system. Whenever these daemons do anything, they write the details of the task to a log file as a sort of “history” of what they’ve been up to. These daemons perform actions ranging from syncing your clock with an atomic clock to managing your network connection. All of this is written to log files so that if something goes wrong, you can look into the specific log file and see what happened.

![](https://www.suse.com/communities/blog/files/2017/11/markus-spiske-153537-300x450.jpg)

Photo by Markus Spiske on Unsplash

There are many different logs on your Linux computer. Historically, they were mostly stored in the /var/log directory in a plain text format. Quite a few still are, and you can read them easily with the less pager. On your freshly installed openSUSE Leap 42.3 system, and on most modern systems, important logs are stored by the systemd init system. This is the system that handles starting up daemons and getting the computer ready for use on startup. The logs handled by systemd are stored in a binary format, which means that they take up less space and can more easily be viewed or exported in various formats, but the downside is that you need a special tool to view them. Luckily, this tool comes installed on your system: it’s called journalctl and by default, it records all of the logs from every daemon to one location.

To take a look at your systemd log, just run the journalctl command. This will open up the combined logs in the less pager. To get a better idea of what you’re looking at, see a single log entry from journalctl here:

```
Jul 06 11:53:47 aaathats3as pulseaudio[2216]: [pulseaudio] alsa-util.c: Disabling timer-based scheduling because running inside a VM.
```

This individual log entry contains (in order) the date and time of the entry, the hostname of the computer, the name of the process that logged the entry, the PID (process ID number) of the process that logged the entry, and then the log entry itself.

If a program running on your system is misbehaving, look at the log file and search (with the “/” key followed by the search term) for the name of the program. Chances are that if the program is reporting errors that are causing it to malfunction, then the errors will show up in the system log. Sometimes errors are verbose enough for you to be able to fix them yourself. Other times, you have to search for a solution on the Web. Google is usually the most convenient search engine to use for weird Linux problems 
![](https://www.suse.com/communities/blog/files/2017/09/Sunglasses_Emoji-450x450.png)
. However, be sure that you only enter the actual log entry, because the rest of the information at the beginning of the line (date, host name, PID) is unnecessary and could return false positives.

After you search for the problem, the first few results are usually pages containing various things that you can try for solutions. Of course, you shouldn’t just follow random instructions that you find on the Internet: always be sure to do additional research into what exactly you will be doing and what the effects of it are before following any instructions. With that being said, the results for a specific entry from the system’s log file are usually much more useful than results from searching more generic terms that describe the malfunctioning of the program directly. This is because many different things could cause a program to misbehave, and multiple problems could cause identical misbehaviors.

For example, a lack of audio on the system could be due to a massive amount of different reasons, ranging from speakers not being plugged in, to back end sound systems misbehaving, to a lack of the proper drivers. If you search for a general problem, you’re likely to see a lot of irrelevant solutions and you’ll end up wasting your time on a wild goose chase. With a specific search of an actual line from a log file, you can see other people who have had the same log entry. See Picture 1 and Picture 2 to compare and contrast between the two types of searching.

![](https://www.suse.com/communities/blog/files/2017/11/picture1-450x450.png)

Picture 1 shows generic, unspecific Google results for a general misbehavior of the system. This type of searching generally doesn’t help much.

![](https://www.suse.com/communities/blog/files/2017/11/picture2-450x450.png)

Picture 2 shows more specific, helpful Google results for a particular log file line. This type of searching is generally very helpful.

There are some systems that log their actions outside of journalctl. The most important ones that you may find yourself dealing with on a desktop system are /var/log/zypper.log for openSUSE’s package manager, /var/log/boot.log for those messages that scroll by too fast to be read when you turn your system on, and /var/log/ntp if your Network Time Protocol Daemon is having troubles syncing time. One more important place to look for errors if you’re having problems with specific hardware is the Kernel Ring Buffer, which you can read by typing the dmesg -H command (this opens in the less pager as well). The Kernel Ring Buffer is stored in RAM, so you lose it when you reboot your system, but it contains important messages from the Linux kernel about important events, such as hardware being added, modules being loaded, or strange network errors.

Hopefully you are prepared now to understand your Linux system better! Have a lot of fun!

--------------------------------------------------------------------------------

via: https://www.suse.com/communities/blog/system-logs-understand-linux-system/

作者：[chabowski]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:https://www.suse.com/communities/blog/author/chabowski/
[2]:http://www.linux-magazine.com/Resources/Special-Editions/30-Getting-Started-with-Linux
[3]:https://en.opensuse.org/Portal:42.3
[4]:http://www.linux-magazine.com/

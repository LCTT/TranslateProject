Translating-------------geekpi

Deciphering Top
================================================================================
When curious about the performance of a server, one of the first places I stop is "top". Top is not perfect, not by a long shot, but it does provide a decent point in time snapshot of the server, and attempts to answer the question of "what is going on right now?". Unfortunatly, the output of top can easily be misinterpreted if you do not have a good understanding of the different fields of data presented.

I'm not going to go through the [man page][2] for top, when you have the time and inclination it is always there waiting for you. What I would like to do is point out a few highlights of how I use it to get a quick overview of the system and hopefully get a direction I should go next. Top is often my first stop in troubleshooting, but it is rarely my only stop. 

[![](http://farm4.staticflickr.com/3827/10847969205_c1b75f9fa2_m.jpg)][1]

The very first thing I look at in top is the load average, in the top right hand corner of the screen. The load average is computed based on a number of statistics gathered, but can generally be thought of as the amount of work the CPU is being asked to do. If your machine has a single CPU core, than a load average of one would mean that the machine was perfectly loaded and had sufficient power to accomplish all tasks during the time it was sampled. Likewise, if the load average is two, the single CPU machine was overloaded, and would have needed two available cores to accomplish the work it was being asked to do in the same amount of time. With todays 8, 16, and 32 core servers shipping, I need to think twice when considering the load average. If I need to check, I press "1" in top, which will drop down a list of all CPU cores so I can get a quick count for comparison.

The second item I check is the first process listed, and the ninth column over, labled "%CPU". The explanation for this column is novel:

> The task's share of the elapsed CPU time since the last screen update, expressed as a percentage of total CPU time. In a true SMP environment, if 'Irix mode' is Off, top will operate in 'Solaris mode' where a task's cpu usage will be divided by the total number of CPUs. You toggle 'Irix/Solaris' modes with the 'I' interactive command.

Clear as mud, right? The main idea to keep in mind is that if a single process has gone berzerk for one reason or antoher, it will probably show up listed first in top, with a rather extreme number for %CPU.

The next area I glance at is the "Cpu(s):" line, in the center of the header block. Specifically, I'm interested in the %us, which is user processes, %sy, for system processes, %id, which is idle time, and %wa, which is the percent of time the CPU had processes that were waiting on a response from an I/O stream to execute. This percentage should always be close to zero, and anything higher than 5% should be looked at closer.

Lastly, I like to check the system up time, shown in the top left hand corner. If I'm having problems with a server, and the server was recently rebooted, there may be a correlation there, perhaps a daemon that didn't start.

All of these checks take only a few seconds. I may leave top running for a few minutes and watch the processes, CPU, and load if I'm just observing, but normally I'm in and out of top fairly quickly. Top is one of those fantastic sysadmin tools that is built to give you a quick overview of the health of your system, and allow you to quickly diagnose potential problems. 

--------------------------------------------------------------------------------

via: http://ostatic.com/blog/deciphering-top

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.flickr.com/photos/51724787@N06/10847969205/
[2]:http://www.linuxmanpages.com/man1/top.1.php
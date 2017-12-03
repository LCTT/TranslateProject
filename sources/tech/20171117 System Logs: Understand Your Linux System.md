translating by lujun9972
### System Logs: Understand Your Linux System

![chabowski](https://www.suse.com/communities/blog/files/2016/03/chabowski_avatar_1457537819-100x100.jpg)
 By: [chabowski][1]

本文摘自教授Linux小白(或者非资深桌面用户)技巧的系列文章. 该系列文章旨在为由LinuxMagazine基于 [openSUSE Leap][3] 发布的第30期特别版 “[Getting Started with Linux][2]” 提供补充说明.

本文作者是 Romeo S. Romeo, 他是一名 PDX-based enterprise Linux 专家，转为创新企业提供富有伸缩性的解决方案.

Linux系统日志非常重要. 后台运行的程序(通常被称为守护进程或者服务进程)处理了你Linux系统中的大部分任务. 当这些守护进程工作时,它们将任务的详细信息记录进日志文件中，作为他们做过什么的历史信息. 这些守护进程的工作内容涵盖从使用原子钟同步时钟到管理网络连接. 所有这些都被记录进日志文件，这样当有错误发生时，你可以通过查阅特定的日志文件来看出发生了什么.

![](https://www.suse.com/communities/blog/files/2017/11/markus-spiske-153537-300x450.jpg)

Photo by Markus Spiske on Unsplash

有很多不同的日志. 历史上, 他们一般以纯文本的格式存储到 `/var/log` 目录中. 现在依然有很多日志这样做, 你可以很方便的使用 `less` 来查看它们. 
在新装的 `openSUSE Leap 42.3` 以及大多数现代操作系统上,重要的日志由 `systemd` 初始化系统存储. `systemd`这套系统负责启动守护进程并在系统启动时让计算机做好被使用的准备。
由 `systemd` 记录的日志以二进制格式存储, 这使地它们消耗的空间更小,更容易被浏览，也更容易被导出成其他各种格式,不过坏处就是你必须使用特定的工具才能查看.
好在, 这个工具已经预安装在你的系统上了: 它的名字叫 `journalctl`,而且默认情况下, 它会将每个守护进程的所有日志都记录到一个地方.

只需要运行 `journalctl` 命令就能查看你的 `systemd` 日志了. 它会用 `less` 分页器显示各种日志. 为了让你有个直观的感受, 下面是`journalctl` 中摘录的一条日志记录:

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

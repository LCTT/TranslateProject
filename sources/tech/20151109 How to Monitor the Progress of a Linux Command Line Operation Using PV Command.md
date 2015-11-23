translating by ezio

How to Monitor the Progress of a Linux Command Line Operation Using PV Command
================================================================================
![](https://www.maketecheasier.com/assets/uploads/2015/11/pv-featured-1.jpg)

If you’re a Linux system admin, there’s no doubt that you must be spending most of your work time on the command line – installing and removing packages; monitoring system stats; copying, moving, deleting stuff; debugging problems; and more. There are times when you fire a command, and it takes a while before the operation completes. However, there are also times when the command you executed just hangs, leaving you guessing as to what’s actually happening behind the scenes.

Usually, Linux commands provide no information related to the progress of the ongoing operation, something that is very important especially when you have limited time. However, that doesn’t mean you’re helpless – there exists a command, dubbed pv, that displays useful progress information related to the ongoing command line operation. In this article we will discuss this command as well as its features through some easy-to-understand examples.

### PV Command ###

Developed by Andrew Wood, [PV][1] – which stands for Pipe Viewer – displays information related to the progress of data through a pipeline. The information includes time elapsed, percentage completed (with progress bar), current throughput rate, total data transferred, and ETA.

> “To use it, insert it in a pipeline between two processes, with the appropriate options. Its standard input will be passed through to its standard output and progress will be shown on standard error,”

The above explains the command’s man page.

### Download and Installation ###

Users of Debian-based systems like Ubuntu can easily install the utility by running the following command in terminal:

    sudo apt-get install pv

If you’re using any other Linux distro, you can install the command using the package manager installed on your system. Once installed successfully you can use the command line utility in various scenarios (see the following section). It’s worth mentioning that pv version 1.2.0 has been used in all the examples mentioned in this article.

### Features and Usage ###

A very common scenario that probably most of us (who work on the command line in Linux) would relate to is copying a movie file from a USB drive to your computer. If you try to complete the aforementioned operation using the cp command, you’ll have to blindly wait until the copying is complete or some error is thrown.

However, the pv command can be helpful in this case. Here is an example:

    pv /media/himanshu/1AC2-A8E3/fNf.mkv > ./Desktop/fnf.mkv

And here’s the output:

![pv-copy](https://www.maketecheasier.com/assets/uploads/2015/10/pv-copy.png)

So, as you can see above, the command shows a lot of useful information related to the ongoing operation, including the amount of data that has been transferred, time elapsed, rate of transfer, progress bar, progress in percentage, and the amount of time left.

The `pv` command provides various display switches. For example, you can use `-p` for displaying percentage, `-t` for timer, `-r` for rate of transfer, `-e` for eta, and -b for byte counter. The good thing is that you won’t have to remember any of them, as all of them are enabled by default. However, should you exclusively require information related to only a particular display switch in the output, you can pass that switch in the pv command.

There’s also a `-n` display switch that allows the command to display an integer percentage, one per line on standard error, instead of the regular visual progress indicator. The following is an example of this switch in action:

    pv -n /media/himanshu/1AC2-A8E3/fNf.mkv > ./Desktop/fnf.mkv

![pv-numeric](https://www.maketecheasier.com/assets/uploads/2015/10/pv-numeric.png)

This particular display switch is suitable in scenarios where you want to pipe the output into the [dialog][2] command.

Moving on, there’s also a command line option, `-L`, that lets you modify the data transfer rate of the pv command. For example, I used -L to limit the data transfer rate to 2MB/s.

    pv -L 2m /media/himanshu/1AC2-A8E3/fNf.mkv > ./Desktop/fnf.mkv

![pv-ratelimit](https://www.maketecheasier.com/assets/uploads/2015/10/pv-ratelimit.png)

As can be seen in the screenshot above, the data transfer rate was capped according to my direction.

Another scenario where `pv` can help is while compressing files. Here is an example of how you can use this command while compressing files using Gzip:

    pv /media/himanshu/1AC2-A8E3/fnf.mkv | gzip > ./Desktop/fnf.log.gz

![pv-gzip](https://www.maketecheasier.com/assets/uploads/2015/10/pv-gzip.png)

### Conclusion ###

As you have observed, pv is a useful little utility that could help you save your precious time in case a command line operation isn’t behaving as expected. Plus, the information it displays can also be used in shell scripts. I’d strongly recommend this command; it’s worth giving a try.

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/monitor-progress-linux-command-line-operation/

作者：[Himanshu Arora][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/himanshu/
[1]:http://linux.die.net/man/1/pv
[2]:http://linux.die.net/man/1/dialog

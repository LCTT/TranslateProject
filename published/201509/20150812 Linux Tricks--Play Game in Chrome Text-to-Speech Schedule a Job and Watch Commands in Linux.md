Linux 小技巧：Chrome 小游戏，让文字说话，计划作业，重复执行命令
================================================================================

重要的事情说两遍，我完成了一个[Linux提示与彩蛋][1]系列，让你的Linux获得更多创造和娱乐。

![Linux提示与彩蛋系列](http://www.tecmint.com/wp-content/uploads/2015/08/Linux-Tips-and-Tricks.png)

*Linux提示与彩蛋系列*

本文，我将会讲解Google-chrome内建小游戏，在终端中如何让文字说话，使用‘at’命令设置作业和使用watch命令重复执行命令。

### 1. Google Chrome 浏览器小游戏彩蛋 ###

网线脱掉或者其他什么原因连不上网时，Google Chrome就会出现一个小游戏。声明，我并不是游戏玩家，因此我的电脑上并没有安装任何第三方的恶意游戏。安全是第一位。

所以当Internet发生出错，会出现一个这样的界面：

![不能连接到互联网](http://www.tecmint.com/wp-content/uploads/2015/08/Unable-to-Connect-Internet.png)

*不能连接到互联网*

按下空格键来激活Google-chrome彩蛋游戏。游戏没有时间限制。并且还不需要浪费时间安装使用。

不需要第三方软件的支持。同样支持Windows和Mac平台，但是我的平台是Linux，我也只谈论Linux。当然在Linux，这个游戏运行很好。游戏简单，但也很花费时间。

使用空格/向上方向键来跳跃。请看下列截图：

![Google Chrome中玩游戏](http://www.tecmint.com/wp-content/uploads/2015/08/Play-Game-in-Google-Chrome.gif)

*Google Chrome中玩游戏*

### 2. Linux 终端中朗读文字 ###

对于那些不能文字朗读的设备，有个小工具可以实现文字说话的转换器。用各种语言写一些东西，espeak就可以朗读给你。

系统应该默认安装了Espeak，如果你的系统没有安装，你可以使用下列命令来安装：

    # apt-get install espeak   (Debian)
    # yum install espeak       (CentOS)
    # dnf install espeak       (Fedora 22 及其以后)

你可以让espeak接受标准输入的交互输入并及时转换成语音朗读出来。如下：

    $ espeak [按回车键]

更详细的输出你可以这样做：

    $ espeak --stdout | aplay [按回车键][再次回车]

espeak设置灵活，也可以朗读文本文件。你可以这样设置：

    $ espeak --stdout /path/to/text/file/file_name.txt  | aplay [Hit Enter] 

espeak可以设置朗读速度。默认速度是160词每分钟。使用-s参数来设置。

设置每分钟30词的语速：

    $ espeak -s 30 -f /path/to/text/file/file_name.txt | aplay

设置每分钟200词的语速：

    $ espeak -s 200 -f /path/to/text/file/file_name.txt | aplay

说其他语言，比如北印度语（作者母语），这样设置：

    $ espeak -v hindi --stdout 'टेकमिंट विश्व की एक बेहतरीन लाइंक्स आधारित वेबसाइट है|' | aplay 

你可以使用各种语言，让espeak如上面说的以你选择的语言朗读。使用下列命令来获得语言列表：

    $ espeak --voices

### 3. 快速调度任务 ###

我们已经非常熟悉使用[cron][2]守护进程执行一个计划命令。

Cron是一个Linux系统管理的高级命令，用于计划定时任务如备份或者指定时间或间隔的任何事情。

但是，你是否知道at命令可以让你在指定时间调度一个任务或者命令？at命令可以指定时间执行指定内容。

例如，你打算在早上11点2分执行uptime命令，你只需要这样做：

    $ at 11:02
    uptime >> /home/$USER/uptime.txt 
    Ctrl+D

![Linux中计划任务](http://www.tecmint.com/wp-content/uploads/2015/08/Schedule-Job-in-Linux.png)

*Linux中计划任务*

检查at命令是否成功设置，使用：

    $ at -l

![浏览计划任务](http://www.tecmint.com/wp-content/uploads/2015/08/View-Scheduled-Jobs.png)

*浏览计划任务*

at支持计划多个命令，例如：

    $ at 12:30
    Command – 1
    Command – 2
    …
    command – 50
    …
    Ctrl + D

### 4. 特定时间重复执行命令 ###

有时，我们可以需要在指定时间间隔执行特定命令。例如，每3秒，想打印一次时间。

查看现在时间，使用下列命令。

    $ date +"%H:%M:%S

![Linux中查看日期和时间](http://www.tecmint.com/wp-content/uploads/2015/08/Check-Date-in-Linux.png)

*Linux中查看日期和时间*

为了每三秒查看一下这个命令的输出，我需要运行下列命令：

    $ watch -n 3 'date +"%H:%M:%S"'

![Linux中watch命令](http://www.tecmint.com/wp-content/uploads/2015/08/Watch-Command-in-Linux.gif)

*Linux中watch命令*

watch命令的‘-n’开关设定时间间隔。在上述命令中，我们定义了时间间隔为3秒。你可以按你的需求定义。同样watch
也支持其他命令或者脚本。

至此。希望你喜欢这个系列的文章，让你的linux更有创造性，获得更多快乐。所有的建议欢迎评论。欢迎你也看看其他文章，谢谢。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/text-to-speech-in-terminal-schedule-a-job-and-watch-commands-in-linux/

作者：[Avishek Kumar][a]
译者：[VicYu/Vic020](http://vicyu.net)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://www.tecmint.com/tag/linux-tricks/
[2]:http://www.tecmint.com/11-cron-scheduling-task-examples-in-linux/

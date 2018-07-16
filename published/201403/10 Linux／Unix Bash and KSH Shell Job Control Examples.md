10个 Linux/Unix下 Bash 和 KSH shell 的作业控制实例
================================================================================
![](http://s0.cyberciti.org/uploads/cms/2014/02/unix-llnux-shell-job-control-series.jpg)

Linux 和 Unix 属于多任务的操作系统，也就是说一个系统在同一时间段内能运行多重任务(进程)。在这个新的博客系列，我将会列出相关的 Linux 和 Unix 作业（job）控制的命令，你可以通过这些命令在 Bash 或 Korn 还有 POSIX shell 下实现执行多重任务。

### 什么是作业控制？###

作业控制不只是能够停止/挂起(stop/suspend)正在执行的进程(命令)，也可以继续/唤醒(continue/resume)执行你需要的每一个进程。这完全可以用你的操作系统和 bash/ksh 之类的 shell 或 POSIX shell 完成。

### 谁给作业控制的提供了环境？ ###

Bash / Korn shell，或者是 POSIX shell 提供给了作业控制的环境。

### 跟作业表打个招呼吧 ###

你的 shell 会留有一张当前作业的表单，称为作业表。当你键入命令时，shell 会给它分配一个 jobID(也称作 JOB_SPEC)。一个 jobID 或 JOB_SPEC只是很小的整数数值。

#### #1: 创建你的首个 Linux/Unix 作业 ####

我要运行一个名为 xeyes 的命令，它会在屏幕上显示两个椭圆的眼睛,输入：
    $ xeyes &

输出样例：

[![](http://s0.cyberciti.org/uploads/cms/2014/02/run-xeyes-command-in-background.jpg)][4]
*Fig.01: 在后台运行 xeyes 命令*

我使用&符号让一个 job 在后台运行。shell 会打印一行信息类似如下:

    [1] 6891

在这个例子中，有两个数字输出，分别表示：

- [1] : 在后台执行的 xeyes 任务的作业号为 1。 
- 6891 : 作业1的进程ID。 

我在多执行一些 job:

    ## 启动一个文本编辑器，X 的系统负载显示，和 sleep 命令 ##
    gedit /tmp/hello.c &
    xload &
    sleep 100000 &

#### #2: 列出当前的作业 ####

要[查看当前 shell 的激活的任务状态][1]，输入：

    $ jobs
    $ jobs -l

输出如下:

    [1]   9379 Running                 xeyes &
    [2]   9380 Running                 gedit /tmp/hello.c &
    [3]-  9420 Running                 xload &
    [4]+  9421 Running                 sleep 100000 &

简要描述如下：

<table border="1"><tbody><tr><th>字段</th><th>值</th><th>描述</th><th>示例</th></tr><tr><td>1</td><td>[1]</td><td><strong>jobID</strong> 或 <strong>JOB_SPEC</strong> - 工作号要与fg, bg, wait, kill和其他shell命令一起使用。你必须在工作号前缀添加一个百分号：(<kbd><strong>%</strong></kbd>)。<br>加号 (<kbd>+</kbd>) 标识着默认的或是现在的作业。<br>减号 (<kbd>-</kbd>) 标识着前一个作业。</td><td><kbd>%1</kbd><br><kbd>fg %1</kbd><br><kbd>kill %2</kbd></td></tr><tr><td>2</td><td>9379</td><td><strong>进程 ID</strong> - 系统自动为每个进程创建并分配地独有的身份标志号。</td><td>kill 9379</td></tr><tr><td>3</td><td>Running</td><td><strong>状态</strong> - 关于作业的状态:<br><kbd><strong>Running</strong></kbd> - 该 作业正在运行,还没有被外部信号挂起。<br><kbd><strong>Stopped</strong></kbd> - 该作业已经被挂起。<br></td><td>N/A</td></tr><tr><td>4</td><td>xeyes &amp;</td><td><strong>command</strong> - 由shell给出的命令。</td><td>script &amp;<br>firefox url&amp;</td></tr></tbody></table>

你也可以用 ps 命名列出当前系统正在运行的进程:

    $ ps

#### #3: 停止或挂起正在运行的作业 ####

按下[Ctrl]-[Z]键或使用[kill 命令][2],如下所示：

    kill -s stop PID

举个例子，启动[ping 命令][3]，然后用 Ctrl-Z 键来停止 ping 命令作业：

[![](http://s0.cyberciti.org/uploads/cms/2014/02/suspend-unix-job-command.gif)][5]
*Animated gif 01: 挂起 ping 命令作业*

#### #4: 在前台恢复 挂起的/停止的作业 ####

让我们[恢复处于停止状态下的作业，让它回到前台继续运行][6]，要将其变成当前作业，必须借助[fg 命令][7]。具体语法如下：

    ## ping 命令的作业号的值为5 ##
    fg %5

我也可以规定命令行开端符合字符串"ping"的作业[译注：不能出现不明确的字符串，例如如果后台有两个 vim 进程而你敲入 fg %vim 会报错。]:

    ## %String ##
    fg %ping

输出样例：

    64 bytes from www.cyberciti.biz (75.126.153.206): icmp_req=3 ttl=53 time=265 ms
    64 bytes from www.cyberciti.biz (75.126.153.206): icmp_req=4 ttl=53 time=249 ms
    64 bytes from www.cyberciti.biz (75.126.153.206): icmp_req=5 ttl=53 time=267 ms
    ^C

#### #5: 在后台恢复 挂起/停止状态的作业 ####

在这个例子中，我使用[yum 命令][8]更新所有安装在 Redhat 或 CentOS Linux 生产服务器上的软件包并置于后台作业。

    # yum -y update &>/root/patch.log &

然而，由于一些原因(例如,过载问题)我决定停止这个作业20分钟：

    # kill -s stop %yum

输出样例：

    [7]+  Stopped                 yum -y update &>/root/patch.log &

#### 用 bg 重启停止在后台的 yum 进程 ####

现在，我将要[恢复停止的 yum -y update &>/root/patch.log & 作业][9]，键入：

    # bg %7

或者：

    # bg %yum

输出样例：

    [7]+ yum -y update &>/root/patch.log &

#### #6: 杀死作业/进程 ####

杀死[yum 命令][10]进程，输入如下[kill 命令][11]及其作业号 7：

    # kill %7

或者

    # kill 进程ID

输出样例：

    [7]+  Terminated              yum -y update &>/root/patch.log &

在 Linux/FreeBSD/OS X Unix 下你也可以[使用 killall 命令通过名字杀死进程或是 jobID 而不是通过 PID][12]

#### #7 为什么当我登出后 shell 会清除我的所有后台作业 ####

在这个例子中,我将会启动 pdfwriter.py 来批量生成[这个站点][13]的 pdf 文件:

    ~/scripts/www/pdfwriter.py --profile=faq --type=clean --header=logo\
    --footer-left "nixCraft is GIT UL++++ W+++ C++++ M+ e+++ d-" \
    --footer-right "Page [of] of [total]" &

一旦当我登出shell时，pdfwriter.py 作业就会被我的 shell 杀死。为了克服这个问题需要使用[shell的内置命令 disown 来告诉 shell 不要发送 HUP 信号][14],键入：

    $ ~/scripts/www/pdfwriter.py --profile=faq .... &
    $ disown
    $ exit

#### #8 使用一个名为 nohup 的外部命令阻止在登出时杀死作业 ####

你也可以使用[nohup 命令在你退出 shell 后执行作业][15]:

    $ nohup ~/scripts/www/pdfwriter.py --profile=faq .... &
    $ exit

#### #9: 查找最后的作业的 PID ####

为了查找最近在后台执行的(异步)命令的进程ID，可使用 bash shell 的特殊参数 $!

    $ gedit foo.txt &
    $ echo "最近在后台执行的job 的PID - $!" 

输出样例：

    最近在后台执行的job 的PID - 9421

#### #10: 等候作业完成 ####

wait 命令会等候给予的进程ID 或 作业ID指定的进程，然后报告它的终止状态。语法如下：

    /path/to/large-job/command/foo &
    wait $!
    /path/to/next/job/that-is-dependents/on-foo-command/bar

这是我的一个工作脚本：

    #!/bin/bash
    # A shell script wrapper to create pdf files for our blog/faq section
    ########################################################################
    # init() - Must be run first 
    # Purpose - Create index file in $_tmp for all our wordpress databases 
    ########################################################################
    init(){
     _php="/usr/bin/php"
     _phpargs="-d apc.enabled=0"
     _base="~/scripts"
     _tmp="$_base/tmp"
     _what="$1"
     for i in $_what
     do
            [[ ! -d "$_tmp/$i" ]] && /bin/mkdir "$_tmp/$i"
            $_php $_phpargs -f "$_base/php/rawsqlmaster${i}.php" >  "$_tmp/$i/output.txt"
     done
    }
     
    #####################################################
    # Without index file, we can out generate pdf files
    #####################################################
    init blog
     
    ###########################################################
    # Do not run the rest of the script until init() finished
    ###########################################################
    wait $!
     
    ## Alright, create pdf files 
    ~/scripts/www/pdfwriter.py --profile=blog --type=clean --header=logo\
    --footer-left "nixCraft is GIT UL++++ W+++ C++++ M+ e+++ d-" \
    --footer-right "Page [of] of [total]"

#### Linux 和 Unix 作业控制命令总结列表 ####

<table border="1"><tbody><tr><th>命令</th><th>描述</th><th>示例</th></tr><tr><td><kbd><strong>&amp;</strong></kbd></td><td>将作业置入后台</td><td><kbd>命令 &amp;</kbd></td></tr><tr><td><kbd><strong>%n</strong></kbd></td><td>设置作业号为 n (数字)的作业</td><td><kbd>命令 %1</kbd></td></tr><tr><td><kbd><strong>%Word</strong></kbd></td><td>引用命令行开端包含 Word 的作业</td><td><kbd>命令 %yum</kbd></td></tr><tr><td><kbd><strong>%?Word</strong></kbd></td><td>引用命令行包含 Word 的作业</td><td><kbd>命令 %?ping</kbd></td></tr><tr><td><kbd><strong>%%</strong></kbd><br><kbd><strong>%+</strong></kbd></td><td>引用当前作业</td><td><kbd>kill %%<br>kill %+</kbd></td></tr><tr><td><kbd><strong>%-</strong></kbd></td><td>引用先前作业</td><td><kbd>bg %-</kbd></td></tr><tr><td><kbd><strong>CTRL-Z</strong><br><kbd><strong>kill -s stop jobID</strong></kbd></kbd></td><td>挂起或停止作业</td><td><kbd>kill -s stop %ping</kbd></td></tr><tr><td><kbd><strong>jobs</strong><br><kbd><strong>jobs -l</strong></kbd></kbd></td><td>列出活动的作业</td><td><kbd>jobs -l</kbd></td></tr><tr><td><kbd><strong>bg</strong></kbd></td><td>将 作业置入后台</td><td><kbd>bg %1<br>bg %ping</kbd></td></tr><tr><td><kbd><strong>fg</strong></kbd></td><td>将作业置入前台</td><td><kbd>fg %2<br>fg %apt-get</kbd></td></tr></tbody></table>

#### 关于 shell 内置命令和外部命令的小注 ####

运行下面的 type 命令找出给予命令是否属于内部或外部的。

    type -a fg bg jobs disown

输出样式：

    fg is a shell builtin
    fg is /usr/bin/fg
    bg is a shell builtin
    bg is /usr/bin/bg
    jobs is a shell builtin
    jobs is /usr/bin/jobs
    disown is a shell builtin

在几乎所有情况下，你都需要使用 shell 的内置命令。所有外部命令例如 /usr/bin/fg 或 /usr/bin/jobs 工作在一个不同的 shell 环境下，而不能用在父 shell 的环境下。

#### 总结 ####

我希望你能喜欢这篇博文系列([rss 订阅][16]),我建议你阅读下面的更多信息：

- 在我们的 faq 章节查阅有关进程管理的文章[disoen 命令示例][17]，[jobs 命令示例][18]，[bg 命令示例][19]，和[fg 命令示例][20]。
- Man pages [bash(1)][21], [ksh(1)][22], [ps(1)][23], [kill(1)][24]
- [Korn shell (ksh93) 文档][25].
- [NU bash shell 文档][26].

我会计划在这个系列添加更多深入的教程。若果你需要看到具体的主题，请在下方评论让我知道。

--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/howto/unix-linux-job-control-command-examples-for-bash-ksh-shell/

译者：[Luoxcat](https://github.com/Luoxcat) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.cyberciti.biz/faq/unix-linux-jobs-command-examples-usage-syntax/
[2]:http://www.cyberciti.biz/faq/unix-kill-command-examples/
[3]:http://www.cyberciti.biz/faq/unix-ping-command-examples/
[4]:http://www.cyberciti.biz/howto/unix-linux-job-control-command-list-for-bash-ksh-shell/attachment/run-xeyes-command-in-background/
[5]:http://www.cyberciti.biz/howto/unix-linux-job-control-command-list-for-bash-ksh-shell/attachment/suspend-unix-job-command/
[6]:http://www.cyberciti.biz/faq/unix-linux-fg-command-examples-usage-syntax/
[7]:http://www.cyberciti.biz/faq/unix-linux-fg-command-examples-usage-syntax/
[8]:http://www.cyberciti.biz/faq/rhel-centos-fedora-linux-yum-command-howto/
[9]:http://www.cyberciti.biz/faq/unix-linux-bg-command-examples-usage-syntax/
[10]:http://www.cyberciti.biz/faq/rhel-centos-fedora-linux-yum-command-howto/
[11]:http://www.cyberciti.biz/faq/unix-kill-command-examples/
[12]:http://www.cyberciti.biz/faq/unix-linux-killall-command-examples-usage-syntax/
[13]:http://www.cyberciti.biz/faq/
[14]:http://www.cyberciti.biz/faq/unix-linux-disown-command-examples-usage-syntax/
[15]:http://www.cyberciti.biz/tips/nohup-execute-commands-after-you-exit-from-a-shell-prompt.html
[16]:http://www.cyberciti.biz/tutorials/practical-unixlinux-series/feed/
[17]:http://www.cyberciti.biz/faq/unix-linux-disown-command-examples-usage-syntax/
[18]:http://www.cyberciti.biz/faq/unix-linux-jobs-command-examples-usage-syntax/
[19]:http://www.cyberciti.biz/faq/unix-linux-bg-command-examples-usage-syntax/
[20]:http://www.cyberciti.biz/faq/unix-linux-fg-command-examples-usage-syntax/
[21]:http://www.manpager.com/linux/man1/bash.1.html
[22]:http://www.manpager.com/linux/man1/ksh.1.html
[23]:http://www.manpager.com/linux/man1/ps.1.html
[24]:http://www.manpager.com/linux/man1/kill.1.html
[25]:http://www2.research.att.com/sw/download/man/man1/ksh.html
[26]:https://www.gnu.org/software/bash/manual/bashref.html

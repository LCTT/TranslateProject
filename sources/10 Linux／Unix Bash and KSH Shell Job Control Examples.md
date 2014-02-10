10 Linux/Unix Bash and KSH Shell Job Control Examples
================================================================================
![](http://s0.cyberciti.org/uploads/cms/2014/02/unix-llnux-shell-job-control-series.jpg)

Linux and Unix are multitasking operating systems i.e. a system that can run multiple tasks (process) during the same period of time. In this new blog series, I am going to list the Linux and Unix job control commands that you can use for multitasking with the Bash or Korn or POSIX shell.

### What is a job control? ###

Job control is nothing but the ability to stop/suspend the execution of processes (commands) and continue/resume their execution as per your requirements. This is done using your operating system and shell such as bash/ksh or POSIX shell.

### Who provides a facility to control jobs? ###

The Bash / Korn shell, or POSIX shell provides a facility to control jobs.

### Say hello to job table ###

Your shell keeps a table of current jobs, called job table. When you type command the shell assigns a jobID (also known as JOB_SPEC). A jobID or JOB_SPEC is nothing but small integer numbers.

#### #1: Creating your first Linux/Unix job ####

I am going to run a command called xeyes that displays two googly eyes on screen, enter:

    $ xeyes &

Sample outputs:

[![](http://s0.cyberciti.org/uploads/cms/2014/02/run-xeyes-command-in-background.jpg)][4]
*Fig.01: Running the xeyes command in the background*

I started a job in the background with an ampersand (&). The shell prints a line that looks like the following:

    [1] 6891

In this example, two numbers are output as follows

- [1] : The xeyes job, which was started in the background, was job number 1.
- 6891 : A process ID of job number 1.

I am going to start a few more jobs:

    ## Start a text editor, system load average display for X, and sleep command ##
    gedit /tmp/hello.c &
    xload &
    sleep 100000 &

#### #2: List the current jobs ####

To [see the status of active jobs in the current shell][1], type:

    $ jobs
    $ jobs -l

Sample outputs:

    [1]   9379 Running                 xeyes &
    [2]   9380 Running                 gedit /tmp/hello.c &
    [3]-  9420 Running                 xload &
    [4]+  9421 Running                 sleep 100000 &

A brief description of each field is given below:

(注：表格部分，这样发表出来应该会方便看一点)
<table border="1"><tbody><tr><th>Field</th><th>Value</th><th>Description</th><th>Example(s)</th></tr><tr><td>1</td><td>[1]</td><td><strong>jobID</strong> or <strong>JOB_SPEC</strong> - Job number to use with the fg, bg, wait, kill and other shell commands. You must prefix the job number with a percent sign (<kbd><strong>%</strong></kbd>).<br>A plus sign (<kbd>+</kbd>) identifies the default or current job.<br>A minus sign (<kbd>-</kbd>) identifies the previous job.</td><td><kbd>%1</kbd><br><kbd>fg %1</kbd><br><kbd>kill %2</kbd></td></tr><tr><td>2</td><td>9379</td><td>P<strong>rocess ID</strong> - An identification unique number that is automatically assigned to each process when it is created on the system.</td><td>kill 9379</td></tr><tr><td>3</td><td>Running</td><td><strong>state</strong> - The state of job:<br><kbd><strong>Running</strong></kbd> - The job is currently running and has not been suspended by a signal.<br><kbd><strong>Stopped</strong></kbd> - The job was suspended.<br></td><td>N/A</td></tr><tr><td>4</td><td>xeyes &amp;</td><td><strong>command</strong> - The command that was given to the shell.</td><td>script &amp;<br>firefox url&amp;</td></tr></tbody></table>

You can also use ps command to list the processes running on the system:

    $ ps

#### #3: Stop or suspend running jobs ####

Hit the [Ctrl]-[Z] key or use [kill command][2] as follows:

    kill -s stop PID

In this example, start [ping command][3] and use the Ctrl-Z key sequence to stop the ping command job:

[![](http://s0.cyberciti.org/uploads/cms/2014/02/suspend-unix-job-command.gif)][5]
*Animated gif 01: Suspending ping command job*

#### #4: Resume suspended/stopped job in the foreground ####

Let us [resume or bring stopped ping job to the foreground][6] and make it the current job with the help of [fg command][7]. The syntax is as follows:

    ## Job id number 5 for ping command ##
    fg %5

I can also state any job whose command line begins with the string "ping":

    ## %String ##
    fg %ping

Sample outputs:

    64 bytes from www.cyberciti.biz (75.126.153.206): icmp_req=3 ttl=53 time=265 ms
    64 bytes from www.cyberciti.biz (75.126.153.206): icmp_req=4 ttl=53 time=249 ms
    64 bytes from www.cyberciti.biz (75.126.153.206): icmp_req=5 ttl=53 time=267 ms
    ^C

#### #5: Resume suspended/stopped job in the background ####

In this example, I am going to update all installed packages on Red Hat or CentOS Linux production server using [yum command][8] background job:

    # yum -y update &>/root/patch.log &

However, due to some reason (say load issue) I decided to stop this job for 20 minutes:

    # kill -s stop %yum

Sample outputs:

    [7]+  Stopped                 yum -y update &>/root/patch.log &

#### Restart a stopped background yum process with bg ####

Now, I am going to [resume stopped the yum -y update &>/root/patch.log & job][9], type:

    # bg %7

OR

    # bg %yum

Sample outputs:

    [7]+ yum -y update &>/root/patch.log &

#### #6: Kill a job / process ####

To stop/kill a [yum command][10] process, enter the following [kill command][11] whose jobID was 7:

    # kill %7

OR

    # kill pid

Sample outputs:

    [7]+  Terminated              yum -y update &>/root/patch.log &

On Linux/FreeBSD/OS X Unix you can [use killall command to kill process by name instead of PID][12] or jobID.

#### #7 Why does shell kill off all my background jobs when I logout? ####

In this example, I am going to start pdfwriter.py job to generate pdf files for [this site][13] in bulk:

    ~/scripts/www/pdfwriter.py --profile=faq --type=clean --header=logo\
    --footer-left "nixCraft is GIT UL++++ W+++ C++++ M+ e+++ d-" \
    --footer-right "Page [of] of [total]" &

As soon as I logout from shell, pdfwriter.py job will be killed by my shell. To overcome this problem use [disown shell builting command to tell the shell not to send a HUP signal][14], type:

    $ ~/scripts/www/pdfwriter.py --profile=faq .... &
    $ disown
    $ exit

#### #8 Prevent job from being killed on logout using an external command called nohup ####

You can also use [nohup command to execute jobs after you exit from a shell prompt][15]:

    $ nohup ~/scripts/www/pdfwriter.py --profile=faq .... &
    $ exit

#### #9: Finding the PID of last job ####

To find the the process ID of the most recently executed background (asynchronous) command, use bash shell special parameter $!

    $ gedit foo.txt &
    $ echo "PID of most recently executed background job - $!" 

Sample outputs:

    PID of most recently executed background job - 9421

#### #10: Wait for job completion ####

The wait command waits for given process ID or jobID (job specification) , and reports its termination status. The syntax is as follows:

    /path/to/large-job/command/foo &
    wait $!
    /path/to/next/job/that-is-dependents/on-foo-command/bar

Here is one of my working script:

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

#### Linux and Unix job control command list summery ####

<table border="1"><tbody><tr><th>Command</th><th>Description</th><th>Example(s)</th></tr><tr><td><kbd><strong>&amp;</strong></kbd></td><td>Put the job in the background</td><td><kbd>command &amp;</kbd></td></tr><tr><td><kbd><strong>%n</strong></kbd></td><td>Set the job with the given n (number)</td><td><kbd>command %1</kbd></td></tr><tr><td><kbd><strong>%Word</strong></kbd></td><td>Refer the job whose command line begins with the Word</td><td><kbd>command %yum</kbd></td></tr><tr><td><kbd><strong>%?Word</strong></kbd></td><td>Refer any job whose command line contains the Word</td><td><kbd>command %?ping</kbd></td></tr><tr><td><kbd><strong>%%</strong></kbd><br><kbd><strong>%+</strong></kbd></td><td>Refer to the current job</td><td><kbd>kill %%<br>kill %+</kbd></td></tr><tr><td><kbd><strong>%-</strong></kbd></td><td>Refer to the previous job</td><td><kbd>bg %-</kbd></td></tr><tr><td><kbd><strong>CTRL-Z</strong><br><kbd><strong>kill -s stop jobID</strong></kbd></kbd></td><td>Suspend or stop the job</td><td><kbd>kill -s stop %ping</kbd></td></tr><tr><td><kbd><strong>jobs</strong><br><kbd><strong>jobs -l</strong></kbd></kbd></td><td>List the active jobs</td><td><kbd>jobs -l</kbd></td></tr><tr><td><kbd><strong>bg</strong></kbd></td><td>Put jobs to the background</td><td><kbd>bg %1<br>bg %ping</kbd></td></tr><tr><td><kbd><strong>fg</strong></kbd></td><td>Put job to the foreground</td><td><kbd>fg %2<br>fg %apt-get</kbd></td></tr></tbody></table>

#### A note about shell built-in and external commands ####

Run the following type command to find out whether given command is internal or external:

    type -a fg bg jobs disown

Sample outputs:

    fg is a shell builtin
    fg is /usr/bin/fg
    bg is a shell builtin
    bg is /usr/bin/bg
    jobs is a shell builtin
    jobs is /usr/bin/jobs
    disown is a shell builtin

In almost all cases, you need to use shell built-in commands. All external commands such as /usr/bin/fg or /usr/bin/jobs works in a different shell environment, and can not use parent shell's environment.

#### Conclusion ####

I hope you enjoyed this blog post series ([rss feed][16]) and I suggest that you read the following for more information:

- See our faq section for [disown command examples][17], [jobs command examples][18], [bg command examples][19], and [fg command examples][20] on Linux/Unix process management.
- Man pages [bash(1)][21], [ksh(1)][22], [ps(1)][23], [kill(1)][24]
- [Korn shell (ksh93) documentation][25].
- [NU bash shell documentation][26].

I am planning to add more in-depth tutorial in this series. Please let me know if you need to see specific topic in the comment section below.

--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/howto/unix-linux-job-control-command-examples-for-bash-ksh-shell/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

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
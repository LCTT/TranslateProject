Translating by goreliu ...

3 Useful Hacks Every Linux User Must Know
================================================================================
The world of Linux is filled with so much fun and interesting stuffs, the more we go in, the more we find stuffs. In our efforts to bring those little hacks and tips for you that makes you different from others, here we have came up with three little tricks.

### 1. How to Schedule a Linux Job Without Cron ###

Scheduling a job/command in Linux is acronym to cron. Whenever we need to schedule a job, we call cron, but do you know we can schedule a job at a later time without corn? You can do it as suggested below..

Run a command (say date) every 5 sec and write the output to a file (say date.txt). To achieve this scenario, we need to run the below one liner script directly on the command prompt.

    $ while true; do date >> date.txt ; sleep 5 ; done &

Anatomy of the above one liner script:

- while true – Ask script to run while the condition is true, it acts as a loop which makes the command to run again-and-again or say in a loop.
- do – do perform what follows, ie., execute command or set of commands that lies ahead of do statement.
- date >> date.txt – here the output of date command is being written to a file date.txt. Also note that we have used >> and not >.
- >> ensures that the file (date.txt) is not overwritten every time the script execute. It just append the changes. Whereas > overwrite the file again and again.
- sleep 5 – It ask the shell to keep a time difference of 5 seconds before it executed again. Note the time here is always measured in seconds. Say if you want to execute the command every 6 minutes, you should use (6*60) 360, in succession of sleep.
- done – marks the end of while loop.
- & – Put the whole process in loop to background.

Similarly, we can execute any script in the same manner. Here is the command to call a script after certain interval (say 100 sec) and the name of script is `script_name.sh`.

Also worth mentioning that the script above should be run in the directory where the script to be called lies, else you need to provide full path (`/home/$USER/…/script_name.sh`). The syntax for calling script at above described interval is:

    $ while true; do /bin/sh script_name.sh ; sleep 100 ; done &

**Conclusion**: The above one liner is not a replacement of Cron, because Cron utility supports a whole lots of options, as compared and is very flexible as well as customizable. However if we want to run certain test cases or I/O benchmark, then the above singe command will serve the purpose.

Read Also: [11 Linux Cron Job Scheduling Examples][1]

### 2. How to Clear Terminal without Using ‘clear’ Command ###

What we do to clear the screen? Well you may think how silly it is to ask such question. Well, we all know it’s ‘clear‘ command. However if we make a habit of using key combination ‘ctrl+l‘ to clear terminal, we will save a lot of time of ours.

Key combination ‘Ctrl+l‘ has the same effect as ‘clear‘ command. So from next time use ctrl+l to clear your Linux Command Line Interface.

**Conclusion**: Since ctrl+l is a key combination, so we can not use it inside a script. If we need to clear screen inside a shell script, call command ‘clear’, for all other cases I could think of now, ctrl+l is more than sufficient.

### 3. Run a command and come back to the current working directory automatically. ###

Well this is an amazing hack not many people know. You may run a command no matter what it return back to the current directory. All you need to do is to run the command in parentheses i.e., in between `( and )`.

Let see the example,

    avi@deb:~$ (cd /home/avi/Downloads/)

#### Sample Output ####

    avi@deb:~

First it cd to directory Downloads and then again return back to home directory in one go. May be you believe that the command didn’t executed and for some reason one or another it is not throwing error, since there is no change in prompt. Lets do a little more tweak..

    avi@deb:~$ (cd /home/avi/Downloads/ && ls -l)

#### Sample Output ####

    -rw-r-----  1 avi  avi     54272 May  3 18:37 text1.txt
    -rw-r-----  1 avi  avi     54272 May  3 18:37 text2.txt
    -rw-r-----  1 avi  avi     54272 May  3 18:37 text3.txt
    avi@deb:~$

So in the above command it first changed the current directory to Downloads and then list the content of that directory before returning back to current directory. Also, it proves that command executed successfully. You may run any sort of command in the parentheses and return back to your current working directory without a hitch.

That’s all for now, if you know any such Linux hacks or tricks you may share with us via our comment section and don’t forget to share this article with your friends….

--------------------------------------------------------------------------------

via: http://www.tecmint.com/useful-linux-hacks-commands/

作者：[Avishek Kumar][a]
译者：[goreliu](https://github.com/goreliu)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://www.tecmint.com/11-cron-scheduling-task-examples-in-linux/
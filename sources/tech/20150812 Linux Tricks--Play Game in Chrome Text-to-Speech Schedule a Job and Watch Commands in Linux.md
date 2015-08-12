Linux Tricks: Play Game in Chrome, Text-to-Speech, Schedule a Job and Watch Commands in Linux
================================================================================
Here again, I have compiled a list of four things under [Linux Tips and Tricks][1] series you may do to remain more productive and entertained with Linux Environment.

![Linux Tips and Tricks Series](http://www.tecmint.com/wp-content/uploads/2015/08/Linux-Tips-and-Tricks.png)

Linux Tips and Tricks Series

The topics I have covered includes Google-chrome inbuilt small game, Text-to-speech in Linux Terminal, Quick job scheduling using ‘at‘ command and watch a command at regular interval.

### 1. Play A Game in Google Chrome Browser ###

Very often when there is a power shedding or no network due to some other reason, I don’t put my Linux box into maintenance mode. I keep myself engage in a little fun game by Google Chrome. I am not a gamer and hence I have not installed third-party creepy games. Security is another concern.

So when there is Internet related issue and my web page seems something like this:

![Unable to Connect Internet](http://www.tecmint.com/wp-content/uploads/2015/08/Unable-to-Connect-Internet.png)

Unable to Connect Internet

You may play the Google-chrome inbuilt game simply by hitting the space-bar. There is no limitation for the number of times you can play. The best thing is you need not break a sweat installing and using it.

No third-party application/plugin required. It should work well on other platforms like Windows and Mac but our niche is Linux and I’ll talk about Linux only and mind it, it works well on Linux. It is a very simple game (a kind of time pass).

Use Space-Bar/Navigation-up-key to jump. A glimpse of the game in action.

![Play Game in Google Chrome](http://www.tecmint.com/wp-content/uploads/2015/08/Play-Game-in-Google-Chrome.gif)

Play Game in Google Chrome

### 2. Text to Speech in Linux Terminal ###

For those who may not be aware of espeak utility, It is a Linux command-line text to speech converter. Write anything in a variety of languages and espeak utility will read it loud for you.

Espeak should be installed in your system by default, however it is not installed for your system, you may do:

    # apt-get install espeak   (Debian)
    # yum install espeak       (CentOS)
    # dnf install espeak       (Fedora 22 onwards)

You may ask espeak to accept Input Interactively from standard Input device and convert it to speech for you. You may do:

    $ espeak [Hit Return Key]

For detailed output you may do:

    $ espeak --stdout | aplay [Hit Return Key][Double - Here]

espeak is flexible and you can ask espeak to accept input from a text file and speak it loud for you. All you need to do is:

    $ espeak --stdout /path/to/text/file/file_name.txt  | aplay [Hit Enter] 

You may ask espeak to speak fast/slow for you. The default speed is 160 words per minute. Define your preference using switch ‘-s’.

To ask espeak to speak 30 words per minute, you may do:

    $ espeak -s 30 -f /path/to/text/file/file_name.txt | aplay

To ask espeak to speak 200 words per minute, you may do:

    $ espeak -s 200 -f /path/to/text/file/file_name.txt | aplay

To use another language say Hindi (my mother tongue), you may do:

    $ espeak -v hindi --stdout 'टेकमिंट विश्व की एक बेहतरीन लाइंक्स आधारित वेबसाइट है|' | aplay 

You may choose any language of your preference and ask to speak in your preferred language as suggested above. To get the list of all the languages supported by espeak, you need to run:

    $ espeak --voices

### 3. Quick Schedule a Job ###

Most of us are already familiar with [cron][2] which is a daemon to execute scheduled commands.

Cron is an advanced command often used by Linux SYSAdmins to schedule a job such as Backup or practically anything at certain time/interval.

Are you aware of ‘at’ command in Linux which lets you schedule a job/command to run at specific time? You can tell ‘at’ what to do and when to do and everything else will be taken care by command ‘at’.

For an example, say you want to print the output of uptime command at 11:02 AM, All you need to do is:

    $ at 11:02
    uptime >> /home/$USER/uptime.txt 
    Ctrl+D

![Schedule Job in Linux](http://www.tecmint.com/wp-content/uploads/2015/08/Schedule-Job-in-Linux.png)

Schedule Job in Linux

To check if the command/script/job has been set or not by ‘at’ command, you may do:

    $ at -l

![View Scheduled Jobs](http://www.tecmint.com/wp-content/uploads/2015/08/View-Scheduled-Jobs.png)

View Scheduled Jobs

You may schedule more than one command in one go using at, simply as:

    $ at 12:30
    Command – 1
    Command – 2
    …
    command – 50
    …
    Ctrl + D

### 4. Watch a Command at Specific Interval ###

We need to run some command for specified amount of time at regular interval. Just for example say we need to print the current time and watch the output every 3 seconds.

To see current time we need to run the below command in terminal.

    $ date +"%H:%M:%S

![Check Date and Time in Linux](http://www.tecmint.com/wp-content/uploads/2015/08/Check-Date-in-Linux.png)

Check Date and Time in Linux

and to check the output of this command every three seconds, we need to run the below command in Terminal.

    $ watch -n 3 'date +"%H:%M:%S"'

![Watch Command in Linux](http://www.tecmint.com/wp-content/uploads/2015/08/Watch-Command-in-Linux.gif)

Watch Command in Linux

The switch ‘-n’ in watch command is for Interval. In the above example we defined Interval to be 3 sec. You may define yours as required. Also you may pass any command/script with watch command to watch that command/script at the defined interval.

That’s all for now. Hope you are like this series that aims at making you more productive with Linux and that too with fun inside. All the suggestions are welcome in the comments below. Stay tuned for more such posts. Keep connected and Enjoy…

--------------------------------------------------------------------------------

via: http://www.tecmint.com/text-to-speech-in-terminal-schedule-a-job-and-watch-commands-in-linux/

作者：[Avishek Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://www.tecmint.com/tag/linux-tricks/
[2]:http://www.tecmint.com/11-cron-scheduling-task-examples-in-linux/
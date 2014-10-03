Translating by johnhoow...
How to Use Systemd Timers
================================================================================
I was setting up some scripts to run backups recently, and decided I would try to set them up to use [systemd timers][1] rather than the more familiar to me [cron jobs][2].

As I went about trying to set them up, I had the hardest time, since it seems like the required information is spread around in various places. I wanted to record what I did so firstly, I can remember, but also so that others don’t have to go searching as far and wide as I did.

There are additional options associated with the each step I mention below, but this is the bare minimum to get started. Look at the man pages for **systemd.service**, **systemd.timer**, and **systemd.target** for all that you can do with them.

### Running a Single Script ###

Let’s say you have a script **/usr/local/bin/myscript** that you want to run every hour.

#### Service File ####

First, create a service file, and put it wherever it goes on your Linux distribution (on Arch, it is either **/etc/systemd/system/** or **/usr/lib/systemd/system**).

myscript.service

    [Unit]
    Description=MyScript
    
    [Service]
    Type=simple
    ExecStart=/usr/local/bin/myscript

Note that it is important to set the **Type** variable to be “simple”, not “oneshot”. Using “oneshot” makes it so that the script will be run the first time, and then systemd thinks that you don’t want to run it again, and will turn off the timer we make next.

#### Timer File ####

Next, create a timer file, and put it also in the same directory as the service file above.

myscript.timer

    [Unit]
    Description=Runs myscript every hour
    
    [Timer]
    # Time to wait after booting before we run first time
    OnBootSec=10min
    # Time between running each consecutive time
    OnUnitActiveSec=1h
    Unit=myscript.service
    
    [Install]
    WantedBy=multi-user.target

#### Enable / Start ####

Rather than starting / enabling the service file, you use the timer.

    # Start timer, as root
    systemctl start myscript.timer
    # Enable timer to start at boot
    systemctl enable myscript.timer

### Running Multiple Scripts on the Same Timer ###

Now let’s say there a bunch of scripts you want to run all at the same time. In this case, you will want make a couple changes on the above formula.

#### Service Files ####

Create the service files to run your scripts as I [showed previously][3], but include the following section at the end of each service file.

    [Install]
    WantedBy=mytimer.target

If there is any ordering dependency in your service files, be sure you specify it with the **After=something.service** and/or **Before=whatever.service** parameters within the **Description** section.

Alternatively (and perhaps more simply), create a wrapper script that runs the appropriate commands in the correct order, and use the wrapper in your service file.

#### Timer File ####

You only need a single timer file. Create **mytimer.timer**, as I [outlined above][4].

#### Target File ####

You can create the target that all these scripts depend upon.

mytimer.target

    [Unit]
    Description=Mytimer
    # Lots more stuff could go here, but it's situational.
    # Look at systemd.unit man page.

#### Enable / Start ####

You need to enable each of the service files, as well as the timer.

    systemctl enable script1.service
    systemctl enable script2.service
    ...
    systemctl enable mytimer.timer
    systemctl start mytimer.service

Good luck.

--------------------------------------------------------------------------------

via: http://jason.the-graham.com/2013/03/06/how-to-use-systemd-timers/#enable--start-1

作者：Jason Graham 
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://fedoraproject.org/wiki/User:Johannbg/QA/Systemd/Systemd.timer
[2]:https://en.wikipedia.org/wiki/Cron
[3]:http://jason.the-graham.com/2013/03/06/how-to-use-systemd-timers/#service-file
[4]:http://jason.the-graham.com/2013/03/06/how-to-use-systemd-timers/#timer-file-1

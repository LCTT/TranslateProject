如何使用 systemd 中的定时器
================================================================================
我最近在写一些执行备份工作的脚本，我决定使用[systemd timers][1]而不是对我而已更熟悉的[cron jobs][2]来管理它们。

在我使用时，出现了很多问题需要我去各个地方找资料，这个过程非常麻烦。因此，我想要把我目前所做的记录下来，方便自己的记忆，也方便读者不必像我这样，满世界的找资料了。

在我下面提到的步骤中有其他的选择，但是这里是最简单的方法。在此之前，请查看**systemd.service**, **systemd.timer**,和**systemd.target**的帮助页面(man)，学习你能用它们做些什么。

### 运行一个简单的脚本 ###

假设你有一个脚本叫：**/usr/local/bin/myscript** ，你想要每隔一小时就运行一次。

#### Service 文件 ####

第一步，创建一个service文件，根据你Linux的发行版本放到相应的系统目录(在Arch中，这个目录是**/etc/systemd/system/** 或 **/usr/lib/systemd/system**)

myscript.service

    [Unit]
    Description=MyScript
    
    [Service]
    Type=simple
    ExecStart=/usr/local/bin/myscript

注意，务必将**Type**变量的值设置为"simple"而不是"oneshot"。使用"oneshot"使得脚本只在第一次运行，之后系统会认为你不想再次运行它，从而关掉我们接下去创建的定时器(Timer)。

#### Timer 文件 ####

第二步，创建一个timer文件，把它放在第一步中service文件放置的目录。

myscript.timer

    [Unit]
    Description=Runs myscript every hour
    
    [Timer]
    # 首次运行要在启动后10分钟后 
    OnBootSec=10min
    # 每次运行间隔时间
    OnUnitActiveSec=1h
    Unit=myscript.service
    
    [Install]
    WantedBy=multi-user.target

#### 授权 / 运行 ####

授权并运行的是timer文件，而不是service文件。

    # 以 root 身份启动定时器
    systemctl start myscript.timer
    # 在系统引导起来后就启用该定时器 
    systemctl enable myscript.timer

### 在同一个Timer上运行多个脚本 ###

现在我们假设你在相同时间想要运行多个脚本。这种情况，**你需要在上面的文件中做适当的修改**。

#### Service 文件 ####

像我[之前说过的][3]那样创建你的service文件来运行你的脚本，但是在每个service 文件最后都要包含下面的内容:

    [Install]
    WantedBy=mytimer.target

如果在你的service 文件中有一些依赖顺序，确保你使用**Description**字段中的值具体指定**After=something.service**和**Before=whatever.service**中的参数。

另外的一种选择是(或许更加简单)，创建一个包装脚本来使用正确的顺序来运行命令，并在你的service文件中使用这个脚本。

#### Timer 文件 ####

你只需要一个timer文件，创建**mytimer.timer**，像我在[上面指出的](4)。

#### target 文件 ####

你可以创建一个以上所有的脚本依赖的target文件。

mytimer.target

    [Unit]
    Description=Mytimer
    # Lots more stuff could go here, but it's situational.
    # Look at systemd.unit man page.

#### 授权 / 启动 ####

你需要将所有的service文件和timer文件授权。

    systemctl enable script1.service
    systemctl enable script2.service
    ...
    systemctl enable mytimer.timer
    systemctl start mytimer.service

Good luck.

--------------------------------------------------------------------------------

via: http://jason.the-graham.com/2013/03/06/how-to-use-systemd-timers/

作者：Jason Graham 
译者：[johnhoow](https://github.com/johnhoow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://fedoraproject.org/wiki/User:Johannbg/QA/Systemd/Systemd.timer
[2]:https://en.wikipedia.org/wiki/Cron
[3]:http://jason.the-graham.com/2013/03/06/how-to-use-systemd-timers/#service-file
[4]:http://jason.the-graham.com/2013/03/06/how-to-use-systemd-timers/#timer-file-1

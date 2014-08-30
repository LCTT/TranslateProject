Check how much do you type with WhatPulse on Linux
================================================================================
![](http://cdn.linuxaria.com/wp-content/uploads/2014/08/whatpulse.png)

If, like me, you are a statistics freak you must install this small application on all your computers: [WhatPulse][1]

The software tracks a user’s pressed keys, mouse clicks and used [bandwidth][2] and the uptime of the system. Periodically, or by hand, the user can upload to the server the number of keystrokes made; this is called “pulsing”. 

Users can see where they are in a leaderboard of people who have joined the program and compare themselves against people from their own countries. Users can also join teams, which enables them to compare themselves against people with similar interests (Go Linux Users !!).

There is a basic, and free, version where you can easily see and check all the basic statistics and a premium account where you can see some more stats.

The software is available for Linux, Windows and Mac.

### Registration on the website ###

As first step you have to register your account on the [WhatPulse Website][1] or as alternative when you first start the WhatPulse client there is a practical wizard through which each user has the option to create an account to upload their own statistics (you can also log in with Facebook).

You will be prompted to login, once you login, you have to search for your computers name, this is because you can login to several computers with this and they’ll all collectively go to the same statistic count. Once you’ve logged in, a small W will appear in your system tray, that’s it, your set up!

### Installation of WhatPulse on Linux ###

The official website offer on the [download page][3] a generic version distributed via a .tar.gz archive (available for 32 and 64 bit) and a debian package.

Personally I’ve installed the debian package on my Mint Qiana and the [Aur Package][4] on My Arch Linux, no problems at all.

If you want to go with the generic installation please keep in mind that WhatPulse requires several libraries to function. Mainly Qt, because WhatPulse is built on Qt. Here’s a list of requirements:

- libQtCore
- libQtWebKit
- libqt4-sql
- libqt4-sql-sqlite
- openssl-devel (libssl-dev)
- libQtScript

#### Input Statistics ####

The client needs permissions to be allowed to read your keyboard/mouse input. Run the included interactive .sh script to set up these permissions.

#### [Network][5] Statistics ####

To enable the network measurements, you also need the package **libpcap** to allow WhatPulse to hook into the network traffic. If WhatPulse does not find libpcap, it will run but it will not display any network statistics.

![](http://cdn.linuxaria.com/wp-content/uploads/2014/08/heatmap.png)

### Using the Application ###

By default WhatPulse will start automatically at the login of your graphical session and clicking on the W on your systray you’ll go to the Overview tab that gives a birds-eye view of all the different information gathered about your machine, for instance, the Linux version installed on your PC, processor model, RAM, GPU, total click counts, keystrokes and bandwidth usage. Clicking ‘Pulse’ under these information will upload the gathered data to the main server.

It’s also possible to select when automatically ‘Pulse’ the data to the server, such as every 50.000 clicks or 1 GB downloaded.

For further details, you can switch to each category’s pertaining tab. For example, the Input tab shows you the amount of key strokes and clicks your PC has registered during a certain time period. The time period can be sorted on a daily, weekly, monthly, yearly and all-time basis. The ‘all’ setting will show stats since the program was installed.

Below the keystrokes, you’ll find the keyboard heat map, which basically uses light and warm colors to shows what keys were used more than others during the selected time period, as shown in the screenshot above. Below that, the app displays the total amount of clicks registered in the selected period.

Under the Network tab, it’s possible to view the daily Internet usage. The application can monitor bandwidth usage of all the network devices, and even shows you bandwidth usage by country. Once again, you can navigate between available data using the arrow buttons at the top-right.

On the website you’ll see the sum of all your computer statistics with the same information available on the client.

Disclaimer: The link above to the WhatPulse website contains my referral link, using it when you register will give me a premium account for some time.

--------------------------------------------------------------------------------

via: http://linuxaria.com/recensioni/check-how-much-do-you-type-with-whatpulse-on-linux

作者：[linuxari][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://plus.google.com/100563597940685405833?rel=author
[1]:http://whatpulse.org/ref/833872/
[2]:http://linuxaria.com/article/tool-command-line-bandwidth-linux
[3]:http://www.whatpulse.org/downloads/
[4]:https://aur.archlinux.org/packages/whatpulse/
[5]:http://linuxaria.com/tag/network
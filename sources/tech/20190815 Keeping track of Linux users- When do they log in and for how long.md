[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Keeping track of Linux users: When do they log in and for how long?)
[#]: via: (https://www.networkworld.com/article/3431864/keeping-track-of-linux-users-when-do-they-log-in-and-for-how-long.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Keeping track of Linux users: When do they log in and for how long?
======
Getting an idea how often your users are logging in and how much time they spend on a Linux server is pretty easy with a couple commands and maybe a script or two.
![Adikos \(CC BY 2.0\)][1]

The Linux command line provides some excellent tools for determining how frequently users log in and how much time they spend on a system. Pulling information from the **/var/log/wtmp** file that maintains details on user logins can be time-consuming, but with a couple easy commands, you can extract a lot of useful information on user logins.

One of the commands that helps with this is the **last** command. It provides a list of user logins that can go quite far back. The output looks like this:

```
$ last | head -5 | tr -s " "
shs pts/0 192.168.0.14 Wed Aug 14 09:44 still logged in
shs pts/0 192.168.0.14 Wed Aug 14 09:41 - 09:41 (00:00)
shs pts/0 192.168.0.14 Wed Aug 14 09:40 - 09:41 (00:00)
nemo pts/1 192.168.0.18 Wed Aug 14 09:38 still logged in
shs pts/0 192.168.0.14 Tue Aug 13 06:15 - 18:18 (00:24)
```

Note that the **tr -s " "** portion of the command above reduces strings of blanks to single blanks, and in this case, it keeps the output shown from being so wide that it would be wrapped around on this web page. Without the **tr** command, that output would look like this:

```
$ last | head -5
shs      pts/0        192.168.0.14     Wed Aug 14 09:44   still logged in
shs      pts/0        192.168.0.14     Wed Aug 14 09:41 - 09:41  (00:00)
shs      pts/0        192.168.0.14     Wed Aug 14 09:40 - 09:41  (00:00)
nemo     pts/1        192.168.0.18     Wed Aug 14 09:38   still logged in
shs      pts/0        192.168.0.14     Wed Aug 14 09:15 - 09:40  (00:24)
```

**[ Two-Minute Linux Tips: [Learn how to master a host of Linux commands in these 2-minute video tutorials][2] ]**

While it’s easy to generate and review login activity records like these for all users with the **last** command or for some particular user with a **last username** command, without the pipe to **head**, these commands will generally result in a _lot_ of data. In this case, a listing for all users would have 908 lines.

```
$ last | wc -l
908
```

### Counting logins with last

If you don't need all of the login detail, you can view user login sessions as a simple count of logins for all users on the system with a command like this:

```
$ for user in `ls /home`; do echo -ne "$user\t"; last $user | wc -l; done
dorothy 21
dory    13
eel     29
jadep   124
jdoe    27
jimp    42
nemo    9
shark   17
shs     423
test    2
waynek  201
```

The list above shows how many times each user has logged since the current **/var/log/wtmp** file was initiated. Notice, however, that the command to generate it does depend on user accounts being set up in the default /home directory.

Depending on how much data has been accumulated in your current **wtmp** file, you may see a lot of logins or relatively few. To get a little more insight into how relevant the number of logins are, you could turn this command into a script, adding a command that shows when the first login in the current file occurred to provide a little perspective.

```
#!/bin/bash

echo -n "Logins since "
who /var/log/wtmp | head -1 | awk '{print $3}'
echo "======================="

for user in `ls /home`
do
  echo -ne "$user\t"
  last $user | wc -l
done
```

When you run the script, the "Logins since" line will let you know how to interpret the stats shown.

```
$ ./show_user_logins
Logins since 2018-10-05
=======================
dorothy 21
dory    13
eel     29
jadep   124
jdoe    27
jimp    42
nemo    9
shark   17
shs     423
test    2
waynek  201
```

### Looking at accumulated login time with **ac**

The **ac** command provides a report on user login time — hours spent logged in. As with the **last** command, **ac** reports on user logins since the last rollover of the **wtmp** file since **ac**, like **last**, gets its details from **/var/log/wtmp**. The **ac** command, however, provides a much different view of user activity than the number of logins. For a single user, we might use a command like this one:

```
$ ac nemo
        total       31.61
```

This tells us that nemo has spent nearly 32 hours logged in. To use the command to generate a listing of the login times for all users, you might use a command like this:

```
$ for user in `ls /home`; do ac $user | sed "s/total/$user\t/" ; done
        dorothy         9.12
        dory            1.67
        eel             4.32
          …
```

In this command, we are replacing the word “total” in each line with the relevant username. And, as long as usernames are fewer than 8 characters, the output will line up nicely. To left justify the output, you can modify that command to this:

```
$ for user in `ls /home`; do ac $user | sed "s/^\t//" | sed "s/total/$user\t/" ; done
dorothy         9.12
dory            1.67
eel             4.32
...
```

The first used of **sed** in that string of commands strips off the initial tabs.

To turn this command into a script and display the initial date for the **wtmp** file to add more relevance to the hour counts, you could use a script like this:

```
#!/bin/bash

echo -n "hours online since "
who /var/log/wtmp | head -1 | awk '{print $3}'
echo "============================="

for user in `ls /home`
do
  ac $user | sed "s/^\t//" | sed "s/total/$user\t/"
done
```

If you run the script, you'll see the hours spent by each user over the lifespan of the **wtmp** file:

```
$ ./show_user_hours
hours online since 2018-10-05
=============================
dorothy        70.34
dory            4.67
eel            17.05
jadep         186.04
jdoe           28.20
jimp           11.49
nemo           11.61
shark          13.04
shs          3563.60
test            1.00
waynek        312.00
```

The difference between the user activity levels in this example is pretty obvious with one user spending only one hour on the system since October and another dominating the system.

### Wrap-up

Reviewing how often users log into a system and how many hours they spend online can both give you an overview of how a system is being used and who are likely the heaviest users. Of course, login time does not necessarily correspond to how much work each user is getting done, but it's likely close and commands such as **last** and **ac **can help you identify the most active users.

### More Linux advice: Sandra Henry-Stocker explains how to use the rev command in this 2-Minute Linux Tip video

Join the Network World communities on [Facebook][3] and [LinkedIn][4] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3431864/keeping-track-of-linux-users-when-do-they-log-in-and-for-how-long.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/08/keyboard-adikos-100808324-large.jpg
[2]: https://www.youtube.com/playlist?list=PL7D2RMSmRO9J8OTpjFECi8DJiTQdd4hua
[3]: https://www.facebook.com/NetworkWorld/
[4]: https://www.linkedin.com/company/network-world

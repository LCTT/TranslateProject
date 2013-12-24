Linux who command – Displays who is on the system
================================================================================
As a system administrator, we need to ensure who is on the system on a particular time. We must keep on eye to our servers. But of course we can’t do that for 24 hours a day. On Linux system, we can use who command to see who is on the system

### What is who command ###

**who** command is a tool print information about users **who are currently logged in**. who command only see a real user who logged in. It won’t see a user that doing **su** command (switch user).

### How to use who command ###

On most Linux distribution, who command is already installed. To use it, just type who on your console. Running it without options will print a default output.

    $ who

![](http://linoxide.com/wp-content/uploads/2013/12/who_default.png)

#### Here’s how to read the output : ####

- 1st column show the user name
- 2nd column show how the user connected. Tty means the user is connected directly to the computer, while pts means the user is connected from remote
- 3rd and 4th columns show the date and time
- 5th column show the IP Address where the users are connected

### Using who command with options ###

Who command has some options to make the custom output. Here are some samples on day-to-day usage.

#### Indicate the time and date of the last reboot ####

To do this, use **-b** options

    $ who -b

![](http://linoxide.com/wp-content/uploads/2013/12/who_b.png)

We can see that system was boot the computer on December 21st , 2013 at 3:52 PM

#### Indicate the current run-level of the init process ####

With -r option, who will print a current run-level of the init process.

    $ who -r

![](http://linoxide.com/wp-content/uploads/2013/12/who_r.png)

The output show us that the current run-level on December 21st , 2013 at 3:52 PM was run-level 2.

#### Put header above every column ####

Use -H option to put a header above every column

    $ who -H

![](http://linoxide.com/wp-content/uploads/2013/12/who_H.png)

#### Print only information about current terminal ####

We can use **-m** option to do this.

    $ who -m

![](http://linoxide.com/wp-content/uploads/2013/12/who_m.png)

#### Count how many user that currently logged in ####

If you have many users logged in at the same time, this -q option will help you to count them.

    $ who -q

![](http://linoxide.com/wp-content/uploads/2013/12/who_q.png)

#### Add idle time and PID information ####

By default, who will not print Idle Time and PID information. To add those information, use -u option. Don’t forget to use -H option to make it easier to read.

    $ who -u -H

![](http://linoxide.com/wp-content/uploads/2013/12/who_u.png)

**The idle time** contains the number of hours and minutes since last activity occurred. So 00:13 means that user leni has been idle for 13 minutes. **The dot (.) sign** tell us that the terminal has seen activity on the last minute. During that time, we can call it “current”. **The PID** is a process ID of the user’s shell.

#### Show login process ####

To show it, we can use **-l** option.

    $ who -l

![](http://linoxide.com/wp-content/uploads/2013/12/who_l.png)

The 1st column only show Login name which refer to System. The number 967, 971 etc on the screenshot above tell us the PID.

#### Display all the information ####

Using **-a** option will showing us all information. Here’s a sample.

    $ who -a

![](http://linoxide.com/wp-content/uploads/2013/12/who_a.png)

#### Conclusion ####

You will found that who command is similar with [w command][1] in some ways. Don’t be confused about why Linux has some similar command in term its functionality. You can use what you think the best for you and suit the situation you are facing. Please consult to who manual page by typing man who from your console to explore it more detail.
- See more at: http://linoxide.com/linux-command/linux-who-command/#sthash.CU0bq3e4.dpuf

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-who-command/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://linoxide.com/linux-command/linux-w-command/
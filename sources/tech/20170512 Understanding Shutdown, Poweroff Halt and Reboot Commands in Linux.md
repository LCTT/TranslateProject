translating---geekpi

Understanding Shutdown, Poweroff, Halt and Reboot Commands in Linux
============================================================

 Download Your Free eBooks NOW - [10 Free Linux eBooks for Administrators][3] | [4 Free Shell Scripting eBooks][4]

In this article, we will explain to you the difference between shutdown, poweroff, halt and reboot Linux commands. We will make clear what they actually do when you execute them with available options.

If you are hoping to dive into Linux server administration, then these are [some of the important Linux commands][1] you need to fully understand for effective and reliable server administration.

Normally, when you want to turn off or reboot your machine, you’ll run one of the commands below:

### Shutdown Command

shutdown schedules a time for the system to be powered down. It may be used to halt, power-off or reboot the machine.

You may specify a time string (which is usually “now” or “hh:mm” for hour/minutes) as the first argument. Additionally, you may set a wall message to be sent to all logged-in users before the system goes down.

Important: If the time argument is used, 5 minutes before the system goes down the /run/nologin file is created to ensure that further logins will not be allowed.

Examples of shutdown commands:

```
# shutdown
# shutdown now
# shutdown 13:20  
# shutdown -p now	#poweroff the machine
# shutdown -H now	#halt the machine		
# shutdown -r09:35	#reboot the machine at 09:35am
```

To cancel a pending shutdown, simply type the command below:

```
# shutdown -c
```

### Halt Command

halt instructs the hardware to stop all CPU functions, but leaves it powered on. You can use it to get the system to a state where you can perform low level maintenance.

Note that in some cases it completely shuts down the system. Below are examples of halt commands:

```
# halt		   #halt the machine
# halt -p	   #poweroff the machine
# halt --reboot    #reboot the machine
```

### Power off Command

poweroff sends an ACPI signal which instructs the system to power down.

The following are examples of poweroff commands:

```
# poweroff   	       #poweroff the machine
# poweroff --halt      #halt the machine
# poweroff --reboot    #reboot the machine
```

### Reboot Command

reboot instructs the system to restart.

```
# reboot            #reboot the machine
# reboot --halt     #halt the machine
# reboot -p   	    #poweroff the machine
```

That’s all! As mentioned earlier on, understanding these commands will enable to effectively and reliably manage Linux server in a multi-user environment. Do you have any additional ideas? Share them with us via the comments section below.

--------------------------------------------------------------------------------

作者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.


--------------------------

via: https://www.tecmint.com/shutdown-poweroff-halt-and-reboot-commands-in-linux/

作者：[Aaron Kili ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.tecmint.com/author/aaronkili/
[1]:https://www.tecmint.com/60-commands-of-linux-a-guide-from-newbies-to-system-administrator/
[2]:https://www.tecmint.com/author/aaronkili/
[3]:https://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[4]:https://www.tecmint.com/free-linux-shell-scripting-books/

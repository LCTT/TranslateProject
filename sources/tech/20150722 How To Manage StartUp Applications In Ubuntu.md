How To Manage StartUp Applications In Ubuntu
================================================================================
![Manage startup applications in Ubuntu](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/07/Manage-Start-up-apps-in-Ubuntu.png)

Ever felt the need to **control startup applications in Ubuntu**? You should, if you feel that your Ubuntu system is very slow at the boot time.

Every time you boot in to an operating system, a number of applications start automatically. These are called ‘startup applications’ or ‘start up programs’. Over the time, when you have plenty of application installed in your system, you’ll find that there are too many of these ‘startup applications’ which start at the boot time automatically, eats up the system resource and slows down the system. This might result in a sluggish Ubuntu experience, which I think, you don’t want at all.

A way to make Ubuntu faster is to control startup applications. Ubuntu provides you GUI tools that you can use to find out the startup programs, disable them entirely or delay their execution so that you won’t have each application trying to run at the same time.

In this post we shall see **how to control startup applications, how to run an application at startup and how to find hidden startup applications in Ubuntu**. The instructions provided here are applicable to all Ubuntu versions such as Ubuntu 12.04, Ubuntu 14.04 and Ubuntu 15.04.

### Manage startup applications in Ubuntu ###

By default, Ubuntu provides Startup Applications utility that you could use. No need of installation. Just go in Unity Dash and look for startup applications.

![Startup applications Ubuntu](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/07/startup_applications_Ubuntu.jpeg)

Click on it to start. Here is what my startup applications look like:

![Find startup programs in Ubuntu](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/07/Screenshot-from-2015-07-18-122550.png)

### Remove startup applications in Ubuntu ###

Now it is up to you what you find useless. For me [Caribou][1], on screen keyboard program, is not of any use at the startup. I would prefer to remove it.

You can choose to either prevent it from starting up at boot time but keeping it in the startup applications list for future reactivation. Click on close to save your preference.

![remove startup programs in Ubuntu](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/07/startup_applications_ubuntu_2.png)

To remove a program from startup applications list, select it and click on Remove from the right window pane.

![remove programs from startup applications in Ubuntu](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/07/startup_applications_Ubuntu_1.jpeg)

Note that, this will NOT uninstall the program. Just that the program will not start automatically at each boot. You can do it with all the programs that you don’t like.

### Delay the start up programs ###

What if you do not want to remove programs at the start up but you are worried about system performance at the boot time. What you can do is to add a delay in various programs so that not all the programs will be starting at the same time.

Select a program and click Edit.

![edit startup applications ubuntu](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/07/startup_applications_ubuntu_3.png)

This will show the command that runs this particular program.

![commands at startup programs](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/07/startup_applications_ubuntu_4.jpg)

All you need to do is to add sleep XX; before the command. It will add a delay of XX seconds before running the actual commands to run the applications. For example if I want Variety [wallpaper management application][2] for 2 minutes, I’ll add sleep 120; before the command like this:

![delay the startup of programs in Ubuntu](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/07/startup_applications_ubuntu_5.png)

Save it and close it. You’ll see the impact at the next boot.

### Add a program in the startup applications ###

This could be tricky for beginners. You see, things are in commands at the bottom of everything in Linux. We just saw in the previous section that these startup programs are just some commands being run at each boot. If you want to add a new program in the startup, you’ll need to know the command that runs the application.

#### Step 1: How to find the command to run an application? ####

Go in the Unity Dash and search for Main Menu:

![Program Menu Ubuntu](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/07/Program_menu_Ubuntu.jpg)

This contains all the program that you have installed in various categories. In old Ubuntu days, you would see similar menu for selecting and running applications.

![main menu in ubuntu](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/07/Main_menu_ubuntu.jpeg)

Just look for your application under various categories and click on the Properties tab to see the command that runs this application. For example, I want to run Transmission Torrent client on start up.

![find running command of programs in ubuntu](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/07/Main_menu_ubuntu_1.jpeg)

This will give me the command that runs Transmission:

![find running commands of a program in Ubuntu](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/07/startup_programs_commands.png)

Now I’ll use the same information to add Transmission in startup applications.

#### Step 2: Adding programs in startup ####

Go again in Startup Applications and click on Add. This will ask you enter a name, command and description. The command is the most important of all. You can use whatever name and description you want. Use the command you got from previous step and click on Add.

![Adding a startup program in Ubuntu](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/07/Add_startup_program_Ubuntu.jpg)

That’s it. You’ll see it in the next boot up, running automatically. This is all you can do with startup applications in Ubuntu.

So, far we have discussed about applications that are visible in startup but there are many more services, daemons and programs that are not visible to Startup applications. In next section, we shall see how to see hidden startup programs in Ubuntu.

### See hidden startup program in Ubuntu ###

To see what are the services running at startup, open a terminal and use the following command:

    sudo sed -i 's/NoDisplay=true/NoDisplay=false/g' /etc/xdg/autostart/*.desktop

This is just a quick find and replace command that changes the NoDisplay=false with NoDisplay=true in all the programs that are in autostart. Once you do this, open Startup Applications again and now you shall see many more programs here:

![See Hidden Start up programs in Ubuntu](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/07/Hidden_startup_program_Ubuntu.jpg)

You can manage these startup applications the same way which were described earlier. I hope this tutorial helped you to control startup program in Ubuntu. Any questions or suggestions are always welcomed.

--------------------------------------------------------------------------------

via: http://itsfoss.com/manage-startup-applications-ubuntu/

作者：[Abhishek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:https://wiki.gnome.org/action/show/Projects/Caribou?action=show&redirect=Caribou
[2]:http://itsfoss.com/applications-manage-wallpapers-ubuntu/
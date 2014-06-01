Translating by GOLinux...
Linux script command - A recorder inside your Terminal
================================================================================
When you are working on the terminal or console, you may want to record what you have done in the terminal. The recording can be used as a documentation about what happen in terminal. Let say you are working together with some Linux Administrators at the same time. Or you let someone to remote your server. You may want to record about what happen in the terminal. To do this, you can use script command.

### What is script ###

script is a command that make a typescript that printed in the terminal. It is useful for everyone who need a hardcopy record of the session that happened in the terminal. This record can be saved and printed out later.

### How to use it ###

By default, we can start script with typing script on the terminal.

    pungki@dev-machine:~$ script
    Script started, file is typescript
    pungki@dev-machine:~$

You can also define a destination filename to write the result of typescript.

    pungki@dev-machine:~$ script myfile

![Define script file](http://linoxide.com/wp-content/uploads/2014/03/start_script.png)

When you received a command prompt again, it means the terminal will record anything that is printed in terminal.

You will see in the current directory, there is a file named typescript.

### Why we use script command ###

As we mention before, script has main function to record everything. Here’s two samples of scenarios why we are using it.

#### Collaborate with colleague ####

When working together with your colleague, we can record your activity with script.
Let say we will use a typescript file called **collaborate**. To do that type :

    $ script collaborate

![Create collaborate file](http://linoxide.com/wp-content/uploads/2014/03/collaborate.png)

Then after doing some tasks, let say you need to send your work to another engineer. Just send the file. So when the other engineer need to review what was done, he can just open the file using a text editor.

If he want to update the file, he can use **-a** option.

    $ script -a collaborate

![Append the file](http://linoxide.com/wp-content/uploads/2014/03/collaborate_append.png)

#### Record someone activity in the terminal ####

You may let your engineer or someone to enter your system remotely. To make sure that your engineer are doing right, you can record what he had done to your system. To make the script command run automatically upon login, we can add it on your shell profile. If you are using **bash** shell, add this line into your bash profile.

    $ vi ~/.profile

    # run the script command to record everything
    # use -q for quite and -a option to append the script
    #
    /usr/bin/script -qa /usr/local/script/log_record_script

![Add script to bash profile](http://linoxide.com/wp-content/uploads/2014/03/script_login.png)

Then save it. Next time he logged in to your system, script command will automatically run and put the log on the **/usr/local/script/log_record_script**

![Script without notification](http://linoxide.com/wp-content/uploads/2014/03/remote_script_quite.png)

The option **-q** will run script command in quite mode. The user who logged in will not have any notification that the script command is run. While **-a** option will add the record without erasing the previous record.

If we don’t use **-q** option, then when the user logged on, the user will get a notification about script as the picture below.

![Script with notification](http://linoxide.com/wp-content/uploads/2014/03/remote_script.png)

### Quit recording ###

To exit the record activity, we can press **Ctrl+D** button or type **exit** from the terminal. Before you exit from script, you will find the size of the record file is 0 Kb. After you exit from script, the file size will change.

### Conclusion ###

Script command may useful when you need to record or documenting what happen in the terminal. The record file will be stored as a text file, so it will easy to open it with any text editor. As usual, we can always type **man script** or **script -h** to display its manual page and explore it more detail.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/script-command-recorder/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

ictlyh translating
4 Useful Tips on mkdir, tar and kill Commands in Linux
================================================================================
We keep on accomplishing a task conventionally until we come to know that it can be done in a much better way the other way. In continuation of our [Linux Tips and Trick Series][1], I am here with the below four tips that will going to help you in lots of ways. Here we go!

![Linux Useful Tips](http://www.tecmint.com/wp-content/uploads/2015/06/Linux-Useful-Tips.jpg)

4 Linux Useful Tips and Hacks

### 1. You are supposed to create a long/complex directory tree similar to given below. What is the most effective way to achieve this? ###

Directory tree structure to achieve as suggested below.

    $ cd /home/$USER/Desktop
    $ mkdir tecmint
    $ mkdir tecmint/etc
    $ mkdir tecmint/lib
    $ mkdir tecmint/usr
    $ mkdir tecmint/bin
    $ mkdir tecmint/tmp
    $ mkdir tecmint/opt
    $ mkdir tecmint/var
    $ mkdir tecmint/etc/x1
    $ mkdir tecmint/usr/x2
    $ mkdir tecmint/usr/x3
    $ mkdir tecmint/tmp/Y1
    $ mkdir tecmint/tmp/Y2
    $ mkdir tecmint/tmp/Y3
    $ mkdir tecmint/tmp/Y3/z

The above scenario can simply be achieved by running the below 1-liner command.

    $ mkdir -p /home/$USER/Desktop/tecmint/{etc/x1,lib,usr/{x2,x3},bin,tmp/{Y1,Y2,Y3/z},opt,var}

To verify you may use tree command. If not installed you may apt or yum the package ‘tree‘.

    $ tree tecmint

![Check Directory Structure](http://www.tecmint.com/wp-content/uploads/2015/06/Check-Directory-Structure.png)

Check Directory Structure

We can create directory tree structure of any complexity using the above way. Notice it is nothing other than a normal command but its using `{}` to create hierarchy of directories. This may prove very helpful if used from inside of a shell script when required and in general.

### 2. Create a file (say test) on your Desktop (/home/$USER/Desktop) and populate it with the below contents. ###

    ABC
    DEF
    GHI
    JKL
    MNO
    PQR
    STU
    VWX
    Y
    Z

What a normal user would do in this scenario?

a. He will create the file first, preferably using [touch command][2], as:

    $ touch /home/$USER/Desktop/test

b. He will use a text editor to open the file, which may be nano, vim, or any other editor.

    $ nano /home/$USER/Desktop/test

c. He will then place the above text into this file, save and exit.

So regardless of time taken by him/her, he need at-least 3 steps to execute the above scenario.

What a smart experienced Linux-er will do? He will just type the below text in one-go on terminal and all done. He need not do each action separately.

    cat << EOF > /home/$USER/Desktop/test
    ABC
    DEF
    GHI
    JKL
    MNO
    PQR
    STU
    VWX
    Y
    Z
    EOF

You may use ‘cat‘ command to check if the file and its content were created successfully or not.

    $ cat /home/avi/Desktop/test

![Check File Content](http://www.tecmint.com/wp-content/uploads/2015/06/Check-File-Content.gif)

### 3. We deal with archives (specially TAR balls) very often on Linux. In many cases we have to use that TAR ball on some location other than Downloads folder. What we do in this scenario? ###

We normally do two things in this scenario.

a. Copy/Move the tar ball and extract it at destination, as:

    $ cp firefox-37.0.2.tar.bz2 /opt/
    or
    $ mv firefox-37.0.2.tar.bz2 /opt/

b. cd to /opt/ directory.

    $ cd /opt/

c. Extract the Tarball.

    # tar -jxvf firefox-37.0.2.tar.bz2 

We can do this the other way around.

We will extract the Tarball where it is and Copy/Move the extracted archive to the required destination as:

    $ tar -jxvf firefox-37.0.2.tar.bz2 
    $ cp -R firefox/  /opt/
    or
    $ mv firefox/ /opt/

In either case the work is taking two or steps to complete. The professional can complete this task in one step as:

    $ tar -jxvf firefox-37.0.2.tar.bz2 -C /opt/

The option -C makes tar extract the archive in the specified folder (here /opt/).

No it is not about an option (-C) but it is about habits. Make a habit of using option -C with tar. It will ease your life. From now don’t move the archive or copy/move the extracted file, just leave the TAR-ball in the Downloads folder and extract it anywhere you want.

### 4. How we kill a process in a traditional way? ###

In most general way, we first list all the process using command `ps -A` and pipeline it with grep to find a process/service (say apache2), simply as:

    $ ps -A | grep -i apache2

#### Sample Output ####

    1006 ?        00:00:00 apache2
     2702 ?        00:00:00 apache2
     2703 ?        00:00:00 apache2
     2704 ?        00:00:00 apache2
     2705 ?        00:00:00 apache2
     2706 ?        00:00:00 apache2
     2707 ?        00:00:00 apache2

The above output shows all currently running apache2 processes with their PID’s, you can then use these PID’s to kill apache2 with the help of following command.

    # kill 1006 2702 2703 2704 2705 2706 2707

and then cross check if any process/service with the name ‘apache2‘ is running or not, as:

    $ ps -A | grep -i apache2

However we can do it in a more understandable format using utilities like pgrep and pkill. You may find relevant information about a process just by using pgrep. Say you have to find the process information for apache2, you may simply do:

    $ pgrep apache2

#### Sample Output ####

    15396
    15400
    15401
    15402
    15403
    15404
    15405

You may also list process name against pid by running.

    $ pgrep -l apache2

#### Sample Output ####

    15396 apache2
    15400 apache2
    15401 apache2
    15402 apache2
    15403 apache2
    15404 apache2
    15405 apache2

To kill a process using pkill is very simple. You just type the name of resource to kill and you are done. I have written a post on pkill which you may like to refer here : [http://www.tecmint.com/how-to-kill-a-process-in-linux/][3].

To kill a process (say apache2) using pkill, all you need to do is:

    # pkill apache2

You may verify if apache2 has been killed or not by running the below command.

    $ pgrep -l apache2

It returns the prompt and prints nothing means there is no process running by the name of apache2.

That’s all for now, from me. All the above discussed point are not enough but will surely help. We not only mean to produce tutorials to make you learn something new every-time but also want to show ‘How to be more productive in the same frame‘. Provide us with your valuable feedback in the comments below. Keep connected. Keep Commenting.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/mkdir-tar-and-kill-commands-in-linux/

作者：[Avishek Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://www.tecmint.com/tag/linux-tricks/
[2]:http://www.tecmint.com/8-pratical-examples-of-linux-touch-command/
[3]:http://www.tecmint.com/how-to-kill-a-process-in-linux/
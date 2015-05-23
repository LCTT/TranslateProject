translating by wwy-hust

10 Amazing and Mysterious Uses of (!) Symbol or Operator in Linux Commands
================================================================================
The `'!'` symbol or operator in Linux can be used as Logical Negation operator as well as to fetch commands from history with tweaks or to run previously run command with modification. All the commands below have been checked explicitly in bash Shell. Though I have not checked but a major of these won’t run in other shell. Here we go into the amazing and mysterious uses of `'!'` symbol or operator in Linux commands.

### 1. Run a command from history by command number. ###

You might not be aware of the fact that you can run a command from your history command (already/earlier executed commands). To get started first find the command number by running ‘history‘ command.

    $ history

![Find Last Executed Commands with History Command](http://www.tecmint.com/wp-content/uploads/2015/05/history-Command.gif)

Now run a command from history just by the number at which it appears, in the output of history. Say run a command that appears at number 1551 in the output of ‘history‘ command.

    $ !1551

![Run Last Executed Commands by Number ID](http://www.tecmint.com/wp-content/uploads/2015/05/Run-Commands-By-number.gif)

And, it runs the command ([top command][1] in the above case), that was listed at number 1551. This way to retrieving already executed command is very helpful specially in case of those commands which are long. You just need to call it using **![Number at which it appears in the output of history command]**.

### 2. Run previously executed command as 2nd last command, 7th last command,etc. ###

You may run those commands which you have run previously by their running sequence being the last run command will be represented as -1, second last as -2, seventh last as -7,….

First run history command to get a list of last executed command. It is necessary to run history command, so that you can be sure that there is no command like `rm command > file` and others just to make sure you do not run any dangerous command accidentally. And then check Sixth last command, Eight last command and Tenth last command.

    $ history
    $ !-6
    $ !-8
    $ !-10

![Run Last Executed Commands By Numbers](http://www.tecmint.com/wp-content/uploads/2015/05/3.gif)
Run Last Executed Commands By Numbers

### 3. Pass arguments of last command that we run to the new command without retyping ###

I need to list the content of directory ‘/home/$USER/Binary/firefox‘ so I fired.

    $ ls /home/$USER/Binary/firefox

Then I realized that I should have fired ‘ls -l‘ to see which file is executable there? So should I type the whole command again! No I don’t need. I just need to carry the last argument to this new command as:

    $ ls -l !$

Here `!$` will carry arguments passed in last command to this new command.

![Pass Arguments of Last Executed Command to New](http://www.tecmint.com/wp-content/uploads/2015/05/4.gif)
Pass Arguments of Last Executed Command to New

### 4. How to handle two or more arguments using (!) ###

Let’s say I created a text file 1.txt on the Desktop.

    $ touch /home/avi/Desktop/1.txt

and then copy it to ‘/home/avi/Downloads‘ using complete path on either side with cp command.

    $ cp /home/avi/Desktop/1.txt /home/avi/downloads

Now we have passed two arguments with cp command. First is ‘/home/avi/Desktop/1.txt‘ and second is ‘/home/avi/Downloads‘, lets handle them differently, just execute `echo [arguments]` to print both arguments differently.

    $ echo “1st Argument is : !^”
    $ echo “2nd Argument is : !cp:2”

Note 1st argument can be printed as `“!^”` and rest of the arguments can be printed by executing `“![Name_of_Command]:[Number_of_argument]”`. 

In the above example the first command was ‘cp‘ and 2nd argument was needed to print. Hence `“!cp:2”`, if any command say xyz is run with 5 arguments and you need to get 4th argument, you may use `“!xyz:4”`, and use it as you like. All the arguments can be accessed by `“!*”`.

![Handle Two or More Arguments](http://www.tecmint.com/wp-content/uploads/2015/05/5.gif)
Handle Two or More Arguments

### 5. Execute last command on the basis of keywords ###

We can execute the last executed command on the basis of keywords. We can understand it as follows:

    $ ls /home > /dev/null						[Command 1]
    $ ls -l /home/avi/Desktop > /dev/null		                [Command 2]	
    $ ls -la /home/avi/Downloads > /dev/null	                [Command 3]
    $ ls -lA /usr/bin > /dev/null				        [Command 4]

Here we have used same command (ls) but with different switches and for different folders. Moreover we have sent to output of each command to ‘/dev/null‘ as we are not going to deal with the output of the command also the console remains clean.

Now Execute last run command on the basis of keywords.

    $ ! ls					[Command 1]
    $ ! ls -l				[Command 2]	
    $ ! ls -la				[Command 3]
    $ ! ls -lA				[Command 4]

Check the output and you will be astonished that you are running already executed commands just by `ls` keywords.

![Run Commands Based on Keywords](http://www.tecmint.com/wp-content/uploads/2015/05/6.gif)
Run Commands Based on Keywords

### 6. The power of !! Operator ###

You can run/alter your last run command using `(!!)`. It will call the last run command with alter/tweak in the current command. Lets show you the scenario

Last day I run a one-liner script to get my private IP so I run,

    $ ip addr show | grep inet | grep -v 'inet6'| grep -v '127.0.0.1' | awk '{print $2}' | cut -f1 -d/

Then suddenly I figured out that I need to redirect the output of the above script to a file ip.txt, so what should I do? Should I retype the whole command again and redirect the output to a file? Well an easy solution is to use `UP` navigation key and add `'> ip.txt'` to redirect the output to a file as.

    $ ip addr show | grep inet | grep -v 'inet6'| grep -v '127.0.0.1' | awk '{print $2}' | cut -f1 -d/ > ip.txt

Thanks to the life Savior `UP` navigation key here. Now consider the below condition, the next time I run below one-liner script.

    $ ifconfig | grep "inet addr:" | awk '{print $2}' | grep -v '127.0.0.1' | cut -f2 -d:

As soon as I run script, the bash prompt returned an error with the message `“bash: ifconfig: command not found”`, It was not difficult for me to guess I run this command as user where it should be run as root. 

So what’s the solution? It is difficult to login to root and then type the whole command again! Also (UP Navigation Key) in last example didn’t came to rescue here. So? We need to call `“!!”` without quotes, which will call the last command for that user.

    $ su -c “!!” root

Here su is switch user which is root, `-c` is to run the specific command as the user and the most important part `!!` will be replaced by command and last run command will be substituted here. Yeah! You need to provide root password.

![The Power of !! Key](http://www.tecmint.com/wp-content/uploads/2015/05/7.gif)
The Power of !! Key

I make use of `!!` mostly in following scenarios,

1. When I run apt-get command as normal user, I usually get an error saying you don’t have permission to execute.

    $ apt-get upgrade && apt-get dist-upgrade

Opps error…don’t worry execute below command to get it successful..

    $ su -c !!

Same way I do for,

    $ service apache2 start
    or
    $ /etc/init.d/apache2 start
    or
    $ systemctl start apache2

OOPS User not authorized to carry such task, so I run..

    $ su -c 'service apache2 start'
    or
    $ su -c '/etc/init.d/apache2 start'
    or
    $ su -c 'systemctl start apache2'

### 7. Run a command that affects all the file except ![FILE_NAME] ###

The `!` (Logical NOT) can be used to run the command on all the files/extension except that is behind `'!'`.

A. Remove all the files from a directory except the one the name of which is 2.txt.

    $ rm !(2.txt)

B. Remove all the file type from the folder except the one the extension of which is ‘pdf‘.

    $ $ rm !(*.pdf)

### 8. Check if a directory (say /home/avi/Tecmint)exist or not? Printf if the said directory exist or not. ###

Here we will use `'! -d'` to validate if the directory exist or not followed by Logical AND Operator `(&&)` to print that directory does not exist and Logical OR Operator `(||)` to print the directory is present.

Logic is, when the output of `[ ! -d /home/avi/Tecmint ]` is 0, it will execute what lies beyond Logical AND else it will go to Logical OR `(||)` and execute what lies beyond Logical OR.

    $ [ ! -d /home/avi/Tecmint ] && printf '\nno such /home/avi/Tecmint directory exist\n' || printf '\n/home/avi/Tecmint directory exist\n'

### 9. Check if a directory exist or not? If not exit the command. ###

Similar to the above condition, but here if the desired directory doesn’t exist it will exit the command.

    $ [ ! -d /home/avi/Tecmint ] && exit

### 10. Create a directory (say test) in your home directory if it does not exist. ###

A general implementation in Scripting Language where if the desired directory does not exist, it will create one.

    [ ! -d /home/avi/Tecmint ] && mkdir /home/avi/Tecmint

That’s all for now. If you know or come across any other use of `'!'` which is worth knowing, you may like to provide us with your suggestion in the feedback. Keep connected!

--------------------------------------------------------------------------------

via: http://www.tecmint.com/mysterious-uses-of-symbol-or-operator-in-linux-commands/

作者：[Avishek Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://www.tecmint.com/12-top-command-examples-in-linux/

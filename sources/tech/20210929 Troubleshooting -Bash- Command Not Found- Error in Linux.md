[#]: subject: "Troubleshooting “Bash: Command Not Found” Error in Linux"
[#]: via: "https://itsfoss.com/bash-command-not-found/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "chai001125"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Troubleshooting “Bash: Command Not Found” Error in Linux
======

_**This beginner tutorial shows how to go about fixing the Bash: command not found error on Debian, Ubuntu and other Linux distributions.**_

When you use commands in Linux, you expect to see an output. But sometimes, you’ll encounter issues where the terminal shows ‘command not found’ error.

![][1]

There is no straightforward, single solution to this error. You have to do a little bit of troubleshooting on your own.

It’s not too difficult, honestly. The error gives some hint already when it says “bash: command not found”. Your shell (or Linux system) cannot find the command you entered.

There could be three possible reasons why it cannot find the command:

  * It’s a typo and the command name is misspelled
  * The command is not even installed
  * The command is basically an executable script and its location is not known



Let’s go in detail on each possible root cause.

### Fixing “bash: command not found” error

![][2]

#### Method 1: Double check the command name (no, seriously)

It is human to make mistakes, specially while typing. It is possible that the command you entered has a typo (spelling mistake).

You should specially pay attention to:

  * The correct command name
  * The spaces between the command and its options
  * The use of 1 (numeral one), I (capital i) and l (lowercase L)
  * Use of uppercase and lowercase characters



Take a look at the example below, where I have misspelled the common ls command.

![][3]

So, make double sure what you are typing.

#### Method 2: Ensure that the command is installed on your system

This is another common reason behind the command not found error. You cannot run a command if it is not installed already.

While your Linux distribution comes with a huge number of commands installed by default, it is not possible to pre-install all the command line tools in a system. If the command you are trying to run is not a popular, common command, you’ll have to install it first.

You can use your distribution’s package manager to install it.

![You may have to install the missing command][4]

In some cases, popular commands may get discontinued and you may not even install it anymore. You’ll have to find an alternative command to achieve the result.

Take the example of ipconfig command. This deprecated command was used for [getting Ip address][5] and other network interface information. Older tutorials on the web still mention using this command but you cannot use it anymore in newer Linux versions. It has been replaced by the ifconfig tool.

![Some popular commands get discontinued over the time][1]

Occasionally, your system won’t find even the extremely common commands. This is often the case when you are running a Linux distribution in Docker containers. To cut down on the size of the operating system image, the containers often do not include even the most common Linux commands.

This is why Docker user stumble across things like [ping command not found error][6] etc.

![Docker containers often have only a few commands installed][7]

So, the solution is to either install the missing command or find a tool that could do the same thing you were trying to do with the missing command.

#### Method 3: Check if it is an executable script with correct path

This is a common mistake Linux rookies make while [running a shell script][8].

Even if you are in the same directory and try to run an executable script just by its name, it will show an error.

```
[email protected]:~/scripts# sample
-bash: sample: command not found
```

You need to either specify the shell interpreter explicitly or its absolute path.

![][9]

If you are in some other directory and try to execute the shell script without giving the correct path to the file, it will complain about not finding the file.

![][10]

##### Adding it to the PATH

In some cases, you download the entire software in a tar file, extract it and find an executable file along with other program files. To run the program, you need to run the executable file.

But for that, you need to be in the same directory or specify the entire path to the executable file. This is tiresome.

Here, you can use the PATH variable. This variable has a collection of directories and these directories have the binary (executable) files of various Linux commands. When you run a command, your Linux system checks the mentioned directories in the PATH variable to look for the executable file of that command.

You can check the location of the binary of a command by using the `which` command:

![][11]

If you want to run an executable file or script from anywhere on the system, you need to add the location of the file to this PATH variable.

![][12]

The PATH variable then needs to be added to the rc file of the shell so that the changes made to PATH variable is permanent.

You get the gist here. It is important that your Linux system has the knowledge about the location of the executable script. Either you give the path while running it or you add its location to the PATH variable.

### Did it help you?

I understand that when you are new to Linux, things could be overwhelming. But when you understand the root cause of the problem, it gradually improved your knowledge.

Here, there is no straightforward solution possible for the ‘command not found error’. I gave you some hints and pointers and that should help you in troubleshooting.

If you still have doubt or need help, please let me know in the comment section.

--------------------------------------------------------------------------------

via: https://itsfoss.com/bash-command-not-found/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/bash-command-not-found-error.png?resize=741%2C291&ssl=1
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/bash-command-not-found-error-1.png?resize=800%2C450&ssl=1
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/command-not-found-error.png?resize=723%2C234&ssl=1
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/command-not-found-debian.png?resize=741%2C348&ssl=1
[5]: https://itsfoss.com/check-ip-address-ubuntu/
[6]: https://linuxhandbook.com/ping-command-ubuntu/
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/ping-command-not-found-ubuntu.png?resize=786%2C367&ssl=1
[8]: https://itsfoss.com/run-shell-script-linux/
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/bash-script-command-not-found-error-800x331.png?resize=800%2C331&ssl=1
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/script-file-not-found-error-800x259.png?resize=800%2C259&ssl=1
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/path-location.png?resize=800%2C241&ssl=1
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/adding-executable-to-PATH-variable-linux.png?resize=800%2C313&ssl=1

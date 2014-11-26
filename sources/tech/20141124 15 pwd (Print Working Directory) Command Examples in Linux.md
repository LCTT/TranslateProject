15 ‘pwd’ (Print Working Directory) Command Examples in Linux
================================================================================
For those working with Linux command Line, command ‘**pwd**‘ is very helpful, which tells where you are – in which directory, starting from the root (**/**). Specially for Linux newbies, who may get lost amidst of directories in command Line Interface while navigation, command ‘**pwd**‘ comes to rescue.

![15 pwd Command Examples](http://www.tecmint.com/wp-content/uploads/2014/11/pwd-command.png)

15 pwd Command Examples

### What is pwd? ###

‘**pwd**‘ stands for ‘**Print Working Directory**‘. As the name states, command ‘**pwd**‘ prints the current working directory or simply the directory user is, at present. It prints the current directory name with the complete path starting from root (**/**). This command is built in shell command and is available on most of the shell – bash, Bourne shell, ksh,zsh, etc.

#### Basic syntax of pwd: ####

    # pwd [OPTION]

#### Options used with pwd ####

<table border="0" cellspacing="0">
<colgroup width="126"></colgroup>
<colgroup width="450"></colgroup>
<tbody>
<tr>
<td height="21" align="LEFT" style="border: 1px solid #000000;"><b><span style="font-size: small;">&nbsp;Options</span></b></td>
<td align="LEFT" style="border: 1px solid #000000;"><b><span style="font-size: small;">&nbsp;Description</span></b></td>
</tr>
<tr>
<td height="19" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Liberation Serif,Times New Roman; font-size: small;">&nbsp;-L (logical)</span></td>
<td align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Liberation Serif,Times New Roman; font-size: small;">&nbsp;Use PWD from environment, even if it contains symbolic links</span></td>
</tr>
<tr>
<td height="19" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Liberation Serif,Times New Roman; font-size: small;">&nbsp;-P (physical)</span></td>
<td align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Liberation Serif,Times New Roman; font-size: small;">&nbsp;Avoid all symbolic links</span></td>
</tr>
<tr>
<td height="19" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Liberation Serif,Times New Roman; font-size: small;">&nbsp;&ndash;help </span></td>
<td align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Liberation Serif,Times New Roman; font-size: small;">&nbsp;Display this help and exit</span></td>
</tr>
<tr>
<td height="19" align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Liberation Serif,Times New Roman; font-size: small;">&nbsp;&ndash;version</span></td>
<td align="LEFT" style="border: 1px solid #000000;"><span style="font-family: Liberation Serif,Times New Roman; font-size: small;">&nbsp;Output version information and exit</span></td>
</tr>
</tbody>
</table>

If both ‘**-L**‘ and ‘**-P**‘ options are used, option ‘**L**‘ is taken into priority. If no option is specified at the prompt, pwd will avoid all symlinks, i.e., take option ‘**-P**‘ into account.

Exit status of command pwd:

<table border="0" cellspacing="0">
<colgroup width="128"></colgroup>
<colgroup width="151"></colgroup>
<tbody>
<tr>
<td height="19" align="CENTER" style="border: 1px solid #000000;"><span style="font-size: small;">0</span></td>
<td align="CENTER" style="border: 1px solid #000000;"><span style="font-size: small;">Success</span></td>
</tr>
<tr>
<td height="19" align="CENTER" style="border: 1px solid #000000;"><span style="font-size: small;">Non-zero</span></td>
<td align="CENTER" style="border: 1px solid #000000;"><span style="font-size: small;">Failure</span></td>
</tr>
</tbody>
</table>

This article aims at providing you a deep insight of Linux command ‘**pwd**‘ with practical examples.

**1.** Print your current working directory.

    avi@tecmint:~$ /bin/pwd

    /home/avi

![Print Working Directory](http://www.tecmint.com/wp-content/uploads/2014/11/pwd.gif)

Print Working Directory

**2.** Create a symbolic link of a folder (say **/var/www/html** into your home directory as **htm**). Move to the newly created directory and print working directory with symbolic links and without symbolic links.

Create a symbolic link of folder /var/www/html as htm in your home directory and move to it.

    avi@tecmint:~$ ln -s /var/www/html/ htm
    avi@tecmint:~$ cd htm

![Create Symbolic Link](http://www.tecmint.com/wp-content/uploads/2014/11/Create-Symbolic-Link.gif)

Create Symbolic Link

**3.** Print working directory from environment even if it contains symlinks.

    avi@tecmint:~$ /bin/pwd -L

    /home/avi/htm

![Print Current Working Directory](http://www.tecmint.com/wp-content/uploads/2014/11/Print-Working-Directory.gif)

Print Current Working Directory

**4.** Print actual physical current working directory by resolving all symbolic links.

    avi@tecmint:~$ /bin/pwd -P

    /var/www/html

![Print Physical Working Directory](http://www.tecmint.com/wp-content/uploads/2014/11/Print-Physical-Working-Directory.gif)

Print Physical Working Directory

**5.** Check if the output of command “**pwd**” and “**pwd -P**” are same or not i.e., if no options are given at run-time does “**pwd**” takes option **-P** into account or not, automatically.

    avi@tecmint:~$ /bin/pwd

    /var/www/html

![Check pwd Output](http://www.tecmint.com/wp-content/uploads/2014/11/Check-pwd-Output.gif)

Check pwd Output

**Result:** It’s clear from the above output of example 4 and 5 (both result are same) thus, when no options are specified with command “**pwd**”, it automatically takes option “**-P**” into account.

**6.** Print version of your ‘pwd’ command.

    avi@tecmint:~$ /bin/pwd --version
    
    pwd (GNU coreutils) 8.23
    Copyright (C) 2014 Free Software Foundation, Inc.
    License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
    This is free software: you are free to change and redistribute it.
    There is NO WARRANTY, to the extent permitted by law.
    
    Written by Jim Meyering.

![Check pwd Version](http://www.tecmint.com/wp-content/uploads/2014/11/Check-pwd-Version.gif)

Check pwd Version

**Note:** A ‘pwd’ command is often used without options and never used with arguments.

**Important:** You might have noticed that we are executing the above command as “**/bin/pwd**” and not “**pwd**”.

So what’s the difference? Well “**pwd**” alone means shell built-in pwd. Your shell may have different version of pwd. Please refer manual. When we are using **/bin/pwd**, we are calling the binary version of that command. Both the shell and the binary version of command Prints Current Working Directory, though the binary version have more options.

**7.** Print all the locations containing executable named pwd.

    avi@tecmint:~$ type -a pwd

    pwd is a shell builtin
    pwd is /bin/pwd

![Print Executable Locations](http://www.tecmint.com/wp-content/uploads/2014/11/Print-Executable-Locations.gif)

Print Executable Locations

**8.** Store the value of “**pwd**” command in variable (say **a**), and print its value from the variable (important for shell scripting perspective).

    avi@tecmint:~$ a=$(pwd)
    avi@tecmint:~$ echo "Current working directory is : $a"
    
    Current working directory is : /home/avi

![Store Pwd Value in Variable](http://www.tecmint.com/wp-content/uploads/2014/11/Store-Pwd-Value-in-Variable.gif)

Store Pwd Value in Variable

Alternatively, we can use **printf**, in the above example.

**9.** Change current working directory to anything (say **/home**) and display it in command line prompt. Execute a command (say ‘**ls**‘) to verify is everything is **OK**.

    avi@tecmint:~$ cd /home
    avi@tecmint:~$ PS1='$pwd> '		[Notice single quotes in the example]
    > ls

![Change Current Working Directory](http://www.tecmint.com/wp-content/uploads/2014/11/Change-Current-Working-Directory.gif)

Change Current Working Directory

**10.** Set multi-line command line prompt (say something like below).

    /home
    123#Hello#!

And then execute a command (say **ls**) to check is everything is **OK**.

    avi@tecmint:~$ PS1='
    > $PWD
    $ 123#Hello#!
    $ '
    
    /home
    123#Hello#!

![Set Multi Commandline Prompt](http://www.tecmint.com/wp-content/uploads/2014/11/Set-Multi-Commandline-Prompt.gif)

Set Multi Commandline Prompt

**11.** Check the current working directory and previous working directory in one GO!

    avi@tecmint:~$ echo “$PWD $OLDPWD”
    
    /home /home/avi

![Check Present Previous Working Directory](http://www.tecmint.com/wp-content/uploads/2014/11/Check-Present-Previous-Working-Directory.gif)

Check Present Previous Working Directory

**12.** What is the absolute path (starting from **/**) of the pwd binary file.

    /bin/pwd 

**13.** What is the absolute path (starting from **/**) of the pwd source file.

    /usr/include/pwd.h 

**14.** Print the absolute path (starting from **/**) of the pwd manual pages file.

    /usr/share/man/man1/pwd.1.gz

**15.** Write a shell script analyses current directory (say **tecmint**) in your home directory. If you are under directory **tecmint** it output “**Well! You are in tecmint directory**” and then print “**Good Bye**” else create a directory **tecmint** under your home directory and ask you to cd to it.

Let’s first create a ‘tecmint’ directory, under it create a following shell script file with name ‘pwd.sh’.

    avi@tecmint:~$ mkdir tecmint
    avi@tecmint:~$ cd tecmint
    avi@tecmint:~$ nano pwd.sh

Next, add the following script to the pwd.sh file.

    #!/bin/bash
    
    x="$(pwd)"
    if [ "$x" == "/home/$USER/tecmint" ]
    then
         {
          echo "Well you are in tecmint directory"
          echo "Good Bye"
         }
    else
         {
          mkdir /home/$USER/tecmint
          echo "Created Directory tecmint you may now cd to it"
         }
    fi

Give execute permission and run it.

    avi@tecmint:~$ chmod 755 pwd.sh
    avi@tecmint:~$ ./pwd.sh
    
    Well you are in tecmint directory
    Good Bye

#### Conclusion ####

**pwd** is one of the simplest yet most popular and most widely used command. A good command over pwd is basic to use Linux terminal. That’s all for now. I’ll be here again with another interesting article soon, till then stay tuned and connected to Tecmint.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/pwd-command-examples/

作者：[Avishek Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
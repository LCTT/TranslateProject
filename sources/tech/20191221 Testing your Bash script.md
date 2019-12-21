[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Testing your Bash script)
[#]: via: (https://opensource.com/article/19/12/testing-bash-script)
[#]: author: (David Both https://opensource.com/users/dboth)

Testing your Bash script
======
In the fourth and final article in this series on automation with shell
scripts, learn about initializing variables and ensuring your program
runs correctly.
![Team checklist and to dos][1]

In the [first article][2] in this series, you created your first, very small, one-line Bash script and explored the reasons for creating shell scripts. In the [second article][3], you began creating a fairly simple template that can be a starting point for other Bash programs and began testing it. In the [third article][4], you created and used a simple Help function and learned about using functions and how to handle command-line options such as **-h**.

This fourth and final article in the series gets into variables and initializing them as well as how to do a bit of sanity testing to help ensure the program runs under the proper conditions. Remember, the objective of this series is to build working code that will be used for a template for future Bash programming projects. The idea is to make getting started on new programming projects easy by having common elements already available in the template.

### Variables

The Bash shell, like all programming languages, can deal with variables. A variable is a symbolic name that refers to a specific location in memory that contains a value of some sort. The value of a variable is changeable, i.e., it is variable. If you are not familiar with using variables, read my article [_How to program with Bash: Syntax and tools_][5] before you go further.

Done? Great! Let's now look at some good practices when using variables.

I always set initial values for every variable used in my scripts. You can find this in your template script immediately after the procedures as the first part of the main program body, before it processes the options. Initializing each variable with an appropriate value can prevent errors that might occur with uninitialized variables in comparison or math operations. Placing this list of variables in one place allows you to see all of the variables that are supposed to be in the script and their initial values.

Your little script has only a single variable, **$option**, so far. Set it by inserting the following lines as shown:


```
################################################################################
################################################################################
# Main program                                                                 #
################################################################################
################################################################################
# Initialize variables
option=""
################################################################################
# Process the input options. Add options as needed.                            #
################################################################################
```

Test this to ensure that everything works as it should and that nothing has broken as the result of this change.

### Constants

Constants are variables, too—at least they should be. Use variables wherever possible in command-line interface (CLI) programs instead of hard-coded values. Even if you think you will use a particular value (such as a directory name, a file name, or a text string) just once, create a variable and use it where you would have placed the hard-coded name.

For example, the message printed as part of the main body of the program is a string literal, **echo "Hello world!"**. Change that to a variable. First, add the following statement to the variable initialization section:


```
`Msg="Hello world!"`
```

And now change the last line of the program from:


```
`echo "Hello world!"`
```

to:


```
`echo "$Msg"`
```

Test the results.

### Sanity checks

Sanity checks are simply tests for conditions that need to be true in order for the program to work correctly, such as: the program must be run as the root user, or it must run on a particular distribution and release of that distro. Add a check for _root_ as the running user in your simple program template.

Testing that the root user is running the program is easy because a program runs as the user that launches it.

The **id** command can be used to determine the numeric user ID (UID) the program is running under. It provides several bits of information when it is used without any options:


```
[student@testvm1 ~]$ id
uid=1001(student) gid=1001(student) groups=1001(student),5000(dev)
```

Using the **-u** option returns just the user's UID, which is easily usable in your Bash program:


```
[student@testvm1 ~]$ id -u
1001
[student@testvm1 ~]$
```

Add the following function to the program. I added it after the Help procedure, but you can place it anywhere in the procedures section. The logic is that if the UID is not zero, which is always the root user's UID, the program exits:


```
################################################################################
# Check for root.                                                              #
################################################################################
CheckRoot()
{
   if [ `id -u` != 0 ]
   then
      echo "ERROR: You must be root user to run this program"
      exit
   fi  
}
```

Now, add a call to the **CheckRoot** procedure just before the variable's initialization. Test this, first running the program as the student user:


```
[student@testvm1 ~]$ ./hello
ERROR: You must be root user to run this program
[student@testvm1 ~]$
```

then as the root user:


```
[root@testvm1 student]# ./hello
Hello world!
[root@testvm1 student]#
```

You may not always need this particular sanity test, so comment out the call to **CheckRoot** but leave all the code in place in the template. This way, all you need to do to use that code in a future program is to uncomment the call.

### The code

After making the changes outlined above, your code should look like this:


```
#!/usr/bin/bash
################################################################################
#                              scriptTemplate                                  #
#                                                                              #
# Use this template as the beginning of a new program. Place a short           #
# description of the script here.                                              #
#                                                                              #
# Change History                                                               #
# 11/11/2019  David Both    Original code. This is a template for creating     #
#                           new Bash shell scripts.                            #
#                           Add new history entries as needed.                 #
#                                                                              #
#                                                                              #
################################################################################
################################################################################
################################################################################
#                                                                              #
#  Copyright (C) 2007, 2019 David Both                                         #
#  [LinuxGeek46@both.org][6]                                                        #
#                                                                              #
#  This program is free software; you can redistribute it and/or modify        #
#  it under the terms of the GNU General Public License as published by        #
#  the Free Software Foundation; either version 2 of the License, or           #
#  (at your option) any later version.                                         #
#                                                                              #
#  This program is distributed in the hope that it will be useful,             #
#  but WITHOUT ANY WARRANTY; without even the implied warranty of              #
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the               #
#  GNU General Public License for more details.                                #
#                                                                              #
#  You should have received a copy of the GNU General Public License           #
#  along with this program; if not, write to the Free Software                 #
#  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA   #
#                                                                              #
################################################################################
################################################################################
################################################################################

################################################################################
# Help                                                                         #
################################################################################
Help()
{
   # Display Help
   echo "Add description of the script functions here."
   echo
   echo "Syntax: scriptTemplate [-g|h|v|V]"
   echo "options:"
   echo "g     Print the GPL license notification."
   echo "h     Print this Help."
   echo "v     Verbose mode."
   echo "V     Print software version and exit."
   echo
}

################################################################################
# Check for root.                                                              #
################################################################################
CheckRoot()
{
   # If we are not running as root we exit the program
   if [ `id -u` != 0 ]
   then
      echo "ERROR: You must be root user to run this program"
      exit
   fi
}

################################################################################
################################################################################
# Main program                                                                 #
################################################################################
################################################################################

################################################################################
# Sanity checks                                                                #
################################################################################
# Are we rnning as root?
# CheckRoot

# Initialize variables
option=""
Msg="Hello world!"
################################################################################
# Process the input options. Add options as needed.                            #
################################################################################
# Get the options
while getopts ":h" option; do
   case $option in
      h) # display Help
         Help
         exit;;
     \?) # incorrect option
         echo "Error: Invalid option"
         exit;;
   esac
done

echo "$Msg"
```

### A final exercise

You probably noticed that the Help function in your code refers to features that are not in the code. As a final exercise, figure out how to add those functions to the code template you created.

### Summary

In this article, you created a couple of functions to perform a sanity test for whether your program is running as root. Your program is getting a little more complex, so testing is becoming more important and requires more test paths to be complete.

This series looked at a very minimal Bash program and how to build a script up a bit at a time. The result is a simple template that can be the starting point for other, more useful Bash scripts and that contains useful elements that make it easy to start new scripts.

By now, you get the idea: Compiled programs are necessary and fill a very important need. But for sysadmins, there is always a better way. Always use shell scripts to meet your job's automation needs. Shell scripts are open; their content and purpose are knowable. They can be readily modified to meet different requirements. I have never found anything that I need to do in my sysadmin role that cannot be accomplished with a shell script.

What you have created so far in this series is just the beginning. As you write more Bash programs, you will find more bits of code that you use frequently and should be included in your program template.

### Resources

  * [How to program with Bash: Syntax and tools][5]
  * [How to program with Bash: Logical operators and shell expansions][7]
  * [How to program with Bash: Loops][8]



* * *

_This series of articles is partially based on Volume 2, Chapter 10 of David Both's three-part Linux self-study course, [Using and Administering Linux—Zero to SysAdmin][9]._

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/testing-bash-script

作者：[David Both][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/todo_checklist_team_metrics_report.png?itok=oB5uQbzf (Team checklist and to dos)
[2]: https://opensource.com/article/19/12/introduction-automation-bash-scripts
[3]: https://opensource.com/article/19/12/creating-bash-script-template
[4]: https://opensource.com/article/19/12/give-your-bash-program-some-help
[5]: https://opensource.com/article/19/10/programming-bash-syntax-tools
[6]: mailto:LinuxGeek46@both.org
[7]: https://opensource.com/article/19/10/programming-bash-logical-operators-shell-expansions
[8]: https://opensource.com/article/19/10/programming-bash-loops
[9]: http://www.both.org/?page_id=1183

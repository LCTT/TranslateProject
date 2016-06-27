Learn Python Control Flow and Loops to Write and Tune Shell Scripts – Part 2
===============================================================================

In the previous article of this [Python series][1] we shared a brief introduction to Python, its command-line shell, and the IDLE. We also demonstrated how to perform arithmetic calculations, how to store values in variables, and how to print back those values to the screen. Finally, we explained the concepts of methods and properties in the context of Object Oriented Programming through a practical example.

![](http://www.tecmint.com/wp-content/uploads/2016/06/Write-Shell-Scripts-in-Python-Programming.png)
>Write Linux Shell Scripts in Python Programming

In this guide we will discuss control flow (to choose different courses of action depending on information entered by a user, the result of a calculation, or the current value of a variable) and loops (to automate repetitive tasks) and then apply what we have learned so far to write a simple shell script that will display the operating system type, the hostname, the kernel release, version, and the machine hardware name.

This example, although basic, will help us illustrate how we can leverage Python OOP’s capabilities to write shell scripts easier than using regular bash tools.

In other words, we want to go from

```
# uname -snrvm
```

![](http://www.tecmint.com/wp-content/uploads/2016/05/Check-Hostname-of-Linux.png)
>Check Hostname of Linux

to

![](http://www.tecmint.com/wp-content/uploads/2016/05/Check-Linux-Hostname-Using-Python-Script.png)
>Check Linux Hostname Using Python Script

or

![](http://www.tecmint.com/wp-content/uploads/2016/05/Script-to-Check-Linux-System-Information.png)
>Script to Check Linux System Information

Looks pretty, doesn’t it? Let’s roll up our sleeves and make it happen.

### Control flow in Python

As we said earlier, control flow allows us to choose different outcomes depending on a given condition. Its most simple implementation in Python is an if / else clause.

The basic syntax is:

```
if condition:
    # action 1
else:
    # action 2
```

When condition evaluates to true, the code block below will be executed (represented by `# action 1`. Otherwise, the code under else will be run.
A condition can be any statement that can evaluate to either true or false.

For example:

1. 1 < 3 # true

2. firstName == “Gabriel” # true for me, false for anyone not named Gabriel

  - In the first example we compared two values to determine if one is greater than the other.
  - In the second example we compared firstName (a variable) to determine if, at the current execution point, its value is identical to “Gabriel”
  - The condition and the else statement must be followed by a colon (:)
  - Indentation is important in Python. Lines with identical indentation are considered to be in the same code block.

Please note that the if / else statement is only one of the many control flow tools available in Python. We reviewed it here since we will use it in our script later. You can learn more about the rest of the tools in the [official docs][2].

### Loops in Python

Simply put, a loop is a sequence of instructions or statements that are executed in order as long as a condition is true, or once per item in a list.

The most simple loop in Python is represented by the for loop iterates over the items of a given list or string beginning with the first item and ending with the last.

Basic syntax:

```
for x in example:
	# do this
```

Here example can be either a list or a string. If the former, the variable named x represents each item in the list; if the latter, x represents each character in the string:

```
>>> rockBands = []
>>> rockBands.append("Roxette")
>>> rockBands.append("Guns N' Roses")
>>> rockBands.append("U2")
>>> for x in rockBands:
    	print(x)
or
>>> firstName = "Gabriel"
>>> for x in firstName:
    	print(x)
```

The output of the above examples is shown in the following image:

![](http://www.tecmint.com/wp-content/uploads/2016/05/Learn-Loops-in-Python.png)
>Learn Loops in Python

### Python Modules

For obvious reasons, there must be a way to save a sequence of Python instructions and statements in a file that can be invoked when it is needed.

That is precisely what a module is. Particularly, the os module provides an interface to the underlying operating system and allows us to perform many of the operations we usually do in a command-line prompt.

As such, it incorporates several methods and properties that can be called as we explained in the previous article. However, we need to import (or include) it in our environment using the import keyword:

```
>>> import os
```

Let’s print the current working directory:

```
>>> os.getcwd()
```

![](http://www.tecmint.com/wp-content/uploads/2016/05/Learn-Python-Modules.png)
>Learn Python Modules

Let’s now put all of this together (along with the concepts discussed in the previous article) to write the desired script.

### Python Script

It is considered good practice to start a script with a statement that indicates the purpose of the script, the license terms under which it is released, and a revision history listing the changes that have been made. Although this is more of a personal preference, it adds a professional touch to our work.

Here’s the script that produces the output we shown at the top of this article. It is heavily commented so that you can understand what’s happening.

Take a few minutes to go through it before proceeding. Note how we use an if / else structure to determine whether the length of each field caption is greater than the value of the field itself.

Based on the result, we use empty characters to fill in the space between a field caption and the next. Also, we use the right number of dashes as separator between the field caption and its value below.

```
#!/usr/bin/python3
# Change the above line to #!/usr/bin/python if you don't have Python 3 installed

# Script name: uname.py
# Purpose: Illustrate Python's OOP capabilities to write shell scripts more easily
# License: GPL v3 (http://www.gnu.org/licenses/gpl.html)

# Copyright (C) 2016 Gabriel Alejandro Cánepa
# ​Facebook / Skype / G+ / Twitter / Github: gacanepa
# Email: gacanepa (at) gmail (dot) com

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see .

# REVISION HISTORY
# DATE   	  VERSION AUTHOR    	 CHANGE DESCRIPTION
# ---------- ------- --------------
# 2016-05-28 1.0     Gabriel Cánepa    Initial version

# Import the os module
import os

# Assign the output of os.uname() to the the systemInfo variable
# os.uname() returns a 5-string tuple (sysname, nodename, release, version, machine)
# Documentation: https://docs.python.org/3.2/library/os.html#module-os
systemInfo = os.uname()

# This is a fixed array with the desired captions in the script output
headers = ["Operating system","Hostname","Release","Version","Machine"]

# Initial value of the index variable. It is used to define the
# index of both systemInfo and headers in each step of the iteration.
index = 0

# Initial value of the caption variable.
caption = ""

# Initial value of the values variable
values = ""

# Initial value of the separators variable
separators = ""

# Start of the loop
for item in systemInfo:
    if len(item) < len(headers[index]):
   	 # A string containing dashes to the length of item[index] or headers[index]
   	 # To repeat a character(s), enclose it within quotes followed
   	 # by the star sign (*) and the desired number of times.
   	 separators = separators + "-" * len(headers[index]) + " "
   	 caption = caption + headers[index] + " "
   	 values = values + systemInfo[index] + " " * (len(headers[index]) - len(item)) + " "
    else:
   	 separators = separators + "-" * len(item) + " "
   	 caption =  caption + headers[index] + " " * (len(item) - len(headers[index]) + 1)
   	 values = values + item + " "
    # Increment the value of index by 1
    index = index + 1
# End of the loop

# Print the variable named caption converted to uppercase
print(caption.upper())

# Print separators
print(separators)

# Print values (items in systemInfo)
print(values)

# INSTRUCTIONS:
# 1) Save the script as uname.py (or another name of your choosing) and give it execute permissions:
# chmod +x uname.py
# 2) Execute it:
# ./uname.py
```

Once you have saved the above script to a file, give it execute permissions and run it as indicated at the bottom of the code:

```
# chmod +x uname.py
# ./uname.py
```

If you get the following error while attempting to execute the script:

```
-bash: ./uname.py: /usr/bin/python3: bad interpreter: No such file or directory
```

It means you don’t have Python 3 installed. If that is the case, you can either install the package or replace the interpreter line (pay special attention and be very careful if you followed the steps to update the symbolic links to the Python binaries as outlined in the previous article):

```
#!/usr/bin/python3
```

with

```
#!/usr/bin/python
```

which will cause the installed version of Python 2 to execute the script instead.

**Note**: This script has been tested successfully both in Python 2.x and 3.x.

Although somewhat rudimentary, you can think of this script as a Python module. This means that you can open it in the IDLE (File → Open… → Select file):

![](http://www.tecmint.com/wp-content/uploads/2016/05/Open-Python-in-IDLE.png)
>Open Python in IDLE

A new window will open with the contents of the file. Then go to Run → Run module (or just press F5). The output of the script will be shown in the original shell:

![](http://www.tecmint.com/wp-content/uploads/2016/05/Run-Python-Script.png)
>Run Python Script

If you want to obtain the same results with a script written purely in Bash, you would need to use a combination of [awk][3], [sed][4], and resort to complex methods to store and retrieve items in a list (not to mention the use of tr to convert lowercase letters to uppercase).

In addition, Python provides portability in that all Linux systems ship with at least one Python version (either 2.x or 3.x, sometimes both). Should you need to rely on a shell to accomplish the same goal, you would need to write different versions of the script based on the shell.

This goes to show that Object Oriented Programming features can become strong allies of system administrators.

**Note**: You can find [this python script][5] (and others) in one of my GitHub repositories.

### Summary

In this article we have reviewed the concepts of control flow, loops / iteration, and modules in Python. We have shown how to leverage OOP methods and properties in Python to simplify otherwise complex shell scripts.

Do you have any other ideas you would like to test? Go ahead and write your own Python scripts and let us know if you have any questions. Don’t hesitate to drop us a line using the comment form below, and we will get back to you as soon as we can.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/learn-python-programming-to-write-linux-shell-scripts/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+tecmint+%28Tecmint%3A+Linux+Howto%27s+Guide%29

作者：[Gabriel Cánepa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/gacanepa/
[1]: http://www.tecmint.com/learn-python-programming-and-scripting-in-linux/
[2]: http://please%20note%20that%20the%20if%20/%20else%20statement%20is%20only%20one%20of%20the%20many%20control%20flow%20tools%20available%20in%20Python.%20We%20reviewed%20it%20here%20since%20we%20will%20use%20it%20in%20our%20script%20later.%20You%20can%20learn%20more%20about%20the%20rest%20of%20the%20tools%20in%20the%20official%20docs.
[3]: http://www.tecmint.com/use-linux-awk-command-to-filter-text-string-in-files/
[4]: http://www.tecmint.com/sed-command-to-create-edit-and-manipulate-files-in-linux/
[5]: https://github.com/gacanepa/scripts/blob/master/python/uname.py

[#]: subject: (How to parse Bash program configuration files)
[#]: via: (https://opensource.com/article/21/6/bash-config)
[#]: author: (David Both https://opensource.com/users/dboth)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How to parse Bash program configuration files
======
Separating config files from code enables anyone to change their
configurations without any special programming skills.
![bash logo on green background][1]

Keeping program configurations separate from code is important. It enables non-programmers to alter configurations without having to modify the program's code. With compiled binary executables, that would be impossible for non-programmers because it not only requires access to source files (which we do have with open source programs) but also a programmer's skill set. Few people have that, and most people don't want to learn.

With shell languages such as Bash, source code access is available by definition since shell scripts are not compiled into binary formats. Despite that openness, it is not a particularly good idea for non-programmers to root around in shell scripts and alter them. Even knowledgeable developers and sysadmins can make accidental changes that cause errors or worse.

So placing configuration items into easily maintained text files provides separation and allows non-programmers to edit configuration elements without the danger of making unintentional changes to the code. Many developers do this for programs written in compiled languages because they don't expect the users to be developers. For many of the same reasons, it also makes sense to do this with interpreted shell languages.

### The usual way

As with many other languages, you can write code for a Bash program that reads and parses ASCII text configuration files, reads the variable name, and sets values as the program code executes. For example, a configuration file might look like this:


```
var1=LinuxGeek46
var2=Opensource.com
```

The program would read that file, parse each line, and set the values into each variable.

### Sourcing

Bash uses a much easier method for parsing and setting variables called _sourcing_. Sourcing an external file from an executable shell program is a simple method for including the content of that file into a shell program in its entirety. In one sense, this is very much like compiled language `include` statements that include library files at runtime. Such a file can include any type of Bash code, including variable assignments.

As usual, it is easier to demonstrate than to explain.

First, create a `~/bin` directory (if it does not already exist), and make it the present working directory (PWD). The [Linux Filesystem Hierarchical Standard][2] defines `~/bin` as the appropriate place for users to store their executable files.

Create a new file in this directory. Name it `main` and make it executable:


```
[dboth@david bin]$ touch main
[dboth@david bin]$ chmod +x main
[dboth@david bin]$
```

Add the following content to this executable file:


```
#!/bin/bash
Name="LinuxGeek"
echo $Name
```

And execute this Bash program:


```
[dboth@david bin]$ ./main
LinuxGeek
[dboth@david bin]$
```

Create a new file and call it `~/bin/data`. This file does not need to be executable. Add the following information to it:


```
# Sourced code and variables
echo "This is the sourced code from the data file."
FirstName="David"
LastName="Both"
```

Add three lines to the `main` program so that it looks like this:


```
#!/bin/bash
Name="LinuxGeek"
echo $Name
source ~/bin/data
echo "First name: $FirstName"
echo "LastName: $LastName"
```

Rerun the program:


```
[dboth@david bin]$ ./main
LinuxGeek
This is the sourced code from the data file.
First name: David
LastName: Both
[dboth@david bin]$
```

There is one more really cool thing to know about sourcing. You can use a single dot (`.`) as a shortcut for the `source` command. Change the `main` file to substitute the `.` in place of `source`:


```
#!/bin/bash
Name="LinuxGeek"
echo $Name
. ~/bin/data
echo "First name: $FirstName"
echo "LastName: $LastName"
```

And run the program again. The result should be exactly the same as the previous run.

### Starting Bash

Every Linux host that uses Bash—which is pretty much all of them since Bash is the default shell for all distributions—includes some excellent, built-in examples of sourcing.

Whenever a Bash shell starts, its environment must be configured so that it is usable. There are five main files and one directory that are used to configure the Bash environment. They are listed here along with their main functions:

  * `/etc/profile`: System-wide environment and startup programs
  * `/etc/bashrc`: System-wide functions and aliases
  * `/etc/profile.d/`: Directory that contains system-wide scripts for configuring various command-line tools such as `vim` and `mc` and any custom configuration scripts a sysadmin creates
  * `~/.bash_profile`: User-specific environment and startup programs
  * `~/.bashrc`: User-specific aliases and functions
  * `~/.bash_logout`: User-specific commands to execute when the user logs out



Try to trace the execution sequence through these files and determine which sequence it uses for a non-login Bash initialization versus a log-in Bash initialization. I did this in Chapter 17 of Volume 1 in my Linux training series, [_Using and administering Linux: Zero to sysadmin_][3].

I'll give you one hint. It all starts with the `~/.bashrc` script.

### Conclusion

This article explored sourcing for pulling code and variable assignments into a Bash program. This method of parsing variables from a configuration file is fast, easy, and flexible. It provides a method for separating Bash code from variable assignments to allow non-programmers to set the values of those variables.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/bash-config

作者：[David Both][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bash_command_line.png?itok=k4z94W2U (bash logo on green background)
[2]: http://refspecs.linuxfoundation.org/fhs.shtml
[3]: http://www.both.org/?page_id=1183

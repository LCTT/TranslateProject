How To Enable Shell Script Debugging Mode in Linux
============================================================

A script is simply a list of commands stored in a file. Instead of running a sequence of commands by typing them one by one all the time on the terminal, a system user can store all of them (commands) in a file and repeatedly invokes the file to re-execute the commands several times.

While [learning scripting][1] or during the early stages of writing scripts, we normally start by writing small or short scripts with a few lines of commands. And we usually debug such scripts by doing nothing more than looking at their output and ensuring that they work as we intended.

However, as we begin to write very long and advanced scripts with thousands of lines of commands, for instance scripts that modify system settings, [perform critical backups over networks][2] and many more, we will realize that only looking at the output of a script is not enough to find bugs within a script.

Therefore, in this shell script debugging in Linux series, we will walk through how to enable shell script debugging, move over to explain the different shell script debugging modes and how to use them in the subsequent series.

### How To Start A Script

A script is distinguished from other files by its first line, that contains a `#!` (She-bang – defines the file type) and a path name (path to interpreter) which informs the system that the file is a collection of commands that will be interpreted by the specified program (interpreter).

Below are examples of the “first lines” in different types of scripts:

```
#!/bin/sh          [For sh scripting]
#!/bin/bash        [For bash scripting] 
#!/usr/bin/perl    [For perl programming]
#!/bin/awk -f      [For awk scripting]   
```

Note: The first line or `#!` can be left out if a script contains only of a set of standard system commands, without any internal shell directives.

### How To Execute A Shell Script in Linux

The conventional syntax for invoking a shell script is:

```
$ script_name  argument1 ... argumentN
```

Another possible form is by clearly specifying the shell that will execute the script as below:

```
$ shell script_name argument1 ... argumentN  
```

For example:

```
$ /bin/bash script_name argument1 ... argumentN     [For bash scripting]
$ /bin/ksh script_name argument1 ... argumentN      [For ksh scripting]
$ /bin/sh script_name argument1 ... argumentN       [For sh scripting]
```

For scripts that do not have `#!` as the first line and only contain basic system commands such as the one below:

```
#script containing standard system commands
cd /home/$USER
mkdir tmp
echo "tmp directory created under /home/$USER"
```

Simply make it executable and run it as follows:

```
$ chmod +x  script_name
$ ./script_name 
```

### Methods of Enabling Shell Script Debugging Mode

Below are the primary shell script debugging options:

1.  `-v` (short for verbose) – tells the shell to show all lines in a script while they are read, it activates verbose mode.
2.  `-n` (short for noexec or no ecxecution) – instructs the shell read all the commands, however doesn’t execute them. This options activates syntax checking mode.
3.  `-x` (short for xtrace or execution trace) – tells the shell to display all commands and their arguments on the terminal while they are executed. This option enables shell tracing mode.

#### 1\. Modifying the First Line of a Shell Script

The first mechanism is by altering the first line of a shell script as below, this will enable debugging of the whole script.

```
#!/bin/sh option(s)
```

In the form above, option can be one or combination of the debugging options above.

#### 2\. Invoking Shell With Debugging Options

The second is by invoking the shell with debugging options as follows, this method will also turn on debugging of the entire script.

```
$ shell option(s) script_name argument1 ... argumentN
```

For example:

```
$ /bin/bash option(s) script_name argument1 ... argumentN   
```

#### 3\. Using set Shell Built-in Command

The third method is by using the set built-in command to debug a given section of a shell script such as a function. This mechanism is important, as it allows us to activate debugging at any segment of a shell script.

We can turn on debugging mode using set command in form below, where option is any of the debugging options.

```
$ set option 
```

To enable debugging mode, use:

```
$ set -option
```

To disable debugging mode, use:

```
$ set +option
```

In addition, if we have enabled several debugging modes in different segments of a shell script, we can disable all of them at once like so:

```
$ set -
```

That is it for now with enabling shell script debugging mode. As we have seen, we can either debug an entire shell script or a particular section of a script.

In the next two episode of this series, we will cover how to use the shell script debugging options to explain verbose, syntax checking and shell tracing debugging modes with examples.

Importantly, do not forget to ask any questions about this guide or perhaps provide us feedback through the comment section below. Until then, stay connected to Tecmint.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/enable-shell-debug-mode-linux/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/category/bash-shell/
[2]:http://www.tecmint.com/rsync-local-remote-file-synchronization-commands/

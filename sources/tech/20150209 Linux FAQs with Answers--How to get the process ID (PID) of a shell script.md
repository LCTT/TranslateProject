Translating---geekpi

Linux FAQs with Answers--How to get the process ID (PID) of a shell script
================================================================================
> **Question**: I want to know the process ID (PID) of the subshell under which my shell script is running. How can I find a PID in a bash shell script? 

When you execute a shell script, it will launch a process known as a subshell. As a child process of the main shell, a subshell executes a list of commands in a shell script as a batch (so-called "batch processing").

In some cases, you may want to know the process ID (PID) of the subshell where your shell script is running. This PID information can be used under different circumstances. For example, you can create a unique temporary file in /tmp by naming it with the shell script PID. In case a script needs to examine all running processes, it can exclude its own subshell from the process list.

In bash, the **PID of a shell script's subshell process** is stored in a special variable called '$$'. This variable is read-only, and you cannot modify it in a shell script. For example:

    #!/bin/bash
     
    echo "PID of this script: $$"

The above script will show the following output.

    PID of this script: 6583

Besides $$, bash shell exports several other read-only variables. For example, PPID stores the process ID of the subshell's parent process (i.e., main shell). UID stores the user ID of the current user who is executing the script. For example:

    #!/bin/bash
     
    echo "PID of this script: $$"
    echo "PPID of this script: $PPID"
    echo "UID of this script: $UID"

Its output will be:

    PID of this script: 6686
    PPID of this script: 4656
    UID of this script: 1000

In the above, PID will keep changing every time you invoke a script. That is because each invocation of a script will create a new subshell. On the other hand, PPID will remain the same as long as you run a script inside the same shell.

![](https://farm8.staticflickr.com/7437/16274890369_e78ce16d42_b.jpg)

For a complete list of built-in bash variables, refer to its man page.

    $ man bash

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/process-id-pid-shell-script.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

How to Trace Execution of Commands in Shell Script with Shell Tracing
============================================================

In this article of the [shell script debugging series][3], we will explain the third shell script debugging mode, that is shell tracing and look at some examples to demonstrate how it works, and how it can be used.

The previous part of this series clearly throws light upon the two other shell script debugging modes: verbose mode and syntax checking mode with easy-to-understand examples of how to enable shell script debugging in these modes.

1.  [How To Enable Shell Script Debugging Mode in Linux – Part 1][1]
2.  [How to Perform Syntax Checking Debugging Mode in Shell Scripts – Part 2][2]

Shell tracing simply means tracing the execution of the commands in a shell script. To switch on shell tracing, use the `-x` debugging option.

This directs the shell to display all commands and their arguments on the terminal as they are executed.

We will use the `sys_info.sh` shell script below, which briefly prints your system date and time, number of users logged in and the system uptime. However, it contains syntax errors that we need to find and correct.

```
#!/bin/bash
#script to print brief system info
ROOT_ID="0"
DATE=`date`
NO_USERS=`who | wc -l`
UPTIME=`uptime`
check_root(){
if [ "$UID" -ne "$ROOT_ID" ]; then
echo "You are not allowed to execute this program!"
exit 1;    
}
print_sys_info(){
echo "System Time    : $DATE"
echo "Number of users: $NO_USERS"
echo "System Uptime  : $UPTIME
}
check_root
print_sys_info
exit 0
```

Save the file and make the script executable. The script can only be run by root, therefore employ the [sudo command][4] to run it as below:

```
$ chmod +x sys_info.sh
$ sudo bash -x sys_info.sh
```
[
 ![Shell Tracing - Show Error in Script](http://www.tecmint.com/wp-content/uploads/2016/12/Shell-Tracing-Errors.png) 
][5]

Shell Tracing – Show Error in Script

From the output above, we can observe that, a command is first executed before its output is substituted as the value of a variable.

For example, the date was first executed and the its output was substituted as the value of the variable DATE.

We can perform syntax checking to only display the syntax errors as follows:

```
$ sudo bash -n sys_info.sh 
```
[
 ![Syntax Checking in Script](http://www.tecmint.com/wp-content/uploads/2016/12/Syntax-Checking-in-Script.png) 
][6]

Syntax Checking in Script

If we look at the shell script critically, we will realize that the `if statement` is missing a closing `fi` word. Therefore, let us add it and the new script should now look like below:

```
#!/bin/bash
#script to print brief system info
ROOT_ID="0"
DATE=`date`
NO_USERS=`who | wc -l`
UPTIME=`uptime`
check_root(){
if [ "$UID" -ne "$ROOT_ID" ]; then
echo "You are not allowed to execute this program!"
exit 1;
fi    
}
print_sys_info(){
echo "System Time    : $DATE"
echo "Number of users: $NO_USERS"
echo "System Uptime  : $UPTIME
}
check_root
print_sys_info
exit 0
```

Save the file again and invoke it as root and do some syntax checking:

```
$ sudo bash -n sys_info.sh
```
[
 ![Perform Syntax Check in Shell Scripts](http://www.tecmint.com/wp-content/uploads/2016/12/Syntax-Check-in-Shell-Scripts.png) 
][7]

Perform Syntax Check in Shell Scripts

The result of our syntax checking operation above still shows that there is one more bug in our script on line 21. So, we still have some syntax correction to do.

If we look through the script analytically one more time, the error on line 21 is due to a missing closing double quote `(”)` in the last [echo command][8] inside the `print_sys_info` function.

We will add the closing double quote in the echo command and save the file. The changed script is below:

```
#!/bin/bash
#script to print brief system info
ROOT_ID="0"
DATE=`date`
NO_USERS=`who | wc -l`
UPTIME=`uptime`
check_root(){
if [ "$UID" -ne "$ROOT_ID" ]; then
echo "You are not allowed to execute this program!"
exit 1;
fi
}
print_sys_info(){
echo "System Time    : $DATE"
echo "Number of users: $NO_USERS"
echo "System Uptime  : $UPTIME"
}
check_root
print_sys_info
exit 0
```

Now syntactically check the script one more time.

```
$ sudo bash -n sys_info.sh
```

The command above will not produce any output because our script is now syntactically correct. We can as well trace the execution of the script all for a second time and it should work well:

```
$ sudo bash -x sys_info.sh
```
[
 ![Trace Shell Script Execution](http://www.tecmint.com/wp-content/uploads/2016/12/Trace-Shell-Execution.png) 
][9]

Trace Shell Script Execution

Now run the script.

```
$ sudo ./sys_info.sh
```
[
 ![Shell Script to Show Date, Time and Uptime](http://www.tecmint.com/wp-content/uploads/2016/12/Script-to-Show-Date-and-Uptime.png) 
][10]

Shell Script to Show Date, Time and Uptime

### Importance of Shell Script Execution Tracing

Shell script tracing helps us identify syntax errors and more importantly, logical errors. Take for instance the `check_root` function in the `sys_info.sh` shell script, which is intended to determine if a user is root or not, since the script is only allowed to be executed by the superuser.

```
check_root(){
if [ "$UID" -ne "$ROOT_ID" ]; then
echo "You are not allowed to execute this program!"
exit 1;
fi
}
```

The magic here is controlled by the `if statement` expression `[ "$UID" -ne "$ROOT_ID" ]`, once we do not use the suitable numerical operator (`-ne` in this case, which means not equal ), we end up with a possible logical error.

Assuming that we used `-eq` ( means equal to), this would permit any system user as well as the root user to run the script, hence a logical error.

```
check_root(){
if [ "$UID" -eq "$ROOT_ID" ]; then
echo "You are not allowed to execute this program!"
exit 1;
fi
}
```

Note: As we looked at before at the start of this series, the set shell built-in command can activate debugging in a particular section of a shell script.

Therefore, the line below will help us find this logical error in the function by tracing its execution:

The script with a logical error:

```
#!/bin/bash
#script to print brief system info
ROOT_ID="0"
DATE=`date`
NO_USERS=`who | wc -l`
UPTIME=`uptime`
check_root(){
if [ "$UID" -eq "$ROOT_ID" ]; then
echo "You are not allowed to execute this program!"
exit 1;
fi
}
print_sys_info(){
echo "System Time    : $DATE"
echo "Number of users: $NO_USERS"
echo "System Uptime  : $UPTIME"
}
#turning on and off debugging of check_root function
set -x ; check_root;  set +x ;
print_sys_info
exit 0
```

Save the file and invoke the script, we can see that a regular system user can run the script without sudo as in the output below. This is because the value of USER_ID is 100 which is not equal to root ROOT_ID which is 0.

```
$ ./sys_info.sh
```
[
 ![Run Shell Script Without Sudo](http://www.tecmint.com/wp-content/uploads/2016/12/Run-Shell-Script-Without-Sudo.png) 
][11]

Run Shell Script Without Sudo

Well, that is it for now, we have come to the end of the [shell script debugging series][12], the response form below can be used to address any questions or feedback to us, concerning this guide or the whole 3-part series.

--------------------------------------------------------------------------------

作者简介：

![](http://1.gravatar.com/avatar/4e444ab611c7b8c7bcb76e58d2e82ae0?s=128&d=blank&r=g)

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/trace-shell-script-execution-in-linux/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/enable-shell-debug-mode-linux/
[2]:http://www.tecmint.com/check-syntax-in-shell-script/
[3]:http://www.tecmint.com/enable-shell-debug-mode-linux/
[4]:http://www.tecmint.com/su-vs-sudo-and-how-to-configure-sudo-in-linux/
[5]:http://www.tecmint.com/wp-content/uploads/2016/12/Shell-Tracing-Errors.png
[6]:http://www.tecmint.com/wp-content/uploads/2016/12/Syntax-Checking-in-Script.png
[7]:http://www.tecmint.com/wp-content/uploads/2016/12/Syntax-Check-in-Shell-Scripts.png
[8]:http://www.tecmint.com/echo-command-in-linux/
[9]:http://www.tecmint.com/wp-content/uploads/2016/12/Trace-Shell-Execution.png
[10]:http://www.tecmint.com/wp-content/uploads/2016/12/Script-to-Show-Date-and-Uptime.png
[11]:http://www.tecmint.com/wp-content/uploads/2016/12/Run-Shell-Script-Without-Sudo.png
[12]:http://www.tecmint.com/enable-shell-debug-mode-linux/

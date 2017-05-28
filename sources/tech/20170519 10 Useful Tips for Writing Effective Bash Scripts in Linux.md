10 Useful Tips for Writing Effective Bash Scripts in Linux
============================================================
ch-cn translating

[Shell scripting][4] is the easiest form of programming you can learn/do in Linux. More so, it is a required skill for [system administration for automating tasks][5], developing new simple utilities/tools just to mention but a few.

In this article, we will share 10 useful and practical tips for writing effective and reliable bash scripts and they include:

### 1\. Always Use Comments in Scripts

This is a recommended practice which is not only applied to shell scripting but all other kinds of programming. Writing comments in a script helps you or some else going through your script understand what the different parts of the script do.

For starters, comments are defined using the `#` sign.

```
#TecMint is the best site for all kind of Linux articles
```

### 2\. Make a Script exit When Fails

Sometimes bash may continue to execute a script even when a certain command fails, thus affecting the rest of the script (may eventually result in logical errors). Use the line below to exit a script when a command fails:

```
#let script exit if a command fails
set -o errexit 
OR
set -e
```

### 3\. Make a Script exit When Bash Uses Undeclared Variable

Bash may also try to use an undeclared script which could cause a logical error. Therefore use the following line to instruct bash to exit a script when it attempts to use an undeclared variable:

```
#let script exit if an unsed variable is used
set -o nounset
OR
set -u
```

### 4\. Use Double Quotes to Reference Variables

Using double quotes while referencing (using a value of a variable) helps to prevent word splitting (regarding whitespace) and unnecessary globbing (recognizing and expanding wildcards).

Check out the example below:

```
#!/bin/bash
#let script exit if a command fails
set -o errexit 
#let script exit if an unsed variable is used
set -o nounset
echo "Names without double quotes" 
echo
names="Tecmint FOSSMint Linusay"
for name in $names; do
echo "$name"
done
echo
echo "Names with double quotes" 
echo
for name in "$names"; do
echo "$name"
done
exit 0
```

Save the file and exit, then run it as follows:

```
$ ./names.sh
```
 [![Use Double Quotes in Scripts](https://www.tecmint.com/wp-content/uploads/2017/05/Use-Double-Quotes-in-Scripts.png)][6] 

Use Double Quotes in Scripts

### 5\. Use functions in Scripts

Except for very small scripts (with a few lines of code), always remember to use functions to modularize your code and make scripts more readable and reusable.

The syntax for writing functions is as follows:

```
function check_root(){
command1; 
command2;
}
OR
check_root(){
command1; 
command2;
}
```

For single line code, use termination characters after each command like this:

```
check_root(){ command1; command2; }
```

### 6\. Use = instead of == for String Comparisons

Note that `==` is a synonym for `=`, therefore only use a single `=` for string comparisons, for instance:

```
value1=”tecmint.com”
value2=”fossmint.com”
if [ "$value1" = "$value2" ]
```

### 7\. Use $(command) instead of legacy ‘command’ for Substitution

[Command substitution][7] replaces a command with its output. Use `$(command)` instead of backquotes ``command`` for command substitution.

This is recommended even by [shellcheck tool][8] (shows warnings and suggestions for shell scripts). For example:

```
user=`echo “$UID”`
user=$(echo “$UID”)
```

### 8\. Use Read-only to Declare Static Variables

A static variable doesn’t change; its value can not be altered once it’s defined in a script:

```
readonly passwd_file=”/etc/passwd”
readonly group_file=”/etc/group”
```

### 9\. Use Uppercase Names for ENVIRONMENT Variables and Lowercase for Custom Variables

All bash environment variables are named with uppercase letters, therefore use lowercase letters to name your custom variables to avoid variable name conflicts:

```
#define custom variables using lowercase and use uppercase for env variables
nikto_file=”$HOME/Downloads/nikto-master/program/nikto.pl”
perl “$nikto_file” -h  “$1”
```

### 10\. Always Perform Debugging for Long Scripts

If you are writing bash scripts with thousands of lines of code, finding errors may become a nightmare. To easily fix things before executing a script, perform some debugging. Master this tip by reading through the guides provided below:

1.  [How To Enable Shell Script Debugging Mode in Linux][1]

2.  [How to Perform Syntax Checking Debugging Mode in Shell Scripts][2]

3.  [How to Trace Execution of Commands in Shell Script with Shell Tracing][3]

That’s all! Do you have any other best bash scripting practices to share? If yes, then use the comment form below to do that.

--------------------------------------------------------------------------------

作者简介：


Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

----------------

via: https://www.tecmint.com/useful-tips-for-writing-bash-scripts-in-linux/

作者：[ Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.tecmint.com/author/aaronkili/
[1]:https://www.tecmint.com/enable-shell-debug-mode-linux/
[2]:https://www.tecmint.com/check-syntax-in-shell-script/
[3]:https://www.tecmint.com/trace-shell-script-execution-in-linux/
[4]:https://www.tecmint.com/category/bash-shell/
[5]:https://www.tecmint.com/using-shell-script-to-automate-linux-system-maintenance-tasks/
[6]:https://www.tecmint.com/wp-content/uploads/2017/05/Use-Double-Quotes-in-Scripts.png
[7]:https://www.tecmint.com/assign-linux-command-output-to-variable/
[8]:https://www.tecmint.com/shellcheck-shell-script-code-analyzer-for-linux/

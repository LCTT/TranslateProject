How To Debug a Bash Shell Script Under Linux or UNIX
======
From my mailbag:
**I wrote a small hello world script. How can I Debug a bash shell scripts running on a Linux or Unix like systems?**
It is the most common question asked by new sysadmins or Linux/UNIX user. Shell scripting debugging can be a tedious job (read as not easy). There are various ways to debug a shell script.

You need to pass the -x or -v argument to bash shell to walk through each line in the script.

[![How to debug a bash shell script on Linux or Unix][1]][1]

Let us see how to debug a bash script running on Linux and Unix using various methods.

### -x option to debug a bash shell script

Run a shell script with -x option.
```
$ bash -x script-name
$ bash -x domains.sh
```

### Use of set builtin command

Bash shell offers debugging options which can be turn on or off using the [set command][2]:

  *  **set -x** : Display commands and their arguments as they are executed.
  *  **set -v** : Display shell input lines as they are read.



You can use above two command in shell script itself:
```
#!/bin/bash
clear
 
# turn on debug mode
set -x
for f in *
do
   file $f
done
# turn OFF debug mode
set +x
ls
# more commands
```

You can replace the [standard Shebang][3] line:
`#!/bin/bash`
with the following (for debugging) code:
`#!/bin/bash -xv`

### Use of intelligent DEBUG function

First, add a special variable called _DEBUG. Set _DEBUG to 'on' when you need to debug a script:
`_DEBUG="on"`

Put the following function at the beginning of the script:
```
function DEBUG()
{
 [ "$_DEBUG" == "on" ] &&  $@
}
```

function DEBUG() { [ "$_DEBUG" == "on" ] && $@ }

Now wherever you need debugging simply use the DEBUG function as follows:
`DEBUG echo "File is $filename"`
OR
```
DEBUG set -x
Cmd1
Cmd2
DEBUG set +x
```

When done with debugging (and before moving your script to production) set _DEBUG to 'off'. No need to delete debug lines.
`_DEBUG="off" # set to anything but not to 'on'`

Sample script:
```
#!/bin/bash
_DEBUG="on"
function DEBUG()
{
 [ "$_DEBUG" == "on" ] &&  $@
}
 
DEBUG echo 'Reading files'
for i in *
do
  grep 'something' $i > /dev/null
  [ $? -eq 0 ] && echo "Found in $i file"
done
DEBUG set -x
a=2
b=3
c=$(( $a + $b ))
DEBUG set +x
echo "$a + $b = $c"
```

Save and close the file. Run the script as follows:
`$ ./script.sh`
Output:
```
Reading files
Found in xyz.txt file
+ a=2
+ b=3
+ c=5
+ DEBUG set +x
+ '[' on == on ']'
+ set +x
2 + 3 = 5

```

Now set DEBUG to off (you need to edit the file):
`_DEBUG="off"`
Run script:
`$ ./script.sh`
Output:
```
Found in xyz.txt file
2 + 3 = 5

```

Above is a simple but quite effective technique. You can also try to use DEBUG as an alias instead of function.

### Debugging Common Bash Shell Scripting Errors

Bash or sh or ksh gives various error messages on screen and in many case the error message may not provide detailed information.

#### Skipping to apply execute permission on the file

When you [write your first hello world bash shell script][4], you might end up getting an error that read as follows:
`bash: ./hello.sh: Permission denied`
Set permission using chmod command:
```
$ chmod +x hello.sh
$ ./hello.sh
$ bash hello.sh
```

#### End of file unexpected Error

If you are getting an End of file unexpected error message, open your script file and and make sure it has both opening and closing quotes. In this example, the echo statement has an opening quote but no closing quote:
```
#!/bin/bash


...
....


echo 'Error: File not found
                           ^^^^^^^
                           missing quote
```

Also make sure you check for missing parentheses and braces ({}):
```
#!/bin/bash
.....
[ ! -d $DIRNAME ] && { echo "Error: Chroot dir not found"; exit 1;
                                                                    ^^^^^^^^^^^^^
                                                                    missing brace }
...
```

####  Missing Keywords Such As fi, esac, ;;, etc.

If you missed ending keyword such as fi or ;; you will get an error such as as "xxx unexpected". So make sure all nested if and case statements ends with proper keywords. See bash man page for syntax requirements. In this example, fi is missing:
```
#!/bin/bash
echo "Starting..."
....
if [ $1 -eq 10 ]
then
   if [ $2 -eq 100 ]
   then
      echo "Do something"
fi
 
for f in $files
do
  echo $f
done
 
# note fi is missing
```

#### Moving or editing shell script on Windows or Unix boxes

Do not create the script on Linux/Unix and move to Windows. Another problem is editing the bash shell script on Windows 10 and move/upload to Unix server. It will result in an error like command not found due to the carriage return (DOS CR-LF). You [can convert DOS newlines CR-LF to Unix/Linux format using][5] the following syntax:
`dos2unix my-script.sh`

### Tip 1 - Send Debug Message To stderr

[Standard error][6] is the default error output device, which is used to write all system error messages. So it is a good idea to send messages to the default error device:
```
# Write error to stdout
echo "Error: $1 file not found"
#
# Write error to stderr (note 1>&2 at the end of echo command)
#
echo "Error: $1 file not found" 1>&2
```

### Tip 2 - Turn On Syntax Highlighting when using vim text editor

Most modern text editors allows you to set syntax highlighting option. This is useful to detect syntax and prevent common errors such as opening or closing quote. You can see bash script in different colors. This feature eases writing in a shell script structures and syntax errors are visually distinct. Highlighting does not affect the meaning of the text itself; it's made only for you. In this example, vim syntax highlighting is used for my bash script:
[![How To Debug a Bash Shell Script Under Linux or UNIX Using Vim Syntax Highlighting Feature][7]][7]

### Tip 3 - Use shellcheck to lint script

[ShellCheck is a static analysis tool for shell scripts][8]. One can use it to finds bugs in your shell scripts. It is written in Haskell. You can find warnings and suggestions for bash/sh shell scripts with this tool. Let us see how to install and use ShellCheck on a Linux or Unix-like system to enhance your shell scripts, avoid errors and productivity.


### About the author

Posted by:

The author is the creator of nixCraft and a seasoned sysadmin and a trainer for the Linux operating system/Unix shell scripting. He has worked with global clients and in various industries, including IT, education, defense and space research, and the nonprofit sector. Follow him on [Twitter][9], [Facebook][10], [Google+][11].

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/tips/debugging-shell-script.html

作者：[Vivek Gite][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/tips/wp-content/uploads/2007/01/How-to-debug-a-bash-shell-script-on-Linux-or-Unix.jpg
[2]:https://bash.cyberciti.biz/guide/Set_command
[3]:https://bash.cyberciti.biz/guide/Shebang
[4]:https://www.cyberciti.biz/faq/hello-world-bash-shell-script/
[5]:https://www.cyberciti.biz/faq/howto-unix-linux-convert-dos-newlines-cr-lf-unix-text-format/
[6]:https://bash.cyberciti.biz/guide/Standard_error
[7]:https://www.cyberciti.biz/media/new/tips/2007/01/bash-vim-debug-syntax-highlighting.png
[8]:https://www.cyberciti.biz/programming/improve-your-bashsh-shell-script-with-shellcheck-lint-script-analysis-tool/
[9]:https://twitter.com/nixcraft
[10]:https://facebook.com/nixcraft
[11]:https://plus.google.com/+CybercitiBiz

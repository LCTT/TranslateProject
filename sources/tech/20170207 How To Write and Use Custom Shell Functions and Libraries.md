wcnnbdk1 translating
How To Write and Use Custom Shell Functions and Libraries
============================================================

In Linux, shell scripts help us in so many different ways including performing or even [automating certain system administration tasks][1], creating simple command line tools and many more.

In this guide, we will show new Linux users where to reliably store custom shell scripts, explain how to write custom shell functions and libraries, use functions from libraries in other scripts.

### Where to Store Shell Scripts

In order to run your scripts without typing a full/absolute path, they must be stored in one of the directories in the $PATH environment variable.

To check your $PATH, issues the command below:

```
$ echo $PATH
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games
```

Normally, if the directory bin exists in a users home directory, it is automatically included in his/her $PATH. You can store your shell scripts here.

Therefore, create the bin directory (which may also store Perl, [Awk][2] or Python scripts or any other programs):

```
$ mkdir ~/bin
```

Next, create a directory called lib (short for libraries) where you’ll keep your own libraries. You can also keep libraries for other languages such as C, Python and so on, in it. Under it, create another directory called sh; this will particularly store you shell libraries:

```
$ mkdir -p ~/lib/sh 
```

### Create Your Own Shell Functions and Libraries

A shell function is a group of commands that perform a special task in a script. They work similarly to procedures, subroutines and functions in other programming languages.

The syntax for writing a function is:

```
function_name() { list of commands }
```

For example, you can write a function in a script to show the date as follows:

```
showDATE() {date;}
```

Every time you want to display date, simply invoke the function above using its name:

```
$ showDATE
```

A shell library is simply a shell script, however, you can write a library to only store your functions that you can later call from other shell scripts.

Below is an example of a library called libMYFUNCS.sh in my ~/lib/sh directory with more examples of functions:

```
#!/bin/bash 
#Function to clearly list directories in PATH 
showPATH() { 
oldifs="$IFS"   #store old internal field separator
IFS=:              #specify a new internal field separator
for DIR in $PATH ;  do echo $DIR ;  done
IFS="$oldifs"    #restore old internal field separator
}
#Function to show logged user
showUSERS() {
echo -e “Below are the user logged on the system:\n”
w
}
#Print a user’s details 
printUSERDETS() {
oldifs="$IFS"    #store old internal field separator
IFS=:                 #specify a new internal field separator
read -p "Enter user name to be searched:" uname   #read username
echo ""
#read and store from a here string values into variables using : as  a  field delimiter
read -r username pass uid gid comments homedir shell <<< "$(cat /etc/passwd | grep   "^$uname")"
#print out captured values
echo  -e "Username is            : $username\n"
echo  -e "User's ID                 : $uid\n"
echo  -e "User's GID              : $gid\n"
echo  -e "User's Comments    : $comments\n"
echo  -e "User's Home Dir     : $homedir\n"
echo  -e "User's Shell             : $shell\n"
IFS="$oldifs"         #store old internal field separator
}
```

Save the file and make the script executable.

### How To Invoke Functions From a Library

To use a function in a lib, you need to first of all include the lib in the shell script where the function will be used, in the form below:

```
$ ./path/to/lib
OR
$ source /path/to/lib
```

So you would use the function printUSERDETS from the lib ~/lib/sh/libMYFUNCS.sh in another script as shown below.

You do not have to write another code in this script to print a particular user’s details, simply call an existing function.

Open a new file with the name test.sh:

```
#!/bin/bash 
#include lib
.  ~/lib/sh/libMYFUNCS.sh
#use function from lib
printUSERDETS
#exit script
exit 0
```

Save it, then make the script executable and run it:

```
$ chmod 755 test.sh
$ ./test.sh 
```
[
 ![Write Shell Functions](http://www.tecmint.com/wp-content/uploads/2017/02/Write-Shell-Functions.png) 
][3]

Write Shell Functions

In this article, we showed you where to reliably store shell scripts, how to write your own shell functions and libraries, invoke functions from libraries in normal shell scripts.

Next, we will explain a straight forward way of configuring Vim as an IDE for Bash scripting. Until then, always stay connected to TecMint and also share your thoughts about this guide via the feedback form below.

--------------------------------------------------------------------------------

作者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/write-custom-shell-functions-and-libraries-in-linux/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/

[1]:http://www.tecmint.com/using-shell-script-to-automate-linux-system-maintenance-tasks/
[2]:http://www.tecmint.com/use-linux-awk-command-to-filter-text-string-in-files/
[3]:http://www.tecmint.com/wp-content/uploads/2017/02/Write-Shell-Functions.png

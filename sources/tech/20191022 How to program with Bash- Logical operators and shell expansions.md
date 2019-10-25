[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to program with Bash: Logical operators and shell expansions)
[#]: via: (https://opensource.com/article/19/10/programming-bash-part-2)
[#]: author: (David Both https://opensource.com/users/dboth)

How to program with Bash: Logical operators and shell expansions
======
Learn about logical operators and shell expansions, in the second
article in this three-part series on programming with Bash.
![Women in computing and open source v5][1]

Bash is a powerful programming language, one perfectly designed for use on the command line and in shell scripts. This three-part series (which is based on my [three-volume Linux self-study course][2]) explores using Bash as a programming language on the command-line interface (CLI).

The [first article][3] explored some simple command-line programming with Bash, including using variables and control operators. This second article looks into the types of file, string, numeric, and miscellaneous logical operators that provide execution-flow control logic and different types of shell expansions in Bash. The third and final article in the series will explore the **for**, **while**, and **until** loops that enable repetitive operations.

Logical operators are the basis for making decisions in a program and executing different sets of instructions based on those decisions. This is sometimes called flow control.

### Logical operators

Bash has a large set of logical operators that can be used in conditional expressions. The most basic form of the **if** control structure tests for a condition and then executes a list of program statements if the condition is true. There are three types of operators: file, numeric, and non-numeric operators. Each operator returns true (0) if the condition is met and false (1) if the condition is not met.

The functional syntax of these comparison operators is one or two arguments with an operator that are placed within square braces, followed by a list of program statements that are executed if the condition is true, and an optional list of program statements if the condition is false:


```
if [ arg1 operator arg2 ] ; then list
or
if [ arg1 operator arg2 ] ; then list ; else list ; fi
```

The spaces in the comparison are required as shown. The single square braces, **[** and **]**, are the traditional Bash symbols that are equivalent to the **test** command:


```
`if test arg1 operator arg2 ; then list`
```

There is also a more recent syntax that offers a few advantages and that some sysadmins prefer. This format is a bit less compatible with different versions of Bash and other shells, such as ksh (the Korn shell). It looks like:


```
`if [[ arg1 operator arg2 ]] ; then list`
```

#### File operators

File operators are a powerful set of logical operators within Bash. Figure 1 lists more than 20 different operators that Bash can perform on files. I use them quite frequently in my scripts.

Operator | Description
---|---
-a filename | True if the file exists; it can be empty or have some content but, so long as it exists, this will be true
-b filename | True if the file exists and is a block special file such as a hard drive like **/dev/sda** or **/dev/sda1**
-c filename | True if the file exists and is a character special file such as a TTY device like **/dev/TTY1**
-d filename | True if the file exists and is a directory
-e filename | True if the file exists; this is the same as **-a** above
-f filename | True if the file exists and is a regular file, as opposed to a directory, a device special file, or a link, among others
-g filename | True if the file exists and is **set-group-id**, **SETGID**
-h filename | True if the file exists and is a symbolic link
-k filename | True if the file exists and its "sticky'" bit is set
-p filename | True if the file exists and is a named pipe (FIFO)
-r filename | True if the file exists and is readable, i.e., has its read bit set
-s filename | True if the file exists and has a size greater than zero; a file that exists but that has a size of zero will return false
-t fd | True if the file descriptor **fd** is open and refers to a terminal
-u filename | True if the file exists and its **set-user-id** bit is set
-w filename | True if the file exists and is writable
-x filename | True if the file exists and is executable
-G filename | True if the file exists and is owned by the effective group ID
-L filename | True if the file exists and is a symbolic link
-N filename | True if the file exists and has been modified since it was last read
-O filename | True if the file exists and is owned by the effective user ID
-S filename | True if the file exists and is a socket
file1 -ef file2 | True if file1 and file2 refer to the same device and iNode numbers
file1 -nt file2 | True if file1 is newer (according to modification date) than file2, or if file1 exists and file2 does not
file1 -ot file2 | True if file1 is older than file2, or if file2 exists and file1 does not

_**Fig. 1: The Bash file operators**_

As an example, start by testing for the existence of a file:


```
[student@studentvm1 testdir]$ File="TestFile1" ; if [ -e $File ] ; then echo "The file $File exists." ; else echo "The file $File does not exist." ; fi
The file TestFile1 does not exist.
[student@studentvm1 testdir]$
```

Next, create a file for testing named **TestFile1**. For now, it does not need to contain any data:


```
`[student@studentvm1 testdir]$ touch TestFile1`
```

It is easy to change the value of the **$File** variable rather than a text string for the file name in multiple locations in this short CLI program:


```
[student@studentvm1 testdir]$ File="TestFile1" ; if [ -e $File ] ; then echo "The file $File exists." ; else echo "The file $File does not exist." ; fi
The file TestFile1 exists.
[student@studentvm1 testdir]$
```

Now, run a test to determine whether a file exists and has a non-zero length, which means it contains data. You want to test for three conditions: 1. the file does not exist; 2. the file exists and is empty; and 3. the file exists and contains data. Therefore, you need a more complex set of tests—use the **elif** stanza in the **if-elif-else** construct to test for all of the conditions:


```
[student@studentvm1 testdir]$ File="TestFile1" ; if [ -s $File ] ; then echo "$File exists and contains data." ; fi
[student@studentvm1 testdir]$
```

In this case, the file exists but does not contain any data. Add some data and try again:


```
[student@studentvm1 testdir]$ File="TestFile1" ; echo "This is file $File" &gt; $File ; if [ -s $File ] ; then echo "$File exists and contains data." ; fi
TestFile1 exists and contains data.
[student@studentvm1 testdir]$
```

That works, but it is only truly accurate for one specific condition out of the three possible ones. Add an **else** stanza so you can be somewhat more accurate, and delete the file so you can fully test this new code:


```
[student@studentvm1 testdir]$ File="TestFile1" ; rm $File ; if [ -s $File ] ; then echo "$File exists and contains data." ; else echo "$File does not exist or is empty." ; fi
TestFile1 does not exist or is empty.
```

Now create an empty file to test:


```
[student@studentvm1 testdir]$ File="TestFile1" ; touch $File ; if [ -s $File ] ; then echo "$File exists and contains data." ; else echo "$File does not exist or is empty." ; fi
TestFile1 does not exist or is empty.
```

Add some content to the file and test again:


```
[student@studentvm1 testdir]$ File="TestFile1" ; echo "This is file $File" &gt; $File ; if [ -s $File ] ; then echo "$File exists and contains data." ; else echo "$File does not exist or is empty." ; fi
TestFile1 exists and contains data.
```

Now, add the **elif** stanza to discriminate between a file that does not exist and one that is empty:


```
[student@studentvm1 testdir]$ File="TestFile1" ; touch $File ; if [ -s $File ] ; then echo "$File exists and contains data." ; elif [ -e $File ] ; then echo "$File exists and is empty." ; else echo "$File does not exist." ; fi
TestFile1 exists and is empty.
[student@studentvm1 testdir]$ File="TestFile1" ; echo "This is $File" &gt; $File ; if [ -s $File ] ; then echo "$File exists and contains data." ; elif [ -e $File ] ; then echo "$File exists and is empty." ; else echo "$File does not exist." ; fi
TestFile1 exists and contains data.
[student@studentvm1 testdir]$
```

Now you have a Bash CLI program that can test for these three different conditions… but the possibilities are endless.

It is easier to see the logic structure of the more complex compound commands if you arrange the program statements more like you would in a script that you can save in a file. Figure 2 shows how this would look. The indents of the program statements in each stanza of the **if-elif-else** structure help to clarify the logic.


```
File="TestFile1"
echo "This is $File" &gt; $File
if [ -s $File ]
   then
   echo "$File exists and contains data."
elif [ -e $File ]
   then
   echo "$File exists and is empty."
else
   echo "$File does not exist."
fi
```

_**Fig. 2: The command line program rewritten as it would appear in a script**_

Logic this complex is too lengthy for most CLI programs. Although any Linux or Bash built-in commands may be used in CLI programs, as the CLI programs get longer and more complex, it makes more sense to create a script that is stored in a file and can be executed at any time, now or in the future.

#### String comparison operators

String comparison operators enable the comparison of alphanumeric strings of characters. There are only a few of these operators, which are listed in Figure 3.

Operator | Description
---|---
-z string | True if the length of string is zero
-n string | True if the length of string is non-zero
string1 == string2
or
string1 = string2 | True if the strings are equal; a single **=** should be used with the test command for POSIX conformance. When used with the **[[** command, this performs pattern matching as described above (compound commands).
string1 != string2 | True if the strings are not equal
string1 &lt; string2 | True if string1 sorts before string2 lexicographically (refers to locale-specific sorting sequences for all alphanumeric and special characters)
string1 &gt; string2 | True if string1 sorts after string2 lexicographically

_**Fig. 3: Bash string logical operators**_

First, look at string length. The quotes around **$MyVar** in the comparison must be there for the comparison to work. (You should still be working in **~/testdir**.)


```
[student@studentvm1 testdir]$ MyVar="" ; if [ -z "" ] ; then echo "MyVar is zero length." ; else echo "MyVar contains data" ; fi
MyVar is zero length.
[student@studentvm1 testdir]$ MyVar="Random text" ; if [ -z "" ] ; then echo "MyVar is zero length." ; else echo "MyVar contains data" ; fi
MyVar is zero length.
```

You could also do it this way:


```
[student@studentvm1 testdir]$ MyVar="Random text" ; if [ -n "$MyVar" ] ; then echo "MyVar contains data." ; else echo "MyVar is zero length" ; fi
MyVar contains data.
[student@studentvm1 testdir]$ MyVar="" ; if [ -n "$MyVar" ] ; then echo "MyVar contains data." ; else echo "MyVar is zero length" ; fi
MyVar is zero length
```

Sometimes you may need to know a string's exact length. This is not a comparison, but it is related. Unfortunately, there is no simple way to determine the length of a string. There are a couple of ways to do it, but I think using the **expr** (evaluate expression) command is easiest. Read the man page for **expr** for more about what it can do. Note that quotes are required around the string or variable you're testing.


```
[student@studentvm1 testdir]$ MyVar="" ; expr length "$MyVar"
0
[student@studentvm1 testdir]$ MyVar="How long is this?" ; expr length "$MyVar"
17
[student@studentvm1 testdir]$ expr length "We can also find the length of a literal string as well as a variable."
70
```

Regarding comparison operators, I use a lot of testing in my scripts to determine whether two strings are equal (i.e., identical). I use the non-POSIX version of this comparison operator:


```
[student@studentvm1 testdir]$ Var1="Hello World" ; Var2="Hello World" ; if [ "$Var1" == "$Var2" ] ; then echo "Var1 matches Var2" ; else echo "Var1 and Var2 do not match." ; fi
Var1 matches Var2
[student@studentvm1 testdir]$ Var1="Hello World" ; Var2="Hello world" ; if [ "$Var1" == "$Var2" ] ; then echo "Var1 matches Var2" ; else echo "Var1 and Var2 do not match." ; fi
Var1 and Var2 do not match.
```

Experiment some more on your own to try out these operators.

#### Numeric comparison operators

Numeric operators make comparisons between two numeric arguments. Like the other operator classes, most are easy to understand.

Operator | Description
---|---
arg1 -eq arg2 | True if arg1 equals arg2
arg1 -ne arg2 | True if arg1 is not equal to arg2
arg1 -lt arg2 | True if arg1 is less than arg2
arg1 -le arg2 | True if arg1 is less than or equal to arg2
arg1 -gt arg2 | True if arg1 is greater than arg2
arg1 -ge arg2 | True if arg1 is greater than or equal to arg2

_**Fig. 4: Bash numeric comparison logical operators**_

Here are some simple examples. The first instance sets the variable **$X** to 1, then tests to see if **$X** is equal to 1. In the second instance, **X** is set to 0, so the comparison is not true.


```
[student@studentvm1 testdir]$ X=1 ; if [ $X -eq 1 ] ; then echo "X equals 1" ; else echo "X does not equal 1" ; fi
X equals 1
[student@studentvm1 testdir]$ X=0 ; if [ $X -eq 1 ] ; then echo "X equals 1" ; else echo "X does not equal 1" ; fi
X does not equal 1
[student@studentvm1 testdir]$
```

Try some more experiments on your own.

#### Miscellaneous operators

These miscellaneous operators show whether a shell option is set or a shell variable has a value, but it does not discover the value of the variable, just whether it has one.

Operator | Description
---|---
-o optname | True if the shell option optname is enabled (see the list of options under the description of the **-o** option to the Bash set builtin in the Bash man page)
-v varname | True if the shell variable varname is set (has been assigned a value)
-R varname | True if the shell variable varname is set and is a name reference

_**Fig. 5: Miscellaneous Bash logical operators**_

Experiment on your own to try out these operators.

### Expansions

Bash supports a number of types of expansions and substitutions that can be quite useful. According to the Bash man page, Bash has seven forms of expansions. This article looks at five of them: tilde expansion, arithmetic expansion, pathname expansion, brace expansion, and command substitution.

#### Brace expansion

Brace expansion is a method for generating arbitrary strings. (This tool is used below to create a large number of files for experiments with special pattern characters.) Brace expansion can be used to generate lists of arbitrary strings and insert them into a specific location within an enclosing static string or at either end of a static string. This may be hard to visualize, so it's best to just do it.

First, here's what a brace expansion does:


```
[student@studentvm1 testdir]$ echo {string1,string2,string3}
string1 string2 string3
```

Well, that is not very helpful, is it? But look what happens when you use it just a bit differently:


```
[student@studentvm1 testdir]$ echo "Hello "{David,Jen,Rikki,Jason}.
Hello David. Hello Jen. Hello Rikki. Hello Jason.
```

That looks like something useful—it could save a good deal of typing. Now try this:


```
[student@studentvm1 testdir]$ echo b{ed,olt,ar}s
beds bolts bars
```

I could go on, but you get the idea.

#### Tilde expansion

Arguably, the most common expansion is the tilde (**~**) expansion. When you use this in a command like **cd ~/Documents**, the Bash shell expands it as a shortcut to the user's full home directory.

Use these Bash programs to observe the effects of the tilde expansion:


```
[student@studentvm1 testdir]$ echo ~
/home/student
[student@studentvm1 testdir]$ echo ~/Documents
/home/student/Documents
[student@studentvm1 testdir]$ Var1=~/Documents ; echo $Var1 ; cd $Var1
/home/student/Documents
[student@studentvm1 Documents]$
```

#### Pathname expansion

Pathname expansion is a fancy term expanding file-globbing patterns, using the characters **?** and *****, into the full names of directories that match the pattern. File globbing refers to special pattern characters that enable significant flexibility in matching file names, directories, and other strings when performing various actions. These special pattern characters allow matching single, multiple, or specific characters in a string.

  * **?** — Matches only one of any character in the specified location within the string
  * ***** — Matches zero or more of any character in the specified location within the string



This expansion is applied to matching directory names. To see how this works, ensure that **testdir** is the present working directory (PWD) and start with a plain listing (the contents of my home directory will be different from yours):


```
[student@studentvm1 testdir]$ ls
chapter6  cpuHog.dos    dmesg1.txt  Documents  Music       softlink1  testdir6    Videos
chapter7  cpuHog.Linux  dmesg2.txt  Downloads  Pictures    Templates  testdir
testdir  cpuHog.mac    dmesg3.txt  file005    Public      testdir    tmp
cpuHog     Desktop       dmesg.txt   link3      random.txt  testdir1   umask.test
[student@studentvm1 testdir]$
```

Now list the directories that start with **Do**, **testdir/Documents**, and **testdir/Downloads**:


```
Documents:
Directory01  file07  file15        test02  test10  test20      testfile13  TextFiles
Directory02  file08  file16        test03  test11  testfile01  testfile14
file01       file09  file17        test04  test12  testfile04  testfile15
file02       file10  file18        test05  test13  testfile05  testfile16
file03       file11  file19        test06  test14  testfile09  testfile17
file04       file12  file20        test07  test15  testfile10  testfile18
file05       file13  Student1.txt  test08  test16  testfile11  testfile19
file06       file14  test01        test09  test18  testfile12  testfile20

Downloads:
[student@studentvm1 testdir]$
```

Well, that did not do what you wanted. It listed the contents of the directories that begin with **Do**. To list only the directories and not their contents, use the **-d** option.


```
[student@studentvm1 testdir]$ ls -d Do*
Documents  Downloads
[student@studentvm1 testdir]$
```

In both cases, the Bash shell expands the **Do*** pattern into the names of the two directories that match the pattern. But what if there are also files that match the pattern?


```
[student@studentvm1 testdir]$ touch Downtown ; ls -d Do*
Documents  Downloads  Downtown
[student@studentvm1 testdir]$
```

This shows the file, too. So any files that match the pattern are also expanded to their full names.

#### Command substitution

Command substitution is a form of expansion that allows the STDOUT data stream of one command to be used as the argument of another command; for example, as a list of items to be processed in a loop. The Bash man page says: "Command substitution allows the output of a command to replace the command name." I find that to be accurate if a bit obtuse.

There are two forms of this substitution, **`command`** and **$(command)**. In the older form using back tics (**`**), using a backslash (**\**) in the command retains its literal meaning. However, when it's used in the newer parenthetical form, the backslash takes on its meaning as a special character. Note also that the parenthetical form uses only single parentheses to open and close the command statement.

I frequently use this capability in command-line programs and scripts where the results of one command can be used as an argument for another command.

Start with a very simple example that uses both forms of this expansion (again, ensure that **testdir** is the PWD):


```
[student@studentvm1 testdir]$ echo "Todays date is `date`"
Todays date is Sun Apr  7 14:42:46 EDT 2019
[student@studentvm1 testdir]$ echo "Todays date is $(date)"
Todays date is Sun Apr  7 14:42:59 EDT 2019
[student@studentvm1 testdir]$
```

The **-w** option to the **seq** utility adds leading zeros to the numbers generated so that they are all the same width, i.e., the same number of digits regardless of the value. This makes it easier to sort them in numeric sequence.

The **seq** utility is used to generate a sequence of numbers:


```
[student@studentvm1 testdir]$ seq 5
1
2
3
4
5
[student@studentvm1 testdir]$ echo `seq 5`
1 2 3 4 5
[student@studentvm1 testdir]$
```

Now you can do something a bit more useful, like creating a large number of empty files for testing:


```
`[student@studentvm1 testdir]$ for I in $(seq -w 5000) ; do touch file-$I ; done`
```

In this usage, the statement **seq -w 5000** generates a list of numbers from one to 5,000. By using command substitution as part of the **for** statement, the list of numbers is used by the **for** statement to generate the numerical part of the file names.

#### Arithmetic expansion

Bash can perform integer math, but it is rather cumbersome (as you will soon see). The syntax for arithmetic expansion is **$((arithmetic-expression))**, using double parentheses to open and close the expression.

Arithmetic expansion works like command substitution in a shell program or script; the value calculated from the expression replaces the expression for further evaluation by the shell.

Once again, start with something simple:


```
[student@studentvm1 testdir]$ echo $((1+1))
2
[student@studentvm1 testdir]$ Var1=5 ; Var2=7 ; Var3=$((Var1*Var2)) ; echo "Var 3 = $Var3"
Var 3 = 35
```

The following division results in zero because the result would be a decimal value of less than one:


```
[student@studentvm1 testdir]$ Var1=5 ; Var2=7 ; Var3=$((Var1/Var2)) ; echo "Var 3 = $Var3"
Var 3 = 0
```

Here is a simple calculation I often do in a script or CLI program that tells me how much total virtual memory I have in a Linux host. The **free** command does not provide that data:


```
[student@studentvm1 testdir]$ RAM=`free | grep ^Mem | awk '{print $2}'` ; Swap=`free | grep ^Swap | awk '{print $2}'` ; echo "RAM = $RAM and Swap = $Swap" ; echo "Total Virtual memory is $((RAM+Swap))" ;
RAM = 4037080 and Swap = 6291452
Total Virtual memory is 10328532
```

I used the **`** character to delimit the sections of code used for command substitution.

I use Bash arithmetic expansion mostly for checking system resource amounts in a script and then choose a program execution path based on the result.

### Summary

This article, the second in this series on Bash as a programming language, explored the Bash file, string, numeric, and miscellaneous logical operators that provide execution-flow control logic and the different types of shell expansions.

The third article in this series will explore the use of loops for performing various types of iterative operations.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/programming-bash-part-2

作者：[David Both][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_women_computing_5.png?itok=YHpNs_ss (Women in computing and open source v5)
[2]: http://www.both.org/?page_id=1183
[3]: https://opensource.com/article/19/10/programming-bash-part-1

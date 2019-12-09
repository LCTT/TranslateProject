[#]: collector: "lujun9972"
[#]: translator: "lxbwolf"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "
[#]: subject: "How to program with Bash: Logical operators and shell expansions"
[#]: via: "https://opensource.com/article/19/10/programming-bash-logical-operators-shell-expansions"
[#]: author: "David Both https://opensource.com/users/dboth"

Bash 编程教程：逻辑操作符和 shell 扩展
======

学习逻辑操作符和 shell 扩展，本文是Bash 编程系列（三篇文章）的第二篇。
![Women in computing and open source v5][1]

Bash 是一种强大的编程语言，完美契合命令行和 shell 脚本。本系列（三篇文章，基于我的 [Linux 自学课程三卷][2]）讲解如何在 CLI 使用 Bash 编程。

[第一篇文章][3] 讲解了 Bash 的一些简单命令行操作，包括如何使用变量和控制操作符。第二篇文章探讨文件、字符串、数字等类型和各种各样在执行流中提供控制逻辑的的逻辑运算符，还有 Bash 中的各类 shell 扩展。本系列第三篇也是最后一篇文章，将会探索能重复执行操作的 **for** 、**while** 和 **until** 循环。

逻辑操作符是程序中判断的根本要素，也是执行不同的语句组合的依据。有时这也被称为流控制。

### 逻辑操作符

Bash 中有大量的用于不同条件表达式的逻辑操作符。最基本的是 **if** 控制结构，它判断一个条件，如果条件为真，就执行一些了程序语句。操作符共有三类：文件，数字和非数字操作符。如果条件为真，所有的操作符返回 true（0），如果条件为假，返回 false （1）。

这些比较操作符的函数语法是，一个操作符加一个或两个参数放在中括号内，后面跟一系列程序语句，如果条件为真，程序语句执行，可能会有另一个程序语句 list，该 list 在条件为假时执行：


```
if [ arg1 operator arg2 ] ; then list
or
if [ arg1 operator arg2 ] ; then list ; else list ; fi
```

像例子中那样，在比较表达式中，空格不能省略。中括号的每部分，**[** 和 **]**，是跟 **test** 命令一样的传统的 Bash 符号：


```
`if test arg1 operator arg2 ; then list`
```

还有一个更新的语法能提供一点点便利，一些系统管理员比较喜欢用。这种格式对于不同版本的 Bash 和一些 shell 如 ksh（the Korn shell）兼容性稍差。格式如下：


```
`if [[ arg1 operator arg2 ]] ; then list`
```

#### 文件操作符

文件操作符是 Bash 中一系列强大的逻辑操作符。图表1列出了 20 多种不同的 Bash 处理文件的操作符。在我的脚本中使用频率很高。

Operator | Description
---|---
-a filename | 如果文件存在，返回 true；文件可以为空也可以有内容，但是只要它存在，就返回 true 
-b filename | 如果文件存在且是一个块设备如**/dev/sda** or **/dev/sda1**，则返回 true 
-c filename | 如果文件存在且是一个字符设备如**/dev/TTY1**，则返回 true 
-d filename | 文件存在且是一个目录，返回 true 
-e filename | 文件存在，返回 true；与上面的 **-a** 相同 
-f filename | 文件存在且是一个一般文件，不是目录、设备文件或链接等的其他的文件，则返回 true 
-g filename | 文件存在且 **SETGID** 标记被设置在其上，返回 true 
-h filename | True if the file exists and is a symbolic link
-k filename | True if the file exists and its "sticky'" bit is set
-p filename | 文件存在且是一个命名的管道（FIFO），返回 true 
-r filename | 文件存在且有可读权限，如它的可读位被设置，返回 true 
-s filename | 文件存在且大小大于 0，返回 true；如果一个文件存在但大小为 0，则返回 false 
-t fd | 文件描述符 **fd** 被打开且被关联到一个终端设备上，返回 true 
-u filename | 文件存在且它的**set-user-id** 位被设置，返回 true 
-w filename | 文件存在且有可写权限，返回 true 
-x filename | 文件存在且有可执行权限，返回 true 
-G filename | 文件存在且文件的 group ID 与当前用户相同，返回 true 
-L filename | 文件存在且是一个符号链接，返回 true 
-N filename | 文件存在且从文件上一次被读取到现在为止, 文件被修改过，返回 true 
-O filename | 文件存在且你是文件的拥有者，返回 true 
-S filename | True if the file exists and is a socket
file1 -ef file2 | 文件`file1`和 文件`file2`是相同文件的硬链接，返回 true 
file1 -nt file2 | 文件 file1 比 file2 新（根据修改日期），或 file1 存在而 file2 不存在 
file1 -ot file2 | 文件 file1 比 file2 旧（根据修改日期），或 file1 不存在而 file2 存在 

_**Fig.1：Bash 文件操作符**_

以测试一个文件存在与否来举例：


```
[student@studentvm1 testdir]$ File="TestFile1" ; if [ -e $File ] ; then echo "The file $File exists." ; else echo "The file $File does not exist." ; fi
The file TestFile1 does not exist.
[student@studentvm1 testdir]$
```

创建一个用来测试的文件，命名为  **TestFile1**。目前它不需要包含任何数据：


```
`[student@studentvm1 testdir]$ touch TestFile1`
```

在这个简短的 CLI 程序中， 修改 **$File** 变量的值相比于在多个地方修改表示文件名的字符串的值要容易：


```
[student@studentvm1 testdir]$ File="TestFile1" ; if [ -e $File ] ; then echo "The file $File exists." ; else echo "The file $File does not exist." ; fi
The file TestFile1 exists.
[student@studentvm1 testdir]$
```

现在，运行一个测试来判断一个文件是否存在且长度不为 0（表示它包含数据）。假设你想判断三种情况：1. 文件不存在；2. 文件存在且为空；3. 文件存在且包含数据。因此，你需要一组更负责的测试代码 — 为了测试所有的情况在 **if-elif-else** 结构中使用 **elif** 语句：


```
[student@studentvm1 testdir]$ File="TestFile1" ; if [ -s $File ] ; then echo "$File exists and contains data." ; fi
[student@studentvm1 testdir]$
```

在本案例中，文件存在但不包含任何数据。向文件添加一些数据再运行一次：


```
[student@studentvm1 testdir]$ File="TestFile1" ; echo "This is file $File" > $File ; if [ -s $File ] ; then echo "$File exists and contains data." ; fi
TestFile1 exists and contains data.
[student@studentvm1 testdir]$
```

这组语句能返回正常的结果，但是仅仅是在我们已知三种可能的情况下测试某种确切的条件。添加一段 **else** 语句，这样你就可以更精确地测试。把文件删掉，你就可以完整地测试这段新代码：


```
[student@studentvm1 testdir]$ File="TestFile1" ; rm $File ; if [ -s $File ] ; then echo "$File exists and contains data." ; else echo "$File does not exist or is empty." ; fi
TestFile1 does not exist or is empty.
```

现在创建一个空文件用来测试：


```
[student@studentvm1 testdir]$ File="TestFile1" ; touch $File ; if [ -s $File ] ; then echo "$File exists and contains data." ; else echo "$File does not exist or is empty." ; fi
TestFile1 does not exist or is empty.
```

向文件添加一些内容，然后再测试一次：


```
[student@studentvm1 testdir]$ File="TestFile1" ; echo "This is file $File" &gt; $File ; if [ -s $File ] ; then echo "$File exists and contains data." ; else echo "$File does not exist or is empty." ; fi
TestFile1 exists and contains data.
```

现在加入 **elif** 语句来辨别是文件不存在还是文件为空：


```
[student@studentvm1 testdir]$ File="TestFile1" ; touch $File ; if [ -s $File ] ; then echo "$File exists and contains data." ; elif [ -e $File ] ; then echo "$File exists and is empty." ; else echo "$File does not exist." ; fi
TestFile1 exists and is empty.
[student@studentvm1 testdir]$ File="TestFile1" ; echo "This is $File" &gt; $File ; if [ -s $File ] ; then echo "$File exists and contains data." ; elif [ -e $File ] ; then echo "$File exists and is empty." ; else echo "$File does not exist." ; fi
TestFile1 exists and contains data.
[student@studentvm1 testdir]$
```

Now you have a Bash CLI program that can test for these three different conditions… but the possibilities are endless.

It is easier to see the logic structure of the more complex compound commands if you arrange the program statements more like you would in a script that you can save in a file. Figure 2 shows how this would look. The indents of the program statements in each stanza of the **if-elif-else** structure help to clarify the logic.

现在你有一个可以测试这三种情况的 Bash CLI 程序，但是可能的情况是无限的。

如果你能像保存在文件中的脚本那样书写程序语句，那么对于即使更复杂的命令组合也会很容易看出它们的逻辑结构。图表 2 就是一个示例。 **if-elif-else** 结构中每一部分的程序语句的缩进让逻辑更变得清晰。


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

_**Fig. 2: 像在脚本里一样重写书写命令行程序**_

对于大多数 CLI 程序来说，让这些复杂的命令变得有逻辑需要写很长的代码。虽然 CLI 可能是用 Linux 或 Bash 内置的命令，但是当 CLI 程序很长或很复杂时，创建一个脚本保存在一个文件中将更有效，保存到文件中后，可以随时运行。

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

via: https://opensource.com/article/19/10/programming-bash-logical-operators-shell-expansions

作者：[David Both][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_women_computing_5.png?itok=YHpNs_ss "Women in computing and open source v5"
[2]: http://www.both.org/?page_id=1183
[3]: https://opensource.com/article/19/10/programming-bash-part-1

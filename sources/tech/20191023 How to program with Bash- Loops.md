[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to program with Bash: Loops)
[#]: via: (https://opensource.com/article/19/10/programming-bash-part-3)
[#]: author: (David Both https://opensource.com/users/dboth)

How to program with Bash: Loops
======
Learn how to use loops for performing iterative operations, in the final
article in this three-part series on programming with Bash.
![arrows cycle symbol for failing faster][1]

Bash is a powerful programming language, one perfectly designed for use on the command line and in shell scripts. This three-part series, based on my [three-volume Linux self-study course][2], explores using Bash as a programming language on the command-line interface (CLI).

The [first article][3] in this series explored some simple command-line programming with Bash, including using variables and control operators. The [second article][4] looked into the types of file, string, numeric, and miscellaneous logical operators that provide execution-flow control logic and different types of shell expansions in Bash. This third (and final) article examines the use of loops for performing various types of iterative operations and ways to control those loops.

### Loops

Every programming language I have ever used has at least a couple types of loop structures that provide various capabilities to perform repetitive operations. I use the for loop quite often but I also find the while and until loops useful.

#### for loops

Bash's implementation of the **for** command is, in my opinion, a bit more flexible than most because it can handle non-numeric values; in contrast, for example, the standard C language **for** loop can deal only with numeric values.

The basic structure of the Bash version of the **for** command is simple:


```
`for Var in list1 ; do list2 ; done`
```

This translates to: "For each value in list1, set the **$Var** to that value and then perform the program statements in list2 using that value; when all of the values in list1 have been used, it is finished, so exit the loop." The values in list1 can be a simple, explicit string of values, or they can be the result of a command substitution (described in the second article in the series). I use this construct frequently.

To try it, ensure that **~/testdir** is still the present working directory (PWD). Clean up the directory, then look at a trivial example of the **for** loop starting with an explicit list of values. This list is a mix of alphanumeric values—but do not forget that all variables are strings and can be treated as such.


```
[student@studentvm1 testdir]$ rm *
[student@studentvm1 testdir]$ for I in a b c d 1 2 3 4 ; do echo $I ; done
a
b
c
d
1
2
3
4
```

Here is a bit more useful version with a more meaningful variable name:


```
[student@studentvm1 testdir]$ for Dept in "Human Resources" Sales Finance "Information Technology" Engineering Administration Research ; do echo "Department $Dept" ; done
Department Human Resources
Department Sales
Department Finance
Department Information Technology
Department Engineering
Department Administration
Department Research
```

Make some directories (and show some progress information while doing so):


```
[student@studentvm1 testdir]$ for Dept in "Human Resources" Sales Finance "Information Technology" Engineering Administration Research ; do echo "Working on Department $Dept" ; mkdir "$Dept"  ; done
Working on Department Human Resources
Working on Department Sales
Working on Department Finance
Working on Department Information Technology
Working on Department Engineering
Working on Department Administration
Working on Department Research
[student@studentvm1 testdir]$ ll
total 28
drwxrwxr-x 2 student student 4096 Apr  8 15:45  Administration
drwxrwxr-x 2 student student 4096 Apr  8 15:45  Engineering
drwxrwxr-x 2 student student 4096 Apr  8 15:45  Finance
drwxrwxr-x 2 student student 4096 Apr  8 15:45 'Human Resources'
drwxrwxr-x 2 student student 4096 Apr  8 15:45 'Information Technology'
drwxrwxr-x 2 student student 4096 Apr  8 15:45  Research
drwxrwxr-x 2 student student 4096 Apr  8 15:45  Sales
```

The **$Dept** variable must be enclosed in quotes in the **mkdir** statement; otherwise, two-part department names (such as "Information Technology") will be treated as two separate departments. That highlights a best practice I like to follow: all file and directory names should be a single word. Although most modern operating systems can deal with spaces in names, it takes extra work for sysadmins to ensure that those special cases are considered in scripts and CLI programs. (They almost certainly should be considered, even if they're annoying because you never know what files you will have.)

So, delete everything in **~/testdir**—again—and do this one more time:


```
[student@studentvm1 testdir]$ rm -rf * ; ll
total 0
[student@studentvm1 testdir]$ for Dept in Human-Resources Sales Finance Information-Technology Engineering Administration Research ; do echo "Working on Department $Dept" ; mkdir "$Dept"  ; done
Working on Department Human-Resources
Working on Department Sales
Working on Department Finance
Working on Department Information-Technology
Working on Department Engineering
Working on Department Administration
Working on Department Research
[student@studentvm1 testdir]$ ll
total 28
drwxrwxr-x 2 student student 4096 Apr  8 15:52 Administration
drwxrwxr-x 2 student student 4096 Apr  8 15:52 Engineering
drwxrwxr-x 2 student student 4096 Apr  8 15:52 Finance
drwxrwxr-x 2 student student 4096 Apr  8 15:52 Human-Resources
drwxrwxr-x 2 student student 4096 Apr  8 15:52 Information-Technology
drwxrwxr-x 2 student student 4096 Apr  8 15:52 Research
drwxrwxr-x 2 student student 4096 Apr  8 15:52 Sales
```

Suppose someone asks for a list of all RPMs on a particular Linux computer and a short description of each. This happened to me when I worked for the State of North Carolina. Since open source was not "approved" for use by state agencies at that time, and I only used Linux on my desktop computer, the pointy-haired bosses (PHBs) needed a list of each piece of software that was installed on my computer so that they could "approve" an exception.

How would you approach that? Here is one way, starting with the knowledge that the **rpm –qa** command provides a complete description of an RPM, including the two items the PHBs want: the software name and a brief summary.

Build up to the final result one step at a time. First, list all RPMs:


```
[student@studentvm1 testdir]$ rpm -qa
perl-HTTP-Message-6.18-3.fc29.noarch
perl-IO-1.39-427.fc29.x86_64
perl-Math-Complex-1.59-429.fc29.noarch
lua-5.3.5-2.fc29.x86_64
java-11-openjdk-headless-11.0.ea.28-2.fc29.x86_64
util-linux-2.32.1-1.fc29.x86_64
libreport-fedora-2.9.7-1.fc29.x86_64
rpcbind-1.2.5-0.fc29.x86_64
libsss_sudo-2.0.0-5.fc29.x86_64
libfontenc-1.1.3-9.fc29.x86_64
&lt;snip&gt;
```

Add the **sort** and **uniq** commands to sort the list and print the unique ones (since it's possible that some RPMs with identical names are installed):


```
[student@studentvm1 testdir]$ rpm -qa | sort | uniq
a2ps-4.14-39.fc29.x86_64
aajohan-comfortaa-fonts-3.001-3.fc29.noarch
abattis-cantarell-fonts-0.111-1.fc29.noarch
abiword-3.0.2-13.fc29.x86_64
abrt-2.11.0-1.fc29.x86_64
abrt-addon-ccpp-2.11.0-1.fc29.x86_64
abrt-addon-coredump-helper-2.11.0-1.fc29.x86_64
abrt-addon-kerneloops-2.11.0-1.fc29.x86_64
abrt-addon-pstoreoops-2.11.0-1.fc29.x86_64
abrt-addon-vmcore-2.11.0-1.fc29.x86_64
&lt;snip&gt;
```

Since this gives the correct list of RPMs you want to look at, you can use this as the input list to a loop that will print all the details of each RPM:


```
`[student@studentvm1 testdir]$ for RPM in `rpm -qa | sort | uniq` ; do rpm -qi $RPM ; done`
```

This code produces way more data than you want. Note that the loop is complete. The next step is to extract only the information the PHBs requested. So, add an **egrep** command, which is used to select **^Name** or **^Summary**. The carat (**^**) specifies the beginning of the line; thus, any line with Name or Summary at the beginning of the line is displayed.


```
[student@studentvm1 testdir]$ for RPM in `rpm -qa | sort | uniq` ; do rpm -qi $RPM ; done | egrep -i "^Name|^Summary"
Name        : a2ps
Summary     : Converts text and other types of files to PostScript
Name        : aajohan-comfortaa-fonts
Summary     : Modern style true type font
Name        : abattis-cantarell-fonts
Summary     : Humanist sans serif font
Name        : abiword
Summary     : Word processing program
Name        : abrt
Summary     : Automatic bug detection and reporting tool
&lt;snip&gt;
```

You can try **grep** instead of **egrep** in the command above, but it will not work. You could also pipe the output of this command through the **less** filter to explore the results. The final command sequence looks like this:


```
`[student@studentvm1 testdir]$ for RPM in `rpm -qa | sort | uniq` ; do rpm -qi $RPM ; done | egrep -i "^Name|^Summary" > RPM-summary.txt`
```

This command-line program uses pipelines, redirection, and a **for** loop—all on a single line. It redirects the output of your little CLI program to a file that can be used in an email or as input for other purposes.

This process of building up the program one step at a time allows you to see the results of each step and ensure that it is working as you expect and provides the desired results.

From this exercise, the PHBs received a list of over 1,900 separate RPM packages. I seriously doubt that anyone read that list. But I gave them exactly what they asked for, and I never heard another word from them about it.

### Other loops

There are two more types of loop structures available in Bash: the **while** and **until** structures, which are very similar to each other in both syntax and function. The basic syntax of these loop structures is simple:


```
`while [ expression ] ; do list ; done`
```

and


```
`until [ expression ] ; do list ; done`
```

The logic of the first reads: "While the expression evaluates as true, execute the list of program statements. When the expression evaluates as false, exit from the loop." And the second: "Until the expression evaluates as true, execute the list of program statements. When the expression evaluates as true, exit from the loop."

#### While loop

The **while** loop is used to execute a series of program statements while (so long as) the logical expression evaluates as true. Your PWD should still be **~/testdir**.

The simplest form of the **while** loop is one that runs forever. The following form uses the true statement to always generate a "true" return code. You could also use a simple "1"—and that would work just the same—but this illustrates the use of the true statement:


```
[student@studentvm1 testdir]$ X=0 ; while [ true ] ; do echo $X ; X=$((X+1)) ; done | head
0
1
2
3
4
5
6
7
8
9
[student@studentvm1 testdir]$
```

This CLI program should make more sense now that you have studied its parts. First, it sets **$X** to zero in case it has a value left over from a previous program or CLI command. Then, since the logical expression **[ true ]** always evaluates to 1, which is true, the list of program instructions between **do** and **done** is executed forever—or until you press **Ctrl+C** or otherwise send a signal 2 to the program. Those instructions are an arithmetic expansion that prints the current value of **$X** and then increments it by one.

One of the tenets of [_The Linux Philosophy for Sysadmins_][5] is to strive for elegance, and one way to achieve elegance is simplicity. You can simplify this program by using the variable increment operator, **++**. In the first instance, the current value of the variable is printed, and then the variable is incremented. This is indicated by placing the **++** operator after the variable:


```
[student@studentvm1 ~]$ X=0 ; while [ true ] ; do echo $((X++)) ; done | head
0
1
2
3
4
5
6
7
8
9
```

Now delete **| head** from the end of the program and run it again.

In this version, the variable is incremented before its value is printed. This is specified by placing the **++** operator before the variable. Can you see the difference?


```
[student@studentvm1 ~]$ X=0 ; while [ true ] ; do echo $((++X)) ; done | head
1
2
3
4
5
6
7
8
9
```

You have reduced two statements into a single one that prints the value of the variable and increments that value. There is also a decrement operator, **\--**.

You need a method for stopping the loop at a specific number. To accomplish that, change the true expression to an actual numeric evaluation expression. Have the program loop to 5 and stop. In the example code below, you can see that **-le** is the logical numeric operator for "less than or equal to." This means: "So long as **$X** is less than or equal to 5, the loop will continue. When **$X** increments to 6, the loop terminates."


```
[student@studentvm1 ~]$ X=0 ; while [ $X -le 5 ] ; do echo $((X++)) ; done
0
1
2
3
4
5
[student@studentvm1 ~]$
```

#### Until loop

The **until** command is very much like the **while** command. The difference is that it will continue to loop until the logical expression evaluates to "true." Look at the simplest form of this construct:


```
[student@studentvm1 ~]$ X=0 ; until false  ; do echo $((X++)) ; done | head
0
1
2
3
4
5
6
7
8
9
[student@studentvm1 ~]$
```

It uses a logical comparison to count to a specific value:


```
[student@studentvm1 ~]$ X=0 ; until [ $X -eq 5 ]  ; do echo $((X++)) ; done
0
1
2
3
4
[student@studentvm1 ~]$ X=0 ; until [ $X -eq 5 ]  ; do echo $((++X)) ; done
1
2
3
4
5
[student@studentvm1 ~]$
```

### Summary

This series has explored many powerful tools for building Bash command-line programs and shell scripts. But it has barely scratched the surface on the many interesting things you can do with Bash; the rest is up to you.

I have discovered that the best way to learn Bash programming is to do it. Find a simple project that requires multiple Bash commands and make a CLI program out of them. Sysadmins do many tasks that lend themselves to CLI programming, so I am sure that you will easily find tasks to automate.

Many years ago, despite being familiar with other shell languages and Perl, I made the decision to use Bash for all of my sysadmin automation tasks. I have discovered that—sometimes with a bit of searching—I have been able to use Bash to accomplish everything I need.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/programming-bash-part-3

作者：[David Both][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/fail_progress_cycle_momentum_arrow.png?itok=q-ZFa_Eh (arrows cycle symbol for failing faster)
[2]: http://www.both.org/?page_id=1183
[3]: https://opensource.com/article/19/10/programming-bash-part-1
[4]: https://opensource.com/article/19/10/programming-bash-part-2
[5]: https://www.apress.com/us/book/9781484237298

[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Using Square Brackets in Bash: Part 2)
[#]: via: (https://www.linux.com/blog/learn/2019/4/using-square-brackets-bash-part-2)
[#]: author: (Paul Brown https://www.linux.com/users/bro66)

Using Square Brackets in Bash: Part 2
======

![square brackets][1]

We continue our tour of square brackets in Bash with a look at how they can act as a command.

[Creative Commons Zero][2]

Welcome back to our mini-series on square brackets. In the [previous article][3], we looked at various ways square brackets are used at the command line, including globbing. If you've not read that article, you might want to start there.

Square brackets can also be used as a command. Yep, for example, in:

```
[ "a" = "a" ]
```

which is, by the way, a valid command that you can execute, `[ ... ]` is a command. Notice that there are spaces between the opening bracket `[` and the parameters `"a" = "a"`, and then between the parameters and the closing bracket `]`. That is precisely because the brackets here act as a command, and you are separating the command from its parameters.

You would read the above line as " _test whether the string "a" is the same as string "a"_ ". If the premise is true, the `[ ... ]` command finishes with an exit status of 0. If not, the exit status is 1. [We talked about exit statuses in a previous article][4], and there you saw that you could access the value by checking the `$?` variable.

Try it out:

```
[ "a" = "a" ]
echo $?
```

And now try:

```
[ "a" = "b" ]
echo $?
```

In the first case, you will get a 0 (the premise is true), and running the second will give you a 1 (the premise is false). Remember that, in Bash, an exit status from a command that is 0 means it exited normally with no errors, and that makes it `true`. If there were any errors, the exit value would be a non-zero value (`false`). The `[ ... ]` command follows the same rules so that it is consistent with the rest of the other commands.

The `[ ... ]` command comes in handy in `if ... then` constructs and also in loops that require a certain condition to be met (or not) before exiting, like the `while` and `until` loops.

The logical operators for testing stuff are pretty straightforward:

```
[ STRING1 = STRING2 ] => checks to see if the strings are equal
[ STRING1 != STRING2 ] => checks to see if the strings are not equal
[ INTEGER1 -eq INTEGER2 ] => checks to see if INTEGER1 is equal to INTEGER2
[ INTEGER1 -ge INTEGER2 ] => checks to see if INTEGER1 is greater than or equal to INTEGER2
[ INTEGER1 -gt INTEGER2 ] => checks to see if INTEGER1 is greater than INTEGER2
[ INTEGER1 -le INTEGER2 ] => checks to see if INTEGER1 is less than or equal to INTEGER2
[ INTEGER1 -lt INTEGER2 ] => checks to see if INTEGER1 is less than INTEGER2
[ INTEGER1 -ne INTEGER2 ] => checks to see if INTEGER1 is not equal to INTEGER2
etc...
```

You can also test for some very shell-specific things. The `-f` option, for example, tests whether a file exists or not:

```
for i in {000..099}; \
 do \
  if [ -f file$i ]; \
  then \
   echo file$i exists; \
  else \
   touch file$i; \
   echo I made file$i; \
  fi; \
done
```

If you run this in your test directory, line 3 will test to whether a file is in your long list of files. If it does exist, it will just print a message; but if it doesn't exist, it will create it, to make sure the whole set is complete.

You could write the loop more compactly like this:

```
for i in {000..099};\
do\
 if [ ! -f file$i ];\
 then\
  touch file$i;\
  echo I made file$i;\
 fi;\
done
```

The `!` modifier in the condition inverts the premise, thus line 3 would translate to " _if the file`file$i` does not exist_ ".

Try it: delete some random files from the bunch you have in your test directory. Then run the loop shown above and watch how it rebuilds the list.

There are plenty of other tests you can try, including `-d` tests to see if the name belongs to a directory and `-h` tests to see if it is a symbolic link. You can also test whether a files belongs to a certain group of users (`-G`), whether one file is older than another (`-ot`), or even whether a file contains something or is, on the other hand, empty.

Try the following for example. Add some content to some of your files:

```
echo "Hello World" >> file023
echo "This is a message" >> file065
echo "To humanity" >> file010
```

and then run this:

```
for i in {000..099};\
do\
 if [ ! -s file$i ];\
 then\
  rm file$i;\
  echo I removed file$i;\
 fi;\
done
```

And you'll remove all the files that are empty, leaving only the ones you added content to.

To find out more, check the manual page for the `test` command (a synonym for `[ ... ]`) with `man test`.

You may also see double brackets (`[[ ... ]]`) sometimes used in a similar way to single brackets. The reason for this is because double brackets give you a wider range of comparison operators. You can use `==`, for example, to compare a string to a pattern instead of just another string; or < and `>` to test whether a string would come before or after another in a dictionary.

To find out more about extended operators [check out this full list of Bash expressions][5].

### Next Time

In an upcoming article, we'll continue our tour and take a look at the role of parentheses `()` in Linux command lines. See you then!

_Read more:_

  1. [The Meaning of Dot (`.`)][6]
  2. [Understanding Angle Brackets in Bash (`<...>`)][7]
  3. [More About Angle Brackets in Bash(`<` and `>`)][8]
  4. [And, Ampersand, and & in Linux (`&`)][9]
  5. [Ampersands and File Descriptors in Bash (`&`)][10]
  6. [Logical & in Bash (`&`)][4]
  7. [All about {Curly Braces} in Bash (`{}`)][11]
  8. [Using Square Brackets in Bash: Part 1][3]



--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/2019/4/using-square-brackets-bash-part-2

作者：[Paul Brown][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/bro66
[b]: https://github.com/lujun9972
[1]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/square-brackets-3734552_1920.jpg?itok=hv9D6TBy (square brackets)
[2]: /LICENSES/CATEGORY/CREATIVE-COMMONS-ZERO
[3]: https://www.linux.com/blog/2019/3/using-square-brackets-bash-part-1
[4]: https://www.linux.com/blog/learn/2019/2/logical-ampersand-bash
[5]: https://www.gnu.org/software/bash/manual/bashref.html#Bash-Conditional-Expressions
[6]: https://www.linux.com/blog/learn/2019/1/linux-tools-meaning-dot
[7]: https://www.linux.com/blog/learn/2019/1/understanding-angle-brackets-bash
[8]: https://www.linux.com/blog/learn/2019/1/more-about-angle-brackets-bash
[9]: https://www.linux.com/blog/learn/2019/2/and-ampersand-and-linux
[10]: https://www.linux.com/blog/learn/2019/2/ampersands-and-file-descriptors-bash
[11]: https://www.linux.com/blog/learn/2019/2/all-about-curly-braces-bash

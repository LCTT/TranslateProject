[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Logical & in Bash)
[#]: via: (https://www.linux.com/blog/learn/2019/2/logical-ampersand-bash)
[#]: author: (Paul Brown https://www.linux.com/users/bro66)

Logical & in Bash
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/ampersand-brian-taylor-unsplash.jpg?itok=Iq6vxSNK)

One would think you could dispatch `&` in two articles. Turns out you can't. While [the first article dealt with using `&` at the end of commands to push them into the background][1] and then diverged into explaining process management, the second article saw [`&` being used as a way to refer to file descriptors][2], which led us to seeing how, combined with `<` and `>`, you can route inputs and outputs from and to different places.

This means we haven't even touched on `&` as an AND operator, so let's do that now.

### & is a Bitwise Operator

If you are at all familiar with binary operations, you will have heard of AND and OR. These are bitwise operations that operate on individual bits of a binary number. In Bash, you use `&` as the AND operator and `|` as the OR operator:

**AND**

```
0 & 0 = 0

0 & 1 = 0

1 & 0 = 0

1 & 1 = 1
```

**OR**

```
0 | 0 = 0

0 | 1 = 1

1 | 0 = 1

1 | 1 = 1
```

You can test this by ANDing any two numbers and outputting the result with `echo`:

```
$ echo $(( 2 & 3 )) # 00000010 AND 00000011 = 00000010

2

$ echo $(( 120 & 97 )) # 01111000 AND 01100001 = 01100000

96
```

The same goes for OR (`|`):

```
$ echo $(( 2 | 3 )) # 00000010 OR 00000011 = 00000011

3

$ echo $(( 120 | 97 )) # 01111000 OR 01100001 = 01111001

121
```

Three things about this:

  1. You use `(( ... ))` to tell Bash that what goes between the double brackets is some sort of arithmetic or logical operation. `(( 2 + 2 ))`, `(( 5 % 2 ))` (`%` being the [modulo][3] operator) and `((( 5 % 2 ) + 1))` (equals 3) will all work.
  2. [Like with variables][4], `$` extracts the value so you can use it.
  3. For once spaces don't matter: `((2+3))` will work the same as `(( 2+3 ))` and `(( 2 + 3 ))`.
  4. Bash only operates with integers. Trying to do something like this `(( 5 / 2 ))` will give you "2", and trying to do something like this `(( 2.5 & 7 ))` will result in an error. Then again, using anything but integers in a bitwise operation (which is what we are talking about now) is generally something you wouldn't do anyway.



**TIP:** If you want to check what your decimal number would look like in binary, you can use _bc_ , the command-line calculator that comes preinstalled with most Linux distros. For example, using:

```
bc <<< "obase=2; 97"
```

will convert `97` to binary (the _o_ in `obase` stands for _output_ ), and ...

```
bc <<< "ibase=2; 11001011"
```

will convert `11001011` to decimal (the _i_ in `ibase` stands for _input_ ).

### && is a Logical Operator

Although it uses the same logic principles as its bitwise cousin, Bash's `&&` operator can only render two results: 1 ("true") and 0 ("false"). For Bash, any number not 0 is “true” and anything that equals 0 is “false.” What is also false is anything that is not a number:

```
$ echo $(( 4 && 5 )) # Both non-zero numbers, both true = true

1

$ echo $(( 0 && 5 )) # One zero number, one is false = false

0

$ echo $(( b && 5 )) # One of them is not number, one is false = false

0
```

The OR counterpart for `&&` is `||` and works exactly as you would expect.

All of this is simple enough... until it comes to a command's exit status.

### && is a Logical Operator for Command Exit Status

[As we have seen in previous articles][2], as a command runs, it outputs error messages. But, more importantly for today's discussion, it also outputs a number when it ends. This number is called an _exit code_ , and if it is 0, it means the command did not encounter any problem during its execution. If it is any other number, it means something, somewhere, went wrong, even if the command completed.

So 0 is good, any other number is bad, and, in the context of exit codes, 0/good means "true" and everything else means “false.” Yes, this is **the exact contrary of what you saw in the logical operations above** , but what are you gonna do? Different contexts, different rules. The usefulness of this will become apparent soon enough.

Moving on.

Exit codes are stored _temporarily_ in the [special variable][5] `?` \-- yes, I know: another confusing choice. Be that as it may, [remember that in our article about variables][4], and we said that you read the value in a variable using a the `$` symbol. So, if you want to know if a command has run without a hitch, you have to read `?` as soon as the command finishes and before running anything else.

Try it with:

```
$ find /etc -iname "*.service"

find: '/etc/audisp/plugins.d': Permission denied

/etc/systemd/system/dbus-org.freedesktop.nm-dispatcher.service

/etc/systemd/system/dbus-org.freedesktop.ModemManager1.service

[etcetera]
```

[As you saw in the previous article][2], running `find` over _/etc_ as a regular user will normally throw some errors when it tries to read subdirectories for which you do not have access rights.

So, if you execute...

```
echo $?
```

... right after `find`, it will print a `1`, indicating that there were some errors.

(Notice that if you were to run `echo $?` a second time in a row, you'd get a `0`. This is because `$?` would contain the exit code of `echo $?`, which, supposedly, will have executed correctly. So the first lesson when using `$?` is: **use`$?` straight away** or store it somewhere safe -- like in another variable, or you will lose it).

One immediate use of `?` is to fold it into a list of chained commands and bork the whole thing if anything fails as Bash runs through it. For example, you may be familiar with the process of building and compiling the source code of an application. You can run them on after another by hand like this:

```
$ configure

.

.

.

$ make

.

.

.

$ make install

.

.

.
```

You can also put all three on one line...

```
$ configure; make; make install
```

... and hope for the best.

The disadvantage of this is that if, say, `configure` fails, Bash will still try and run `make` and `sudo make install`, even if there is nothing to make or, indeed, install.

The smarter way of doing it is like this:

```
$ configure && make && make install
```

This takes the exit code from each command and uses it as an operand in a chained `&&` operation.

But, and here's the kicker, Bash knows the whole thing is going to fail if `configure` returns a non-zero result. If that happens, it doesn't have to run `make` to check its exit code, since the result is going to be false no matter what. So, it forgoes `make` and just passes a non-zero result onto the next step of the operation. And, as `configure && make` delivers false, Bash doesn't have to run `make install` either. This means that, in a long chain of commands, you can join them with `&&`, and, as soon as one fails, you can save time as the rest of the commands get canceled immediately.

You can do something similar with `||`, the OR logical operator, and make Bash continue processing chained commands if only one of a pair completes.

In view of all this (along with the stuff we covered earlier), you should now have a clearer idea of what the command line we set at the beginning of [this article does][1]:

```
mkdir test_dir 2>/dev/null || touch backup/dir/images.txt && find . -iname "*jpg" > backup/dir/images.txt &
```

So, assuming you are running the above from a directory for which you have read and write privileges, what it does it do and how does it do it? How does it avoid unseemly and potentially execution-breaking errors? Next week, apart from giving you the solution, we'll be dealing with brackets: curly, curvy and straight. Don't miss it!

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/2019/2/logical-ampersand-bash

作者：[Paul Brown][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/bro66
[b]: https://github.com/lujun9972
[1]: https://www.linux.com/blog/learn/2019/2/and-ampersand-and-linux
[2]: https://www.linux.com/blog/learn/2019/2/ampersands-and-file-descriptors-bash
[3]: https://en.wikipedia.org/wiki/Modulo_operation
[4]: https://www.linux.com/blog/learn/2018/12/bash-variables-environmental-and-otherwise
[5]: https://www.gnu.org/software/bash/manual/html_node/Special-Parameters.html

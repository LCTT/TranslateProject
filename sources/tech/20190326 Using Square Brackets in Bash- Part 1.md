[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Using Square Brackets in Bash: Part 1)
[#]: via: (https://www.linux.com/blog/2019/3/using-square-brackets-bash-part-1)
[#]: author: (Paul Brown https://www.linux.com/users/bro66)

Using Square Brackets in Bash: Part 1
======

![square brackets][1]

This tutorial tackle square brackets and how they are used in different contexts at the command line.

[Creative Commons Zero][2]

After taking a look at [how curly braces (`{}`) work on the command line][3], now it’s time to tackle brackets (`[]`) and see how they are used in different contexts.

### Globbing

The first and easiest use of square brackets is in _globbing_. You have probably used globbing before without knowing it. Think of all the times you have listed files of a certain type, say, you wanted to list JPEGs, but not PNGs:

```
ls *.jpg
```

Using wildcards to get all the results that fit a certain pattern is precisely what we call globbing.

In the example above, the asterisk means " _zero or more characters_ ". There is another globbing wildcard, `?`, which means " _exactly one character_ ", so, while

```
ls d*k*
```

will list files called _darkly_ and _ducky_ (and _dark_ and _duck_ \-- remember `*` can also be zero characters),

```
ls d*k?
```

will not list _darkly_ (or _dark_ or _duck_ ), but it will list _ducky_.

Square brackets are used in globbing for sets of characters. To see what this means, make directory in which to carry out tests, `cd` into it and create a bunch of files like this:

```
touch file0{0..9}{0..9}
```

(If you don't know why that works, [take a look at the last installment that explains curly braces `{}`][3]).

This will create files _file000_ , _file001_ , _file002_ , etc., through _file097_ , _file098_ and _file099_.

Then, to list the files in the 70s and 80s, you can do this:

```
ls file0[78]?
```

To list _file022_ , _file027_ , _file028_ , _file052_ , _file057_ , _file058_ , _file092_ , _file097_ , and _file98_ you can do this:

```
ls file0[259][278]
```

Of course, you can use globbing (and square brackets for sets) for more than just `ls`. You can use globbing with any other tool for listing, removing, moving, or copying files, although the last two may require a bit of lateral thinking.

Let's say you want to create duplicates of files _file010_ through _file029_ and call the copies _archive010_ , _archive011_ , _archive012_ , etc..

You can't do:

```
cp file0[12]? archive0[12]?
```

Because globbing is for matching against existing files and directories and the _archive..._ files don't exist yet.

Doing this:

```
cp file0[12]? archive0[1..2][0..9]
```

won't work either, because `cp` doesn't let you copy many files to other many new files. Copying many files only works if you are copying them to a directory, so this:

```
mkdir archive

cp file0[12]? archive
```

would work, but it would copy the files, using their same names, into a directory called _archive/_. This is not what you set out to do.

However, if you look back at [the article on curly braces (`{}`)][3], you will remember how you can use `%` to lop off the end of a string contained in a variable.

Of course, there is a way you can also lop of the beginning of string contained in a variable. Instead of `%`, you use `#`.

For practice, you can try this:

```
myvar="Hello World"

echo Goodbye Cruel ${myvar#Hello}
```

It prints " _Goodbye Cruel World_ " because `#Hello` gets rid of the _Hello_ part at the beginning of the string stored in `myvar`.

You can use this feature alongside your globbing tools to make your _archive_ duplicates:

```
for i in file0[12]?;\

do\

cp $i archive${i#file};\

done
```

The first line tells the Bash interpreter that you want to loop through all the files that contain the string _file0_ followed by the digits _1_ or _2_ , and then one other character, which can be anything. The second line `do` indicates that what follows is the instruction or list of instructions you want the interpreter to loop through.

Line 3 is where the actually copying happens, and you use the contents of the loop variable _`i`_ **twice: First, straight out, as the first parameter of the `cp` command, and then you add _archive_ to its contents, while at the same time cutting of _file_. So, if _`i`_ contains, say, _file019_...

```
"archive" + "file019" - "file" = "archive019"
```

the `cp` line is expanded to this:

```
cp file019 archive019
```

Finally, notice how you can use the backslash `\` to split a chain of commands over several lines for clarity.

In part two, we’ll look at more ways to use square brackets. Stay tuned.

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/2019/3/using-square-brackets-bash-part-1

作者：[Paul Brown][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/bro66
[b]: https://github.com/lujun9972
[1]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/square-gabriele-diwald-475007-unsplash.jpg?itok=cKmysLfd (square brackets)
[2]: https://www.linux.com/LICENSES/CATEGORY/CREATIVE-COMMONS-ZERO
[3]: https://www.linux.com/blog/learn/2019/2/all-about-curly-braces-bash

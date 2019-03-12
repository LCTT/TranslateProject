[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (All about {Curly Braces} in Bash)
[#]: via: (https://www.linux.com/blog/learn/2019/2/all-about-curly-braces-bash)
[#]: author: (Paul Brown https://www.linux.com/users/bro66)

All about {Curly Braces} in Bash
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/curly-braces-1920.jpg?itok=cScRhWrX)

At this stage of our Bash basics series, it would be hard not to see some crossover between topics. For example, you have already seen a lot of brackets in the examples we have shown over the past several weeks, but the focus has been elsewhere.

For the next phase of the series, we’ll take a closer look at brackets, curly, curvy, or straight, how to use them, and what they do depending on where you use them. We will also tackle other ways of enclosing things, like when to use quotes, double-quotes, and backquotes.

This week, we're looking at curly brackets or _braces_ : `{}`.

### Array Builder

You have already encountered curly brackets before in [The Meaning of Dot][1]. There, the focus was on the use of the dot/period (`.`), but using braces to build a sequence was equally important.

As we saw then:

```
echo {0..10}
```

prints out the numbers from 0 to 10. Using:

```
echo {10..0}
```

prints out the same numbers, but in reverse order. And,

```
echo {10..0..2}
```

prints every second number, starting with 10 and making its way backwards to 0.

Then,

```
echo {z..a..2}
```

prints every second letter, starting with _z_ and working its way backwards until _a_.

And so on and so forth.

Another thing you can do is combine two or more sequences:

```
echo {a..z}{a..z}
```

This prints out all the two letter combinations of the alphabet, from _aa_ to _zz_.

Is this useful? Well, actually it is. You see, arrays in Bash are defined by putting elements between parenthesis `()` and separating each element using a space, like this:

```
month=("Jan" "Feb" "Mar" "Apr" "May" "Jun" "Jul" "Aug" "Sep" "Oct" "Nov" "Dec")
```

To access an element within the array, you use its index within brackets `[]`:

```
$ echo ${month[3]} # Array indexes start at [0], so [3] points to the fourth item

Apr
```

You can accept all those brackets, parentheses, and braces on faith for a moment. We'll talk about them presently.

Notice that, all things being equal, you can create an array with something like this:

```
letter_combos=({a..z}{a..z})
```

and `letter_combos` points to an array that contains all the 2-letter combinations of the entire alphabet.

You can also do this:

```
dec2bin=({0..1}{0..1}{0..1}{0..1}{0..1}{0..1}{0..1}{0..1})
```

This last one is particularly interesting because `dec2bin` now contains all the binary numbers for an 8-bit register, in ascending order, starting with 00000000, 00000001, 00000010, etc., until reaching 11111111. You can use this to build yourself an 8-bit decimal-to-binary converter. Say you want to know what 25 is in binary. You can do this:

```
$ echo ${dec2bin[25]}

00011001
```

Yes, there are better ways of converting decimal to binary as we saw in [the article where we discussed & as a logical operator][2], but it is still interesting, right?

### Parameter expansion

Getting back to

```
echo ${month[3]}
```

Here the braces `{}` are not being used as apart of a sequence builder, but as a way of generating _parameter expansion_. Parameter expansion involves what it says on the box: it takes the variable or expression within the braces and expands it to whatever it represents.

In this case, `month` is the array we defined earlier, that is:

```
month=("Jan" "Feb" "Mar" "Apr" "May" "Jun" "Jul" "Aug" "Sep" "Oct" "Nov" "Dec")
```

And, item 3 within the array points to `"Apr"` (remember: the first index in an array in Bash is `[0]`). That means that `echo ${month[3]}`, after the expansion, translates to `echo "Apr"`.

Interpreting a variable as its value is one way of expanding it, but there are a few more you can leverage. You can use parameter expansion to manipulate what you read from variable, say, by cutting a chunk off the end.

Suppose you have a variable like:

```
a="Too longgg"
```

The command:

```
echo ${a%gg}
```

chops off the last two gs and prints " _Too long_ ".

Breaking this down,

  * `${...}` tells the shell to expand whatever is inside it
  * `a` is the variable you are working with
  * `%` tells the shell you want to chop something off the end of the expanded variable ("Too longgg")
  * and `gg` is what you want to chop off.



This can be useful for converting files from one format to another. Allow me to explain with a slight digression:

[ImageMagick][3] is a set of command line tools that lets you manipulate and modify images. One of its most useful tools ImageMagick comes with is `convert`. In its simplest form `convert` allows you to, given an image in a certain format, make a copy of it in another format.

The following command takes a JPEG image called _image.jpg_ and creates a PNG copy called _image.png_ :

```
convert image.jpg image.png
```

ImageMagick is often pre-installed on most Linux distros. If you can't find it, look for it in your distro's software manager.

Okay, end of digression. On to the example:

With variable expansion, you can do the same as shown above like this:

```
i=image.jpg

convert $i ${i%jpg}png
```

What you are doing here is chopping off the extension `jpg` from `i` and then adding `png`, making the command `convert image.jpg image.png`.

You may be wondering how this is more useful than just writing in the name of the file. Well, when you have a directory containing hundreds of JPEG images, you need to convert to PNG, run the following in it:

```
for i in *.jpg; do convert $i ${i%jpg}png; done
```

... and, hey presto! All the pictures get converted automatically.

If you need to chop off a chunk from the beginning of a variable, instead of `%`, use `#`:

```
$ a="Hello World!"

$ echo Goodbye${a#Hello}

Goodbye World!
```

There's quite a bit more to parameter expansion, but a lot of it makes sense only when you are writing scripts. We'll explore more on that topic later in this series.

### Output Grouping

Meanwhile, let's finish up with something simple: you can also use `{ ... }` to group the output from several commands into one big blob. The command:

```
echo "I found all these PNGs:"; find . -iname "*.png"; echo "Within this bunch of files:"; ls > PNGs.txt
```

will execute all the commands but will only copy into the _PNGs.txt_ file the output from the last `ls` command in the list. However, doing

```
{ echo "I found all these PNGs:"; find . -iname "*.png"; echo "Within this bunch of files:"; ls; } > PNGs.txt
```

creates the file _PNGs.txt_ with everything, starting with the line " _I found all these PNGs:_ ", then the list of PNG files returned by `find`, then the line "Within this bunch of files:" and finishing up with the complete list of files and directories within the current directory.

Notice that there is space between the braces and the commands enclosed within them. That’s because `{` and `}` are _reserved words_ here, commands built into the shell. They would roughly translate to " _group the outputs of all these commands together_ " in plain English.

Also notice that the list of commands has to end with a semicolon (`;`) or the whole thing will bork.

### Next Time

In our next installment, we'll be looking at more things that enclose other things, but of different shapes. Until then, have fun!

Read more:

[And, Ampersand, and & in Linux][4]

[Ampersands and File Descriptors in Bash][5]

[Logical & in Bash][2]

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/2019/2/all-about-curly-braces-bash

作者：[Paul Brown][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/bro66
[b]: https://github.com/lujun9972
[1]: https://www.linux.com/blog/learn/2019/1/linux-tools-meaning-dot
[2]: https://www.linux.com/blog/learn/2019/2/logical-ampersand-bash
[3]: http://www.imagemagick.org/
[4]: https://www.linux.com/blog/learn/2019/2/and-ampersand-and-linux
[5]: https://www.linux.com/blog/learn/2019/2/ampersands-and-file-descriptors-bash

The Shuf Command Tutorial With Examples For Beginners
======

![](https://www.ostechnix.com/wp-content/uploads/2018/04/shuf-command-720x340.png)
The Shuf command is used to generate random permutations in Unix-like operating systems. Using shuf command, we can shuffle the lines of a given input file randomly. Shuf command is part of GNU Coreutils, so you don’t have bother with installation. In this brief tutorial, let me show you some examples of shuf command.

### The Shuf Command Tutorial With Examples

I have a file named **ostechnix.txt** with the following contents.
```
$ cat ostechnix.txt
line1
line2
line3
line4
line5
line6
line7
line8
line9
line10

```

Now let us display the above lines in a random order. To do so, run:
```
$ shuf ostechnix.txt
line2
line8
line5
line10
line7
line1
line4
line6
line9
line3

```

See? The above command randomized the order of lines in the file named “ostechnix.txt” and output the result.

You might want to write the output to another file. For example, I want to save the output in a file named **output.txt**. To do so, first create output.txt file:
```
$ touch output.txt

```

Then, write the output to that file using **-o** flag like below.
```
$ shuf ostechnix.txt -o output.txt

```

The above command will shuffle the contents of ostechnix.txt file randomly and write the output to output.txt file. You can view the output.txt file contents using command:
```
$ cat output.txt

line2
line8
line9
line10
line1
line3
line7
line6
line4
line5

```

I just want to display any one of the random line from the file. How do I do it? Simple!
```
$ shuf -n 1 ostechnix.txt
line6

```

Similarly, we can pick the first “n” random entries. The following command will display the only the first five random entries.
```
$ shuf -n 5 ostechnix.txt
line10
line4
line5
line9
line3

```

Instead of reading the lines from a file, we can directly pass the inputs using **-e** flag like below.
```
$ shuf -e line1 line2 line3 line4 line5
line1
line3
line5
line4
line2

```

You can pass shuffle the numbers too:
```
$ shuf -e 1 2 3 4 5
3
5
1
4
2

```

To quickly pick any one from the given range, use this command instead.
```
$ shuf -n 1 -e 1 2 3 4 5

```

Or, pick any three random numbers like below.
```
$ shuf -n 3 -e 1 2 3 4 5
3
5
1

```

We can also generate random numbers within a particular range. For example, to display random numbers between 1 to 10, simply use:
```
$ shuf -i 1-10
1
9
8
2
4
7
6
3
10
5

```

For more details, refer man pages.
```
$ man shuf

```

And, that’s all for today. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/the-shuf-command-tutorial-with-examples-for-beginners/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/

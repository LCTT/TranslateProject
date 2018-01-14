The Fold Command Tutorial With Examples For Beginners
======

![](https://www.ostechnix.com/wp-content/uploads/2018/01/Fold-Command-2-720x340.png)

Have you ever found yourself in a situation where you want to fold or break the output of a command to fit within a specific width? I have find myself in this situation few times while running VMs, especially the servers with no GUI. Just in case, if you ever wanted to limit the output of a command to a particular width, look nowhere! Here is where **fold** command comes in handy! The fold command wraps each line in an input file to fit a specified width and prints it to the standard output.

In this brief tutorial, we are going to see the usage of fold command with practical examples.

### The Fold Command Tutorial With Examples

Fold command is the part of GNU coreutils package, so let us not bother about installation.

The typical syntax of fold command:
```
fold [OPTION]... [FILE]...
```

Allow me to show you some examples, so you can get a better idea about fold command. I have a file named **linux.txt** with some random lines.

[![][1]][2]

To wrap each line in the above file to default width, run:
```
fold linux.txt
```

**80** columns per line is the default width. Here is the output of above command:

[![][1]][3]

As you can see in the above output, fold command has limited the output to a width of 80 characters.

Of course, we can specify your preferred width, for example 50, like below:
```
fold -w50 linux.txt
```

Sample output would be:

[![][1]][4]

Instead of just displaying output, we can also write the output to a new file as shown below:
```
fold -w50 linux.txt > linux1.txt
```

The above command will wrap the lines of **linux.txt** to a width of 50 characters, and writes the output to new file named **linux1.txt**.

Let us check the contents of the new file:
```
cat linux1.txt
```

[![][1]][5]

Did you closely notice the output of the previous commands? Some words are broken between lines. To overcome this issue, we can use -s flag to break the lines at spaces.

The following command wraps each line in a given file to width "50" and breaks the line at spaces:
```
fold -w50 -s linux.txt
```

Sample output:

[![][1]][6]

See? Now, the output is much clear. This command puts each space separated word in a new line and words with length > 50 are wrapped.

In all above examples, we limited the output width by columns. However, we can enforce the width of the output to the number of bytes specified using **-b** option. The following command breaks the output at 20 bytes.
```
fold -b20 linux.txt
```

Sample output:

[![][1]][7]

**Also read:**

+ [The Uniq Command Tutorial With Examples For Beginners][8]

For more details, refer the man pages.
```
man fold
```

And, that's for now folks. You know now how to use fold command to limit the output of a command to fit in a specific width. I hope this was useful. We will be posting more useful guides everyday. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/fold-command-tutorial-examples-beginners/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]:http://www.ostechnix.com/wp-content/uploads/2018/01/fold-command-1.png ()
[3]:http://www.ostechnix.com/wp-content/uploads/2018/01/fold-command-2.png ()
[4]:http://www.ostechnix.com/wp-content/uploads/2018/01/fold-command-3-1.png ()
[5]:http://www.ostechnix.com/wp-content/uploads/2018/01/fold-command-4.png ()
[6]:http://www.ostechnix.com/wp-content/uploads/2018/01/fold-command-5-1.png ()
[7]:http://www.ostechnix.com/wp-content/uploads/2018/01/fold-command-6-1.png ()
[8]:https://www.ostechnix.com/uniq-command-tutorial-examples-beginners/

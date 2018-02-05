The Uniq Command Tutorial With Examples For Beginners
======
If you're working mostly on command line and dealing with a lot of text files every day, you should be aware of **Uniq** command. This command helps you to find repeated/duplicate lines from a file easily. It is not just for finding duplicates, but also we can use uniq command to remove the duplicates, display the number of occurrences of the duplicate lines, display only the repeated lines and display only the unique lines etc. Since the uniq command is part of GNU coreutils package, it comes preinstalled in most Linux distributions. Let us not bother with installation and see some practical examples.

Please note that the 'uniq' command will not detect repeated lines unless they are adjacent. So, you might need to sort them first or combine the sort command with uniq to get the results. Allow me to show you some examples.

First, let us create a file with some duplicate lines.
```
vi ostechnix.txt
```
```
welcome to ostechnix
welcome to ostechnix
Linus is the creator of Linux.
Linux is secure by default
Linus is the creator of Linux.
Top 500 super computers are powered by Linux
```

As you see in the above file, we have few repeated lines (the first, second, third, and fifth lines are duplicates).

### **1\. Remove consecutive duplicate lines in a file using Uniq command**

If you use 'uniq' command without any arguments, it will remove all consecutive duplicate lines and display only the unique lines.
```
uniq ostechnix.txt
```

Sample output would be:

[![][1]][2]

As you can see, uniq command removed all consecutive duplicate lines in the given file. You might also have noticed that the above output still has the duplicates in second and fourth lines. It is because the uniq command will only omit the repeated lines only if they are adjacent. We can, of course, remove that non-consecutive duplicates too. Look at the second example below.

### **2\. Remove all duplicate lines**
```
sort ostechnix.txt | uniq
```

Sample output would be:

[![][1]][3]

See? There are no duplicates or repeated lines. In other words, the above command will display each line once from file ostechnix.txt. We used the sort command in conjunction with uniq, because, as I already mentioned, uniq will not find the duplicate/repeated lines unless they are adjacent.

### **3\. Display only unique lines from a file**

To display only the unique lines from a file, the command would be:
```
sort ostechnix.txt | uniq -u
```

Sample output:
```
Linux is secure by default
Top 500 super computers are powered by Linux
```

As you can see, we have only two unique lines in the given file.

### **4\. Display only duplicate lines**

Similarly, we can also display duplicates lines from a file like below.
```
sort ostechnix.txt | uniq -d
```

Sample output:
```
Linus is the creator of Linux.
welcome to ostechnix
```

These two are the repeated/duplicated lines in ostechnix.txt file. Please note that -d (small d) will **only print duplicate lines** , **one for each group**. To print **all duplicate lines** , use -D (capital d) like below.
```
sort ostechnix.txt | uniq -D
```

See the difference between both flags in the below screenshot.

[![][1]][4]

### **5\. Display number of occurrences of each line in a file
**

For some reason, you might want to check how many times a line is repeated in the given file. To do so, use **-c** flag like below.
```
sort ostechnix.txt | uniq -c
```

**Sample output:**
```
 2 Linus is the creator of Linux.
 1 Linux is secure by default
 1 Top 500 super computers are powered by Linux
 2 welcome to ostechnix
```

We can also display number of occurrences of each line along with that line, sorted by the most frequent like below.
```
sort ostechnix.txt | uniq -c | sort -nr
```

Sample output:
```
 2 welcome to ostechnix
 2 Linus is the creator of Linux.
 1 Top 500 super computers are powered by Linux
 1 Linux is secure by default
```

### 6\. Limit the comparison to 'N' characters

We can limit the comparison to a particular number of characters of lines in a file using **-w** flag. For example, let us limit the comparison to first 4 characters of lines in a file and display the repeated lines as shown below.
```
uniq -d -w 4 ostechnix.txt
```

### 7\. Avoid the comparison with the first 'N' characters

Like limit comparison to N characters of lines in a file, we can also avoid comparing the first N characters using -s flag.

The following command will avoid the comparison with the first 4 characters of lines in a file:
```
uniq -d -s 4 ostechnix.txt
```

To avoid comparing the first N fields instead of characters, use '-f' flag in the above command.

For more details, refer the help section;
```
uniq --help
```

and man pages.
```
man uniq
```

And, that's all for today! I hope you now get a basic idea about uniq command and its purpose. If you find our guides useful, please share them on your social, professional networks and support OSTechNix. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/uniq-command-tutorial-examples-beginners/

作者：[][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com
[1]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]:http://www.ostechnix.com/wp-content/uploads/2018/01/uniq-2.png ()
[3]:http://www.ostechnix.com/wp-content/uploads/2018/01/uniq-1-1.png ()
[4]:http://www.ostechnix.com/wp-content/uploads/2018/01/uniq-4.png ()

translating---geekpi

Linux command line navigation tips: the basics of pushd and popd commands
============================================================

### On this page

1.  [The basics of pushd and popd commands][1]
2.  [Some advanced points][2]
3.  [Conclusion][3]

In the [first part][4] of this series, we focused on the command line navigation aspect in Linux by discussing the usage of the **cd -** command. Some other related points/concepts were also discussed. Taking the discussion further, in this article, we will be discussing how you can have a faster navigation experience on the Linux command line using the pushd and popd commands.

Before we move ahead, it's worth sharing that all the instructions and commands mentioned henceforth have been tested on Ubuntu 14.04 and Bash shell (version 4.3.11).

### The basics of pushd and popd commands

To better understand what exactly pushd and popd commands do, let's first discuss the concept of stack. Imagine an empty area on your kitchen slab, and now imagine a set of plates that you want to keep there. What will you do? Simple, keep them one over the other.

So at the end of the whole process, the first plate that you kept on the slab ends being the last plate in the pile, and the last plate that you had in your hand ends up being the first plate in the pile. Now, when you require a plate, you pick the one which is at the top of the pile, use it, and then pick the next one when required.

Similar is the concept of pushd and popd commands. There's a directory stack on your Linux system where you can pile up directory paths for future use. You can quickly see the contents of the stack at any point in time using the **dirs** command.

Here's an example that shows the output of the dirs command on my system immediately after the command line terminal was launched:

$ dirs
~

The tilde (~) in the output means the directory stack currently only contains the user's home directory.  

Moving on, the operation of storing a directory path and removing it are performed using the pushd and popd commands. Using pushd is very easy - just pass the path that you want to store in the directory stack as an argument to this command. Here's an example:

pushd /home/himanshu/Downloads/

What the above command does is, it changes your present working directory to the directory that you've passed as the argument, and also adds the path to the directory stack. To make things convenient for the user, the pushd command produces the contents of the directory stack in its output. So, when the above command was run, the following output was produced:

```
~/Downloads ~
```

The output reveals that now there are two directory paths in the stack: one is the user's home directory and other is the user's Downloads directory. The order in which they are kept is: the home directory is at the bottom and the newly-added Downloads directory is above it. 

To verify that what pushd is saying in its output is true, you can also use the dirs command:

$ dirs
~/Downloads ~

So you can see that the dirs command also produced the same output.

Let's issue a couple of more pushd commands:

$ pushd /usr/lib/; pushd /home/himanshu/Desktop/
/usr/lib ~/Downloads ~
~/Desktop /usr/lib ~/Downloads ~

So the directory stack now contains a total of four directory paths, where the home directory (~) is at the bottom, and the user's Desktop directory is at the top.  

Always keep in mind that the head of the stack is the directory that you're currently in. This means that now our current working directory is ~/Desktop.

Now, suppose you want to go back to the /usr/lib directory, so all you have to do is to execute the popd command:

$ popd
/usr/lib ~/Downloads ~

The popd command will not only switch your current directory to /usr/lib, it'll also remove ~/Desktop from the directory stack - as evident by the output the command produced. This way, the popd command will let you navigate these directories in the reverse order.

### Some advanced points

Now that we have discussed the basics of pushd and popd commands, let's move on to some other details related to these commands. To begin with, these commands also let you manipulate the directory stack. For example, suppose here's what your directory stack looks like:

$ dirs
~/Desktop /usr/lib ~ ~/Downloads

Now, let's say the requirement is to change the order of the directory paths in the stack in a way that the topmost element (~/Desktop) comes at the bottom and rest all move up by one place each. This can be achieved using the following command:

pushd +1

And here's what the above command does to the directory stack:

$ dirs
/usr/lib ~ ~/Downloads ~/Desktop

So we see that the order of elements in directory stack has been changed, and is now the same as we wanted. Of course, you can make the directory stack elements move any number of times. For example, the following command will move them up two times:

$ pushd +2
~/Downloads ~/Desktop /usr/lib ~

You can use negative indexes as well:

$ pushd -1
/usr/lib ~ ~/Downloads ~/Desktop

Similarly, you can use this technique with the popd command to remove any entry from the directory stack without leaving your current working directory. For example, if you want to remove the third entry from top (which is ~/Downloads currently) using popd, the you can run the following command:

popd +2

Keep in mind that the stack index begins with 0, so we've used 2 to access third entry. 

So the directory stack now contains:

$ dirs
/usr/lib ~ ~/Desktop

Confirming that the entry has been removed.

If, for some reason, you find it difficult to remember the order in which elements are positioned in the directory stack as well as the indexes they carry, you can use the -v command line option with the dirs command. Here's an example:

$ dirs -v
0 /usr/lib
1 ~
2 ~/Desktop

As you would have probably gussed, the numbers on the left are indexes and what follows them is the directory path positioned at that index.

**Note**: Use the -c command line option with the dirs command to clear the directory stack.

Now let's briefly discuss the practical usage of popd and pushd commands. While they may seem a bit complicated to use in first glance, these commands come in handy while writing shell scripts - you don't need to remember where you're coming from; just do a popd and you're back to the directory where you came from.

Experienced script writers usually use these command in the following way:

`popd >/dev/null 2>&1`

The aforementioned command makes sure that popd remains silent (do not produce any output). Similarly, you can silent pushd as well.

The pushd and popd command are also used by Linux server administrators, who usually move around between a handful of same directories all the time. Some other really informative use-cases are explained [here][5].

### Conclusion

Agreed, the concept of pushd and popd isn't very straight forward. But, all it requires is a bit of practice - yes, you need to get your hands dirty. Spend some time with these commands and you'll start liking them, especially if there's a use-case where-in they make life easy for you.

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/linux-command-line-tips-tricks-part-2/

作者：[Ansh ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/tutorial/linux-command-line-tips-tricks-part-2/
[1]:https://www.howtoforge.com/tutorial/linux-command-line-tips-tricks-part-2/#the-basics-of-pushd-and-popd-commands
[2]:https://www.howtoforge.com/tutorial/linux-command-line-tips-tricks-part-2/#some-advanced-points
[3]:https://www.howtoforge.com/tutorial/linux-command-line-tips-tricks-part-2/#conclusion
[4]:https://www.howtoforge.com/tutorial/linux-command-line-navigation-tips-and-tricks-part-1/
[5]:http://unix.stackexchange.com/questions/77077/how-do-i-use-pushd-and-popd-commands

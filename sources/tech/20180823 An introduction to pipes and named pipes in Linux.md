An introduction to pipes and named pipes in Linux
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/LAW-Internet_construction_9401467_520x292_0512_dc.png?itok=RPkPPtDe)

In Linux, the `pipe` command lets you sends the output of one command to another. Piping, as the term suggests, can redirect the standard output, input, or error of one process to another for further processing.

The syntax for the `pipe` or `unnamed pipe` command is the `|` character between any two commands:

`Command-1 | Command-2 | …| Command-N`

Here, the pipe cannot be accessed via another session; it is created temporarily to accommodate the execution of `Command-1` and redirect the standard output. It is deleted after successful execution.

![](https://opensource.com/sites/default/files/uploads/pipe.png)

In the example above, contents.txt contains a list of all files in a particular directory—specifically, the output of the ls -al command. We first grep the filenames with the "file" keyword from contents.txt by piping (as shown), so the output of the cat command is provided as the input for the grep command. Next, we add piping to execute the awk command, which displays the 9th column from the filtered output from the grep command. We can also count the number of rows in contents.txt using the wc -l command.

A named pipe can last until as long as the system is up and running or until it is deleted. It is a special file that follows the [FIFO][1] (first in, first out) mechanism. It can be used just like a normal file; i.e., you can write to it, read from it, and open or close it. To create a named pipe, the command is:
```
mkfifo <pipe-name>

```

This creates a named pipe file that can be used even over multiple shell sessions.

Another way to create a FIFO named pipe is to use this command:
```
mknod p <pipe-name>

```

To redirect a standard output of any command to another process, use the `>` symbol. To redirect a standard input of any command, use the `<` symbol.

![](https://opensource.com/sites/default/files/uploads/redirection.png)

As shown above, the output of the `ls -al` command is redirected to `contents.txt` and inserted in the file. Similarly, the input for the `tail` command is provided as `contents.txt` via the `<` symbol.

![](https://opensource.com/sites/default/files/uploads/create-named-pipe.png)

![](https://opensource.com/sites/default/files/uploads/verify-output.png)

Here, we have created a named pipe, `my-named-pipe`, and redirected the output of the `ls -al` command into the named pipe. We can the open a new shell session and `cat` the contents of the named pipe, which shows the output of the `ls -al` command, as previously supplied. Notice the size of the named pipe is zero and it has a designation of "p".

So, next time you're working with commands at the Linux terminal and find yourself moving data between commands, hopefully a pipe will make the process quick and easy.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/introduction-pipes-linux

作者：[Archit Modi][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/architmodi
[1]:https://en.wikipedia.org/wiki/FIFO_(computing_and_electronics)

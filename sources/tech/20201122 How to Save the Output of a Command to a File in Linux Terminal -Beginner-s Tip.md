[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Save the Output of a Command to a File in Linux Terminal [Beginner’s Tip])
[#]: via: (https://itsfoss.com/save-command-output-to-file-linux/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

How to Save the Output of a Command to a File in Linux Terminal [Beginner’s Tip]
======

When you run a command or script in the Linux terminal, it prints the output on the screen for your immediate viewing.

There will be times when you need to save the output to a file for future references. Now, [you can surely copy and paste in Linux terminal][1] but there are better ways to save the output of a shell script or command in Linux command line. Let me show them to you.

### Method 1: Use redirection to save command output to file in Linux

You can [use redirection in Linux for this purpose][2]. With redirection operator, instead of showing the output on the screen, it goes to the provided file.

  * The &gt; redirects the command output to a file replacing any existing content on the file.
  * The &gt;&gt; redirects adds the command output at the end of the existing content (if any) of the file.



Use the STDOUT redirection operator &gt; for redirecting the output to a file like this:

```
command > file.txt
```

If the file.txt doesn’t exist, it will be created automatically. If you use the &gt; redirect again with the same file, the file content is replaced by the new output.

The example below demonstrates it better. It first saves the output of _ls -l_ command. And then later, it replaces the content of the file with the output of _ls *.c_ command.

![Redirecting command output to file][3]

If you don’t want to lose the content of the existing file while saving the output of a script or command, use the redirection operation in append mode with &gt;&gt;.

```
command >> file.txt
```

This example demonstrates it better:

![Redirecting command output to file in append mode][4]

Even here if the file doesn’t exist, it is created automatically.

Bonus Tip: Save Linux command output as well as error to a file

If your Linux command returns an error, it doesn’t get saved in the file. You can save both the command output and command error in the same file using 2&gt;&amp;1 like this:

**command &gt; file.txt 2&gt;&amp;1**

Basically, 0 stands for standard input, 1 for standard output and 2 for standard error. Here, you are redirecting (&gt;) standard error (2) to same address (&amp;) as standard output (1).

### Method 2: Use tee command to display the output and save it to a file as well

By the way, did you notice that when you send the command output to a file, you cannot see it anymore on the display? The [tee command in Linux][5] solves this problem for you.

Like a tee pipe that sends water stream into two directions, the tee command send the output to the display as well as to a file (or as input to another command). You can use it like this:

```
command | tee file.txt
```

Again, the file will be created automatically, if it doesn’t exist already.

You may also use the tee command in append mode with option -a in this manner:

```
command | tee -a file.txt
```

Let me demonstrate it with some easy to follow examples:

![][6]

I have used simple Linux commands in my examples. But rest assured, you can use these methods to save the output of bash scripts as well.

### Note: Avoid pipe pitfall while saving command output to file

You probably are familiar with pipe redirection. You may use it to combine Linux commands but you cannot pipe the output to a file. It will result in error that filename command not found:

![][7]

This is because pipe redirects the output of one command to input of another command. And in this case, you give it a file name while it was expecting a command.

If you are new to Linux command line, I hope this quick tutorial added to your Linux knowledge a bit. [I/O redirection][8] is an essential concept that one should be aware of.

As always, questions and suggestions are always welcome.

--------------------------------------------------------------------------------

via: https://itsfoss.com/save-command-output-to-file-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/copy-paste-linux-terminal/
[2]: https://linuxhandbook.com/redirection-linux/
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/redirecting_command_output_to_file_in_linux.png?resize=741%2C456&ssl=1
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/11/redirecting_command_output_to_file.png?resize=741%2C494&ssl=1
[5]: https://linuxhandbook.com/tee-command/
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/display-and-save-linux-command-output.png?resize=741%2C494&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/pipe-output-to-file-linux.png?resize=687%2C266&ssl=1
[8]: https://tldp.org/LDP/abs/html/io-redirection.html#FTN.AEN17894

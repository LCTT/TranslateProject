[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Read and write data from anywhere with redirection in the Linux terminal)
[#]: via: (https://opensource.com/article/20/6/redirection-bash)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Read and write data from anywhere with redirection in the Linux terminal
======
Redirection is an efficient way to get data from one place to another
without a lot of mouse moving and key pressing.
![Hands programming][1]

Redirection of input and output is a natural function of any programming or scripting language. Technically, it happens inherently whenever you interact with a computer. Input gets read from `stdin` (standard input, usually your keyboard or mouse), output goes to `stdout` (standard output, a text or data stream), and errors get sent to `stderr`. Understanding that these data streams exist enables you to control where information goes when you're using a shell, such as [Bash][2] or [Zsh][3].

Standard in, standard out, and standard error exist as filesystem locations on Linux. You can see them in `/dev`:


```
$ ls /dev/std*
/dev/stderr@  /dev/stdin@  /dev/stdout@
```

You can't do much with them directly, but it's sometimes useful to think of them as meta-locations where you can send data.

The basics of redirection are simple: use some number of `>` characters to redirect output, and some number of `<` characters to redirect input.

### Redirecting output

To write the output of the [ls][4] command to a file:


```
`$ ls > list.txt`
```

You don't see the output of `ls` as you normally would, because the output is written to the `list.txt` file instead of your screen. This is so versatile, in fact, that you can even use it to copy the contents of one file to another. It doesn't have to be a text file, either. You can use redirection for binary data:


```
`$ cat image.png > picture.png`
```

(In case you're wondering why you'd ever want to do that, it's for a sometimes-useful repercussion on [file permissions][5].)

### Redirecting input

You can redirect input "into" a command, too. This is arguably less useful than redirecting output because many commands are already hard-coded to take input from an argument you provide. It can be useful, however, when a command expects a list of arguments, and you have those arguments in a file and want to quickly "copy and paste" them from the file into your terminal (except you don't actually want to copy and paste):


```
`$ sudo dnf install $(<package.list)`
```

Common uses of input redirection are the **here-document** (or just **here-doc** for short) and **here-string** techniques. This input method redirects a block of text into the standard input stream, up to a special end-of-file marker (most people use `EOF`, but it can be any string you expect to be unique). Try typing this (up to the second instance of `EOF`) into a terminal:


```
$ echo &lt;&lt; EOF
&gt; foo
&gt; bar
&gt; baz
&gt; EOF
```

The expected result:


```
foo
bar
baz
```

A **here-doc** is a common trick used by [Bash][2] scripters to dump several lines of text into a file or onto the screen. As long as you don't forget to end the clause with your end-of-file marker, it's an effective way to avoid unwieldy lists of `echo` or `printf` statements.

A **here-string** is similar to a **here-doc**, but it consists of just one string (or several strings disguised as a single string with quotation marks):


```
$ cat &lt;&lt;&lt; "foo bar baz"
foo bar baz
```

### Redirecting error messages

Error messages go to a stream called `stderr`, designated as `2>` for the purposes of redirection. This command directs error messages to a file called `output.log`:


```
`$ ls /nope 2> output.log`
```

### Sending data to /dev/null

Just as there are locations for standard in, standard out, and error, there's also a location for _nowhere_ on the Linux filesystem. It's called `null`, and it's located in `/dev`, so it's often pronounced "devnull" by people who use it too frequently to say "slash dev slash null."

You can send data to `/dev/null` using redirection. For instance, the `find` command tends to be verbose, and it often reports permission conflicts while searching through your files:


```
$ find ~ -type f
/home/seth/actual.file
find: `/home/seth/foggy': Permission denied
find: `/home/seth/groggy': Permission denied
find: `/home/seth/soggy': Permission denied
/home/seth/zzz.file
```

The `find` command processes that as an error, so you can redirect just the error messages to `/dev/null`:


```
$ find ~ -type f 2&gt; /dev/null
/home/seth/actual.file
/home/seth/zzz.file
```

### Using redirection

Redirection is an efficient way to get data from one place to another in Bash. You may not use redirection all the time, but learning to use it when you need it can save you a lot of needless opening files and copying and pasting data, all of which generally require mouse movement and lots of key presses. Don't resort to such extremes. Live the good life and use redirection.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/redirection-bash

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming-code-keyboard-laptop.png?itok=pGfEfu2S (Hands programming)
[2]: https://opensource.com/resources/what-bash
[3]: https://opensource.com/article/19/9/getting-started-zsh
[4]: https://opensource.com/article/19/7/master-ls-command
[5]: https://opensource.com/article/19/8/linux-permissions-101

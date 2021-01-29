[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Run a Shell Script in Linux [Essentials Explained for Beginners])
[#]: via: (https://itsfoss.com/run-shell-script-linux/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

How to Run a Shell Script in Linux [Essentials Explained for Beginners]
======

There are two ways to run a shell script in Linux. You can use:

```
bash script.sh
```

Or you can execute the shell script like this:

```
./script.sh
```

That maybe simple, but it doesn’t explain a lot. Don’t worry, I’ll do the necessary explaining with examples so that you understand why a particular syntax is used in the given format while running a shell script.

I am going to use this one line shell script to make things as uncomplicated as possible:

```
[email protected]:~/Scripts$ cat hello.sh

echo "Hello World!"
```

### Method 1: Running a shell script by passing the file as argument to shell

The first method involves passing the script file name as an argument to the shell.

Considering that bash is the default shell, you can run a script like this:

```
bash hello.sh
```

Do you know the advantage of this approach? **Your script doesn’t need to have the execute permission**. Pretty handy for quick and simple tasks.

![Running a Shell Script Linux][1]

If you are not familiar already, I advise you to [read my detailed guide on file permission in Linux][2].

Keep in mind that it needs to be a shell script that you pass as argument. A shell script is composed of commands. If you use a normal text file, it will complain about incorrect commands.

![Running a Text File As Script][3]

In this approach, **you explicitly specified that you want to use bash as the interpreter** for the script.

Shell is just a program and bash is an implementation of that. There are other such shells program like ksh, [zsh][4], etc. If you have other shells installed, you can use that as well instead of bash.

For example, I installed zsh and used it to run the same script:

![Execute Shell Script With Zsh][5]

**Recommended Read:**

![][6]

#### [How to Run Multiple Linux Commands at Once in Linux Terminal [Essential Beginners Tip]][7]

### Method 2: Execute shell script by specifying its path

The other method to run a shell script is by providing its path. But for that to be possible, your file must be executable. Otherwise, you’ll have “permission denied” error when you try to execute the script.

So first you need to make sure that your script has the execute permission. You can [use the chmod command][8] to give yourself this permission like this:

```
chmod u+x script.sh
```

Once your script is executable, all you need to do is to type the file name along with its absolute or relative path. Most often you are in the same directory so you just use it like this:

```
./script.sh
```

If you are not in the same directory as your script, you can specify it the absolute or relative path to the script:

![Running Shell Script In Other Directory][9]

#### That ./ before the script is important (when you are in the same directory as the script)

![][10]

Why can you not use the script name when you are in the same directory? That is because your Linux systems looks for the executables to run in a few selected directories that are specified in the PATH variable.

Here’s the value of PATH variable for my system:

```
[email protected]:~$ echo $PATH
/home/abhishek/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
```

This means that any file with execute permissions in one of the following directories can be executed from anywhere in the system:

  * /home/abhishek/.local/bin
  * /usr/local/sbin
  * /usr/local/bin
  * /usr/sbin
  * /usr/bin
  * /sbin
  * /bin
  * /usr/games
  * /usr/local/games
  * /snap/bin



The binaries or executable files for Linux commands like ls, cat etc are located in one of those directories. This is why you are able to run these commands from anywhere on your system just by using their names. See, the ls command is located in /usr/bin directory.

![][11]

When you specify the script WITHOUT the absolute or relative path, it cannot find it in the directories mentioned in the PATH variable.

#### Why most shell scripts contain #! /bin/bash at the beginning of the shell scripts?

Remember how I mentioned that shell is just a program and there are different implementations of shells.

When you use the #! /bin/bash, you are specifying that the script is to run with bash as interpreter. If you don’t do that and run a script in ./script.sh manner, it is usually run with whatever shell you are running.

Does it matter? It could. See, most of the shell syntax is common in all kind of shell but some might differ.

For example, the array behavior is different in bash and zsh shells. In zsh, the array index starts at 1 instead of 0.

![Bash Vs Zsh][12]

Using #! /bin/bash indicates that the script is bash shell script and should be run with bash as interpreter irrespective of the shell which is being used on the system. If you are using zsh specific syntax, you can indicate that it is zsh script by adding #! /bin/zsh as the first line of the script.

The space between #! /bin/bash doesn’t matter. You can also use #!/bin/bash.

### Was it helpful?

I hope this article added to your Linux knowledge. If you still have questions or suggestions, please leave a comment.

Expert users can still nitpick this article about things I missed out. But the problem with such beginner topics is that it is not easy to find the right balance of information and avoid having too much or too few details.

If you are interested in learning bash script, we have an [entire Bash Beginner Series][13] on our sysadmin focused website [Linux Handbook][14]. If you want, you may also [purchase the ebook with additional exercises to support Linux Handbook][15].

--------------------------------------------------------------------------------

via: https://itsfoss.com/run-shell-script-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/01/run-a-shell-script-linux.png?resize=741%2C329&ssl=1
[2]: https://linuxhandbook.com/linux-file-permissions/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/01/running-text-file-as-script.png?resize=741%2C329&ssl=1
[4]: https://www.zsh.org
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/01/execute-shell-script-with-zsh.png?resize=741%2C253&ssl=1
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/09/run-multiple-commands-in-linux.png?fit=800%2C450&ssl=1
[7]: https://itsfoss.com/run-multiple-commands-linux/
[8]: https://linuxhandbook.com/chmod-command/
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/01/running-shell-script-in-other-directory.png?resize=795%2C272&ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/01/executing-shell-scripts-linux.png?resize=800%2C450&ssl=1
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/01/locating-command-linux.png?resize=795%2C272&ssl=1
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/01/bash-vs-zsh.png?resize=795%2C386&ssl=1
[13]: https://linuxhandbook.com/tag/bash-beginner/
[14]: https://linuxhandbook.com
[15]: https://www.buymeacoffee.com/linuxhandbook

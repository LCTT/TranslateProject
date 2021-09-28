[#]: subject: "Bash Shell Scripting for beginners (Part 1)"
[#]: via: "https://fedoramagazine.org/bash-shell-scripting-for-beginners-part-1/"
[#]: author: "zexcon https://fedoramagazine.org/author/zexcon/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Bash Shell Scripting for beginners (Part 1)
======

![][1]

Photo by [N Bandaru][2] on [Unsplash][3]

As the title implies this article will be covering Bash Shell Scripting at a beginner level. I’m not going to review the history of Bash but there are many resources to fill you in or you can visit the GNU project at <https://www.gnu.org/software/bash/>. We will start out with understanding some very basic concepts and then start to put things together.

### Creating a script file

The first thing to do is create a script file. First make sure the home directory is the current directory.

```
cd ~
```

In the home directory, create the example file. This can be named anything but _learnToScript.sh_ will be used in this article.

```
touch learnToScript.sh
```

From this point there will be a file called _learnToScript.sh_ in your home directory. Verify it exists and also notice the privileges for that file are -rw-rw-r– by typing the following.

```
ls -l
```

```
[zexcon@trinity ~]$ ls -l
total 7
drwxr-xr-x. 1 zexcon zexcon   90 Aug 30 13:08 Desktop
drwxr-xr-x. 1 zexcon zexcon   80 Sep 16 08:53 Documents
drwxr-xr-x. 1 zexcon zexcon 1222 Sep 16 08:53 Downloads
-rw-rw-r--. 1 zexcon zexcon   70 Sep 17 10:10 learnToScript.sh
drwxr-xr-x. 1 zexcon zexcon    0 Jul  7 16:04 Music
drwxr-xr-x. 1 zexcon zexcon  318 Sep 15 13:53 Pictures
drwxr-xr-x. 1 zexcon zexcon    0 Jul  7 16:04 Public
drwxr-xr-x. 1 zexcon zexcon    0 Jul  7 16:04 Videos
[zexcon@trinity ~]$
```

There is one more thing that needs to be done to get started. Let’s try and execute the script with nothing written in it. Type the following:

```
./learnToScript.sh
```

```
[zexcon ~]$ ./learnToScript.sh
bash: ./learnToScript.sh: Permission denied
```

You get permission denied because there are no execute permissions on the file. You need to change the permissions of the file to be able to execute the script. If you are not familiar with permissions I would recommend reading the Fedora Magazine articles written by [Paul W. Frields][4]

> [Command line quick tips: Permissions][5]

> [Command line quick tips: More about permissions][6]

At this point you’ve brushed up on permissions, so back to the terminal and let’s change the _learnToScript.sh_ file so it will execute. Type in the following to allow execution of the file.

```
chmod 755 learnToScript.sh
```

```
[zexcon@trinity ~]$ ls -l
total 7
drwxr-xr-x. 1 zexcon zexcon   90 Aug 30 13:08 Desktop
drwxr-xr-x. 1 zexcon zexcon   80 Sep 16 08:53 Documents
drwxr-xr-x. 1 zexcon zexcon 1222 Sep 16 08:53 Downloads
-rwxr-xr-x. 1 zexcon zexcon   70 Sep 17 10:10 learnToScript.sh
drwxr-xr-x. 1 zexcon zexcon    0 Jul  7 16:04 Music
drwxr-xr-x. 1 zexcon zexcon  318 Sep 15 13:53 Pictures
drwxr-xr-x. 1 zexcon zexcon    0 Jul  7 16:04 Public
drwxr-xr-x. 1 zexcon zexcon    0 Jul  7 16:04 Videos
[zexcon@trinity ~]$
```

Okay now you’re ready, you have read, write and execute permissions (-rwxr-x r-x) to the _learnToScript.sh_ command.

### Editing a script file

Take a moment and make certain you are familiar with _vim_ or any text editor. Throughout this article I will be utilizing _vim_. At the command prompt type the following:

```
vim learnToScript.sh
```

This will bring you to an empty text file with a bunch of tildes in it. Type _i_ on your keyboard and this will move you into — INSERT — mode. You can see it’s in this mode by looking at the bottom left of the terminal window. (Note that an alternative editor is the [_nano_ editor][7].)

From here you need to make sure that the file is recognized by the correct interpreter. So enter the shebang ( #! ) and the directory to your bash, /bin/bash:

```
#!/bin/bash
```

One last thing that you will use throughout the article is saving the document. Hit _Esc_ to leave input mode, then Shift + Colon. At the colon you will enter _wq_. This will write(_w_) the file and quit(_q_) _vim_ once you hit enter.

A few things to remember while using _vi_m, anytime you want to write into a document you need to enter _i_ and you will see –INSERT– at the bottom. Anytime you want to save, you will need to hit _Esc_ to leave input mode, and then _Shift+:_ to enter _w_ to write the file or _Esc_ then _Shift+:_ to enter _q_ to quit and not save. Or add both _wq_ together and it will write and close. _Esc_ by itself will exit INSERT mode. You can find much more about _vim_ at it’s [website][8] or this [get started][9] site.

## Lets start scripting…

### echo

The _echo_ command is used to return something to the terminal. You will notice that you can use single quotes, double quotes or no quotes. So let’s take a look at it with a traditional Hello World!

```
#!/bin/bash

echo Hello World!
echo 'Hello World!'
echo "Hello World!"
```

```
[zexcon ~]$ ./learnToScript.sh
Hello World!
Hello World!
Hello World!
[zexcon ~]$
```

Notice that you get the same result with all three options. This is not always the case but in this basic script it is. In some circumstances the type of quotes will make a difference. By the way, congratulations you have written your first Bash script. Let’s look at a few things that you will want to know as you continue to create more scripts and let your mind run wild.

### Command Substitution $( ) or ` `

Command substitution allows you to get the results of a command you might execute at the command line and write that result to a variable. For example if you type _ls_ at the command prompt you will get a list of the current working directory. So let’s put this into practice. You have two options for command substitution. Note that the first option uses a back tick found above the Tab key on the left side of the keyboard. It is paired with the tilde ~ key. The second option uses a shell variable.

```
#!/bin/bash

command1=`ls`
echo $command1

command2=$(ls)
echo $command2
```

```
[zexcon ~]$ ./learnToScript.sh
Desktop Documents Downloads learnToScript.sh Music Pictures Public snap Videos
Desktop Documents Downloads learnToScript.sh Music Pictures Public snap Videos
[zexcon ~]$
```

Notice no space between the variable, equal sign, and the start of the command. You get the exact same result with both options. Note that variables need to be led by a dollar sign. If you forget and you echo out the command variable without the dollar sign you will just see the name of the command as shown in the next example.

```
#!/bin/bash

command1=`ls`
echo command1

command2=$(ls)
echo command2
```

```
[zexcon ~]$ ./learnToScript.sh
command1
command2
[zexcon ~]$
```

### Double Parenthesis (())

So what are double parenthesis for? Double parenthesis are simple, they are for mathematical equations.

```
#!/bin/bash

echo $((5+3))
echo $((5-3))
echo $((5*3))
echo $((5/3))
```

```
[zexcon ~]$ ./learnToScript.sh
8
2
15
1
[zexcon ~]$
```

## Conclusion

At this point we have created our first script. We have an idea how to take several commands, place them in a script and run it to get the results. We will continue this discussion in the next article and look at redirection of input and output, the pipe command, using double brackets or maybe just adding some comments.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/bash-shell-scripting-for-beginners-part-1/

作者：[zexcon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/zexcon/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/09/bash_shell_scripting_pt1-816x345.jpg
[2]: https://unsplash.com/@nbandana?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/shell-scripting?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: http://pfrields.id.fedoraproject.org/
[5]: https://fedoramagazine.org/command-line-quick-tips-permissions/
[6]: https://fedoramagazine.org/command-line-quick-tips-more-about-permissions/
[7]: https://fedoramagazine.org/gnu-nano-minimalist-console-editor/
[8]: https://www.vim.org/docs.php
[9]: https://linuxhandbook.com/basic-vim-commands/

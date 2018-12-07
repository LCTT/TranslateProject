[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: subject: (Bash Variables: Environmental and Otherwise)
[#]: via: (https://www.linux.com/blog/learn/2018/12/bash-variables-environmental-and-otherwise)
[#]: author: (Paul Brown https://www.linux.com/users/bro66)
[#]: url: ( )

Bash Variables: Environmental and Otherwise
======
![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/wynand-van-poortvliet-40467-unsplash.jpg?itok=tr6Eb4N0)

Bash variables, including those pesky _environment variables_ , have been popped up several times in previous articles, and it’s high time you get to know them better and how they can help you.

So, open your terminal window and let's get started.

### Environment Variables

Consider `HOME`. Apart from the cozy place where you lay down your hat, in Linux it is a variable that contains the path to the current user's home directory. Try this:

```
echo $HOME
```

This will show the path to your home directory, usually _/home/_.

As the name indicates, variables can change according to the context. Indeed, each user on a Linux system will have a `HOME` variable containing a different value. You can also change the value of a variable by hand:

```
HOME=/home/<your username>/Documents
```

will make `HOME` point to your _Documents/_ folder.

There are three things to notice here:

  1. There are no spaces between the name of the variable and the `=` or between the `=` and the value you are putting into the variable. Spaces have their own meaning in the shell and cannot be used any old way you want.
  2. If you want to put a value into a variable or manipulate it in any way, you just have to write the name of the variable. If you want to see or use the contents of a variable, you put a `$` in front of it.
  3. Changing `HOME` is risky! A lot programs rely on `HOME` to do stuff and changing it can have unforeseeable consequences. For example, just for laughs, change `HOME` as shown above and try typing `cd` and then [Enter]. As we have seen elsewhere in this series, you use `cd` to _c_ hange to another _d_ irectory. Without any parameters, `cd` takes you to your home directory. If you change the `HOME` variable, `cd` will take you to the new directory `HOME` points to.



Changes to environment variables like the one described in point 3 above are not permanent. If you close your terminal and open it back up, or even open a new tab in your terminal window and move there, `echo $HOME` will show its original value.

Before we go on to how you make changes permanent, let's look at another environment variable that it does make sense changing.

### PATH

The `PATH` variable lists directories that contain executable programs. If you ever wondered where your applications go when they are installed and how come the shell seems to magically know which programs it can run without you having to tell it where to look for them, `PATH` is the reason.

Have a look inside `PATH` and you will see something like this:

```
$ echo $PATH
/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/bin:/sbin
```

Each directory is separated by a colon (`:`) and if you want to run an application installed in any directory other than the ones listed in `PATH`, you will have to tell the shell where to find it:

```
/home/<user name>/bin/my_program.sh
```

This will run a program calle _my_program.sh_ you have copied into a _bin/_ directory in your home directory.

This is a common problem: you don't want to clutter up your system's _bin/_ directories, or you don't want other users running your own personal scripts, but you don't want to have to type out the complete path every time you need to run a script you use often. The solution is to create your own _bin/_ directory in your home directory:

```
mkdir $HOME/bin
```

And then tell `PATH` all about it:

```
PATH=$PATH:$HOME/bin
```

After that, your _/home//bin_ will show up in your `PATH` variable. But... Wait! We said that the changes you make in a given shell will not last and will lose effect when that shell is closed.

To make changes permanent for your user, instead of running them directly in the shell, put them into a file that gets run every time a shell is started. That file already exists and lives in your home directory. It is called _.bashrc_ and the dot in front of the name makes it a hidden file -- a regular `ls` won't show it, but `ls -a` will.

You can open it with a text editor like [kate][1], [gedit][2], [nano][3], or [vim][4] (NOT LibreOffice Writer -- that's a word processor. Different beast entirely). You will see that _.bashrc_ is full of shell commands the purpose of which are to set up the environment for your user.

Scroll to the bottom and add the following on a new, empty line:

```
export PATH=$PATH:$HOME/bin
```

Save and close the file. You'll be seeing what `export` does presently. In the meantime, to make sure the changes take effect immediately, you need to `source` _.bashrc_ :

```
source .bashrc
```

What `source` does is execute _.bashrc_ for the current open shell, and all the ones that come after it. The alternative would be to log out and log back in again for the changes to take effect, and who has the time for that?

From now on, your shell will find every program you dump in _/home//bin_ without you having to specify the whole path to the file.

### DYI Variables

You can, of course, make your own variables. All the ones we have seen have been written with ALL CAPS, but [you can call a variable more or less whatever you want][5].

Creating a new variables is straightforward: just set a value within it:

```
new_variable="Hello"
```

And you already know how to recover a value contained within a variable:

```
echo $new_variable
```

You often have a program that will require you set up a variable for things to work properly. The variable may set an option to "on", or help the program find a library it needs, and so on. When you run a program in Bash, the shell spawns a daughter process. This means it is not exactly the same shell that executes your program, but a related mini-shell that inherits some of the mother's characteristics. Unfortunately, variables, by default, are not one of them. This is because, by default again, variables are _local_. This means that, for security reasons, a variable set in one shell cannot be read in another, even if it is a daughter shell.

To see what I mean, set a variable:

```
robots="R2D2 & C3PO"
```

... and run:

```
bash
```

You just ran a Bash shell program within a Bash shell program.

Now see if you can read the contents of you variable with:

```
echo $robots
```

You should draw a blank.

Still inside your bash-within-bash shell, set `robots` to something different:

```
robots="These aren't the ones you are looking for"
```

Check `robots`' value:

```
$ echo $robots
These aren't the ones you are looking for
```

Exit the bash-within-bash shell:

```
exit
```

And re-check the value of `robots`:

```
$ echo $robots
R2D2 & C3P0
```

This is very useful to avoid all sorts of messed up configurations, but this presents a problem also: if a program requires you set up a variable, but the program can't access it because Bash will execute it in a daughter process, what can you do? That is exactly what `export` is for.

Try doing the prior experiment, but, instead of just starting off by setting `robots="R2D2 & C3PO"`, export it at the same time:

```
export robots="R2D2 & C3PO"
```

You'll notice that, when you enter the bash-within-bash shell, `robots` still retains the same value it had at the outset.

**Interesting fact:** While the daughter process will  "inherit" the value of an exported variable, if the variable is changed within the daughter process, changes will not flow upwards to the mother process. In other words, changing the value of an exported variable in a daughter process does not change the value of the original variable in the mother process.

You can see all exported variables by running

```
export -p
```

The variables you create should be at the end of the list. You will also notice some other interesting variables in the list: `USER`, for example, contains the current user's user name; `PWD` points to the current directory; and `OLDPWD` contains the path to the last directory you visited and since left. That's because, if you run:

```
cd -
```

You will go back to the last directory you visited and `cd` gets the information from `OLDPWD`.

You can also see all the environment variables using the `env` command.

To un-export a variable, use the `-n` option:

```
export -n robots
```

### Next Time

You have now reached a level in which you are dangerous to yourself and others. It is time you learned how to protect yourself from yourself by making your environment safer and friendlier through the use of _aliases,_ and that is exactly what we'll be tackling in the next episode. See you then.

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/2018/12/bash-variables-environmental-and-otherwise

作者：[Paul Brown][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/bro66
[b]: https://github.com/lujun9972
[1]: https://www.kde.org/applications/utilities/kate/
[2]: https://help.gnome.org/users/gedit/stable/
[3]: https://www.nano-editor.org/
[4]: https://www.vim.org/
[5]: https://bash.cyberciti.biz/guide/Rules_for_Naming_variable_name

[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Understanding Angle Brackets in Bash)
[#]: via: (https://www.linux.com/blog/learn/2019/1/understanding-angle-brackets-bash)
[#]: author: (Paul Brown https://www.linux.com/users/bro66)

Understanding Angle Brackets in Bash
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/architecture-1839450_1920.jpg?itok=ra6XonD3)

[Bash][1] provides many important built-in commands, like `ls`, `cd`, and `mv`, as well as regular tools such as `grep`, `awk,` and `sed`. But, it is equally important to know the punctuation marks -- [the glue in the shape of dots][2], commas, brackets. and quotes -- that allow you to transform and push data from one place to another. Take angle brackets (`< >`), for example.

### Pushing Around

If you are familiar with other programming and scripting languages, you may have used `<` and `>` as logical operators to check in a condition whether one value is larger or smaller than another. If you have ever written HTML, you have used angle brackets to enclose tags.

In shell scripting, you can also use brackets to push data from place to place, for example, to a file:

```
ls > dir_content.txt
```

In this example, instead of showing the contents of the directory on the command line, `>` tells the shell to copy it into a file called _dir_content.txt_. If _dir_content.txt_ doesn't exist, Bash will create it for you, but if _dir_content.txt_ already exists and is not empty, you will overwrite whatever it contained, so be careful!

You can avoid overwriting existing content by tacking the new stuff onto the end of the old stuff. For that you use `>>` (instead of `>`):

```
ls $HOME > dir_content.txt; wc -l dir_content.txt >> dir_content.txt
```

This line stores the list of contents of your home directory into _dir_content.txt_. You then count the number of lines in _dir_content.txt_ (which gives you the number of items in the directory) with [`wc -l`][3] and you tack that value onto the end of the file.

After running the command line on my machine, this is what my _dir_content.txt_ file looks like:

```
Applications
bin
cloud
Desktop
Documents
Downloads
Games
ISOs
lib
logs
Music
OpenSCAD
Pictures
Public
Templates
test_dir
Videos
17 dir_content.txt
```

The mnemonic here is to look at `>` and `>>` as arrows. In fact, the arrows can point the other way, too. Say you have a file called _CBActors_ containing some names of actors and the number of films by the Coen brothers they have been in. Something like this:

```
John Goodman 5
John Turturro 3
George Clooney 2
Frances McDormand 6
Steve Buscemi 5
Jon Polito 4
Tony Shalhoub 3
James Gandolfini 1
```

Something like

```
sort < CBActors # Do this
Frances McDormand 6 # And you get this
George Clooney 2
James Gandolfini 1
John Goodman 5
John Turturro 3
Jon Polito 4
Steve Buscemi 5
Tony Shalhoub 3
```

Will [sort][4] the list alphabetically. But then again, you don't need `<` here since `sort` already expects a file anyway, so `sort CBActors` will work just as well.

However, if you need to see who is the Coens' favorite actor, you can check with :

```
while read name surname films; do echo $films $name $surname > filmsfirst.txt; done < CBActors
```

Or, to make that a bit more readable:

```
while read name surname films;\
 do
 echo $films $name $surname >> filmsfirst;\
 done < CBActors
```

Let's break this down, shall we?

  * the [`while ...; do ... done`][5] structure is a loop. The instructions between `do` and `done` are repeatedly executed while a condition is met, in this case...
  * ... the [`read`][6] instruction has lines to read. `read` reads from the standard input and will continue reading until there is nothing more to read...
  * ... And as standard input is fed in via `<` and comes from _CBActors_ , that means the `while` loop will loop until the last line of _CBActors_ is piped into the loop.
  * Getting back to `read` for a sec, the tool is clever enough to see that there are three distinct fields separated by spaces on each line of the file. That allows you to put the first field from each line in the `name` variable, the second in `surname` and the third in `films`. This comes in handy later, on the line that says `echo $films $name $surname >> filmsfirst;\`, allowing you to reorder the fields and push them into a file called _filmsfirst_.



At the end of all that, you have a file called _filmsfirst_ that looks like this:

```
5 John Goodman
3 John Turturro
2 George Clooney
6 Frances McDormand
5 Steve Buscemi
4 Jon Polito
3 Tony Shalhoub
1 James Gandolfini
```

which you can now use with `sort`:

```
sort -r filmsfirst
```

to see who is the Coens' favorite actor. Yes, it is Frances McDormand. (The [`-r`][4] option reverses the sort, so McDormand ends up on top).

We'll look at more angles on this topic next time!

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/2019/1/understanding-angle-brackets-bash

作者：[Paul Brown][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/bro66
[b]: https://github.com/lujun9972
[1]: https://www.linux.com/blog/2019/1/bash-shell-utility-reaches-50-milestone
[2]: https://www.linux.com/blog/learn/2019/1/linux-tools-meaning-dot
[3]: https://linux.die.net/man/1/wc
[4]: https://linux.die.net/man/1/sort
[5]: http://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO-7.html
[6]: https://linux.die.net/man/2/read
